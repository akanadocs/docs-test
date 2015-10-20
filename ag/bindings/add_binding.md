---
layout: page
title: Add Binding
description: Add a new binding to the Policy Manager repository. Choose from binding types such as HTTP, Plain Old XML (POX), SOAP 1.1, SOAP 1.2, XML, and Messaging Binding.
product: ag
category: learn
sub-nav-class: Bindings
weight:	6
type: page
nav-title: Add Binding
---

## Add Binding

Add a new binding to the Policy Manager repository.  Choose from binding types such as HTTP, Plain Old XML (POX), SOAP 1.1, SOAP 1.2, XML, and Messaging Binding.

<a href="bindings_toc.html" class="button secondary">Bindings (Home)</a> <a href="../bindings/about_bindings.html" class="button secondary">About Bindings</a> <a href="../bindings/view_binding_details.html" class="button secondary">View Binding Details</a>    <a href="../bindings/binding_identifiers.html" class="button secondary">Binding Identifiers</a>  <a href="../bindings/binding_categories.html" class="button secondary">Binding Categories</a> <br><br><a href="../bindings/import_binding_from_wsdl.html" class="button secondary">Import Binding from WSDL</a> <a href="../bindings/view_wsdl_binding.html" class="button secondary">View WSDL (Binding)</a> <a href="../bindings/view_service_references_binding.html" class="button secondary">View Service References (Binding)</a> <a href="../bindings/delete_binding.html" class="button secondary">Delete Binding</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [Launch Add Binding Wizard](#launch-add-binding-wizard)
* [Select Interfaces](#select-interfaces)
* [Specify Binding Details](#specify-binding-details)
* [Configure Binding Properties](#configure-binding-properties)
	* [Configure HTTP Binding Properties](#configure-http-binding-properties)
	* [Configure POX Binding Properties](#configure-pox-binding-properties)
	* [Configure SOAP 1.1 Binding Properties](#configure-soap-1-1-binding-properties)
	* [Configure SOAP 1.2 Binding Properties](#configure-soap-1-2-binding-properties)
	* [Configure XML Binding Properties](#configure-xml-binding-properties)
	* [Configure Messaging Binding Properties](#configure-messaging-binding-properties)
* [Complete Binding Configuration](#complete-binding-configuration)


## Launch Add Binding Wizard

1. Go to **Configure > Registry > Bindings**.  
2. On the *Bindings Summary* screen, click **Add Binding**. The *Add Binding Wizard* launches and displays the *Select Interface* screen.

<a href="#top">back to top</a> 

## Select Interfaces
Use the *Select Interfaces* screen to model your service by selecting from the list of interfaces currently stored in the Policy Manager data repository.

1. In the *Search Interfaces* text box, enter part of an "Interface QName" and/or "Localpart." Interface QNames that match your search criteria will be included in the *Interfaces* drop-down in the *Results* section.
2. From the "Interfaces" dropdown list in the *Results* section, select an interface and click **Next**. The *Specify Binding Details* Screen is displayed.  
**Note**: *If an interface search is not performed, the default content of the drop-down equals* ***all*** *interfaces defined in the Policy Manager data repository.*

<a href="#top">back to top</a> 

## Specify Binding Details

Add "Namespace URI" and "Localpart" elements to your binding definition.

1. For the "Namespace URI" and "Localport" text boxes, leave the system-generated (and derivative of the elements of the selected interface) entries or enter custom values.
2. From the *Binding Type* drop-down, select the protocol that will be applied to the Binding Type you will be defining on subsequent binding configuration screen and click **Next** to continue. 
**Note**: *Supported options include HTTP, Messaging, POX, SOAP 1.1, SOAP 1.2, and XML.*
3. The *Binding Configuration* screen for the Binding Type selected in step 2 is displayed.

<a href="#top">back to top</a> 

## Configure Binding Properties

The next section includes general configuration steps for HTTP, Messaging, Plain Old XML (POX), SOAP 1.1, and SOAP 1.2 binding properties. 

The Binding Details screen includes the following information for each binding type:

* The "Binding Details" section of the screen displays the "Interface QName," "Binding QName," and "Binding Type" for the current binding definition.
* The "Binding Properties" section of the screen includes properties that apply to the WSDL operation within an HTTP binding.

### Configure HTTP Binding Properties

Define the HTTP method and URI pattern for your REST operation.

1. In the *Binding Properties* section, from the "Method" drop-down, select the HTTP method that will be mapped to at runtime and used when formulating an HTTP message request.  Select from:  
  * GET
  * POST
  * PUT
  * DELETE
2. (Optional) In the "URI Syntax" text field, specify a location attribute that can be used to map portions of an HTTP requested URI to portions of a WSDL input message.  
**Note**: *The specified syntax must match the inbound URI pattern. For example, if the HTTP URL looks similar to http://endpoint/context/quotes/xyz where xyz is a variable, then the URI syntax would be /quotes/{var}. The URI can contain multiple variables denoted by {}.*
3. Use the "Serialization Type" drop-down to select provides "Pre-defined" or "Custom XML" content types that support different message processing requirements for Input, Output, and Fault messages. Note that the "Form URL Encoded" category applies to the "Input Serialization" option only. The "Custom XML" content type provides a text box for entering custom XML that represents your message processing requirements.  
Select from: 
  * **Input Serialization Type** - This option is used to describe the content type of the Request Message. The default Input Serialization setting is application/x-www-form-urlencoded. A value of application/x-www-form-urlencoded assumes one of two things: 1) If the request message is a GET or DELETE, the query string contains items that are appended to the resulting XML message. 2) If the request message is a PUT or POST, the body contains a URL encoded string whose elements are appended to the resulting XML message. A value of an XML based content type assumes that the body contains the whole XML message.
  * **Output Serialization Type** - This option is used to describe the content type of the response message when it is not a fault. The Container uses the Output Serialization to correctly set the content type of the response sent back to the consumer when the response is not a fault. The default content type is "text/XML."
  * **Fault Serialization Type** - This option is used to describe the content type of the response message when it is a fault. The Container uses the Fault Serialization to correctly set the content type of the response sent back to the consumer when the response is a fault. The default content type is "text/XML."  

<a href="#top">back to top</a> 

##3 Configure POX Binding Properties

Define a Plain Old XML (POX) binding and define the Transport URI.

1. In the *Binding Properties* section, use the "Transport" dropdown to select a binding "Transport" (HTTP, JMS, Other) and "Transport URI" (JMS, Other).  
  * Each POX binding requires a "Transport URI" which is an address that points to the message transport mechanism used to communicate information required to deliver a message appropriately to an endpoint.
  * The "Transport URI" option displays for "JMS" and "Other" options.
  * JMS supports four "Transport URI" options (WebSphere, WebLogic, WSIF, and Tibco) that are selectable from a drop-down list box.
  * The "Other" transport option displays a "Transport URI" text box that allows you to enter a custom Transport URI (e.g., TCP). 
  * The Transport URI for HTTP is a known value and is processed by Policy Manager.

<a href="#top">back to top</a> 
  
## Configure SOAP 1.1 Binding Properties

Configure the properties of the current SOAP 1.1 binding definition including, Style, Transport, Namespace, and SOAP Action.

1. In the *Binding Properties* section, use the "Transport" drop-down list to select a binding "Transport" (HTTP or HTTPS) and then subsequently the "Transport URI" (JMS or Other). 
2. Use the "Style" drop-down list to select a binding "style" (Doc/Literal, RPC Literal or RPC Encoded).
3. Use the radio buttons to select a "SOAP Action."  Select from:  
  * **No SOAP Action required for all operations** - If selected, a SOAP action is not used to identify the operation and the system generates an empty string for the SOAP action.
  * **Treat each operation name in interface as a SOAP Action** - Identify the operation of a service by treating each operation name as a SOAP Action.
  * **Configure SOAP Action by adding a prefix value to operation name** - Customize the SOAP Action name for each operation with a unique identifier for the service. This prefix generally matches the targetNamespace of the WSDL.
4. Specify the Namespace of the operation element defined in the request.  
**Note**: *This option supports RPC/Literal or "RPC/Encoded" styles only.*

<a href="#top">back to top</a> 
  
## Configure SOAP 1.2 Binding Properties

Configure the properties of the current SOAP 1.2 binding definition including, Style, Transport and SOAP Action.

1. In the *Binding Properties* section, use the "Transport" drop-down list to select a binding "Transport" (HTTP or HTTPS) and then subsequently the "Transport URI" (JMS or Other). 
2. Use the "Style" drop-down list to select a binding "style" (Doc/Literal, RPC Literal or RPC Encoded).
3. Use the radio buttons to select a "SOAP Action."  Select from:  
  * **No SOAP Action required for all operations** - If selected, a SOAP action is not used to identify the operation and the sy	stem generates an empty string for the SOAP action.
  * **Treat each operation name in interface as a SOAP Action** - Identify the operation of a service by treating each operation name as a SOAP Action.
  * **Configure SOAP Action by adding a prefix value to operation name** - Customize the SOAP Action name for each operation with a unique identifier for the service. This prefix generally matches the targetNamespace of the WSDL.
4. Specify the Namespace of the operation element defined in the request.  
**Note**: *This option supports RPC/Literal or "RPC/Encoded" styles only.*

<a href="#top">back to top</a> 
  
## Configure XML Binding Properties

Configure a custom service binding definition.

1. In the *Binding Properties* section, **Enter Binding Properties** - Enter content of the XML Binding extensions. Typical binding elements include:
  * binding protocol (e.g., shttp:binding)
  * operation name (wsdl:operation name)
  * serialization type (faultSerialization, inputSerialization, and outputSerialization).  
  **Note**: *The wsdl:binding element is system generated and should not be specified as part of your binding definition. When a binding definition is saved, the specified XML extensions and content from the "Specify Binding Details" screen (i.e., Namespace URI, Localpart, etc.) are added to the wsdl:binding element.*
2. Click **Check Syntax** - Check the XML syntax to verify it is valid, well formed, and complies with the XML 1.0 requirements.
3. Click **Check Schema** - Verify that the XML content is valid according to the XML schemas referenced. The schemas are assumed to be reachable by the Namespace, Schema location, or existence in the *Configure > Registry > Schema* section of the *Management Console*.

<a href="#top">back to top</a> 
  
## Configure Messaging Binding Properties

Configure the properties of the current Messaging binding definition.

1. In the *Binding Properties* section, from the **Transport** drop-down, select AMQP or JMS messaging protocols.
2. If you selected JMS, from the **Transport URI** dropdown, specify transport URI for connecting to the AMQP or JMS server.
3. If you selected AMQP, from the Version dropdown, select the AMQP version. 

In the "Operations" section, configure each operation in the binding as follows:

1. **Operation Label** (No Action Required) - Displays the read only label of the operation.
2. **Destination Type Pull-Down** - Route messages to a Topic exchange or a Queue.
3. **Destination Name** - Enter the name of the Topic exchange (e.g., example.topic) or Queue.
4. **Input Content Type** - Describe type of content of the Request Message.
5. **Output Content Type** - Describe the type of content of the response message when it is not a fault.
6. **Fault Content Type** - Describe the type of content of the response message when it is a fault.  
**Note**: *Type of content can be described using a media type (i.e., application/xml, text/html, application/json).*
7. **Reply To** - Specify the name of the queue that the replies (i.e., responses to the requests) will be inserted into.
8. Define the following elements for the parts of the input message as defined in the interface (WSDL portType).
  * **Part** (No Action Required) - Read-only label that displays part name as defined in the interface.
  * **Name** - Enter a binding specific name for the part. The value of the Part is used as the default.
  * **Type** - Select how the part is transported in the protocol (Body or Property).
  * **Value** - Enter a value if the Type field has a Property as its choice.  *Note: This text box is only enabled if Property has been chosen.*
  * **Use Selector** - Enable use of a selector filter and specify filter.

<a href="#top">back to top</a> 
  
## Complete Binding Configuration

1. After completing your selections, click **Finish**.  The wizard exits, and you are returned to the *Bindings Summary* screen where your updated binding definition is displayed.

<a href="#top">back to top</a> 
