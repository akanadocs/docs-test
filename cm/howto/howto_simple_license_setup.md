---
layout: page
title: How to Manage API Visibility with Licenses
description: A how to guide for creating a simple setup to use licenses to control the visibility of APIs
product: cm
category: learn
sub-nav-class: API Documentation
weight: 4
type: page
nav-title: API Licenses
no-nav:
no-catalog:
---

## How to Manage API Visibility with Licenses
This article describes how to create a really simple environment that uses licenses to control visibility and access to the operations of an API.  This is typically used in conjunction with [content visibility controls](howto_control_content_visibility.html) and [documentation file visibility controls](howto_control_doc_file_visibility.html) to provide a comprehensive solution.  

This article provides a simple set of instructions to get you started, for a comprehensive guide to the documentation visibility controls [click here](../learnmore/api_admin_documentation_tagging.htm).

The licenses feature is extremely powerful, and as such can be a little hard to understand at time.  In this example we are going to create a "public" API, and then use license restrictions to make some operations within the API "private", granting access to these operations to members of an admin group.  

NOTE 1: Making an operation private will hide it within automatically generated product features such as the Test Clients, and swagger documentation.  

NOTE 2: Once you choose to use license for an API, all user generated documentation will be hidden by default unless you choose to expose it using content and file visibility controls (see links above).

### Step 1 - Setup Scopes and Licenses
To keep things really simple we are going to define 2 scopes; user, and admin, and use these scopes in 2 licenses; User, and Admin.  NOTE: the admin license will include both scopes to provide comprehensive access.

* Login as a Site or Business Administrator
* Use Config->Scopes (```/#/system/scopes```) to add 2 new scopes, one named "user" and one named "admin"
  * "user" scope - take all the defaults, except for marking it public
  * "admin" scope - use all the defaults, ensure the scope is marked private
*  Use Config-Licenses (```/#/system/licenses```) to add 2 new licenses, one named "User", and one named "Admin"
  * "User" license - check both environments, visibility - **public**, add a term that includes ONLY the "user" scope
  * "Admin" license - check both environments, visibility - **private**, add a term that includes BOTH the "user", and "admin" scopes

### Step 2 - Configure API to use Licenses and Map Scopes
Either as you create your API, or after the fact by editing it, set the API to public, and check the "use licenses" box.  This will mean that the public aspects of the API will be visible to anonymous users, private aspects will be hidden.  

To determine which operations are public and which are private you will map scopes using the "Scope Mapping" tool from the API details page.  

* Select "operation-specific mapping"
* Choose the "user" scope for the operations you want to be public
* Choose the "admin" scope for operations you want to be private

### Step 3 - Define a Group for Admin users
At this point your API will be visible to all users and the operations to which you assigned the "user" scope will be visible, but any other operations will be hidden.  

* Choose "Visibility" from the API left nav, and select "groups" under that nav option
* Hit the "Create Group" button to add a new group 
	* Pick a sensible name like "Administrators" and provide a description
	* Select "independently-managed" 
	* Select "private"
	
NOTE: if there is no create group button, this feature may be disabled - check that ```admin->settings->API->Private API Settings->API Scope Groups``` is enabled.  This shouldn't be in play here because you really should be working with a Public API, in fact, if you're not using a public API, then this scenario won't work the way you want it to.

### Step 4 - Assign the Admin license to the group
To expose these operations to selected users you will define a group, assign the "Admin" license to the group, and add the selected users as group members.

* Use the "Edit Licenses" button for your group
	* Choose "Partial API Visibility"
	* Select the "Admin" license

### Step 5 - Invite users to the group

Now you can click on the group name and invite users to be members of your admin group.  Remember that the invited users will need to accept their invitations before they will be group members.  As soon as they are members they will be able to see the full list of operations in the Test Client and Swagger documentation.

### Next Steps - documentation visibility
Now you have set up the basic license features for API visibility you can move on to controlling [content visibility](howto_control_content_visibility.html) and [documentation file visibility](howto_control_doc_file_visibility.html).




