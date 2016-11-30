---
layout: page
title: How to Invoke a Service from Script
description: A how to guide using the messenger service to invoke a service from a script
product: ag
category: learn
sub-nav-class: Mediation
weight: 104
type: page
nav-title: Scripted Invoke
---

How to Invoke a Service from Script
----------------------------------

This is an example of a script showing how to invoke a service using the Messenger Service.  See the full docs for the Messenger Service in the [script docs](http://docs.akana.com/ag/assets/scriptDocs_pm80/index.html).

> NOTE: you can set outbound identities using the Manage Outbound Activies action on the virtual service.  Alternatively you can set principals within the script, but this is more complex.

```javascript
// Grab the message variable for input
var msg = processContext.getVariable("message");

// Set up the new messenger service and instance instances
messenger = msgrService.getMessenger();
exchangeFactory = msgrService.createExchangeFactory();
exchange = exchangeFactory.createInOut();

// Tell the messenger service exchange which service, interface, and operation to invoke
exchange.setServiceName("{http://soap.borrower.demo.soa.com}BorrowerSOAP");
exchange.setInterfaceName("{http://soap.borrower.demo.soa.com}BorrowerService");
exchange.setOperationName("list");

// Tell the messenger service exchange which message variable to use as it's input
exchange.setInMessage(msg);

// Send the message
messenger.send(exchange);

// Read the response and override the input msg variable with the response
msg = exchange.getOutMessage();

// Replace the message variable in the process with the result of the invoke
processContext.setVariable("message",msg);
```

That's it.  Nice and simple.
