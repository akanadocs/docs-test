---
layout: page
title: How to Generate a JSONP Response
description: A how to guide for mediating responses to JSONP
product: ag
category: learn
sub-nav-class: Mediation
weight: 4
type: page
nav-title: Generate JSONP Response
---

How to Generate a JSONP Response
--------------------------------

This article provides a script policy that will generate a JSONP response on demand.  It is driven by 2 things:

1.	The Accept Header - if Accept is set to **application/javascript** then this will generate JSONP
2.	The jsonp query param - if there is a **jsonp** query param present, then this script will use the param value as the wrapping function name.  If not, then it will just default to **jsonFunction**.

There are a few subtleties in this script.

1.	It has to use information that is only available on the request, in the response processing, so it extracts these things (the accept header and the jsonp param) during request message processing and stores them in the exchange.

2.	If the returned content isn't already JSON, then it will mediate it to JSON by normalizing it to XML and then serializing it.


3.	If the returned content is already application/javascript then the script won't do anything.

To make this work, you simply need to create an operational script policy using the following self-contained script, and then attach this policy to your virtual service.

```javascript
// Get the message and the exchange
var msg = messageContext.getMessage();
var exg = messageContext.getExchange();

// Are we dealing with a request, response or fault
switch(messageContext.getParameterType())
{
	case 0:
		auditLog.debug("Request Message");

		// Get the Accept header and store it in the exchange
		var accept = String(msg.getTransportHeaders().get("Accept").getValue());
		exg.setProperty("accept.header", accept);

		// See if there is a jsonp query param
		var queryString = String(msg.getProperty("com.soa.message.TRANSPORT_QUERY"));
		var jsonpFunction = queryString.match(/jsonp=([^\&]*)/im);
		if (! jsonpFunction) {
			jsonpFunction = ["empty", "jsonpFunction"];
		}
		// store the jsonp function name in the exchange
		exg.setProperty("jsonp.function", jsonpFunction[1]);

		break;
	case 1:
		auditLog.debug("Response Message");

		// Get the Accept Header from the exchange
		var accept = exg.getProperty("accept.header");

		// If the header is looking for application/javascript then we will mediate
		if (accept == "application/javascript") {
			// if we don't already have javascript content
			if (msg.getContentType() != "application/javascript") {
				// make sure we have JSON
				if (msg.getContentType() != "application/json") {
					var content = msg.normalize();
					var jsonContent = serializer.read(content.getContentAsString());
					msg.setStringContent(jsonContent);
				}
				// Wrap the JSON result in the jsonp function name
				var jsonpContent = exg.getProperty("jsonp.function") + "(" + msg.getContentAsString() + ");";
				msg.setStringContent(jsonpContent);
				msg.setContentType("application/javascript");
			}
		}

		break;
	default:
		auditLog.debug("Fault");
		
}
```

Happy JSONP Generation.
