---
layout: page
title: How to Generate CSV Responses
description: A how to guide for providing a specific CSV response for a message
product: ag
category: learn
sub-nav-class: Mediation
weight: 4
type: page
nav-title: Generate CSV Response
---

How to Generate CSV Responses
-----------------------------

We had a customer scenario where they wanted the product to take a complex XML repsonse and generate a simple CSV format with just a few of the response message elements.  We could have done this using XSL-T, but I didn’t like this approach because it did give me the flexibility I wanted (plus my XSL is terrible).  So I did this using scripts, with a process context variable of type String named acceptHeader.  One in front of the invoke that captures the accept header and stores in the the processContext variable, and if it’s CSV forces the addition of an options query param to ensure we get all the info we need.

This is a very over-simple model that doesn't attempt to read through any returned array of "product" objects (it just assumes it's a single entry array and reads the values from the first one).  It really should write a header, and then iterate through the products array to generate a real response, but this gives the basic idea of how to make this work.

```javascript
// Grab the Accept header and store it in a variable
var msg = processContext.getVariable("message");
var headers = msg.getTransportHeaders();
var acceptHeader = headers.get("Accept").getValue();
processContext.setVariable("acceptHeader", acceptHeader);
auditLog.debug("Accept: " + acceptHeader);

// If it's CSV then add the options=PRODUCTS query param
if (acceptHeader == "text/csv") {
    auditLog.debug("Adding query string");
    msg.setProperty("com.soa.message.TRANSPORT_QUERY", "options=PRODUCTS");
}
```

And another one after the invoke that checks to see what the original accept header was, and if it’s CSV it gets the bits of the message it needs and makes a CSV string:

```javascript
// If the Accept header was CSV, then mediate the content
var acceptHeader = processContext.getVariable("acceptHeader");
auditLog.debug("Accept: " + acceptHeader);

if (acceptHeader == "text/csv") {
    
    var msg = processContext.getVariable("message");
    
    // force the message to JSON
    var normmsg = msg.normalize();
    
    // This will be going away, but for now grab a JSONLib serializer
    var serializer = new net.sf.json.xml.XMLSerializer();
     
    // And convert the normalized message to JSON
    var jsonContent = serializer.read(normmsg.getContentAsString());
     
    // Parse the JSON doc
    jsonVar = JSON.parse(jsonContent,null);
    
    // Get the bits we need
    var name = jsonVar["name"];
    var url = jsonVar["url"];
    var products = jsonVar["products"];
    var product = products["product"];
    var code = product["code"];
    
    var newContent = code + "," + url + "," + name;
    
    msg.setStringContent(newContent);
    
    msg.setContentType("text/csv");
}
```

This works with Accept set to application/xml, application/json, or text/csv.  It will return whichever you ask for.