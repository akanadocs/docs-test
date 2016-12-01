---
layout: page
title: Import Binding from WSDL
description: Learn how to import bindings and interfaces from a WSDL file into the Policy Manager data repository that can then be reused to model web services.
product: ag
category: learn
sub-nav-class: Bindings
weight: 05
type: page
nav-title: Import Binding from WSDL
---

## Import Binding from WSDL

Learn how to import bindings and interfaces from a WSDL file into the Policy Manager data repository that can then be reused to model web services.

<a href="bindings_toc.html" class="button secondary">Bindings (Home)</a> <a href="../bindings/about_bindings.html" class="button secondary">About Bindings</a> <a href="../bindings/view_binding_details.html" class="button secondary">View Binding Details</a>    <a href="../bindings/add_binding.html" class="button secondary">Add Binding</a>  <a href="../bindings/binding_identifiers.html" class="button secondary">Binding Identifiers</a> <br><br><a href="../bindings/binding_categories.html" class="button secondary">Binding Categories</a> <a href="../bindings/view_wsdl_binding.html" class="button secondary">View WSDL (Binding)</a> <a href="../bindings/view_service_references_binding.html" class="button secondary">View Service References (Binding)</a> <a href="../bindings/delete_binding.html" class="button secondary">Delete Binding</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [Launch the Import Bindings and Interfaces Wizard](#launch-the-import-bindings-and-interfaces-wizard)
* [Select WSDL Import Option](#select-wsdl-import-option)
* [Select Bindings and Interfaces](#select-bindings-and-interfaces)


## Launch the Import Bindings and Interfaces Wizard

1. Log into the Policy Manager *Management Console*.
2. Go to **Configure > Registry > Bindings**.  
2. On the *Bindings Summary* screen, click **View Binding Details**.  
3. Click **Import Binding from WSDL**.

<a href="#top">back to top</a> 

## Select WSDL Import Option
The *Select WSDL Import Option* screen includes three WSDL import options:

* WSDL URL
* WSDL Path
* Zip Archive Path

1. Click the radio button for the WSDL Import Option you would like to use to import a WSDL file.  
  *  **WSDL URL** - Specify a WSDL using a Uniform Resource Locator (URL). Enter the address into the field display. The name format must conform to a supported Uniform Resource Identifier (URI) Scheme.
  *  **WSDL PATH** - Specify a WSDL by file path. Click **Browse** to navigate to the directory location of the WSDL file, and then click on it to select it.
   *  **Zip Archive PATH** - Specify a zipped WSDL by file path. Click **Browse** to navigate to the directory location of the zipped WSDL file, and then click on it to select it.
2. Click **Next**. The system accesses the specified file and presents the following screens:
  * For **WSDL URL** and **WSDL Path** - The system processes the WSDL file data and presents a list of WSDL service elements.  
If the WSDL file includes multiple service elements, each service element is represented using a "Service QName" that includes a namespaceURI and a Localpart.  
Click the **radio button** next to the "Service QName" that represents the WSDL service element you would like to add to the current service definition.
  * For **Zip Archive Path** - The system reads the zip archive file and presents the file list on the *Select File from Zip Archive* screen.  
Click the radio button next to the "File Name" of the zip archive file that contains the WSDL you would like to add to the current service.  
Click **Next** to continue.  
The system reads the selected file and presents the *Select WSDL Service Element* screen.

<a href="#top">back to top</a> 

## Select Bindings and Interfaces

The following steps are performed after you have selected the appropriate service elements.

1. Click **Next**. 
The *Select Bindings and Interfaces* screen displays showing a list of "Binding QNames" and "Interface QNames" that exist in the WSDL file that was selected for [import](#select-wsdl-import-option).
2. Select Interfaces:  
**Note**: *The* Status *column provides an indicator reflecting whether an interface is new or already exists and is stored in the Policy Manager data repository.*
  * To select "All" bindings and/or interfaces, click the **Binding QName** and/or **Interface QName** checkbox.
  * To select specific bindings and/or interfaces, click the checkbox next to each binding/interface you would like imported.  
3. Click **Finish**.  
The import process begins. Your imported Bindings and/or Interfaces will display on the *Bindings Summary* Screen.

<a href="#top">back to top</a> 

