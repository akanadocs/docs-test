---
layout: page
title: Interfaces
description: Learn about Interfaces, which define the behavior of a service based on a set of defined operations that it implements?
product: ag
category: learn
sub-nav-class: Registry
weight: 05
type: page
nav-title: Interfaces
---


## Interfaces
Learn about Interfaces, which define the behavior of a service based on a set of defined operations that it implements.

The *Interfaces* section of *Policy Manager* provides functionality that allows you to manage the baseline of interfaces that are available for use when modeling a service.

View the *Interfaces Summary* screen by going to **Configure > Registry** and then clicking on the **Interfaces** tab.



<a href="registry_toc.html" class="button secondary">Registry (Home)</a> <a href="category_schemes.html" class="button secondary">Category Schemes</a> <a href="categories.html" class="button secondary">Categories</a> <a href="identifier_schemes.html" class="button secondary">Identifier Schemes</a> <a href="schema.html" class="button secondary">Schema</a> <a href="tmodels.html" class="button secondary">tModels</a> <a href="subscriptions.html" class="button secondary">Subscriptions</a> <br><br> <a href="replications.html" class="button secondary">Replications</a> <a href="registry_reference.html" class="button secondary">Registry Reference</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [View Interface Details](#view-interface-details)
* [Perform Interface Search](#perform-interface-search)
* [Add Interface](#add-interface)
* [Interface Identifiers](#interface-identifiers)
* [Interface Categories](#interface-categories)
* [View or Export WSDL for Interfaces](#view-or-export-wsdl-for-interfaces)
* [View Service References for Interfaces](#view-service-references-for-interfaces)
* [Delete Interface](#delete-interface)




## View Interface Details

View the elements that comprise the Interface definition. Information presented includes:

* Key
* QName
* Type
* Description
* Number of References.

1. Go to **Configure > Registry**.
2. Click on the **Interfaces** tab.  
The *Interfaces Summary* screen displays.
3. For the Interface you would like to review, select **View Interface Details** from the **Actions** drop-down list box.  
The *Interface Details* screen displays.

<a href="#top">back to top</a> 


## Perform Interface Search

Query Policy Manager to see specified interface details, references (i.e., services that are implementing a specific interface), and impact analysis.

* Valid search criteria can be any part of the Interface Namespace URI/Localpart of the Service QName. 
* When you perform a search, a list of results display that match your defined search criteria.
1. Go to **Configure > Registry**.
2. Click on the **Interfaces** tab.  
The *Interfaces Summary* screen displays.
3. Define your **Search Criteria**.  
You can enter any portion of a Interface Namespace URI/Localpart of the Service QName.
4. Click **Search**.  
A list of interfaces that match your defined search criteria is displayed. 
5. (Optional) Apply **Interface Actions** to each search result via the *Actions* drop-down list box.

<a href="#top">back to top</a> 


## Add Interface

Define an "Interface," which defines the behavior of a service based on a set of defined operations that it implements.

* An interface can be imported, or modeled using existing schemas or interfaces.
* Adding an Interface to the Policy Manager data repository involves defining an Interface QName which is composed of a "Namespace URI" and "Localpart," and selecting the Interface elements and associated Operations you would like to include in the Interface definition
* There are three (3) ways to add an Interface: 
  * **Import from WSDL** - Import interfaces from a WSDL file into the Policy Manager data repository. These interfaces can then be reused in full or in part to model web services.
  * **Model Using Existing Schemas** - Model a new interface by utilizing schemas and associated operations that are already registered in Policy Manager.
  * **Model Using Existing Interface** - Model a new interface by utilizing interfaces and associated operations that are already registered in Policy Manager.

The following three initial steps are applicable to all Interface addition methods:

1. Go to **Configure > Registry**.
2. Click on the **Interfaces** tab.  
The *Interfaces Summary* screen displays.
3. Click **Add Interface**.  
The *Select Interface Creation Option* screen displays.


### Import Interface from WSDL

1. From the *Select Interface Creation Option*, select the **Import from WSDL** radio button.
2. Click **Next**.  
The *Select WSDL Import Option* screen displays.
3. Click the **radio button** next to the WSDL Import Option you would like to use, and then perform the appropriate action to complete the entry:  
  * **WSDL URL** - Enter the address into the blank field. The name format must conform to a supported Uniform Resource Identifier (URI) Scheme.
  * **WSDL Path** - Click **Browse** to navigate to the directory location of the WSDL file, and then select it. The field display populates with the selected path.
  * **Zip Archive Path** - Click **Browse** to navigate to the directory location of the Zip Archive File, and then select it. The field display populates with the selected path.
4. Click **Next**.  
The system accesses the file specified in step #3 and presents the following screens (depending on selection):  
  * For **WSDL URL** & **WSDL Path** - The system processes the WSDL file data and presents a list of WSDL service elements. If the WSDL file includes multiple service elements, each service element is represented using a "Service QName" that includes a namespaceURI and a Localpart. Click the **radio button** next to the "Service QName" that represents the WSDL service element you would like to add to the current service definition.
  * For **Zip Archive Path** - The system reads the zip archive file and presents the file list on the *Select File from Zip Archive* screen. Click the **radio button** next to the "File Name" of the zip archive file that contains the WSDL you would like to add to the current service.
5. Click **Next**.  
The system reads the selected file and the *Select WSDL Service Element* screen displays.
6. Select the appropriate **Service Element**.
7. Click **Next**.  
The *Select Interface* screen displays, showing a list of "Interface QNames" that exist in the WSDL file that was selected for import in step #3.
8. **Select** Interface(s):  
  * To select **All** interfaces - Click the **Interface QName** checkbox.
  * To select **Specific Interfaces** - Click the **checkbox** next to each interface you would like imported. The "Status" column provides an indicator reflecting whether the interface exists and is already stored in the Policy Manager data repository, or is new.
9. Click **Finish**.  
The import process is initiated.  Once complete, your imported Interfaces will appear on the *Interfaces Summary* screen.


### Model Interface Using Existing Schemas

Model a new interface by utilizing schemas and associated operations that are already registered in Policy Manager.

1. From the *Select Interface Creation Option*, select the **Model using existing schemas** radio button.
2. Click **Next**.  
The *Specify Interface Details* screen displays where you define a new interface that can be used when modeling a service.
3. Specify *Interface Details*:  
  * Namespace URI
  * Local Part
  * Key
  * Description
4. Click **Add Operation**.
5. Define the *Name* and *Description* of the operations for the current interface.  
Input, Output, and Fault messages for each operation will be populated on the *Specify Operation Details* screen.
6. Click **Next**.  
The *Specify Operation Details* screen displays where you populate messages for operations defined on the *Specify Interface Details* screen with schema elements and types.  A new instance of this screen is presented for each operation defined.
7. Under *Schema Elements and Type*, assign schema elements or types to Input, Output, and Fault Messages listed in the *Operation Messages* Section by selecting the operation message type from a drop-down list box.  
**Note**: *Elements can be filtered by "Element" or "Type."*  
  * Select the *Element* or *Type* filter **radio button**.
  * Navigate the *Element/Type Name* list and select "Input," "Output," or "Fault" from the *Add To* column drop-down list box to populate the operation messages.  
The *Operation Messages* populate with the Namespace, Local Part, and Element or Type (i.e., based on the selected filter).
8. Click **Next**.  
If the current operation is the last in the sequence, the **Finish** button is displayed.
9. Click **Finish**.  
The *Completion Summary* screen displays.
10. Review the Summary Information.
11. Click **Close**.



### Model Interface Using Existing Interface

Model a new interface by utilizing interfaces and associated operations that are already registered in Policy Manager.

1. From the *Select Interface Creation Option*, select the **Model using existing interfaces** radio button.
2. Click **Next**.  
The *Specify Interface Details* screen displays where you define a new interface that can be used when modeling a service.
3. Enter the "Interface QName."  
  * Namespace URI
  * Localpart
  * Description (Optional)   
  If you enter a description, it will be displayed as hover text when you drag the mouse over the "Namespace URI" on the *Interfaces Summary* screen.
4. Click **Next**.  
The *Select Interfaces* screen displays.  
  * The web service interface models how the service performs its processing. 
  * It defines the types of messages and message exchange patterns that are involved in interacting with the service, together with any conditions implied by those messages. 
  * Here, you will model your interface by selecting from a list of interfaces that are currently stored in the Policy Manager data repository.
5. (Optional) Perform a search for "Interfaces":  
  * Enter custom search criteria into the *Interface QName* field display.
  * Click **Search**.  
  The *Results* screen area provides a listing of interfaces that match your search criteria.
6. (Optional) Assign individual interfaces to the current interface definition:  
  * Select the **checkbox** next to each "Interface QName."
  * Click the **right arrow**.
  * The selected interfaces will display in the *Interfaces Assigned* screen area.
7. (Optional) Assign all interfaces to the current interface definition:  
  * Click on the main **Interface QName checkbox** in the header of the *Results* screen area.
  * Click the **right arrow**.
  * The selected interfaces will display in the *Interfaces Assigned* screen area.
8. Click **Next**.  
The *Select Operations* screen displays where a list of operations that are included in the Interface definitions selected in the previous step are displayed. These operations can be assigned to the current Interface definition.
9. (Optional) To replicate the current interface definition, click the **checkbox** next to each operation you would like added to the current Interface definition.
10. (Optional) To rename an Operation, enter the new "Operation Name" into the **text box** below the Interface QName.
11. Click **Finish**.  
The new "Interface" is displayed on the *Interfaces Summary* screen.

<a href="#top">back to top</a> 


## Interface Identifiers


### View Interface Identifiers

1. Go to **Configure > Registry**.
2. Click on the **Interfaces** tab.  
The *Interfaces Summary* screen displays.
3. Select **View Interface Details** from the *Actions* drop-down list box.
The *Interface Details* screen displays.
4. Click the **Identifiers** tab.  
The *Interface Identifiers Summary* screen displays.


### Assign Interface Identifiers

Assign an Identifier Scheme, Key Name, and Key Value that represent lookup elements that will be invoked during a search.

1. Follow steps 1 through 4 as outlined directly above, under "View Interface Identifiers."
2. Click **Assign Identifier**.  
The *Assign Identifier* screen displays.
3. Select the desired "Identifier Scheme" from the **drop-down list box**.
4. Enter the **Key Name [physical name]** to associate with the selected Identifier Scheme.
5. Enter the internal *Key Value* being referenced in the selected Identifier Scheme.
6. Click **Apply**.  
The system saves the definition and you are returned to the *Interface Identifier Summary* screen.
7. (Optional) Click **Cancel** to exit without saving.


### Unassign Interface Identifiers

Remove the identifier association from the current Interface definition.  Removing an identifier could become necessary if, among other reasons:

* The established association with the selected identifier scheme is no longer valid
* The Interface definition changed requiring a new identifier association

1. Follow steps #1 through #4 as outlined earlier in this section, under "View Interface Identifiers."
2. Click on the line item for the Identifier Scheme you wish to unassign.
3. Click **Unassign Identifier**.  
A confirmation pop-up is displayed, showing the following message:  
"Are you sure you want to unassign this identifier?"
4. Click **OK**.  
The identifier definition is removed and is no longer listed on the *Interfaces Identifier Summary* screen.
5. (Optional) Click **Cancel** to cancel the operation. 

<a href="#top">back to top</a> 


## Interface Categories


### View Interface Categories

The following three initial steps are applicable to all Interface Category addition methods:

1. Go to **Configure > Registry**.
2. Click on the **Interfaces** tab.  
The *Interfaces Summary* screen displays.
3. Click on the line item for the Interface you would like to assign a category to.
4. From the **Actions** drop-down list, select **View Interface Details**.  
The *Interface Details* screen displays.
5. Click the **Categories** tab.  
The *Interface Categories Summary* screen displays, showing all categories that are defined for the current interface.


### Assign Interface Categories

1. Follow steps #1 through #5 as outlined directly above, under "View Interface Categories."
2. From the *Interface Categories Summary* screen, click **Assign Category**.  
The *Select Categories* screen displays.
3. Select a **Category Scheme**.
4. Navigate the tiers of the *Category Scheme* and select a **Category Value** to apply to the current interface definition.
5. Click **Finish**.  
The system assigns the selected category value to the current organization definition and you are returned to the *Add Categories Summary* screen.
6. Click **Close** to exit.  
The wizard exits and the new category assignments is displayed on the *Interface Categories Summary* screen.


### Unassign Interface Categories

Remove the category association from the current Interface definition. 

Removing a category could become necessary if, among other reasons, the established association with a selected category scheme is no longer valid or an Interface definition changed requiring a new category association.

1. Follow steps #1 through #5 as outlined earlier in this section, under "View Interface Categories."
2. From the *Interface Categories Summary* screen, click **Unassign Category**.  
A confirmation pop-up window is displayed:  
"Are you sure you want to unassign this category?"
3. Click **OK** to unassign the category.  
The category is removed and you are returned to the *Interface Categories Summary* screen.
4. (Optional) Click **Cancel** to cancel the unassign operation.


### Assign Interface Category Groups

Category Groups allow you to categorize service relationships with a higher level of granularity, and contain a list of business categories that describe specific business aspects of the Organizations, Services, tModels, Schemas, Interfaces, or Bindings. 

Examples of categories are:

* Industry
* Product category
* Geographic region. 

Each Organization, Service, tModel, Schema, Interface, or Binding can be assigned one or more Category Groups.

1. Follow steps #1 through #5 as outlined earlier in this section, under "View Interface Categories."
2. From the *Interface Categories Summary* screen, click **Assign Category Group**.  
The *Assign Category Group Wizard* launches and *Select Category Group* screen displays listing the Category Groups that exist for the current interface.
3. Click the **radio button** next to the Category Group that you would like to assign a new category to.
4. Click **Next**.  
The *Select Categories* screen displays.
5. Select a **Category Scheme**.
6. Navigate the tiers of the *Category Scheme* and select a **Category Value** to apply to the current interface definition.
7. Click **Finish**.  
The system assigns the selected category value to the current organization definition and you are returned to the *Add Category Group Summary* screen.
8. Click **Close** to exit.  
The wizard exits and the new category assignments is displayed on the *Interface Categories Summary* screen.


### Unassign Interface Category Groups

Remove the category group association from the current Interface. 

Removing a category group could become necessary if, among other reasons, the established association with a selected category group is no longer valid or an Interface definition changed requiring a new category.

1. Follow steps #1 through #5 as outlined earlier in this section, under "View Interface Categories."
2. From the *Interface Categories Summary* screen, click **Unassign Category Group**.  
A confirmation pop-up window is displayed:  
"Are you sure you want to unassign this category group?"
3. Click **OK** to unassign the category group.  
The category is removed and you are returned to the *Interface Categories Summary* screen.
4. (Optional) Click **Cancel** to cancel the unassign operation.

<a href="#top">back to top</a> 


## View or Export WSDL for Interfaces

The "View WSDL" action launches a browser window and displays the WSDL metadata associated with the current interface. WSDL metadata is copied to the Policy Manager "Registry" when the service is registered using the *Create Physical Service Wizard*.

1. Go to **Configure > Registry**.
2. Click on the **Interfaces** tab.  
The *Interfaces Summary* screen displays.
3. Click on the line item for the Interface you would like to view a WSDL for.
4. From the **Actions** drop-down list, select **View WSDL**.  
The *View WSDL* screen displays.
5. (Optional) To export the WSDL, click **Save**.  
A *File Download* pop-up is displayed.  
  * Click **Save**.
  * Specify the filename you would like to assign to the WSDL.
  * Navigate to the directory where you would like to save the WSDL.
  * Click **Save**.  
  The WSDL file saved to the specified location. 

<a href="#top">back to top</a> 


## View Service References for Interfaces

The *Interfaces Summary* screen displays a "Number of References" column that indicates the number of services that are currently implementing a specific interface.

**Note**: *The number of references column shows both references from bindings and services.*

1. Go to **Configure > Registry**.
2. Click on the **Interfaces** tab.  
The *Interfaces Summary* screen displays.
3. Click on the line item for the Interface you would like to view Service References for.
4. From the **Actions** drop-down list, select **View Service References**.  
The *Workbench > Search* screen displays, showing the references associated with the selected interface.

<a href="#top">back to top</a> 


## Delete Interface

**Note**: *Only interfaces that contain zero references display the delete function.*

1. Go to **Configure > Registry**.
2. Click on the **Interfaces** tab.  
The *Interfaces Summary* screen displays.
3. Click on the line item for the Interface you would like to delete.
4. Click **Delete Interface**.  
A confirmation pop-up is displayed:  
"Are you sure you want to delete this interface?"
5. Click **OK**.  
The interface is permanently removed from the system.
6. (Optional) Click **Cancel** to cancel the delete operation.

<a href="#top">back to top</a> 