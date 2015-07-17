---
layout: page
title: Using the Messaging Binding
description: Learn about messaging binding configuration options and how to configure a virtual service with AMQP or JMS messaging. 
product: ag
category: learn
weight: 2
sub-nav-class: Bindings
type: page
nav-title: Using the Messaging Binding
---

## Using the Messaging Binding

Learn about messaging binding configuration options and how to configure a virtual service with AMQP or JMS messaging.

<a href="../assets/bindings/messaging_binding_use_cases.html" target="_blank" class="button secondary">Use Cases (Messaging Binding)</a>

<h5 class="stamp">Supported Platforms: 7.2</h5>

### Table of Contents
<div id="toc-marker"></div>

* [Introduction](#introduction)
* [Configuration Options](#config-options)
* [Use Cases](#use-cases)

<div class = "divider1"></div>

### Introduction

The Messaging Binding type is introduced in Policy Manager 7.2. This binding type is used for processing messages sent over a messaging protocol.

* The binding is similar in concept to the HTTP (REST) binding but instead of being dependent on the HTTP protocol this binding type allows you to treat a messaging provider as a transport.
* You can specify the queue for each operation of a service when you build the binding.
* Topics and Queues are supported.
* Currently AMQP 1.0 is supported and RabbitMQ - AMQP 0-9.

Support for this binding is available in the following sections of the *Policy Manager Management Console*:

* *Add Binding > Configure Messaging Binding Properties* - (Configure > Registry > Bindings)
* *Add / Modify Access Point > Specify AMQP Details* - (Workbench > Services > Access Points)
* *Add / Modify Access Point > Specify AMQPS Details* - (Workbench &gt; Services &gt; Access Points)
* *Add Container Listener (AMQP)* -  (Workbench > Containers > Details)
* *Add Container Listener (AMQPS)* -  (Workbench > Containers > Details)
* *Host Virtual Service / Modify Virtual Service > Specify AMQP Details* - (Workbench > Containers > Hosted Services)


<p><a href="#top">Back to top</a></p>

### Configuration Options

The Messaging Binding includes the  following configuration options:

##### Add Binding > Configure Messaging Binding Properties - (Configure > Registry > Bindings)

##### Binding Details

* Displays Interface QName, Binding QName, and Binding Type elements for the current  binding definition.


##### Binding Properties

* **Transport** - Select AMQP or JMS messaging protocols.
* **Transport URI** - Specify transport URI for connecting to the AMQP or JMS server.

##### Operations

Configure each operation in the binding as follows:

* **Operation Label** - Displays the read only label of the operation.
* **Destination Type Pull-Down** - Select whether you would like messages routed to a Topic exchange or a Queue.
* **Destination Name** - Enter the name of the Topic exchange (e.g., example.topic) or Queue.
* **Input Content Type** - Describe type of content of the Request Message.
* **Output Content Type** - Describe the type of content of the response message when it  is not a fault.
* **Fault Content Type** - Describe the type of content of the response message when it is a fault.
* **Reply To** - Specify the name of the queue that the replies (i.e., responses to the requests)  will be inserted into.

*Note: Type of content can be described using a media type (i.e., application/xml, text/html, application/json).*

##### Parts

Define the following elements for the parts of the input message as defined in the interface (WSDL portType).

* **Part** - Read-only label that displays part name as defined in the interface.
* **Name** - Enter a binding specific name for the part. The value of the Part is used as the default.
* **Type** - Select how the part is transported in the protocol. Options include Body, Header,  and Property.
* **Value** - Enter a value if the Type field has a Property as its choice. The text box  is only enabled if Property has been chosen.
* **Use Selector** - Enable use of a selector filter and specify filter.

##### Add / Modify Access Point > Specify AMQP Details - (Workbench > Services > Access Points)

The *Specify AMQP Details* screen for a physical and virtual service allows you to configure  transport information for the current Access Point definition. Transport configuration options are derived from the service binding.

##### Physical Service

* **Service Details** - Displays the "Service Type" and "Service Name" of the service associated with the current Access Point definition. These fields are Policy  Manager-specific.
* **Binding Details** - Displays the "Binding Type" and "Binding" associated    with the service access point definition. The "Binding Type" is a Policy Manager-specific  field. The "Binding" represents the wsdl:binding element in the WSDL.
* **Access Point Details** - Displays the "WSDL Port Name" and "Description." The "WSDL Port Name" represents the wsdl:port element in the WSDL. The "Description" represents the wsdl:documentation element in the WSDL. The "Description" field is  optional.
* **Virtual Host Name** - Allows you to specify the virtual host name of the  AMQP broker.
* **Authentication Required** - Used if the AMQPS binding will be used to authenticate an AMQP registry where AMQP destinations or targets are located, or to authenticate the AMQP system itself, authentication may be required. To enable authentication, select the checkbox and specify the username and password credentials.

##### Virtual Service

* **Service Details** - Displays the "Service Type" and "Service Name" of the service associated with the current Access Point definition. These fields are Policy Manager-specific.
* **Binding Details** - Displays the "Binding Type" and "Binding" associated with the service access point definition. The "Binding Type" is a Policy Manager-specific  field. The "Binding" represents the wsdl:binding element in the WSDL.
* **Access Point Details** - Displays the "WSDL Port Name" and "Description." The "WSDL Port Name" represents the wsdl:port element in the WSDL. The "Description" represents the wsdl:documentation element in the WSDL. The "Description" field is  optional.
* Virtual Host Name - Allows you to specify the virtual host name of the  AMQP broker.
* **AMQP Details** - Displays the virtual host name assigned to the AMQP broker, authentication details (true/false), and Username. If true, the AMQP binding will be used to authenticate an AMQP registry where AMQP destinations or targets are located,  or will authenticate the AMQP system itself.

##### *Add / Modify Access Point > Specify AMQPS Details* - (Workbench &gt; Services > Access Points)

The *Specify AMQPS Details* screen for a physical and virtual service allows you to configure  transport information for the current Access Point definition. Transport configuration options are derived from the service binding.

##### Physical Service

* **Service Details** - Displays the "Service Type" and "Service Name" of the service associated with the current Access Point definition. These fields are Policy  Manager-specific.

* **Binding Details** - Displays the "Binding Type" and "Binding" associated with the service access point definition. The "Binding Type" is a Policy Manager-specific  field. The "Binding" represents the wsdl:binding element in the WSDL.

* **Access Point Details** - Displays the "WSDL Port Name" and "Description." The "WSDL Port Name" represents the wsdl:port element in the WSDL. The "Description"    represents the wsdl:documentation element in the WSDL. The "Description" field is  optional.

* **Virtual Host Name** - Allows you to specify the virtual host name of the  AMQP broker.
* **Authentication Required** - Used if the AMQPS binding will be used to authenticate an AMQPS registry where AMQP destinations or targets are located, or to authenticate the AMQP system itself, authentication may be required. To enable  authentication, select the checkbox and specify the username and password credentials.

##### Virtual Service

* **Service Details** - Displays the "Service Type" and "Service Name" of the    service associated with the current Access Point definition. These fields are Policy  Manager-specific.
* **Binding Details** - Displays the "Binding Type" and "Binding" associated with the service access point definition. The "Binding Type" is a Policy Manager-specific field. The "Binding" represents the wsdl:binding element in the WSDL.
* **Access Point Details** - Displays the "WSDL Port Name" and "Description." The "WSDL Port Name" represents the wsdl:port element in the WSDL. The "Description" represents the wsdl:documentation element in the WSDL. The "Description" field is  optional.
* Virtual Host Name - Allows you to specify the virtual host name of the  AMQP broker.
* **AMQPS Details** - Displays the virtual host name assigned to the AMQP broker, authentication details (true/false), and Username. If true, the AMQPS binding will be used to authenticate an AMQP registry where AMQP destinations or targets are located, or will authenticate the AMQP system itself. To enable authentication, select the checkbox and specify the username and password credentials.

*Add Container Listener (AMQP) > Configure AMQP Listener Details* -  (Workbench > Containers > Details)

##### Listener Details

* **Listener Name** - Specify an instance name for the listener. 
* **Description** - Specify a description for the listener.

#####AMQP Details

* **Virtual Host Name** - This option allows you to specify the virtual host name of the AMQP broker.
* **Port** - Displays the default port 5672 used for AMQP connections. 

##### Authentication Required

* If the AMQP binding will be used to authenticate an AMQP registry where AMQP destinations or targets are located, or to authenticate the AMQP system itself, authentication may be required. To enable authentication, select the checkbox and specify the username  and password credentials.

##### Connection

Connection properties are user-defined additional properties that allow you to specify the messaging engine that an application will connect to. Only "String" type message    properties are supported. Connection Properties are configured by entering a "Property Name" and "Property Value." You can enter unlimited connection properties. Entering a Connection Property is optional.

##### *Add Container Listener (AMQPS) > Configure AMQPS Listener Details - (Workbench > Containers >Details)*

##### Listener Details

* **Listener Name** - Specify an instance name for the listener. 
* **Description** - Specify a description for the listener.

##### AMQPS Details

* **Virtual Host Name** - This option allows you to specify the virtual host name of the  AMQP broker.
* **Port** - Displays the default port 5671 used for AMQPS connections.

##### Authentication Required

If the AMQPS binding will be used to authenticate an AMQP registry where AMQP destinations    or targets are located, or to authenticate the AMQP system itself, authentication    may be required. To enable authentication, select the checkbox and specify the username  and password credentials. 

##### Connection

* Connection properties are user-defined additional properties that allow you to specify the messaging engine that an application will connect to. Only "String" type message properties are supported. Connection Properties are configured by entering a "Property Name" and "Property Value." You can enter unlimited connection properties. Entering  a Connection Property is optional.

<a href="#top">Back to top</a>

### Use Cases

The [Messaging Binding Usage Scenarios for Policy Manager](../assets/bindings/messaging_binding_use_cases.html) topic provides instructions for configuring the following scenarios:

* Create AMQP binding for services of any type (REST, Messaging, SOAP).
* Create a virtual service that provides a messaging (AMQP or JMS) interface to one or more existing services of any type (REST, Messaging, SOAP). 
* Create a virtual service that provides a RESTful interface for placing messages onto, and pulling messages from a JMS or AMQP queue.

<a href="#top">Back to top</a>

<div class = "divider1"></div>