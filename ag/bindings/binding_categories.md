---
layout: page
title: Binding Categories
description: Learn how to view current binding category schemes, and assign and unassign categories for the current binding definition.
product: ag
category: learn
sub-nav-class: Bindings
weight:	6
type: page
nav-title: Binding Categories
---

## Binding Categories

Learn how to view current binding category schemes, and assign and unassign categories for the current binding definition.

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

See a listing of categories that are assigned to the current binding.

1. Go to **Configure > Registry > Bindings**.  
2. On the *Bindings Summary* screen, click **View Binding Details**.  
3. On the *Bindings Details* screen, click the **Categories** tab. The *Binding Categories Summary* screen is displays.  

<a href="#top">back to top</a> 

## Assign Binding Categories

Navigate the Category Hierarchy to select a Category Scheme, navigate the tiers of the Category Scheme to select the Category Values, and apply the selected values to the current binding definition.

1. Go to **Configure > Registry > Bindings**.  
2. On the *Bindings Summary* screen, select a binding you want to assign a binding category to.
3. From the **Actions** drop-down, select **View Binding Details**.  
4. On the *Binding Details* screen, click the **Categories** tab. The *Binding Categories Summary* screen displays showing all the Categories that are defined for the current binding.
5. Click **Assign Category**. The *Select Categories* screen displays showing the Category Hierarchy.
6. Select a **Category Scheme**.
7. Navigate the tiers of the Category Scheme and click on a "Category Value" to apply to the current binding definition.
8. Click **Finish**. The system assigns the selected category value to the current organization definition and the  *Add Categories Summary* screen displays.
9. Click **Close** to exit the *Add Categories Wizard*. The *Categories Summary* screen displays.

<a href="#top">back to top</a> 

## Unassign Binding Categories

Remove a category association from the current binding definition. Necessary if:

* The established association with a selected category scheme is no longer valid.
* A binding definition has changed, requiring a new category association, etc.

1. Go to **Configure > Registry > Bindings**.  

2. On the *Bindings Summary* screen, click on the binding you want to assign a binding category to.
3. From the **Actions** drop-down, select **View Binding Details**.  
4. On the *Binding Details* screen, click the **Categories** tab. The *Binding Categories Summary* screen displays, showing all the Categories that are defined for the current Binding.
5. Select the category scheme to be unassigned from the line item display.
6. Click **Unassign Category**. 
7. Click **OK** to confirm the action or **Cancel** to exit the operation

<a href="#top">back to top</a> 

## Assign Binding Category Group

This section describes how to select a UDDI Category Group you want to assign new Categories to, navigate the Category Hierarchy to select a Category Scheme, navigate the tiers of the Category Scheme to select the Category Values, and then apply the selected values to the binding definition.  After applying the selected category values, a category definition is created and the record is displayed on the *Category Summary* screen.  

Category Groups allow you to categorize service relationships with a higher level of granularity, and contain a list of business categories that describe specific business aspects of the Organizations, Services, tModels, Schemas, Interfaces, or Bindings.

Examples of Category Groups are:

* Industry
* Product category
* Geographic region

**Note**: *Each Organization, Service, tModel, Schema, Interface, or Binding can be assigned to one or more Category Groups.*

1. Go to **Configure > Registry > Bindings**.  
2. On the *Bindings Summary* screen, click on the binding you want to assign a binding category to.
3. From the **Actions** drop-down list box, select **View Binding Details**.  
4. On the *Binding Details* screen, click the **Categories** tab. The *Binding Categories Summary* screen displays showing all the Categories that are defined for the current Binding.
5. Click **Assign Category Group**. The *Assign Category Group Wizard* launches and *Select Category Group* screen displays, showing a list of Category Groups that exist for the current binding.
6. Select the radio button next to the Category Group that you would like to assign new categories to.
7. Click **Next**. The *Select Categories* screen displays. 
8. Navigate the tiers of the Category Scheme and select a "Category Value" to apply to the current binding definition.
9. Click **Finish**. The system assigns the selected category value to the current Category Group assigned to the binding and then the *Add Category Group Summary* screen displays. 
10. Click **Close** to exit the wizard.  

<a href="#top">back to top</a> 

## Unassign Binding Category Group

Remove a category group association from the current Binding. This is necessary if:

* The established association with a selected category group is no longer valid.
* A binding definition has changed, requiring a new category association, etc.

1. Go to **Configure > Registry > Bindings**.  
2. On the *Bindings Summary* screen, click on the binding you want to assign a binding category to.
3. From the **Actions** drop-down, select **View Binding Details**.  
4. On the *Binding Details* screen, click the **Categories** tab. The *Binding Categories Summary* screen displays showing all the Categories that are defined for the current binding.
5. From the line item display, select the category group to be unassigned.
6. Click **Unassign Category Group**.
7. Click **OK** to confirm the action or **Cancel** to exit the operation.  
<a href="#top">back to top</a> 