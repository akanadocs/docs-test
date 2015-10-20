---
layout: page
title: Binding Identifiers
description: Learn how to review and assign or unassign identifiers that are defined for the current binding.
product: ag
category: learn
sub-nav-class: Bindings
weight:	6
type: page
nav-title: Binding Identifiers
---

## Binding Identifiers
Learn how to review and assign or unassign identifiers that are defined for the current binding.

<a href="bindings_toc.html" class="button secondary">Bindings (Home)</a> <a href="../bindings/about_bindings.html" class="button secondary">About Bindings</a> <a href="../bindings/view_binding_details.html" class="button secondary">View Binding Details</a>    <a href="../bindings/add_binding.html" class="button secondary">Add Binding</a>  <a href="../bindings/binding_categories.html" class="button secondary">Binding Categories</a> <br><br><a href="../bindings/import_binding_from_wsdl.html" class="button secondary">Import Binding from WSDL</a> <a href="../bindings/view_wsdl_binding.html" class="button secondary">View WSDL (Binding)</a> <a href="../bindings/view_service_references_binding.html" class="button secondary">View Service References (Binding)</a> <a href="../bindings/delete_binding.html" class="button secondary">Delete Binding</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [View Binding Identifiers Summary](#view-binding-identifiers-summary)
* [Assign Binding Identifiers](#assign-binding-identifiers)
* [Unassign Binding Identifiers](#unassign-binding-identifiers)


## View Binding Identifiers Summary

View a listing of Identifiers that are defined for the current binding.

1. Go to **Configure > Registry > Bindings**.  
2. On the *Bindings Summary* screen, select **View Binding Details** from the *Actions* drop-down.  
3. Click the **Identifiers** tab. The *Binding Identifiers Summary* screen displays.  

<a href="#top">back to top</a> 

## Assign Binding Identifiers

Assign an Identifier Scheme, Key Name, and Key Value that represent look-up elements that will be invoked during a search.

1. Go to **Configure > Registry > Bindings**.  
2. On the *Bindings Summary* screen, select the line item of the binding you want to assign an identifier to and select **View Binding Details** from the *Actions* drop-down. 
3. On the *Binding Details* screen, click the **Identifiers** tab.  
4. On the *Binding Identifiers Summary* screen, click **Assign Identifier**.  
5. On the *Assign Identifier* screen, select an **Identifier Scheme** from the drop-down.
6. Enter a **Key Name** [physical name] to associate with the selected Identifier Scheme.
7. Enter the internal **Key Value** being referenced in the selected Identifier Scheme.

<a href="#top">back to top</a> 

## Unassign Binding Identifiers

Removing an identifier from the current binding definition could become necessary if, for example, the established association with the selected identifier scheme is no longer valid or the Interface Definition changed, requiring a new identifier association.

1. Go to **Configure > Registry > Bindings**.  
2. On the *Bindings Summary* screen, select the binding you want to assign an identifier to and select **View Binding Details** from the *Actions* drop-down.  
3. On the *Binding Details* screen, click the **Identifiers** tab. The *Binding Identifiers Summary* screen displays showing all the Identifiers that are defined for the current binding.
4. Select the identifier scheme to be unassigned, and click **Unassign Identifier**.  
5. Click **OK** to confirm the action or **Cancel** to exit the operation.

<a href="#top">back to top</a> 