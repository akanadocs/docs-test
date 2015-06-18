---
layout: page
title: How to Replace Fault Messages
description: A how to guide for providing custom fault content for any fault response
product: ag
category: learn
sub-nav-class: Mediation
weight: 4
type: page
nav-title: Replace Fault Messages
---

How to Replace Fault Messages
-----------------------------

This article describes how to provide custom content for fault messages using an operational script policy.

It uses a simple script policy acting on both response and fault messages.  It defines a static fault message that it uses to replace any fault content, and any reponse IF the response http status is greater than or equal to 400.  It is a simple matter to change the response code criteria, or the static response message.

```javascript
// Get the message and the exchange
var msg = messageContext.getMessage();
var exg = messageContext.getExchange();
var faultContent = "<fault><message>\"For assistance visit https://docs.soa.com.\"</message></fault>";

// Are we dealing with a request, response or fault
switch(messageContext.getParameterType())
{
    case 0:
        auditLog.debug("Request Message");

        break;
    case 1:
        auditLog.debug("Response Message");

        var statusString = msg.getProperty("http.status.code.property");
        var statusInt = parseInt(statusString);
        
        if (statusInt >= 400) {
            msg.setStringContent(faultContent);
            msg.setContentType("application/xml");
        }
        break;
        
    default:
        auditLog.debug("Fault");
        
        var statusString = msg.getProperty("http.status.code.property");
        var statusInt = parseInt(statusString);
        
        msg.setStringContent(faultContent);
        msg.setContentType("application/xml");
}
```

I'm also including a couple of useful utility scripts that will help you with other policies you may need to write:

empty-policy.js - what it sounds like, it’s a framework to use for writing your own javascript policies.

```javascript
// Get the message and the exchange
var msg = messageContext.getMessage();
var exg = messageContext.getExchange();

// Are we dealing with a request, response or fault
switch(messageContext.getParameterType())
{
    case 0:
        auditLog.debug("Request Message");

        break;
    case 1:
        auditLog.debug("Response Message");

        break;
    default:
        auditLog.debug("Fault");
        
}
```

audit-properties.js - a code snippet you can put in any of the request or response handler segments in one of these policies.  It spits out 2 debug log entries, one that contains all the message properties and their values, another that contains all the exchange properties and their values.  This is incredibly useful for debugging these policies.

```javascript
// Audit the msg properties
var msgPropNames = msg.getPropertyNames();
var msgPropNamesArray = msgPropNames.toArray();
var msgArrayLength = msgPropNamesArray.length;
var msgPropOutput = "Message Properties\n";     
for (var i = 0; i < msgArrayLength; i++) {
    msgPropOutput += msgPropNamesArray[i] + " = " + msg.getProperty(msgPropNamesArray[i]) + "\n";
}       
auditLog.debug(msgPropOutput);

// Audit the exg properties
var exgPropNames = exg.getPropertyNames();
var exgPropNamesArray = exgPropNames.toArray();
var exgArrayLength = exgPropNamesArray.length;
var exgPropOutput = "Exchange Properties\n";        
for (var i = 0; i < exgArrayLength; i++) {
    exgPropOutput += exgPropNamesArray[i] + " = " + exg.getProperty(exgPropNamesArray[i]) + "\n";
}       
auditLog.debug(exgPropOutput);
```