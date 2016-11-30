---
layout: page
title: Configure JMS Connection over HTTP
description: Learn how to configure JMS or AMQP to initiate an HTTP/SOAP call that is then sent to JMS in a queue.   
product: ag
category: learn
weight: 104
sub-nav-class: Bindings
type: page
nav-title: Configure JMS Connection over HTTP
---

## Configure JMS Connection Over HTTP

Learn how to configure JMS or AMQP to initiate an HTTP/SOAP call that is then sent to JMS in a queue. 

<h5 class="stamp">Supported Platforms: 7.2</h5>

### Table of Contents
<div id="toc-marker"></div>

* [Introduction](#introduction)
* [General: Create JMS Listener](#general-create-jms-listener)
* [Use Case 1: Existing HTTP based WSDL over JMS](#use-case-1-existing-http-based-wsdl-over-jms)
* [Use Case 2: Existing JMS-Based WSDL](#existing-jms-based-wsdl)
* [Testing and Debugging](#testing-and-debugging)

<div class = "divider1"></div>

### Introduction

This topic provides documentation about two typical use cases when working with a JMS (AMQP setup is similar).

The result will allow you to initiate a HTTP/SOAP call (e.g. SOAPUI) that is then sent to the JMS in a queue. The result will be pulled from a result queue and sent back over HTTP to the client.

### General: Create JMS Listener

For both use cases a JMS Listener must be configured first.

#### Client libraries

For the different JMS vendors you need to deploy client libraries of the target system into the Network Director instance you are planning to use for the connections. Those are typically version dependent and should be taken from the actual JMS server you are binding to.

1. Copy them to your Network Director deploy directory, then restart the instance:

	`cp clientLibs.jar /opt/soa/sm70/instance/NetworkDirectorForJMS/deploy/`

##### ActiveMQ

* The client library is called `activemq-all-VERSION.jar` and can be found in the root directory of the `ActiveMQ` installation.

##### Tibco EMS

* The client libraries are called `tibcrypt.jar`, `tibjmsadmin.jar`, `jms.jar` and `tibjms.jar` and can be found in the folder `/yourTibcoInstallation/ems/VERSION/lib`.

  **Note:** Some versions of the libraries do not expose all needed classes so rebinding them might be needed. Contact *Akana Customer Support* or Professional Services if you need help. This has been discovered on Tibco version 7.0. but might be true for other versions too.

#### Configuring Network Director

1. Choose **Add Container Listener** and select **JMS** as Listener Type. In the following window provide the connection details of the JMS server:
	* **JNDI URL** - Address of the server, for example `tibjmsnaming://tibco.emeademo.de:7222` (Tibco) or `tcp://activemq.emeademo.de:61616` (ActiveMQ)
	* **JNDI Initial Context** - `com.tibco.tibjms.naming.TibjmsInitialContextFactory` (Tibco) `org.apache.activemq.jndi.ActiveMQInitialContextFactory` (ActiveMQ)
	* **JMS Destination Factory Name** - Depending on the JMS server configuration, for example `ConnectionFactory`

2. If you need to enter credentials or other specific parameters for the connection to the server use the **Add Property** link and add the parameters. Refer to [JMS Additional Properties](../bindings/jms_additional_connection_properties.html) for the available options.

	![Messaging Binding](images/jms_http_1.jpg "Configure JMS Connection Listener")

<a href="#top">back to top</a>

### Use Case 1: Existing HTTP based WSDL over JMS

This use case is based on the assumption that a WSDL for the underlying service is existing with the HTTP binding.

#### Create Physical Service

1. Create a new physical service by providing the WSDL.

	![JMS/HTTP](images/jms_http_2.jpg "Create Physical Service")

2. Choose **Do not manage this time** when being asked to create virtual service.

	![JMS/HTTP](../bindings/images/jms_http_3.jpg "Select Service Management Option")

#### Add SOAP/JMS Binding

1. Go to *Configure > Binding* and select **Add Binding**.  

2. Use the search field to find the physical service you just created in the drop-down.

	![JMS/HTTP](images/jms_http_4.jpg "Select Interfaces")

3. Choose SOAP 1.1 or SOAP 1.2 according to your physical service.

	![JMS/HTTP](images/jms_http_5.jpg "Specify Binding Details")

4. On the next screen choose `JMS` for **Transport** and the **Transport URI** depending on the JMS server you are using.

	![JMS/HTTP](images/jms_http_6.jpg "Configure SOAP 1.1 Binding Properties")

5. For the SOAP action, check with the WSDL and JMS server setup for what option to choose.

#### Create Virtual Service for JMS

1. Navigate to your physical service and select the **Virtualize Service** from the Actions Portlet. 

	*Hint: Call the service `YourServiceName_JMS` so it can be easily identified.*

	![JMS/HTTP](images/jms_http_7.jpg "Virtualize Service")

2. Choose **Select Container later**, then **Finish**. 

	![JMS/HTTP](images/jms_http_8.jpg "Select Container")

#### Manage Bindings

1. In *Service Overview > Interfaces and Bindings*, select **Manage Bindings**.
	![JMS/HTTP](images/jms_http_9.jpg "Manage Bindings")

2. Change the binding from the original SOAP/HTTP to the newly created SOAP/JMS.

	![JMS/HTTP](images/jms_http_10.jpg "Select Bindings")

#### Add Access Point

1. Add a new Access Point for your virtual service.

	![JMS/HTTP](images/jms_http_11.jpg "Add Access Point")

2. Choose the Network Director instance which has been configured for JMS (see above).

	![JMS/HTTP](images/jms_http_12.jpg "Select Container")

3. Make sure to choose the right JMS Listener for your JMS server.

	![JMS/HTTP](images/jms_http_13.jpg "Choose JMS Listener")

4. Add the parameter for the destination Queue.

5. For our use case and depending on the configuration of the server you need to also define the reply queue name. This is either a fixed one or you can choose to have a temporary one being created on each request.

6. For a temporary queue, set the `jms.use.temporaries` to `true`.

	![JMS/HTTP](images/jms_http_14.jpg "Add Parameter for Destination Queue")

7. For a fixed reply queue, set the `jms.replyto.name` to the name of the reply queue.

	![JMS/HTTP](images/jms_http_15.jpg "Add Parameter for Reply Queue")

8. See also the [JMS Additional Properties](../bindings/jms_additional_connection_properties.html) for more parameters.

#### Create Virtual Service for HTTP

1. Virtualize your just created JMS virtual service. 
	* *Hint: Name it `YourServiceName_JMS_HTTP` so it can be easily identified.* 

	![JMS/HTTP](images/jms_http_16.jpg "Virtualize JMS Virtual Service")

2. Once again choose to **Select Container later**:

	![JMS/HTTP](images/jms_http_17.jpg "Select Container Later")

3. Manage the binding of the just created virtual service.

	![JMS/HTTP](images/jms_http_18.jpg "Manage Binding of Virtual Service")

4. Choose the non-JMS binding of the service (the opposite of what you did in the first virtual service). This HTTP based binding has been already generated at the creation of the physical service in this use case.

	![JMS/HTTP](images/jms_http_19.jpg "Choose non-JMS Binding")

5. Create an access point for the new virtual service.

	![JMS/HTTP](images/jms_http_20.jpg "Create Access Point for Virtual Service")

6. Choose a container with a HTTP binding. In typical scenarios this is a different one than the one with the JMS Listener.

	![JMS/HTTP](images/jms_http_21.jpg "Select Container with HTTP Binding")

7. Choose your HTTP Listener.

	![JMS/HTTP](images/jms_http_22.jpg "Select HTTP Listener")

8. Choose virtual host and context path.

	![JMS/HTTP](images/jms_http_23.jpg "Chose Virtual Host and Context Path")

9. The configuration is complete. Grab the WSDL of this virtual service and start sending messages to the service. Be sure to have authentication policy or contract applied.

<a href="#top">back to top</a>

### Use Case 2: Existing JMS-Based WSDL

This use case is about having a WSDL with JMS binding included. This means we will have the physical service being JMS and consumed over a virtual HTTP based service.

#### Create Physical Service

1. Create a physical service using the existing WSDL with a JMS binding.

#### Checking WSDL

1. **Important note:** Some JMS servers do provide vendor specific JMS binding properties in the WSDL. Those entries might be in a format which cannot be imported directly in the Policy Manager and therefor will be configured manually (see below). In this case *remove the wsdl:port from the WSDL before importing*.

	```
	<wsdl:service name="serviceESB">
	        <wsdl:port name="serviceJMS" binding="tns:serviceJMS">
	            <soap:address location=""/>
	            <jndi:context>
	                <jndi:property name="java.naming.factory.initial" type="java.lang.String">com.tibco.tibjms.naming.TibjmsInitialContextFactory</jndi:property>
	                <jndi:property name="java.naming.provider.url" type="java.lang.String">tcp://tibco.emeademo.de:7221</jndi:property>
	            </jndi:context>
	            <jms:connectionFactory>QueueConnectionFactory</jms:connectionFactory>
	            <!--The element targetAddress value (targetQueue) is the jndi name of the destination. Please replace this with physical destination name at the service consumption point.-->
	            <jms:targetAddress destination="queue"> targetQueue</jms:targetAddress>
	        </wsdl:port>
	    </wsdl:service>
	
	```             

#### Import WSDL

1. Select **Create Physical Service** and import the WSDL.
	![JMS/HTTP](images/jms_http_24.jpg "Import WSDL")

2. Choose to virtualize the service later.

	![JMS/HTTP](images/jms_http_25.jpg "Do Not Manage Service")

#### Add JMS Binding

2. This task is only required if you need to remove the wsdl:port (see above). Otherwise the binding is already configured automatically.

3. Go to **Configure > Bindings** and select **Add Binding**. 

4. Choose the interface of your service:

	![JMS/HTTP](images/jms_http_26.jpg "Select an Interface")

5. Choose Binding Type `Messaging`.

6. Choose Transport JMS and Transport URI depending on your JMS server.

7. For the operations in the service choose the right parameters for the queues and content types (see screenshot for example).

	![JMS/HTTP](images/jms_http_27.jpg "Choose Binding Type, Transport, and Transport URI")

8. Add the binding to the service by choosing the **Manage** link on Interfaces and bindings.

	![JMS/HTTP](images/jms_http_28.jpg "Add Binding to Service")

9. Choose your created JMS binding.

	![JMS/HTTP](images/jms_http_29.jpg "Select JMS Binding")

#### Add Access Point

1. Add an access point to the physical service.

	![JMS/HTTP](images/jms_http_30.jpg "Add Access Point to Physical Service")

2. Choose the Network Director instance with JMS Listener configured.

	![JMS/HTTP](images/jms_http_31.jpg "Choose Network Director with JMS Listener Configured")

	![JMS/HTTP](images/jms_http_32.jpg "Choose Network Director with JMS Listener Configured")

3. Set the parameters according to the JMS server.

	![JMS/HTTP](images/jms_http_33.jpg "Set Parameters According to JMS Server")
	* **JNDI URL** - Address of the server, for example `tibjmsnaming://tibco.emeademo.de:7222` (Tibco) or `tcp://activemq.emeademo.de:61616` (ActiveMQ)
	* **JNDI Initial Context** -  `com.tibco.tibjms.naming.TibjmsInitialContextFactory` (Tibco) `org.apache.activemq.jndi.ActiveMQInitialContextFactory` (ActiveMQ)
 * **JMS Destination Factory Name** - Depending on the JMS server configuration, for example `ConnectionFactory`

	Those parameters are inherited from the Network Director instance.

4. If you need to enter credentials or other specific parameters for the connection to the server use the **Add Property** link and add the parameters. See [JMS Additional Properties](../bindings/jms_additional_connection_properties.html) for the available options.

#### Virtualize Service as HTTP

1. Choose **Virtualize Service** on your physical service.

2. Select the container later.

	![JMS/HTTP](images/jms_http_34.jpg "Virtualize Service as HTTP")

#### Create a HTTP binding

1. Navigate to *Configure > Bindings* and select **Add Binding** to create a new binding. 

2. Use the search field to find your service in the drop-down.

	![JMS/HTTP](images/jms_http_35.jpg "Add Binding")

3. Choose Binding type SOAP 1.1 or 1.2 depending of your service.

	![JMS/HTTP](images/jms_http_36.jpg "Select SOAP 1.1 or 1.2")

4. Choose HTTP as transport, the parameters for SOAP Action depend on the actual service you are configuring.

	![JMS/HTTP](images/jms_http_37.jpg "Configure Binding Properties")

5. Manage your virtual service’s Interfaces and Bindings.

	![JMS/HTTP](images/jms_http_38.jpg "Manage Interfaces and Bindings")

6. Choose your just created HTTP Binding.

	![JMS/HTTP](images/jms_http_39.jpg "Select HTTP Binding")

#### Add Access Point

1. Add a new access point for your virtual service.

	![JMS/HTTP](images/jms_http_40.jpg "Add Access Point")

2. Choose a container with an HTTP binding. In typical scenarios this is a different one than the one with the JMS Listener.

	![JMS/HTTP](images/jms_http_41.jpg "Select Container with HTTP Binding")

3. Choose your HTTP Listener.

	![JMS/HTTP](images/jms_http_42.jpg "Select HTTP Listener")

4. Choose virtual host and context path:

	![JMS/HTTP](images/jms_http_43.jpg "Specify Virtual Host and Context Path")

5. The configuration is complete. Grab the WSDL of this virtual service and start sending messages to the service. Be sure to have authentication policy or contract applied.

<a href="#top">back to top</a>

### Testing and Debugging

This section provides some general hints on how to test and debug your settings.

#### Set Auditing and Debug

For all your virtual services apply the *Detailed Auditing* Operational Policy. 

Also add debug settings to them by configuring the Audit Logging Level using **Configure Message Processing**.

![JMS/HTTP](images/jms_http_44.jpg "Add debug settings using Configure Message Processing")

![JMS/HTTP](images/jms_http_45.jpg "Update Auditing Logging Level in Configure Message Processing")

#### Places to Look for Information

Typically you follow the way of the request through your virtual services, so the *Monitoring* tab of the virtual services (both Alerts and Logs) is a good point to start.

Also the log files in the file system (`instances/yourNetworkDirector/log`) to host some more detailed data. Keep in mind that in typical scenarios using two Network Director instances (HTTP and JMS) are involved.

Finally for the overall connection the monitoring of Network Director with JMS configured might show some more logs:

![JMS/HTTP](images/jms_http_46.jpg "View Monitoring Data")

#### Configure HermesJMS to Have Access to the JMS Queues

For a Tibco EMS the documentation at http://tibcoadmin.com/tibco/ems/configuring-hermesjms-for-tibco-ems/ provides useful setup information. 

Other JMS servers are configured in a similar way.

![JMS/HTTP](images/jms_http_47.jpg "Tibco EMS Setup")


<a href="#top">back to top</a>


<div class = "divider1"></div>