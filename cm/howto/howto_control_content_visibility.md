---
layout: page
title: How to Control Document Content Visibility
description: A how to guide for using licenses to control the visibility of content elements in documentation files
product: cm
category: learn
subcategory: API Documentation
weight: 10
type: page
nav-title: Content Visibility
no-nav: true
no-catalog: true
---

## How to Control Document Content Visibility
This article describes how to use licenses to control the visibility of documentation files in both the default and developer themes.  This is typically used in conjunction with [document file visibility controls](howto_control_doc_file_visibility.html) to provide a comprehensive solution.  This article provides a simple set of instructions to get you started, for a comprehensive guide to the documentation visibility controls [click here](../learnmore/api_admin_documentation_tagging.htm).

A common scenario is where you have a set of documents for an API with an overview doc, and one document for each API operation.  The documentation for some of the API operations should only be visible to users with an admin license, while the rest should be visible to all users.  All of the docs also contain a content element (e.g. a footer) with links to each of the other docs.  This article describes how you can use the ```metadata.xml``` file to control which files a user will be allowed to see (which also controls what will show up in the default theme API documentation table of contents).  You will need to use these instructions along with [content visibility controls](howto_control_content_visibility.html) to hide links to these protected files and other sensitive content from within the documents.

This article assumes that you have completed the steps in the [simple license setup](howto_simple_license_setup.html) article, and also that you have defined appropriate [document file visibility controls](howto_control_doc_file_visibility.html).  If you are using the sample documents provided in the document file visibility tutorial then you will the steps below already included in these docs.

### Step 1 - Setup the document file
The document tagging relies on an Akana provided Javascript library.  Ensure that you include:

```html
<link rel="stylesheet" type="text/css" href="/resources/style/reset.css"/>
<link rel="stylesheet" type="text/css" href="/resources/style/base.css"/>
<script language="javascript" src="/ui/apps/atmosphere/123/resources/uiframework/jquery/jquery.js"
            type="text/javascript"></script>
<script language="javascript" src="/ui/apps/atmosphere/123/resources/console/javascript/dynamic_docs.js"
        type="text/javascript"></script>
```

Inside the ```<head>...</head>``` element of your document.

### Step 2 - Wrap Restricted Elements
Surround any document elements you want to protect with a simple tag structure:

```html
<soa:showforscope scopeNames="Admin" apiVersionId="<APIVersionId">
    <div class="soa-ui-cm-dynamic-docs">
		Your HTML Content goes here
    </div>
</soa:showforscope>
```

There are a lot of different ways to tag elements and grant access, but this simple example will grant access to the wrapped document elements to any user who is a member of a group assigned a license that includes one or more terms for the "Admin" scope.

[Click here](../learnmore/api_admin_documentation_tagging.htm) for a comprehensive guide to the documentation visibility controls.