---
layout: page
title: Binding Categories
description: View current binding category schemes, assign and unassign categories for the current Binding definition.
product: ag
category: learn
sub-nav-class: Bindings
weight:	6
type: page
nav-title: Binding Categories
---

## Binding Categories
View current binding category schemes, assign and unassign categories for the current Binding definition..

<a href="bindings_toc.html" class="button secondary">Bindings (Home)</a> <a href="../bindings/about_bindings.html" class="button secondary">About Bindings</a> <a href="../bindings/view_binding_details.html" class="button secondary">View Binding Details</a>    <a href="../bindings/add_binding.html" class="button secondary">Add Binding</a>  <a href="../bindings/binding_identifiers.html" class="button secondary">Binding Identifiers</a> <br><br><a href="../bindings/import_binding_from_wsdl.html" class="button secondary">Import Binding from WSDL</a> <a href="../bindings/view_wsdl_binding.html" class="button secondary">View WSDL (Binding)</a> <a href="../bindings/view_service_references_binding.html" class="button secondary">View Service References (Binding)</a> <a href="../bindings/delete_binding.html" class="button secondary">Delete Binding</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [View Binding Categories Summary](#view-binding-categories-summary)
* [Assign Binding Categories](#assign-binding-categories)
* [Unassign Binding Categories](#unassign-binding-categories)
* [Assign Binding Category Group](#assign-binding-category-group)
* [Unassign Binding Category Group](#unassign-binding-category-group)


## View Binding Categories Summary
See a listing of Categories that are assigned to the current Binding.

1. In the *Management Console*, go to **Configure > Registry > Bindings**.  
The *Bindings Summary* Screen is displayed.
2. Click **View Binding Details**.  
The *Bindings Summary* Screen is displayed.
3. Click the **Categories** tab.  
The *Binding Categories Summary* Screen is displayed.  

<a href="#top">back to top</a> 

## Assign Binding Categories
Navigate the Category Hierarchy to select a Category Scheme, then navigate the tiers of the Category Scheme to select the Category Values and finally apply the selected values to the current Binding definition.

1. In the *Management Console*, go to **Configure > Registry > Bindings**.  
The *Bindings Summary* Screen is displayed.
2. In the list, click on the binding you want to assign a binding category to.
3. From the **actions** dropdown list box, select **View Binding Details**.  
The *Binding Details* Screen is displayed.
4. Click the **Categories** tab.  
The *Binding Categories Summary* Screen is displayed, showing all the Categories that are defined for the current Binding.
5. Click **Assign Category**.  
The *Select Categories* Screen is displayed, showing Category Hierarchy.
6. Select a **Category Scheme**.
7. Navigate the tiers of the Category Scheme and click on a "Category Value" to apply to the current binding definition.
8. Click **Finish**.  
The system assigns the selected category value to the current organization definition and the the *Add Categories Summary* Screen is displayed.
9. Click **Close** to exit the *Add Categories Wizard*.  
The *Categories Summary* Screen is displayed.

<a href="#top">back to top</a> 

## Unassign Binding Categories
Remove a category association from the current Binding definition. Necessary if:


* The established association with a selected category scheme is no longer valid
* A Binding definition has changed, requiring a new category association, etc.

1. In the *Management Console*, go to **Configure > Registry > Bindings**.  
The *Bindings Summary* Screen is displayed.
2. In the list, click on the binding you want to assign a binding category to.
3. From the **actions** dropdown list box, select **View Binding Details**.  
The *Binding Details* Screen is displayed.
4. Click the **Categories** tab.  
The *Binding Categories Summary* Screen is displayed, showing all the Categories that are defined for the current Binding.
5. Select the category scheme to be unassigned from the line item display.
6. Click **Unassign Category**.  
A confirmation message is displayed: "Are you sure you want to unassign this category?"
7. Click **OK**.  
The category definition is removed from the *Binding Categories Summary* Screen.
8. (Optional) To cancel the unassign operation, click **Cancel**.

<a href="#top">back to top</a> 

## Assign Binding Category Group
This section describes how to select a UDDI Category Group you want to assign new Categories to, navigate the Category Hierarchy to select a Category Scheme, navigate the tiers of the Category Scheme to select the Category Values, and then appply the selected values to the binding definition.  After applying the selected category values, a category definition is created and the record is displayed on the *Category Summary* Screen.  Refer to the *Category Schemes* section of the *Policy Manager Online Help* in **Registry > Category Schemes**.

Category Groups allow you to categorize service relationships with a higher level of granularity, and contain a list of business categories that describe specific business aspects of the Organizations, Services, tModels, Schemas, Interfaces, or Bindings.

Examples of Category Groups are:

* Industry
* Product category
* Geographic region

**Note**: *Each Organization, Service, tModel, Schema, Interface, or Binding can be assigned to one or more Category Groups.*

1. In the *Management Console*, go to **Configure > Registry > Bindings**.  
The *Bindings Summary* Screen is displayed.
2. In the list, click on the binding you want to assign a binding category to.
3. From the **actions** dropdown list box, select **View Binding Details**.  
The *Binding Details* Screen is displayed.
4. Click the **Categories** tab.  
The *Binding Categories Summary* Screen is displayed, showing all the Categories that are defined for the current Binding.
5. Click **Assign Category Group**.  
The *Assign Category Group Wizard* launches and *Select Category Group* Screen is displayed, showing a list of Category Groups that exist for the current binding.
6. Select the **radio button** next to the Category Group that you would like to assign new categories to.
7. Click **Next**.  
The *Select Categories* Screen is displayed.  Refer to the *Category Schemes* section of the *Policy Manager Online Help* in **Registry > Category Schemes**.
8. Navigate the tiers of the Category Scheme and select a "Category Value" to apply to the current binding definition.
9. Click **Finish**.  
The system assigns the selected category value to the current Category Group assigned to the binding and then the *Add Category Group Summary* Screen is displayed.
10. Click **Close** to exit the *Add Category Group Wizard.* 

<a href="#top">back to top</a> 

## Unassign Binding Category Group
Remove a category group association from the current Binding.  Necessary if:

* The established association with a selected category group is no longer valid
* A Binding definition has changed, requiring a new category association, etc.

1. In the *Management Console*, go to **Configure > Registry > Bindings**.  
The *Bindings Summary* Screen is displayed.
2. In the list, click on the binding you want to assign a binding category to.
3. From the **actions** dropdown list box, select **View Binding Details**.  
The *Binding Details* Screen is displayed.
4. Click the **Categories** tab.  
The *Binding Categories Summary* Screen is displayed, showing all the Categories that are defined for the current Binding.
5. From the line item display, select the category group to be unassigned.
6. Click **Unassign Category Group**.  
A confirmation message is displayed: "Are you sure you want to unassign this category group?"
7. Click **OK**.
The category group is removed from the *Binding Categories Summary* Screen.
8. (Optional) To cancel the unassign operation, click **Cancel**.



<a href="#top">back to top</a> 