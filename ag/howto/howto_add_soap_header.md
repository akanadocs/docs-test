---
layout: page
title: How to Add a SOAP Header
description: A how to guide for adding a SOAP header to a downstream request
product: ag
category: learn
sub-nav-class: Mediation
weight: 4
type: page
nav-title: Add SOAP Header
---

# How to Add a SOAP Header

This article describes how to add a soap header to a downstream request using a script activity in an operation process.  It's a simple process with 4 steps:

### Step 1 - Define a Variable
Use the 'A' button on the process editor palette to define a new variable name of type message.  To match the script below we'll call this new message variable 'newMsg'.  Note: all adding a variable here does is to make the variable name available to other activities in the process editor.

### Step 2 - Set the Invoke to use the new Variable
Edit the invoke and pick your new message variable as the input message.

### Step 3 - Add a Script Activity before the invoke
Add a script activity before the invoke, and use the script below.  This script creates a new normalized message, adds the new protocol (binding) header to the new message, and copies the content from the inbound message (normalized) to the new message.

NOTE: there is a known issue in releases prior to 7.2.10 that means that setProtocolHeader() only works on newly created messages.  After 7.2.10 you will be able to use setProtocolHeader() to add new headers to the input message (after normalization).

```javascript
// Create a new normalized message and add it as a variable to the process context
var newMsg = msgFactory.createNormalized();
processContext.setVariable("newMsg",newMsg);

// Get the input message and normalize it
var nm = processContext.getVariable("message").normalize();

// Add a protocol header to the new normalized message.  The outbound binding will add this to the SOAP envelope when it sends it
newMsg.setProtocolHeader("{http://demo.akana.com/}DemoHead", "<demo:Demohead xmlns:demo=\"http://demo.akana.com/DemoHeade_V_1_0\"/>");

// Set the content of the new normalized message to the content of the input message
newMsg.setStringContent(nm.getContentAsString());
```

### Step 4 - Preserve Binding Headers
Edit the operation, select Header Propagation, and set Preserved Binding Headers to all, or add the specific header you want to pass through the downstream binding in this list.