---
layout: page
title: Configure AMQP binding for REST, Messaging, and SOAP services.
description: Learn how to configure an AMQP binding for REST, Messaging, and SOAP services and use with a virtual service.  
product: ag
category: learn
weight: 3
sub-nav-class: Bindings
type: page
nav-title: Configure AMQP binding for REST, Messaging, and SOAP services.
---

## Configure AMQP binding for REST, Messaging, and SOAP services

Learn how to create an AMQP binding for REST, Messaging, and SOAP services and use with a virtual service.

<a href="../bindings/using_messaging_binding.html" target="_blank" class="button secondary">Using the Messaging Binding</a>

<h5 class="stamp">Supported Platforms: 7.2</h5>

### Table of Contents
<div id="toc-marker"></div>

* [Introduction](#introduction)
* [Step 1 - Add Messaging Binding (AMQP or JMS)](#step-1-add-messaging-binding-amqp-or-jms)
* [Step 2 - Add AMQP Listener](#step-2-add-amqp-listener)
* [Step 3 - Add JMS Listener](#step-3-add-jms-listener)
* [Step 4 - Assign Messaging Binding to Service](#step-4-assign-messaging-binding-to-service)
* [Step 5 - Send Requests to API Using ActiveMQ](#step-5-send-requests-to-api-using-activemq)
* [Step 6 - Create Virtual Service to Provide RESTful Interface for Placing Messages](#step-6-create-virtual-service-to-provide-restful-interface-for-placing-messages)
* [Step 7 - Logging](#logging)

<div class = "divider1"></div>

### Introduction

This topic describes how to perform the following tasks in Akana Policy Manager. 

* Create AMQP binding for services of any type (REST, Messaging, SOAP).
* Create a virtual service that provides a messaging (AMQP or JMS) interface to one or more existing services of any type (REST, Messaging, SOAP). 
* Create a virtual service that provides a RESTful interface for placing messages onto, and pulling messages from a JMS or AMQP queue.

<a href="#top">Back to top</a>

### Step 1 - Add Messaging Binding (AMQP or JMS)

1. Launch the *Policy Manager Management Console*. 
2. Select **Create Physical Service**, create a physical service with http://www.ebi.ac.uk/ebisearch/ws/rest?_wadl
3. Navigate to **Configure > Registry > Bindings** and select **Add Binding**.
4. Select the service added in Step 2.

	![Messaging Binding](images/message_binding_usecase1.jpg "Add Messaging Binding")**
5. On the next screen, select the **Messaging Binding type.
	![Messaging Binding](images/message_binding_usecase1.jpg "Add Messaging Binding")
6. On the next screen, select **AMQP** as the Transport protocol.
7. Provide **Destination** and **Reply To** fields with desired I/O/Fault Serializations.
8. Select **Part Type** in Parts section. This section is used to assign Path parameters, Query parameters, Body parameters (e.g., http://agubba-e6420:9901/VS/{domainid}/entry/{entryids}?fields=<fields>&fieldurl=<fieldurl>&viewurl=<viewurl>&format<format>) is the URL to hit. In this case, the Binding screen configuration should be something like:

	![Messaging Binding](images/message_binding_usecase3.jpg "Add Messaging Binding")

   So that the request will hit, http://agubba-e6420:9901/VS/uniprot/entry/WAP_RAT,WAP_MOUSE?fields=descAltName,organism_scientific_name&fieldurl=true&viewurl=true&format=json
9. Provide an XPath or SQL query for Use selector option (e.g., Operation='get').
10. After adding the required fields, finish the process. 
11. Similarly, select JMS in Transport field, if it is desired to have a Messaging Binding over JMS protocol.

<a href="#top">Back to top</a>

### Step 2 - Add AMQP Listener

1. Select the *Containers* folder where you will be adding the AMQP listener, and select **Add Listener**. 
2. Select the **AMQP** Listener type.
3. Add an AMQP listener with details as shown below.
	![Messaging Binding](images/message_binding_usecase4.jpg "Add Messaging Binding")

<a href="#top">Back to top</a>

### Step 3 - Add JMS Listener

1. Select the *Containers* folder and Network Director (**ND1**) container where you will be adding the JMS listener, and select **Add Listener**.
2. Select the JMS listener type.
3. Add the JMS listener with details as shown below.
	![Messaging Binding](images/message_binding_usecase5.jpg "Add Messaging Binding")

<a href="#top">Back to top</a>

### Step 4 - Assign Messaging Binding to Service

1. Select the *Services* folder for the Physical Service. In the *Service Overview* section select **Manage** in the *Interfaces and Bindings* section. 

	![Messaging Binding](images/message_binding_usecase6.jpg "Add Messaging Binding")

2. On the *Select Interfaces* screen, select the **Messaging Binding** and assign it to the service (i.e., copy to the *Interfaces Assigned* panel), and complete the wizard.

	![Messaging Binding](images/message_binding_usecase7.jpg "Add Messaging Binding")
	![Messaging Binding](images/message_binding_usecase8.jpg "Add Messaging Binding")

3. Select **Virtualize Service** and virtualize the physical service on the AMQP/JMS listener on Network Director (**ND1**), and assign a service name (e.g., **VS1**).

	![Messaging Binding](images/message_binding_usecase9.jpg "Add Messaging Binding")

4. The virtual service should be hosted on the **ND1** where we have previously added the AMQP/JMS listeners.

	![Messaging Binding](images/message_binding_usecase10.jpg "Add Messaging Binding")

<a href="#top">Back to top</a>

### Step 5 - Send Requests to API Using ActiveMQ

1. Network Directory (**ND1**) must be connected to an AMQP broker such as apache-activemq-5.10.0.

2. Run ActiveMQ.

	![Messaging Binding](images/message_binding_usecase11.jpg "Add Messaging Binding")

3. Access activeMQ client at 'http://agubba-e6420:8161/admin/'.

4. Navigate to the *Queues* tab or *Topics* tab depending on the destination type used during Messaging Binding creation.
5. Select the Queue viz., dynamicQueues/dest5 in this scenario.

	![Messaging Binding](images/message_binding_usecase12.jpg "Add Messaging Binding")

6. Click on **SendTo** against the destination name.
7. Provide the appropriate Correlation ID, ReplyTo and Message Body and send the request.

	![Messaging Binding](images/message_binding_usecase13.jpg "Add Messaging Binding")

<a href="#top">Back to top</a>

### Step 6 - Create Virtual Service to Provide RESTful Interface for Placing Messages

1. Virtualize the above service on Network Director (**ND2**) with HTTP binding, and assign a name (e.g., **VS2**).
2. Send requests to **VS2**.
3. The requests will hit the **VS1** > physical service.

	![Messaging Binding](images/message_binding_usecase14.jpg "Add Messaging Binding")

   And the response is seen.

<a href="#top">Back to top</a>

### Step 7 - Logging

1. If the Detailed Auditing policy is attached to **VS1** and **VS2**, usage logs will be generated.
2. **VS2** logs:

	![Messaging Binding](images/message_binding_usecase15.jpg "Add Messaging Binding")

	![Messaging Binding](images/message_binding_usecase16.jpg "Add Messaging Binding")

	![Messaging Binding](images/message_binding_usecase17.jpg "Add Messaging Binding")

	![Messaging Binding](images/message_binding_usecase18.jpg "Add Messaging Binding")

3. **VS1** logs:

	![Messaging Binding](images/message_binding_usecase19.jpg "Add Messaging Binding")

	![Messaging Binding](images/message_binding_usecase20.jpg "Add Messaging Binding")

	![Messaging Binding](images/message_binding_usecase21.jpg "Add Messaging Binding")

<a href="#top">Back to top</a>

<div class = "divider1"></div>