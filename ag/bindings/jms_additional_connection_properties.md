---
layout: page
title: JMS Additional Connection Properties
description: Learn how to configure additional JMS connection properties.   
product: ag
category: learn
weight: 105
sub-nav-class: Bindings
type: page
nav-title: JMS Additional Connection Properties
---

## JMS Connection Over HTTP

Learn how to configure additional JMS connection properties. 

<h5 class="stamp">Supported Platforms: 7.2</h5>

### Table of Contents
<div id="toc-marker"></div>

* [Adding/Modifying Parameters to JMS Connection Properties](#adding-modifying-parameters-to-jms-connection-properties)
* [Using the Add Property Link](#using-the-add-property-link)
* [List of Common Properties](#list-of-common-properties)

<div class = "divider1"></div>

### Adding/Modifying Parameters to JMS Connection Properties

When adding or modifying a JMS connection to Policy manager, three parameters can be configured directly. 

![JMS/HTTP](images/jms_connect_properties.jpg "JMS Connection Properties")

* JNDI URL
	* Example 1 (Active MQ): tcp://my.jms.host.domain:61616
	* Example 2 (Tibco): tibjmsnaming://my.tibco.host.domain:57222/
* JNDI Initial Context
	* Example 1 (ActiveMQ): org.apache.activemq.jndi.ActiveMQInitialContextFactory
	* Example 2 (Tibco): com.tibco.tibjms.naming.TibjmsInitialContextFactory
* JMS Factory
	* Example 1 (ActiveMQ): ConnectionFactory
	* Example 2 (Tibco): QueueConnectionFactory  

<a href="#top">back to top</a>

#### Using the Add Property Link

Additionally more properties can be configured by clicking the **Add Property** link in the connection details.

![JMS/HTTP](images/jms_connect_properties2.jpg "JMS Connection Details")

<a href="#top">back to top</a>

#### List of Common Properties

| Parameter | Description        |
|:----------------------|:---------------------------|
| destination | The URL parameter name used to identify the JMS destination (topic or queue) name.
| connectionFactory | The URL parameter name used to specify the JMS factory name
| jndiProviderURL | The URL parameter name used to define the JNDI provider URL.
| initialContextFactory | The URL parameter name used to define the JNDI initial context factory class.
| format | The URL parameter name used to identify the message type.  Acceptable values are "text" or "bytes."
| temporaries | The URL parameter name used to allow or disallow the use of temporary destinations.  The acceptable values are "true" or "false."
| replyto | The URL parameter name used to identify the replyTo destination.
| jms.mode | The property name that identifies the JMS mode.  The value must be one of JMS_QUEUE_MODE or JMS_TOPIC_MODE.
| jms.queue.mode | The value for the JMS_MODE property that indicates the use of jms queues.
| jms.topic.mode | The value for JMS_MODE that indicates the use of JMS topics.
| jms.transactional | Property name for the indicator of the JMS transport's transactional behavior.  The value will be a boolean indicating that the transport should use transaction (true) or should not (false). If not set, should default to false.
| jms.use.temporaries | Name for the property that indicates whether the JMS transport should use temporary destinations in the JMSReplyTo property of outgoing messages. The value will be a boolean with a value of true if temporaries should be used.  
| jms.message.type | Name for the property that indicates the JMS message type to use.  The value will be one of JMS_MESSAGE_TYPE_BYTES or JMS_MESSAGE_TYPE_TEXT.
| jms.bytes.message.type | Property value used for the JMS_MESSAGE_TYPE to configure the use of JMS TextMessages.
| jms.read.timeout | The name of the property that contains the JMS read timeout.  The value is the string value of the number of milliseconds.
| jms.selector | The name of the property that contains the JNDI provider URL used with the JMS transport.
| java.naming.security.principal | The name of the property that contains the JNDI provider username used with the JMS transport.
| java.naming.security.credentials | The name of the property that contains the JNDI provider credentials used with the JMS transport.
| java.naming.security.authentication | Constant that holds the name of the environment property for specifying the security level to use. Its value is one of the following strings: "none," "simple," "strong." If this property is unspecified, the behavior is determined by the service provider.
| jms.connection.factory.user | The name of the property that contains the JMS connection factory username.
| jms.connection.factory.password | The name of the property that contains the JMS connection factory password.
| jms.connection.factory.name | The name of the property that contains the JMS connection factory name.
| jms.destination.name | The name of the property that contains the JMS destination name.
| jms.replyto.name | The name of the property that contains the JMS replyTo destination name.
| jms.durable.subscriber | The name of the property that contains the JMS durable subscriber name.
| jms.persistent.delivery | The name of the property that indicates whether or not to use PERSISTENT delivery mode.
| jms.time.to.live | The name of the property that holds the JMS message time to live value. The value will be a string version of the number of milliseconds.
| jms.priority | The name of the property that holds the JMS priority.
| jms.retries | The name of the property that holds the JMS retry count.
| jms.client.id | The name of the property that holds the JMS client ID for durable subscriptions.
| jms.url | The name of the property that holds the JMS URL string.
| jms.protocol | The name of the property that holds the JMS protocol.  This is usually "jms" but could be "amqp" or "amqps."
| amqp.virtual.host | The name of the property that holds the virtual host for AMQP/S.
| amqp.port | The name of the property that holds the port for AMQP/S.

![JMS/HTTP](images/jms_connect_properties3.jpg "JMS Connection Details")

<a href="#top">back to top</a>


<div class = "divider1"></div>