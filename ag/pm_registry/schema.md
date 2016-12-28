---
layout: page
title: Schema
description: Learn about Schemas, which are referenced when importing WSDL and describe the messages used by the services.
product: ag
category: learn
sub-nav-class: Registry
weight: 05
type: page
nav-title: Schema
---


## Schema
Learn about Schemas, which are referenced when importing WSDL and describe the messages used by the services.

View the *Schema Summary* screen by going to **Configure > Registry** and then clicking on the **Schemas** tab.



<a href="registry_toc.html" class="button secondary">Registry (Home)</a> <a href="category_schemes.html" class="button secondary">Category Schemes</a> <a href="categories.html" class="button secondary">Categories</a> <a href="identifier_schemes.html" class="button secondary">Identifier Schemes</a> <a href="interfaces.html" class="button secondary">Interfaces</a> <a href="tmodels.html" class="button secondary">tModels</a> <a href="subscriptions.html" class="button secondary">Subscriptions</a> <br><br>  <a href="replications.html" class="button secondary">Replications</a> <a href="registry_reference.html" class="button secondary">Registry Reference</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [About Schemas](#about-schemas)
* [View Schema](#view-schema)
* [View Service References for Schema](#view-service-references-for-schema)
* [Perform Schema Search](#perform-schema-search)
* [Add Schema](#add-schema)
* [Schema Identifiers](#schema-identifiers)
* [Schema Categories](#schema-categories)


## About Schemas

Each web service includes a set of schemas that describe the structure of information (i.e., service model, constraints, commonalities, etc.). The purpose of a schema is to allow machine validation of document structure.

When importing WSDL, all referenced schemas that describe the messages used by the services are extracted, indexed and stored in the Metadata Repository. 

* This allows the Workbench to reuse schema between services, allowing users to see how many service references a particular schema has and therefore determine the impact of any change to a particular schema. 
* To preserve the integrity of the metadata repository, each schema should have a unique and sensible namespace to allow for their successful correlation and discovery.

<a href="#top">back to top</a> 


## View Schema

The *Schemas Summary* screen includes a list of schemas that are currently utilized in service definitions and are stored in the Policy Manager data repository. 

* Schema metadata is copied to the Policy Manager *Registry* when the service is registered using the *Create Physical Service Wizard*. 
* Each schema can be viewed in a browser window by selecting the **View Schema** action via the **Actions** drop-down list box.

1. Go to **Configure > Registry**.
2. Click on the **Schema** tab.  
The *Schemas Summary* screen displays.
3. For the Schema you would like to review, select **View Schema** from the **Actions** drop-down list box.  
A *browser window* loads and displays the content of the selected schema.

<a href="#top">back to top</a> 


## View Service References for Schema

The *Schema Summary* screen displays a *Number of References* column that indicates the number of services that are currently utilizing a specific schema. 

You can view the specific service references using the **View Service References** action.

**Note:** *The number of references column shows both references from bindings and services.*

1. Go to **Configure > Registry**.
2. Click on the **Schema** tab.  
The *Schemas Summary* screen displays.
3. For the Schema you would like to review, select **View Service References** from the **Actions** drop-down list box.  
The *Workbench > Search* screen displays, showing the references associated with the selected schema.

<a href="#top">back to top</a> 


## Perform Schema Search

Query Policy Manager and target schemas for the purposes of viewing schema details, references, and performing impact analysis. 

* Valid search criteria can be any part of the Schema Namespace. 
* When you perform a search, a list of results display that match your defined search criteria.

1. Go to **Configure > Registry**.
2. Click on the **Schema** tab.  
The *Schemas Summary* screen displays.
3. Define your **Search Criteria**.  
You can enter any portion of a Schema Namespace.
4. Click **Search**.  
A list of schemas that match your defined search criteria is displayed. 
5. (Optional) Apply **Schema Actions** to each search result via the *Actions* drop-down list box.

<a href="#top">back to top</a> 


## Add Schema

Import schemas from .xsd files into the Policy Manager data repository. These schemas can then be reused to model web services.

1. Go to **Configure > Registry**.
2. Click on the **Schema** tab.  
The *Schemas Summary* screen displays.
3. Click **Add Schema** to launch the *Add Schema Wizard*.  
The *Select Schema Import Option* screen displays.
4. Use the **radio buttons** to select one of the following:  
  * **Schema Path** - To specify a schema path, click **Browse** to navigate to the directory location of the Schema file, and select the Schema file. The field display populates with the selected path.
  * **Schema URL** - To specify the Schema using a Uniform Resource Locator (URL), click the **Schema URL** radio button and enter the address into the field display. The name format must conform to a supported Uniform Resource Identifier (URI) scheme.
  * **Zip Archive Path** - To specify a path to the Zip Archive Path, click *Browse* to navigate to the directory location of the Zip Archive File, and select the file. The field display populates with the selected path.
5. Click **Finish**.  
The *Completion Summary* screen displays.
6. Review the summary information, and then click **Close** to exit.

<a href="#top">back to top</a> 


## Schema Identifiers

To see a listing of Schema Identifiers that are defined for the current Schema definition:

1. Go to **Configure > Registry**.
2. Click on the **Schema** tab.  
The *Schemas Summary* screen displays.
3. For the Schema you would like to review, select **View Schema Details** from the **Actions** drop-down list box.  
The *Schema Details* screen displays.


### Assign Schema Identifiers
Assign an Identifier Scheme, Key Name, and Key Value that represent lookup elements that will be invoked during a search.

1. Go to **Configure > Registry**.
2. Click on the **Schema** tab.  
The *Schemas Summary* screen displays.
3. Target a schema that you would like to assign an identifier to.
4. Select **View Schema Details** from the **Actions** drop-down list box.  
The *Schema Details* screen displays.
5. Click the *Identifiers* tab.  
The *Schema Identifiers Summary" screen displays.
6. Click **Assign Identifier**.  
The *Assign Identifier* screen displays.
7. Select a desired *Identifier Scheme* from the drop-down list box.
8. Enter the *Key Name* [physical name] to associate with the selected Identifier Scheme.
9. Enter the internal *Key Value* being referenced in the selected Identifier Scheme.
10. Click **Apply**.  
The system saves the definition and you are returned to the *Schema Identifier Summary* screen.
11. (Optional) Click **Cancel** to exit the *Assign Identifier* screen without saving.


### Unassign Schema Identifiers

Remove the identifier association from the current Schema definition. 

Removing an identifier could become necessary if, among other reasons, the established association with the selected identifier scheme is no longer valid or the Schema definition changed requiring a new identifier association.

1. Go to **Configure > Registry**.
2. Click on the **Schema** tab.  
The *Schemas Summary* screen displays.
3. Target a schema that you would like to assign an identifier to.
4. Select **View Schema Details** from the **Actions** drop-down list box.  
The *Schema Details* screen displays.
5. Click the *Identifiers* tab.  
The *Schema Identifiers Summary* screen displays.
6. Click **Unassign Identifier**.  
A confirmation pop-up is displayed:  
"Are you sure you want to unassign this identifier?"
7. Click **OK** to unassign the Identifier.
8. (Optional) Click **Cancel** to cancel the operation.


<a href="#top">back to top</a> 


## Schema Categories
To view the Schema Categories Summary:

1. Go to **Configure > Registry**.
2. Click on the **Schema** tab.  
The *Schemas Summary* screen displays.
3. Target a schema that you would like to assign an identifier to.
4. Select **View Schema Details** from the **Actions** drop-down list box.  
The *Schema Details* screen displays.
5. Click the **Categories** tab.  
The *Schema Categories Summary* screen displays, presenting all the Categories that are defined for the current Schema.



### Assign Schema Category

To assign a Schema Category, you will:

* Navigate the Category Hierarchy to select a Category Scheme
* Navigate the tiers of the Category Scheme to select the Category Values
* Apply the selected values to the current Schema definition 

After applying the selected category values, a category definition is created and the record is displayed on the *Schema Category Summary* screen.

1. Follow steps #1 through #5 as outlined at the beginning of this section ([Schema Categories](#schema-categories)).
2. Click **Assign Category**.  
The *Select Categories* screen displays, presenting the Category Hierarchy.
3. Select a Category Scheme.
4. Navigate the tiers of the Category Scheme and select a "Category Value" to apply to the current schema definition.
5. Click **Finish**  
The system assigns the selected category value to the current organization definition and you are returned to the *Add Categories Summary* screen.
6. Click **Close**.  
You are returned to the *Categories Summary* screen where any new category assignments are displayed.


### Unassign Schema Category

Remove the category association from the current Schema definition. 

Removing a category could become necessary, among other reasons, if the established association with a selected category scheme is no longer valid or a Schema definition changed requiring a new category association.

1. Follow steps #1 through #5 as outlined at the beginning of this section ([Schema Categories](#schema-categories)).
2. Click **Unassign Category**.
3. A confirmation pop-up is displayed:  
"Are you sure you want to unassign this category?"
7. Click **OK** to unassign the category.
8. (Optional) Click **Cancel** to cancel the operation.


### Assign Schema Group

Category Groups allow you to categorize service relationships with a higher level of granularity, and contain a list of business categories that describe specific business aspects of the Organizations, Services, tModels, Schemas, Interfaces, or Bindings. 

Examples of categories are:

* Industry
* Product category
* Geographic region. 

One or more Category Groups can be assigned to each:

* Organization
* Service
* tModel
* Schema
* Interface
* Binding 

1. Follow steps #1 through #5 as outlined at the beginning of this section ([Schema Categories](#schema-categories)).
2. Click **Assign Category Group**.  
The *Assign Category Group* Wizard is launched, displaying the *Select Category Group* screen, where a list of Category Groups that exist for the current schema is presented.
3. Select the **radio button** next to the Category Group that you would like to assign new categories to.
4. Click **Next**.
The *Select Categories* screen displays.
5. Navigate the tiers of the Category Scheme and select a "Category Value" to apply to the current schema definition.
6. Click **Finish**.  
The system assigns the selected category value to the current Category Group assigned to the schema, and you are returned to the *Add Category Group Summary* screen.
7. Review the summary information.
8. Click **Close** to exit the *Add Category Group* Wizard.



### Unassign Schema Group

Remove the category group association from the current Schema Instance.

Removing a category group could become necessary if, among other reasons, the established association with a selected category group is no longer valid or a Schema definition changed requiring a new category association.

1. Follow steps #1 through #5 as outlined at the beginning of this section ([Schema Categories](#schema-categories)).
2. Click **Unassign Category Group**.
3. A confirmation pop-up is displayed:  
"Are you sure you want to unassign this category group?"
7. Click **OK** to unassign the category.
8. (Optional) Click **Cancel** to cancel the operation.

<a href="#top">back to top</a> 