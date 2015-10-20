---
layout: page
title: About Bindings
description: Learn how bindings are managed and configured in Policy Manager.
product: ag
category: learn
sub-nav-class: Bindings
weight:	6
type: page
nav-title: About Bindings
---

## About Bindings
Learn how bindings are managed and configured in Policy Manager.

<a href="bindings_toc.html" class="button secondary">Bindings (Home)</a> <a href="../bindings/view_binding_details.html" class="button secondary">View Binding Details</a>  <a href="../bindings/add_binding.html" class="button secondary">Add Binding</a>  <a href="../bindings/binding_identifiers.html" class="button secondary">Binding Identifiers</a>  <a href="../bindings/binding_categories.html" class="button secondary">Binding Categories</a> <br><br><a href="../bindings/import_binding_from_wsdl.html" class="button secondary">Import Binding from WSDL</a> <a href="../bindings/view_wsdl_binding.html" class="button secondary">View WSDL (Binding)</a> <a href="../bindings/view_service_references_binding.html" class="button secondary">View Service References (Binding)</a> <a href="../bindings/delete_binding.html" class="button secondary">Delete Binding</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [View Bindings Summary](#view-bindings-summary)


## Introduction
A binding is a reference to an external framework (i.e., interface) that defines how the WSDL user will reach the implementation of services. This reference specifies the protocol and data format to be used in the transmitting message defined by the associated interface.
* Each binding technique is specified in the WSDL and points to the server that has access to the actual implementation of your Web service.
* Policy Manager provides an extensible WSDL Binding framework that supports both out-of-the-box Binding implementations as well as custom Binding implementations. The Binding Framework includes API’s and extension points in both the SOA Containers and the Policy Manager *Management Console* user interface, though these portions of the framework are independent of each other. In some situations, only the user interface of the *Management Console* is extended for a type of binding. This is the case when an *SOA Container* is not used to virtualize services using the binding.
* Bindings drive the service management process and must be present and available when defining and managing service configurations. Because of this, Bindings must be added to the Policy Manager *Management Console* as a prerequisite to using the various service management wizards and access point functionality. SOAP 1.1, SOAP 1.2, Plain Old XML (POX), HTTP, XML, and Messaging binding types are supported. If the specified interface does not contain one of these binding types, a custom binding can be specified by supplying the appropriate XML.
* When defining Containers to host services, the listener configuration of the container must match the protocol defined in the binding that will be associated with the service.

<a href="#top">back to top</a> 

## View Bindings Summary
Log into the Policy Manager *Management Console*, and go to **Configure > Registry > Bindings**. The *Bindings Summary* screen displays where you can:

* Add bindings
* View bindings/WSDLs
* Configure identifiers/categories
* Import bindings from WSDLs
* View service references
* Delete bindings

<a href="#top">back to top</a> 






