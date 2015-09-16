---
layout: page
title: Binding Identifiers
description: Review and assign or unassign Identifiers that are defined for the current Binding.
product: ag
category: learn
sub-nav-class: Bindings
weight:	6
type: page
nav-title: Binding Identifiers
---

## Binding Identifiers
Review and assign or unassign Identifiers that are defined for the current Binding.

<a href="bindings_toc.html" class="button secondary">Bindings (Home)</a> <a href="../bindings/about_bindings.html" class="button secondary">About Bindings</a> <a href="../bindings/view_binding_details.html" class="button secondary">View Binding Details</a>    <a href="../bindings/add_binding.html" class="button secondary">Add Binding</a>  <a href="../bindings/binding_categories.html" class="button secondary">Binding Categories</a> <br><br><a href="../bindings/import_binding_from_wsdl.html" class="button secondary">Import Binding from WSDL</a> <a href="../bindings/view_wsdl_binding.html" class="button secondary">View WSDL (Binding)</a> <a href="../bindings/view_service_references_binding.html" class="button secondary">View Service References (Binding)</a> <a href="../bindings/delete_binding.html" class="button secondary">Delete Binding</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [View Binding Identifiers Summary](#view-binding-identifiers-summary)
* [Assign Binding Identifiers](#assign-binding-identifiers)
* [Unassign Binding Identifiers](#unassign-binding-identifiers)


## View Binding Identifiers Summary
See a listing of Identifiers that are defined for the current Binding.

1. In the *Management Console*, go to **Configure > Registry > Bindings**.  
The *Bindings Summary* Screen is displayed.
2. Click **View Binding Details**.  
The *Bindings Summary* Screen is displayed.
3. Click the **Identifiers** tab.  
The *Binding Identifiers Summary* Screen is displayed.  

<a href="#top">back to top</a> 

## Assign Binding Identifiers
Assign an Identifier Scheme, Key Name, and Key Value that represent lookup elements that will be invoked during a search.

1. In the *Management Console*, go to **Configure > Registry > Bindings**.  
The *Bindings Summary* Screen is displayed.
2. In the list, click on the binding you want to assign an identifier to.
3. From the **actions** dropdown list box, select **View Binding Details**.  
The *Binding Details* Screen is displayed.
4. Click the **Identifiers** tab.  
The *Binding Identifiers Summary* Screen is displayed.
5. Click **Assign Identifier**.  
The *Asign Identifier* Screen is displayed.
6. Select an **Identifier Scheme** from the dropdown list box.
7. Enter a **Key Name** [physical name] to associate with the selected Identifier Scheme.
8. Enter the internal **Key Value** being referenced in the selected Identifier Scheme.

<a href="#top">back to top</a> 

## Unassign Binding Identifiers
Remove an identifier association from the current Binding definition. 

Removing an identifier could become necessary if, for example, the established association with the selected identifier scheme is no longer valid or the Interface Definition changed, requiring a new identifier association.

1. In the *Management Console*, go to **Configure > Registry > Bindings**.  
The *Bindings Summary* Screen is displayed.
2. In the list, click on the binding you want to assign an identifier to.
3. From the **actions** dropdown list box, select **View Binding Details**.  
The *Binding Details* Screen is displayed.
4. Click the **Identifiers** tab.  
The *Binding Identifiers Summary* Screen is displayed, showing all the Identifiers that are defined for the current Binding.
5. From the line item display, click on the identifier scheme to be unassigned.
6. Click **Unassign Identifier**.  
A confirmation message is diapleyd: "Are you sure you want to unassign this identifier?"
7. Click **OK**.  
The identifier definition is removed from the *Binding Identifier Summary* Screen.
8. (Optional) To cancel the unassign operation, click **Cancel**.

<a href="#top">back to top</a> 