---
layout: page
title: tModels
description: Learn about tModels, which represent definitions of UDDI web service types and are used to define pointers to the technical specification of a web service and for configuring identifier and category taxonomies to facilitate advanced discovery.
product: ag
category: learn
sub-nav-class: Registry
weight:	11
type: page
nav-title: tModels
---

## tModels
Learn about tModels, which represent definitions of UDDI web service types and are used to define pointers to the technical specification of a web service and for configuring identifier and category taxonomies to facilitate advanced discovery.



<a href="../registry/registry_toc.html" class="button secondary">Registry (Home)</a> <a href="../registry/category_schemes.html" class="button secondary">Category Schemes</a> <a href="../registry/categories.html" class="button secondary">Categories</a> <a href="../registry/identifier_schemes.html" class="button secondary">Identifier Schemes</a> <a href="../registry/schema.html" class="button secondary">Schema</a> <a href="../registry/interfaces.html" class="button secondary">Interfaces</a> <a href="../registry/subscriptions.html" class="button secondary">Subscriptions</a> <br><br> <a href="../registry/replications.html" class="button secondary">Replications</a> <a href="../registry/registry_reference.html" class="button secondary">Registry Reference</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [About tModels](#about-tmodels)
* [View tModels Summary](#view-tmodels-summary)
* [View tModel Details](#view-tmodel-details)
* [Category Group tModels](#category-group-tmodels)
* [Add tModel](#add-tmodel)
* [Delete tModel](#delete-tmodel)
* [Modify tModel](#modify-tmodel)
* [About tModel Identifiers](#about-tmodel-identifiers)
* [Assign tModel Identifiers](#assign-tmodel-identifiers)
* [Unassign tModel Identifiers](#unassign-tmodel-identifiers)
* [About tModel Categories](#about-tmodel-categories)
* [Assign tModel Categories](#assign-tmodel-categories)
* [Unassign tModel Categories](#unassign-tmodel-categories)
* [Assign tModel Category Group](#assign-tmodel-category-group)
* [Unassign tModel Category Group](#unassign-tmodel-category-group)



## About tModels

* The tModel definition is stored in a businessEntity construct in a bindingTemplate and contains a key (tModelKey) that provides a unique technical fingerprint.
* The "tModels" portion of the Registry provides an interface for cataloging the technical model (i.e., tModel) of web services. 
* tModel definitions facilitate the discovery process by providing meaningful information about a web service including the abstract interface, and technical specifications (e.g., binding templates). 
* The web service discovery process can be further enhanced by defining optional Identifier Schemes (e.g., identification numbers for a tModel), and Categories (e.g., used to record taxonomy information such as industry, product, or geographic codes). 
* Registering these additional numbering and grouping elements enhances the search process and ensures that your published web services will be found.
* tModels are organized into the following logical groups: Category Scheme Group tModels


<a href="#top">back to top</a> 

## View tModels Summary

The *tModels Summary* screen provides a listing of tModel definitions that are currently defined in the Registry. 

1. Go to **Configure > Registry > tModels**.  
The *tModels Summary* screen displays.

The default installation includes several industry-focused tModels including:

* NAICS (an industry code taxonomy)
* UNSPC (a product and service category code taxonomy)
* ISO 3166 (a geographical region code taxonomy)


<a href="#top">back to top</a>

## View tModel Details

View the tModel Organization.

1. Go to **Configure > Registry > tModels**.  
The *tModels Summary* screen displays.
2. Select the line item corresponding to the tModel definition you want to see details for.
3. Click **View tModel**.  
The *tModel Details* screen displays, showing:  
  * Key
  * Name
  * Description
  * Overview Document URL
  * Overview document URL Description

<a href="#top">back to top</a>

## Category Group tModels ????????

Categories can also be grouped together. The process of creating a Category Group involves adding a new tModel, assigning the "uddi-org:category_types" category, and identifying this tModel as a "Category Group System" and specifying whether the Category Group will be used for tModels or for Binding Templates.

1. Go to **Configure > Registry > tModels**.  
The *tModels Summary* screen displays.
2. Click **Add tModel**.  
The *Add tModel* pop up window is displayed.
3. 

<a href="#top">back to top</a> 


## Add tModel

Define the key, name, description, and URL information of a tModel.  

**Note**: *Data for specified field displays is stored in the tModel construct within a bindingTemplate.*

1. Go to **Configure > Registry > tModels**.  
The *tModels Summary* screen displays.
2. Click **Add tModel**.  
The *Add tModel* pop up window is displayed.
3. Enter a unique identifier "Key" (i.e., tModelKey) for the tModel definition.
4. Select one of the following:  
**Note**: *tModel key should contain alphanumeric, dashes, and colons only.*
  * **For system-generated tModelKeys** - Leave the **Key** field display blank.  
  A system-generated key will be created when you save the tModel definition.
  * **For manually entered tModelKeys** - Enter the unique identifier into the **Key** field display.
5. In the **Name** field, enter the tModel name.  
**Note**: *This field is optional and maps to the &lt;name&gt; field in your tModel construct.*
6. In the **Description** field, enter the tModel description.  
**Note**: *This field is optional and maps to the &lt;description&gt; field in your tModel construct.*
7. In the **Overview Document URL** field, enter the Overview URL.  
**Note**: *This field is optional and maps to the &lt;overviewURL&gt; field in your tModel construct.*
8. In the **Overview Document URL Description** field, enter the Overview URL Description.  
**Note**: *This field is optional and maps to the &lt;description&gt; field in your tModel construct.*
9. Click **Apply**.  
The new tModel definition is displayed on the *tModel Summary* screen.
10. (Optional) Click **Cancel** to exit without saving.

<a href="#top">back to top</a> 

## Delete tModel

1. Go to **Configure > Registry > tModels**.  
The *tModels Summary* screen displays.
2. Select the line item corresponding to the tModel definition you want to delete.
3. Click **Delete tModel**.  
A confirmation pop up window is displayed:  
"Are you sure you want to delete this tModel?"
4. Click **OK** to confirm the tModel.  
The system permanently removes the tModel definition from the system.
5. (Optional) Click **Cancel** to cancel the delete operation.

<a href="#top">back to top</a> 

## Modify tModel


Modify the key, name, description, and URL information of a tModel.  

**Note**: *Data for specified field displays is stored in the tModel construct within a bindingTemplate.*

1. Go to **Configure > Registry > tModels**.  
The *tModels Summary* screen displays.
2. Select the line item corresponding to the tModel definition you want to modify.
3. Click **View tModel**.  
The *tModel Details* screen displays, showing a view-only image of the selected tModel.
4. Click **Modify tModel**.  
The *Modify tModel* screen displays.  
**Note**: *the Key (i.e., tModelKey) is non-editable.*
5. Follow steps 5 through 10 of the [Add tModel](#add-tmodel) section of this page.

<a href="#top">back to top</a> 

## About tModel Identifiers

Identifiers provide a method of configuring a web service with unique reference information. Identifiers are generally trade-focused and indicate:

* The identity of the businessEntity or publishing party (e.g., D-U-N-S numbers)
* The Global Location Number (GLM)
* The tax identifiers etc. associated with the web service or tModel

View a listing of tModel Identifier Schemes that are defined for the current tModel definition on the *tModel Identifiers Summary* screen.

1. Go to **Configure > Registry > tModels**.  
The *tModels Summary* screen displays.
2. Select the line item corresponding to the tModel definition you want to modify.
3. Click **View tModel**.  
The *tModel Details* screen displays, showing a view-only image of the selected tModel.
4. Click the **Identifiers** tab.  
The *tModel Identifiers Summary* screen displays.


<a href="#top">back to top</a> 

## Assign tModel Identifiers

Assign an Identifier Scheme, Key Name, and Key Value that represent lookup elements that will be invoked during a search.

1. Follow steps #1 through #4 of the [About tModel Identifiers](#about-tmodel-identifiers) section of this page.
2. Click **Assign Identifier**.  
The *Assign Identifier* pop up window is displayed.
3. Select the desired **Identifier Scheme** from the drop-down list box.
4. Enter the **Key Name** [physical name] to associate with the selected Identifier Scheme.
5. Enter the internal **Key Value** being referenced in the selected Identifier Scheme.
6. Click **Apply**.  
The system saves the definition and you returned to the *tModel Identifiers Summary* screen.
7. (Optional) Click **Cancel** to exit the *Assign Identifier* pop up without saving.

<a href="#top">back to top</a> 

## Unassign tModel Identifiers

Remove the identifier association from the current tModel definition. 

Removing an identifier could become necessary if, among other reasons, the established association with the selected identifier scheme is no longer valid or the tModel definition changed requiring a new identifier association.

1. Follow steps #1 through #4 of the [About tModel Identifiers](#about-tmodel-identifiers) section of this page.
2. Select the line item for the Identifier Scheme you want delete.
3. Click **Unassign Identifier**.  
A confirmation pop up is displayed:  
"Are you sure you want to unassign this identifier?"
4. Click **OK** to unassign the identifier.  
The Identifier is removed form the system and no longer appears on the *Identifier Summary* screen.
5. (Optional) Click **Cancel** to cancel the unassign operation.

<a href="#top">back to top</a> 

## About tModel Categories

Categories are a set of classification codes that represent different aspects of a web service (e.g., products, services, technical specifications). 

Within UDDI, a categorization tModel is used for structuring category content

View a listing of current tModel Category Schemes that are defined for the current tModel definition on the *tModel Categories Summary* screen.

1. Go to **Configure > Registry > tModels**.  
The *tModels Summary* screen displays.
2. Select the line item corresponding to the tModel definition you want to modify.
3. Click **View tModel**.  
The *tModel Details* screen displays, showing a view-only image of the selected tModel.
4. Click the **Categories** tab.  
The *tModel Categories Summary* screen displays.

<a href="#top">back to top</a> 

## Assign tModel Categories


1. Follow steps #1 through #4 of the [About tModel Categories](#about-tmodel-categories) section of this page.
2. Click **Assign Category**.  
The *Assign Category* screen displays, showing the Category Hierarchy.
3. Select a **Category Scheme**.
4. Navigate the tiers of the Category Scheme and select a **Category Value** to apply to the current tModel definition.
5. Click **Finish**.  
The system assigns the selected category value to the current organization definition and you are returned to the *Add Categories Summary* screen.
6. Click **Close** to exit.  
The wizard exits and the new category assignments are displayed on the *Categories Summary* screen.


<a href="#top">back to top</a> 

## Unassign tModel Categories

Remove the category association from the current tModel definition. 

Removing a category could become necessary if, among other reasons, the established association with the selected category is no longer valid or the tModel definition changed requiring a new category association.

1. Follow steps #1 through #4 of the [About tModel categories](#about-tmodel-categories) section of this page.
2. Select the line item for the Category Scheme you want delete.
3. Click **Unassign Category**.  
A confirmation pop up is displayed:  
"Are you sure you want to unassign this category?"
4. Click **OK** to unassign the identifier.  
The Category is removed form the system and no longer appears on the *Categories Summary* screen.
5. (Optional) Click **Cancel** to cancel the unassign operation.

<a href="#top">back to top</a> 


## Assign tModel Category Group

Category Groups allow you to categorize service relationships with a higher level of granularity.  They contain a list of business categories that describe specific business aspect of the Providers, Services, Bindings, or tModels. 

Examples of categories are:

* Industry
* Product Category
* Geographic Region

Each  Provider, Service, Binding, or tModel is assigned one or more Category Groups.

1. Go to **Configure > Registry > tModels**.  
The *tModels Summary* screen displays.
2. Select the line item corresponding to the tModel definition you want to modify.
3. Click **View tModel**.  
The *tModel Details* screen displays, showing a view-only image of the selected tModel.
4. Click the **Categories** tab.  
The *tModel Categories Summary* screen displays showing a listing of category definitions associated with the current tModel.
5. Click **Assign Category Group**.  
The *Select Category Group* screen displays, showing a list of Category Groups that exist for the current tModel.
6. Select the **radio button** next to the Category Group that you would like to assign new categories to.
7. Click **Next**.  
The *Select Categories* screen displays.
8. Select a **Category Scheme**.
9. Navigate the tiers of the Category Scheme and select a **Category Value** to apply to the current tModel definition.
10. Click **Finish**.  
The system assigns the selected category value to the current Category Group assigned to the tModel, and you are returned to the *Add Category Group Summary* screen.
11. Review the summary information.
12. Click **Close** to exit.


<a href="#top">back to top</a> 

## Unassign tModel Category Group

Remove the category group association from the current tModel definition. 

Removing a category group could become necessary if, among other reasons, the established association with the selected category group is no longer valid or the tModel definition changed requiring a new category group association.


1. Go to **Configure > Registry > tModels**.  
The *tModels Summary* screen displays.
2. Select the line item corresponding to the tModel definition you want to modify.
3. Click **View tModel**.  
The *tModel Details* screen displays, showing a view-only image of the selected tModel.
4. Click the **Categories** tab.  
The *tModel Categories Summary* screen displays showing a listing of category definitions associated with the current tModel.
5. Select the line item corresponding to the Category Group you want to unassign.
6. Click **Unassign Category Group**.  
A confirmation pop up window is displayed:  
"Are you sure you want to unassign this category group?"
7. Click **OK** to unassign the category group.   
The Category Group is removed form the system and no longer appears on the *Categories Summary* screen.
5. (Optional) Click **Cancel** to cancel the unassign operation.

<a href="#top">back to top</a>