require 'rubygems'
require 'json'
require 'uri'

module Jekyll

  class Indexer < Generator

    def initialize(config = {})
      super(config)
      
      lunr_config = { 
        'excludes' => [],
        'strip_index_html' => false,
        'min_length' => 3,
        'stopwords' => 'stopwords.txt'
      }.merge!(config['lunr_search'])
      
      @excludes = lunr_config['excludes']
      
      # if web host supports index.html as default doc, then optionally exclude it from the url 
      @strip_index_html = lunr_config['strip_index_html']

      # stop word exclusion configuration
      @min_length = lunr_config['min_length']
      @stopwords_file = lunr_config['stopwords']
    end

    # Index all pages except pages matching any value in config['lunr_excludes'] or with date['exclude_from_search']
    # The main content from each page is extracted and saved to disk as json
    def generate(site)
      puts 'Running the search indexer...'

      # gather pages and posts
      items = pages_to_index(site)
      content_renderer = PageRenderer.new(site)
      pdf_renderer = PdfRenderer.new(site)
      index = []

      items.each do |item|
        entry = SearchEntry.create(item, content_renderer, pdf_renderer)

        entry.strip_index_suffix_from_url! if @strip_index_html
        entry.strip_stopwords!(stopwords, @min_length) if File.exists?(@stopwords_file) 

        # Do some magic to find relative hrefs in the description fields and make them relative to the site root, not the document
        description = entry.description

        # if there is an href in there then
        if description
          if description.match(/<a href=\"/) 
            urlparts = URI.parse(entry.url).path.split('/')

            # Get all the pieces either side of any <a href=" matches
            hrefarray = description.split(/<a href=\"/)
            puts 'HREF Array Length: ' << "#{hrefarray.length}"
            # In the unlikely event that a description starts with a link then we'll keep the first element, otherwise...
            if description !~ /^<a href=\"/
              arrayindex = 1
            else
              arrayindex = 0
            end
            for ctr in arrayindex..hrefarray.length-1 do
              href = hrefarray[ctr]
              puts 'Orig HREF1: ' << "#{href}"

              # Make sure it isn't an absolute URL already
              if (href !~ /^\// && href !~ /^http/)
                # Determine the number of ../ instances there are and remove them as you go
                i = 0
                while href.match(/\.\./) do
                  pathpart = urlparts[i += 1]
                  href = href.sub(/\.\.\//, "") 

                  puts 'New HREF1: ' << "#{href}" 
                end
                # Now add the urlparts from the page back onto the href
                puts 'URLParts.length: ' << "#{urlparts.length}" << ' No. ../ instances: ' << "#{i}"
                for j in 2..(urlparts.length - (i)) do
                  href = urlparts[urlparts.length - (j + i)] + "/" + href;
                  puts 'New HREF2: ' << "#{href}" 
                end
                # And replace the value in the array with the new value
                if site.baseurl 
                  hrefarray[ctr] = site.baseurl + href
                else
                  hrefarray[ctr] = href
                end
              end
            end

            # And now we'll rebuild the description with the amended hrefs
            description = hrefarray.join("<a href=\"")
            puts 'New Description: ' << "#{description}"
          end
        end

        index << {
          :title => entry.title, 
          :url => entry.url,
          :date => entry.date,
          :type => entry.type,
          :description => description,
          :categories => entry.categories,
          :body => entry.body
        }
        
        puts 'Indexed ' << "#{entry.title} (#{entry.url})"
      end

      json = JSON.generate({:entries => index})
      
      # File I/O: create search.json file and write out pretty-printed JSON
      filename = 'search.json'

      FileUtils.rm File.join(site.source, filename), :force => true
      
      # Create destination directory if it doesn't exist yet. Otherwise, we cannot write our file there.
      Dir::mkdir(site.dest) unless File.directory?(site.dest)

      puts 'Creating the root-level search.json file'

      # File I/O: create index json file and write out pretty-printed JSON
      File.open(File.join(site.source, filename), "w") do |file|
        file.write(json)
      end

      puts 'copying the root-level index to _site/search.json'

      FileUtils.copy File.join(site.source, filename), File.join(site.dest, filename)

      # Keep the search.json file from being cleaned by Jekyll
      site.static_files << Jekyll::SearchIndexFile.new(site, site.dest, "/", filename)
    end

  private
    
    # load the stopwords file
    def stopwords
      @stopwords ||= IO.readlines(@stopwords_file).map { |l| l.strip }
    end
    
    def pages_to_index(site)
      items = []
      
      # deep copy pages
      site.pages.each {|page| items << page.dup }
      site.posts.each {|post| items << post.dup }

      # only process files that will be converted to .html or .htm and only non excluded files 
      items.select! {|i| ( i.output_ext == '.html' || i.output_ext == '.htm' ) && ! @excludes.any? {|s| (i.url =~ Regexp.new(s)) != nil } } 
      items.reject! {|i| i.data['exclude_from_search'] } 
      
      items
    end
  end
end
require 'nokogiri'

module Jekyll

  class PageRenderer
    def initialize(site)
      @site = site
    end
    
    # render the item, parse the output and get all text inside <p> elements
    def render(item)
      item.render({}, @site.site_payload)
      doc = Nokogiri::HTML(item.output)
      paragraphs = doc.search('p').map {|e| e.text }
      paragraphs.join(" ").downcase.gsub("\r"," ").gsub("\n"," ").gsub(/[^a-z-]/, " ").gsub(/\b[a-z]{1,2}\b/," ").split(" ").uniq.join(" ")
    end
  end
  
end
module Jekyll

  class PdfRenderer
    def initialize(site)
        @site = site
      end

    def render(filename, noblank = true)
      spec = filename.sub(/.pdf$/, '')
      `pdftotext #{spec}.pdf`
      file = File.new("#{spec}.txt")
      text = '';
        file.readlines.each do |l|
        l.chomp! if noblank
          if l.length > 0
          text = text + ' ' + l
          end
        end
      file.close
      FileUtils.rm "#{spec}.txt", :force => true
      # text.encode!('UTF-8', 'UTF-8', :invalid => :replace)
      if !text.valid_encoding? 
        text.encode!('UTF-16', 'UTF-8', :invalid => :replace, :replace => '')
        text.encode!('UTF-8', 'UTF-16')
        puts 'Encoding problem in file: ' << filename
      end
      text.downcase.gsub(/[^a-z-]/, " ").gsub(/\b[a-z]{1,2}\b/," ").split(" ").uniq.join(" ")
    end

  end

end
require 'nokogiri'

module Jekyll
  
  class SearchEntry
    def self.create(page_or_post, renderer, pdf_renderer)
      return create_from_post(page_or_post, renderer) if page_or_post.is_a?(Jekyll::Post)
      return create_from_page(page_or_post, renderer, pdf_renderer) if page_or_post.is_a?(Jekyll::Page)
      raise 'Not supported'
    end
    
    def self.create_from_page(page, renderer, pdf_renderer)
      title, url, type, file, product, description = extract_title_description_and_url(page)
      if type == 'pdf'
        filepath = "#{product}/assets/#{file}"
        puts 'PDF file path: ' << filepath
        # body = pdf_renderer.render(filepath)
        body = '';
      else
        # body = renderer.render(page)
        body = '';
      end
      date = nil
      categories = []
      
      SearchEntry.new(title, url, date, type, description, categories, body)
    end
    
    def self.create_from_post(post, renderer)
      title, url, type, file, product, description = extract_title_description_and_url(post)
      body = renderer.render(post)
      date = post.date
      categories = post.categories
      
      SearchEntry.new(title, url, date, type, description, categories, body)
    end

    def self.extract_title_description_and_url(item)
      data = item.to_liquid
      if data['type'] != 'pdf'
        type = 'document'
      else
        type = 'pdf'
      end
      [ data['title'], data['url'], type, data['filename'], data['product'], data['description'] ]
    end

    def self.extract_type(item)
      data = item.to_liquid
      if data['type'] != 'pdf'
        type = 'document'
      else
        type = 'pdf'
      end
      type
    end

    attr_reader :title, :url, :date, :type, :description, :categories, :body
    
    def initialize(title, url, date, type, description, categories, body)
      @title, @url, @date, @type, @description, @categories, @body = title, url, date, type, description, categories, body
    end
    
    def strip_index_suffix_from_url!
      @url.gsub!(/index\.html$/, '')
    end
    
    # remove anything that is in the stop words list from the text to be indexed
    def strip_stopwords!(stopwords, min_length)
      @body = @body.split.delete_if() do |x| 
        t = x.downcase.gsub(/[^a-z]/, '')
        t.length < min_length || stopwords.include?(t)
      end.join(' ')
    end    
  end
end
module Jekyll
  
  class SearchIndexFile < StaticFile
    # Override write as the search.json index file has already been created 
    def write(dest)
      true
    end
  end
  
end
