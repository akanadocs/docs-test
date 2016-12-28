---
layout: page
title: Categories
description: Review Category Hierarchy and Add or delete sub-categories.
product: ag
category: learn
sub-nav-class: Registry
weight: 05
type: page
nav-title: Categories
---


## Categories
Review Category Hierarchy and add or delete sub-categories.

<a href="registry_toc.html" class="button secondary">Registry (Home)</a> <a href="category_schemes.html" class="button secondary">Category Schemes</a> <a href="identifier_schemes.html" class="button secondary">Identifier Schemes</a> <a href="schema.html" class="button secondary">Schema</a> <a href="interfaces.html" class="button secondary">Interfaces</a> <a href="tmodels.html" class="button secondary">tModels</a> <a href="subscriptions.html" class="button secondary">Subscriptions</a> <br><br> <a href="replications.html" class="button secondary">Replications</a> <a href="registry_reference.html" class="button secondary">Registry Reference</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

<h3 style="color: gray;">Table of Contents</h3>
<div id="toc-marker"></div>
* [About Categories](#about-categories)
* [Navigate Category Hierarchy](#navigate-category-hierarchy)
* [Add Sub Category](#add-sub-category)
* [Modify Category](#modify-category)
* [Delete Category](#delete-category)



## About Categories

The Policy Manager default installation includes a default category hierarchy that includes industry specific and custom category schemes. Category schemes must be defined before they can be added to the category hierarchy (see [Add Category Schemes](category_schemes.html)).

To view the categories summary, including a browse-able Category Hierarchy, in the *Management Console*, go to **Configure > Registry** and then click the **Categories** tab.

<a href="#top">back to top</a> 


## Navigate Category Hierarchy

1. Go to **Configure > Registry**.
2. Click on the **Categories Tab**.  
The *Categories Summary* screen displays.  
**Notes**: 
  * *The Category Hierarchy tree is used to structure the defined category schemes. These Category Schemes are associated with business providers or services to facilitate the discovery process.* 
  * *Each element in the Category Hierarchy is attached to one or more elements directly below it.* 
  * *The top of the Category Hierarchy is referred to as the "root."* 
  * *Each Category Scheme included in the Category Hierarchy is considered a "branch."* 
  * *Clicking a Category Scheme reveals its subcategories.* 
  * *You can drill down into the sub-levels to view the information and how it is organized.* 
  * *Subcategories at the very bottom (with no elements below them) are called "leaves."*

<a href="#top">back to top</a> 


## Add Sub Category

The process of building your category taxonomy involves defining a standard set of subcategories—referred to as topics. After your standard set of topics are defined, you can sub-categorize your "topics" (referred to as "subject categories"). There are a variety of different industry-based categorization templates and guidelines pertaining to development of category taxonomies that are useful reference points.

To build a category taxonomy using the Registry Categories feature, you must define a "Key Name" and "Key Value" for each subcategory (or subject category) definition. The "Key Name" represents the subcategory name that will display in the Category Hierarchy. The "Key Value" is the internal system reference name of the subcategory.

**Note:** *Updating the default set of category schemes is not recommended and not supported. Akana advises against any modifications since it may impact the functionality of the product. This includes the industry-focused set of category schemes, and the Service Manager category schemes.*

After you have the necessary information, you can follow the steps below to Add a Subcategory.

1. Go to **Configure > Registry**.
2. Click on the **Categories Tab**.  
The *Categories Summary* screen displays.
3. Navigate the category hierarchy to view existing category groupings and perform an analysis to determine placement of your custom category schemes:
  * Select one of the category scheme names and double-click the hyperlink.  
  One or more subcategories will be displayed.
  * Double-click on a subcategory to display additional levels.
  * Continue this process until you have targeted the desired placement position for your sub-category.
4. Click **Add Sub-Category**.  
The *Add Category* screen displays.
5. Enter a **Key Name** associated with the subcategory you wish to add.
6. Enter a **Key Value** associated with the subcategory you wish to add.
7. Click **Apply**.  
The system writes the category information to the Category Hierarchy.
8. (Optional) To exit with saving, click **Cancel**. 

<a href="#top">back to top</a> 


## Modify Category

The process of modifying a subcategory involves selecting the category line item in the Category Hierarchy, selecting **Modify Category** and updating the "Key Name" and "Key Value" based on your requirements.

1. Go to **Configure > Registry**.
2. Click on the **Categories Tab**.  
The *Categories Summary* screen displays.
3. Navigate the category hierarchy to locate which existing category you want to modify:
  * Select one of the category scheme names and double-click the hyperlink.  
  One or more subcategories will be displayed.
  * Double-click on a subcategory to display additional levels.
  * Continue this process until you have located the (sub-)category you wish to modify.
4. Click **Modify Sub-Category**.  
The *Modify Category* screen displays.
5. Update the (sub-)category's **Key Name**.
6. Update the (sub-)category's a **Key Value**.
7. Click **Apply**.  
The system writes the category information to the Category Hierarchy.
8. (Optional) To exit with saving, click **Cancel**. 

<a href="#top">back to top</a> 


## Delete Category


1. Go to **Configure > Registry**.
2. Click on the **Categories Tab**.  
The *Categories Summary* screen displays.
3. Navigate the category hierarchy to locate which existing category you want to delete:
  * Select one of the category scheme names and double-click the hyperlink.  
  One or more subcategories will be displayed.
  * Double-click on a subcategory to display additional levels.
  * Continue this process until you have located the (sub-)category you wish to delete.
4. Click **Delete Category**.  
A pop-up appears requesting confirmation of your delete request.
5. **Confirm** your delete request.  
The subcategory is permanently removed from the Category Hierarchy.  

<a href="#top">back to top</a> 