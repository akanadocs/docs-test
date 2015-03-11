---
layout: page
title: Example Developer Theme Customization
description: A step by step guide to customizing the Developer (SimpleDev) theme
product: cm
category: ref
sub-nav-class:
weight: 11
type: page
nav-title: Example Developer Theme Customization
---

## Example SimpleDev Customization

This document describes the process of creating the demodev.eap.soa.com branding for the demo tenant.  It provides a step-by-step guide for how to create this exact brand, these steps will be pretty much universally applicable.  The steps sort of build on each other, and if you skip ahead you may miss some important instructions.  But I'm going to give you the option of doing just that by giving you links to some of the main sections here:

*	Customizing [Styles](#styles)
*	Add a new logo [Logo](#logo)
*	Replace the [Homepage Header](#header)
*	Replace the [Footer](#footer)
*	Change the [Style of the homepage header](#headercss)

### <a name="styles"></a>Customizing Styles

We use a compiled CSS model called Less to manage styles in the product.  There are 3 easy steps for changing styles:

1.	Download the style template (or a prior customized version of it):
	*	As a site administrator go to Config->Custom Styles
		*	IMPORTANT: you MUST make sure you select the tenant for which you want to change the styles before you take any of the actions on this page.  Far and away the most common reason for your style changes to taking effect is that you applied them to the wrong theme (and all sort of other badness can happen to your other theme style if you're not careful).  Trust me on this, I know/
	*	If you have not yet performed any customizations then you need to download the template, rename it to custom.less and edit it (basically follow the instructions in the custom styles configuration screens).  The template is a very useful document, it explains what all the options are and what they do.
	*	If you have already applied some customizations then you will need to download the current custom.less file and apply your changes directly to this.
2.	Edit the custom.less file changing colors, fonts, logo, etc.  You can add your own CSS directly to the end of the file and can even override specific styles from the UI if you  want to, more on this later (in the section [Style of the homepage header](#headercss), including a treatise on why it's not the best idea and why you should only do it if you really have to.
	*	NOTE: you have to uncomment any of the parameters in this file in order for your changes to take effect.
3.	Upload your edited custom.less file.  Make sure you have read and followed the IMPORTANT note above.  Uploading a new custom.less file will automatically trigger a style rebuild.  There is also an option to manually trigger a new rebuild in case you've done something foolish with your actual style.css file (which you should never touch directly, so I'm not going to tell you where it is, although the curious amongst you will find it really easily).

As usual, to see the results of your change you will need to clear your browser cache and then go and check your site again.

### <a name="logo"></a>Changing the Logo

Changing the logo is pretty easy, it involves 2 steps:

1.	Upload the new logo file
	*	Get an appropriately sized logo.  Optimally a logo for a SimpleDev basaed theme would be 228x60px
	*	Use the Resouces file manager under Config->Resources (make sure you use the Resources file manager, not the Content file manager), browse to Style/images (you may need to create the images folder), and upload your new logo file into images.  Remember the name you have chosen for this new file.
2.	Change your custom.less to point to the new logo file - see above for instructions on how to customize styles

As ever, to see the results of your change you will need to clear your browser cache and then go and check your site again.

### <a name="header"></a>Homepage Header

For this branding we want a homepage with no header at all so that we can use a more free-form document structure to layout the message we want.

NOTE: all other pages will retain the standard header.

The steps are actually pretty easy, just figuring out where to find the source artifacts and where to put the resulting code are the challenging bits.  What we're going to do is to replace the default header.ejs with a version that uses some simple if statements to detect if it's dealing with the welcome page, and display something different if it is.  This is a useful technique that I'm sure we'll apply elsewhere.

The premise is easy.  We'll do this:

1.	Find the source header.ejs file
	*	Access the com.soa.atmosphere.theme.simpledev_XXXXX.jar from your repository (e.g. $PROD_HOME$/sm70/lib/cm-7.2.0)
	*	Extract the archive to your file system using your favorite archive (zip) tool
	*	Browse through the archive to find the file (in this case - META=INF/resources/SOA/Dev/header/views/header.ejs)
		* NOTE: there will be a header.js (not ejs) file in the header directory.  This is not the driod you're looking for, you need to head on down a level into views to find the .ejs file.
		* NOTE: remember the path where you found your file, you're going to need it later

2.	Edit the file appropriately, in this case I'm being a bit agressive and am taking out the whole thing conditionally, but you can see from the example here how this construct works for more subtle edits:

	```html+erb
	{% raw %}
	<% if(can.route.attr("page") === "welcome"){%>
		Some Content
	<% }else {%>
		<div class="soa-ui-cm-main container navbar navbar-default" role="navigation">
			<div class="soa-ui-cm-container-top row">
				<div class="navbar-header soa-ui-cm-logo-container">
					<div class="navbar-header">
						<h2 class="soa-ui-cm-logo"><a href="#!welcome" class="navbar-brand soa-ui-cm-logo-link soa-ui-cm-imgtxt"> <%= soa.framework.globalize("messages.logo") %></a></h2>
					</div>
				</div>
				<div class="soa-ui-cm-nav-container navbar-collapse">
					<div <%= soa.framework.control("SOA.Dev.Nav", this) %>>
						<!-- nav -->
					</div>
					<div>
						<ul class="soa-ui-cm-site-tools nav navbar-nav navbar-right hidden-xs hidden-sm">
							<li class="soa-ui-cm-site-tools-item" <%= soa.framework.control("SOA.Dev.SearchFilter", {"view": "searchBox"}) %> >
								<!-- search box -->
							</li>
							<li class="soa-ui-cm-site-tools-item" <%= soa.framework.control("SOA.Dev.Refresh", this) %> >
								<!-- refresh -->
							</li>
							<li class="soa-ui-cm-site-tools-item soa-ui-cm-profile-container" <%= soa.framework.control("SOA.Dev.UserTools", this) %>>
								<!-- user tools -->
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	<% }%>
	{% endraw %}
	```

3.	Upload the new header.ejs file to the right location using your default theme (or the API).
	* You will use the file manager in Config->Resources as a site administrator in your default theme to do this.  NOTE: yes, I did say using the default theme.  All the admin for your tenant (including configuring your SimpleDev theme) is done using the default theme.
	* You could use the file manager and manually recreate the directory structure for all the files uploading changed files as you go, but assuming you're going to be changing more than one thing, an easier approach is to duplicate the directory structure you need on your local file system, and zip the whole thing whenever you make a change.  This will also make it much easier to apply the same set of customizations to more than one tenant or instance.  In this case the easiest approach for me was to create a structure SOA/Dev/header/views and put my new header.ejs file in views.  Then I zip up the whole SOA structure, go to Config->Resources and use the Resources file manager (NOTE: make sure you're using the file manager for the Resources structure, not the Content structure).  Browser into theme, choose the name of your theme (in my case I have developer on one tenant and simpledev on an other), and then upload your newly created zip archive to this location (/resources/theme/developer or /resources/theme/simpledev in my case(s)).
	* At this point you will need to clear the browser cache.  I'm going to say that again, in caps.  CLEAR THE BROWSER CACHE.  Ok, now you can view your site and you should see your shiny new header.

In my case I actually need to do something a little different with my header that invloves messing with the CSS, for details on how to do this see [below](#headercss).

### <a name="footer"></a>Replacing the Footer

Replacing the footer involves replacing the footer.ejs file.  The process for finding and replacing this file is the same as for the header, as described in [Homepage Header](header) above.  In this case you will add your customized file to your local file structure in SOA/Dev/footer/views/footer.ejs.

In most cases replacing the footer will likely be a bit more complex because you will probably also need to drag some styles along with the new footer.  In my case I took the complete footer html structures from our corporate site (www.soa.com), this meant bringing along the css sprite image for the social icons, and grabbing all the CSS that drove that.  The steps here were:

1.	Find the footer.ejs file and copy it to the right place in my local file structure so that it would be included in my next zip update.
2.	This file provides the content of the footer, using the html footer element.  In our out of the box SimpleDev theme this will be placed in an unstyled div at the bottom of the page.  The default footer is styled by a css class of "soa-ui-cm-footer".  I chose to keep this class and its associated styles and drop my content into the middle of this.  Essentially I just replaced everything between the opening and closing divs with my content:
	
	```html+erb
	<div class="soa-ui-cm-footer">
	...
	My content in here
	...
	</div>
	```
3.	My content made a bunch of references to its own defined css classes, so I had to copy the appropriate section of the www.soa.com CSS into the end of my custom.less file (see Customizing [Styles](#styles) above).
	*	NOTE: because my original footer was in an HTML div using a id of footer instead of using the html footer element I had to change all my CSS elements from applying to an id of footer to applying to the element (remove the #).  For example:

		```css
		#footer .credits .social {
			margin-top: 30px;
			text-align: center;
		}
		```

		to:

		```css
		footer .credits .social {
			margin-top: 30px;
			text-align: center;
		}
		```

4.	Having made the css changes and uploaded the new custom.less, all you need to do is save your new footer.ejs file, package up your zip archive and upload it as described in [Homepage Header](header) above.

Now clear your browser cache and enjoy your elegant custom footer.

### <a name="headercss"></a>Homepage Header with CSS Modifications

I don't like to make things easy for myself, and so simply replacing the content of the header really wasn't enough for me.  What I really wanted to do was replace the header with a blank space with just a login button on the top right.  I wanted to use the existing login control which meant I couldn't just go into layout.ejs (more on this in a bit) and remove the header, I needed to change the styles of the header, remove all the things I didn't want in the header, and change the style of the LOGIN control to a button, and make sure all this only happened on the homepage.  This is actually quite a bit easier than you might think.

The basic process includes:

1.	Changing style means adding some new classes to our custom.less file that override specific style instructions and then applying these classes only when we are on a particular page.
	
	For example to override the header background and border we add this to custom.less:
	
	```css
	.soa-ui-cm-header-container-welcome {
    	background: none;
    	border-bottom: none;
	}
	```
	Which contains instructions from:
	
	```css
	.soa-ui-cm-header-container {
  		background: #f8f8f8;
  		border-bottom: 1px solid #d2d2d2;
	}
	```
	
	Because these styles are in custom.less they will appear towards the very bottom of the generated styles and so will if applied to an element will override the default styles. 
	
	To apply these new styles selectively on the welcome page I can embed `{% raw %}<%= can.route.attr("page") === "welcome" ? "soa-ui-cm-header-container-welcome": "" %>{% endraw %}` in my class definintions for the appropriate elements.
	
2. The header.ejs file doesn't include it's own outer wrapping definition, so to change the style of the full width header we actually need to change a style definition in the master layout view (layout.ejs).

	In my case I only want these styles to apply when I'm on the welcome page, so I'm going to use the above class override so that my final layout.ejs ends up looking like this:
	
	```html+erb
	{% raw %}
	<header id="soa-control-cm-header-container" aria-live="polite" role="banner" class=" <%= can.route.attr("page") === "welcome" ? "soa-ui-cm-header-container-welcome": "" %>soa-ui-cm-header-container" <%= soa.framework.control("SOA.Dev.Header", this) %> >
	</header>
	<% if(SOA.Framework.Common.PageContext.getInstance().attr("pageLoading")){ %>
		<div class="soa-ui-cm-loading-overlay">
			<p class="soa-ui-cm-loading-icon">
				<%= soa.framework.globalize("messages.loading") %>
	   		</p>
		</div>
	<% } %>
	<div id="soa-control-cm-page-container" class="soa-ui-cm-page-container" aria-live="assertive">
		<!-- page content goes here -->
	</div>
	<footer id="soa-control-cm-footer-container" class="soa-ui-cm-footer-container" role="contentinfo" <%= soa.framework.control("SOA.Dev.Footer", this) %> >
	</footer>
	<div id="soa-control-cm-notifications-container" class="soa-ui-cm-notifications-container container" <%= soa.framework.control("SOA.Framework.Common.Notifier", this) %> >
	</div>
	{% endraw %}
	```

3.	Removing all the menus from the header, except for the usertools (the login link or profile dropdown is matter of tweaking the header.ejs a little.  I'm going to use the same `{% raw %}<% if(can.route.attr("page") !== "welcome"){%>....<% }%>{% endraw %}` construct I use in layout, but this time I'm not using an inline form because I'm using it to change more significant pieces of the html structure.  There are 3 occurances of this in this file; one that takes out the logo, one that takes out the nav links, and one that removes the search bar.  I also have an inline instance that overrides the styles of the whole navbar, this adds the following css override which is defined in custom.less:

	```css
	.navbar-default-welcome {
	    background: none;
	    border: none;
	}
	```
	
	The result of all this is a new header.ejs file that looks like:
	
	```html+erb
	{% raw %}
	<div class="soa-ui-cm-main container navbar <%= can.route.attr("page") === "welcome" ? "navbar-default-welcome": "" %> navbar-default" role="navigation">
		<div class="soa-ui-cm-container-top row">
			<div class="navbar-header soa-ui-cm-logo-container">
				<% if(can.route.attr("page") !== "welcome"){%>
					<div class="navbar-header">
						<h2 class="soa-ui-cm-logo"><a href="#!welcome" class="navbar-brand soa-ui-cm-logo-link soa-ui-cm-imgtxt"> <%= soa.framework.globalize("messages.logo") %></a></h2>
					</div>
				<% }%>
			</div>
			<div class="soa-ui-cm-nav-container navbar-collapse">
				<% if(can.route.attr("page") !== "welcome"){%>
					<div <%= soa.framework.control("SOA.Dev.Nav", this) %>>
						<!-- nav -->
					</div>
				<% }%>
				<div>
					<ul class="soa-ui-cm-site-tools nav navbar-nav navbar-right hidden-xs hidden-sm">
						<% if(can.route.attr("page") !== "welcome"){%>
							<li class="soa-ui-cm-site-tools-item" <%= soa.framework.control("SOA.Dev.SearchFilter", {"view": "searchBox"}) %> >
								<!-- search box -->
							</li>
							<li class="soa-ui-cm-site-tools-item" <%= soa.framework.control("SOA.Dev.Refresh", this) %> >
								<!-- refresh -->
							</li>
						<% }%>
						<li class="soa-ui-cm-site-tools-item soa-ui-cm-profile-container" <%= soa.framework.control("SOA.Dev.UserTools", this) %>>
							<!-- user tools -->
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	{% endraw %}
	```
	
4.	The last step is to replace the text "Login" link with a nice shiny button.  I cheated a bit and browsed through the UI looking for some buttons I liked.  I liked the Style of the Login button from the login page, so I just used that.  Then I opened up the usertools.ejs file and had at it.  While I was at it I decided to remove the element where the product welcomed me, that was annoying.  See if you can spot the changes:

	```html+erb
	{% raw %}
	<% var user = SOA.Console.Models.User.me(); %>
	<% if(user.isLoggedIn()){ %>
		<p class="soa-ui-cm-profile">
			<span role="button" class="soa-ui-cm-profile-button soa-ui-cm-button-borderless soa-control-cm-profile-link" id="soa-control-cm-profile-link">
				<img src="<%= user.getAvatarUrl() %>" alt="<%= user.getName() %>" class="soa-ui-cm-profile-img">
				<span class="soa-ui-cm-icon-imgtxt soa-ui-cm-icon-imgtxt-down soa-ui-cm-profile-trigger"><%= soa.framework.globalize("labels.userTools") %></span> 
			</span>
		</p>
		<div id="soa-control-cm-quick-links-container" class="soa-control-menu-container" <%= soa.framework.control("SOA.Dev.QuickLinks", this) %>>
			<!-- quick links -->
		</div>
	<% }else if(can.route.attr("page") !== "login") {
			if(can.route.attr("page") === "welcome") {%>
				<p class="soa-ui-cm-profile">
					<div>
						<a id="ig-homepage-login-button" href="#!login"><span>Login</span></a>
					</div>
				</p>
			<% } else {%>
				<p class="soa-ui-cm-profile">
					<a class="soa-control-cm-signin soa-ui-cm-profile-signin" href="#!login"><%= soa.framework.globalize("labels.login") %></a>
				</p>
			<% } %>
	<% } %>
	{% endraw %}
	```
	
And that's it for now.  I'll be back to describe the process of uploading and customizing my docs when I get some content I like.