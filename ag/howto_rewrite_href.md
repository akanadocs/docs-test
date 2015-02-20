---
layout: page
title: How to Rewrite HREFs in content
description: A tutorial on how to rewrite hrefs in response content with Javascript Policies
product: ag
category: learn
sub-nav-class: Mediation
weight: 4
type: page
nav-title: Rewrite HREFs
---

How to Rewrite HREFs in content
-------------------------------

This article provides a couple of policy scripts and a script snippet that combine to deliver a nice solution to the question of how to rewrite URLs in REST response content through a virtual service (a very common issue with HATEOAS).  It uses script policies rather than in-process activity scripts because it is likely to apply to an entire service, and not just one or more operations.

On the surface the problem is simple.  The virtual service listens on a URL, the physical service listens on a different one, the physical service returns content that contains href elements that are based on its URL and we need to mediate them so they look like the virtual service URL.  For example, consider a service on http://localhost:9901/rest/staff that calls a downstream service on http://127.0.0.1:3000/people.  The downstream service returns results like:

```json
{
    "ResourceSummary": [
        {
            "first": "John",
            "last": "Smith",
            "id": "111111111",
            "_links": {
                "self": {
                    "href": "http://127.0.0.1:3000/people/111111111"
                }
            }
        },
        {
            "first": "Peter",
            "last": "Doe",
            "id": "222222222",
            "_links": {
                "self": {
                    "href": "http://127.0.0.1:3000/people/222222222"
                }
            }
        }
    ]
}
```

For a GET on /

and:

```json
{
    "first": "John",
    "last": "Smith",
    "id": "111111111",
    "line1": "1111 Home Street",
    "city": "Midtown",
    "state": "IN",
    "zip": "55511",
    "phone": "555-555-1212",
    "ssn": "111111111",
    "_links": {
        "self": {
            "href": "http://127.0.0.1:3000/people/111111111"
        }
    }
}
```

for a GET on one of the URLs in the list results above.

Simple right, all we need to do is take every instance of http://127.0.0.1:3000/people in the result and turn it into http://localhost:9901/rest/staff.  The problems arise when we realize that the virtual service can be called on anything that DNS resolves to its host, and might even be called by something the other side of a router than changes the port.  So to this end we need handle the case where the consumer expects to see URLs that it addresses at the same location as the service.  Fortunately, the API Gateway understands and tracks a lot of this information so is able to give us all the information we need.  Sadly, not all the information can be available to policies or process operating on the virtual service (it doesn’t know the target URL of the physical service), or on the physical service (it doesn’t know the listener address of the virtual service).  To address this we need to use two policies, one on the virtual service that collects the listener address and passes it to the physical service, the other on the physical service that does the rewriting work.

NOTE: attaching a policy to a physical service doesn't mean that the policy will be enforced at the physical service, it simply means that the Gateway will process the policy when sending to and receiving from the downstream (physical) service. 

The following scripts highlight some useful techniques, including:

1 - how to pass information between virtual and physical service policy handlers using the message context
2 - how to pass information from request handlers to response handlers using the exchange context
3 - how to access and set message and exchange properties

This is all done in Javascript using the following scripts:

collect-listener-policy.js - a policy to attach to the VS, it simply grabs the listener_url (http.req.att.listener.uri), and stores it in the msg context for the PS to use

```javascript
// Get the message and the exchange
var msg = messageContext.getMessage();
var exg = messageContext.getExchange();

// Are we dealing with a request, response or fault
switch(messageContext.getParameterType())
{
    case 0:
        auditLog.debug("Collect Info Request Message");

        // Store the listener url in the msg for use in the PS policy       
        msg.setProperty("vs.listen.url", exg.getProperty("http.req.att.listener.uri"));

        break;
    case 1:
        auditLog.debug("Collect Info Response Message");

        break;
    default:
        auditLog.debug("Fault");
        
}
```

mediate-urls-policy.js - a policy to attach to the PS.  It reads the stored listener url from the msg context, gets the requested url, local_url and binding target, and does a bit of gymnastics to determine what the base of the requested url and the base of the target url are and then uses a little bit of JS string handling magic to replace all instances of the target base url with the requested base url

```javascript
// Get the message and the exchange
var msg = messageContext.getMessage();
var exg = messageContext.getExchange();

// Are we dealing with a request, response or fault
switch(messageContext.getParameterType())
{
    case 0:
        auditLog.debug("Mediate URLs Request Message");
        
        // Determine the requested base url using the listener and local urls to identify the extended path (if any)
        var requested_url = String(msg.getProperty("http.requested.url"));
        var local_url = String(msg.getProperty("http.local.url"));
        var listener_url = String(msg.getProperty("vs.listen.url"));
        var base_url = "";
        var extended_url = "";

        // Remove trailing slashs from the urls
        requested_url = requested_url.replace(/\/+$/, "");
        listener_url = listener_url.replace(/\/+$/, "");
        local_url = local_url.replace(/\/+$/, "");

        if (local_url.length == listener_url.length) {
            base_url = requested_url;
        } else {
            base_url = requested_url.substr(0, requested_url.length - (local_url.length - listener_url.length));
            extended_url = requested_url.substr(base_url.length);
        }

        // Get the binding target URL
        var binding_target = String(msg.getProperty("http.binding.target.url"));
        
        // store the collected information in the exchange for use on the response
        exg.setProperty("ps.base_url", base_url);
        // Remove the extended URL from the binding target to get the target base url
        exg.setProperty("ps.target.base_url", binding_target.substr(0,binding_target.length - extended_url.length));
        
        break;
    case 1:
        auditLog.debug("Mediate URLs Response Message");

        // gather the stored information from the exchange
        var base_url = exg.getProperty("ps.base_url");
        var target_base_url = exg.getProperty("ps.target.base_url");

        auditLog.debug("base_url: " + base_url + "\ntarget_base_url: " + target_base_url);

        // Get the content
        var content = msg.getContentAsString();
        // Replace all instances of target_base with vs base
        var newContent = content.split(target_base_url).join(base_url);
        // Put the new content into the message
        msg.setStringContent(newContent);

        break;
    default:
        auditLog.debug("Fault");
        
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
