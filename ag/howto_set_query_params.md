---
layout: page
title: How to set downstream Query Params
description: A how to guide for hardcoding downstream query params for http services
product: ag
category: learn
sub-nav-class: Mediation
weight: 4
type: page
nav-title: Add Query Params
---

How to Add downstream query params
----------------------------------

This is short and sweet.  A very simple script that appends a new string to the existing query string.  If you want an all new string ignoring anything inbound, that's a pretty simple code change.

```javascript
var msg = processContext.getVariable("message");

// Read the existing query string
var queryString = msg.getProperty("com.soa.message.TRANSPORT_QUERY");
var newQueryString = "";
                                             
// if there is a query string
if (queryString) {
    // Append the new string to the existing one
    newQueryString = String(queryString).concat("&newParamName=newParamValue");
} else {
    // Make a new query string
    newQueryString = "newParamName=newParamValue";
}

// And set the new query string
msg.setProperty("com.soa.message.TRANSPORT_QUERY", newQueryString);
```

That's it.  Nice and simple.
