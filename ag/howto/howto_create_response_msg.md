---
layout: page
title: How to Create a Response Msg
description: A how to guide for returning a locally created response message
product: ag
category: learn
sub-nav-class: Mediation
weight: 4
type: page
nav-title: Create Response Msg
---

## How to Create a Response Msg

This article describes how to create a virtual service process that creates a response message using input from the request message and returns this response to the consumer.  This is useful for creating sandbox services.  In this case I am adding a protocol header that is specific to SOAP, this header would only be returned via a SOAP binding, but the process generates a normalized XML message that can be returned via any of the bindings, including being mediated to JSON if that is required.

NOTE: this article doesn't cover configuring the bindings, all it does is tell you how to create the response message and wire that into your process.

### Step 1 - Define a Variable
Use the 'A' button on the process editor palette to define a new variable name of type message.  To match the script below we'll call this new message variable 'newMsg'.  Note: all adding a variable here does is to make the variable name available to other activities in the process editor.

### Step 2 - Set the Reply to use the new Variable
Edit the reply activity and pick your new message variable as the response message (the field labelled variable).

### Step 3 - Add a Script Activity between the receive and the reply
Add a script activity between the receive and the reply, and use the script below.  This script performs a few operations:

* creates a new normalized message
* normalizes the input request and converts the resulting normalized message to a Javascript object
* Sets the content of the new normalized message as a string built using an element taken from the Javascript object (in this case we know that the input request contains an element called 'cin')
* adds a new protocol (binding) header to the new message - this is Optional, and is here simply to show how this works between SOAP and REST bindings (it's ignored by the REST binding)

NOTE: there is a known issue in releases prior to 7.2.10 that means that setProtocolHeader() only works on newly created messages.  After 7.2.10 you will be able to use setProtocolHeader() to add new headers to the input message (after normalization).

```javascript
// Create a new normalized message and add it as a variable to the process context
var newMsg = msgFactory.createNormalized();
processContext.setVariable("newMsg",newMsg);

// Get the input message and normalize it
var nm = processContext.getVariable("message").normalize();

// Convert the normalized input message to JSON and parse it to a JavaScript Object
converter = com.soa.json.xml.script.XML2JSON.converter();
var jsonString = converter.convert(nm.getContentAsString());
var jsObj = JSON.parse(jsonString,null);

// Set the content of our new normalized message to the body content of the soap response
// NOTE: this is the bit that will be inside the <soap:body> tag, it does not include that tag
newMsg.setStringContent("<brwr:cin xmlns:brwr=\"http://soap.borrower.demo.soa.com\">" + jsObj.cin + "</brwr:cin>")

// Add a protocol header to the new normalized message.  The outbound binding will add this to the SOAP envelope when it sends it
newMsg.setProtocolHeader("{http://demo.akana.com/}DemoHead", "<demo:Demohead xmlns:demo=\"http://demo.akana.com/DemoHeade_V_1_0\"/>");

```

### Step 4 - Preserve Binding Headers - Optional
Edit the operation, select Header Propagation, and set Preserved Binding Headers to all, or add the specific header you want to pass through the downstream binding in this list.

This is only needed if you want to pass specific headers back to the consumer.  For REST consumers you would typically enable Preserve Transport Headers and would use the setTransportHeaders() function:

```javascript
headers = processContext.getVariable("newMsg").getTransportHeaders();
headers.add("HeaderName", "headerValue");
```