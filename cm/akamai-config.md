---
layout: page
title: Configuring Akamai with Akana's API Platform
description: detailed steps on how to configure an Akamai property
product: cm
category: ref	
sub-nav-class: 
weight: 4
type: page
nav-title: Configuring Akamai
---


Configuring Akamai with Akana's API Platform 
-------------------------------------
This document will walk you through setting up all the rules, and the fields within each rule for configuring Akamai with Akana's Enterprise API Platform. Fields which deviate from the default input will be in **Bold type.**

### Prerequisite
This document assumes that you have an Akamai account and know how to use their system. 
 
## Creating new Properties

You need to create two properties:

•	One for the portal - (typically with an origin in the *.eap.soa.com or *.apiportal.akana.com domains)

•	One for the APIs - (typically with an origin in the *.broker.soa.com or *.gateway.akana.com domains)

Note: Do not use the Luna Property  Manager Assistant.

## Creating a new Property for Portal

### Default Rule Settings
In the "Property Version Information" section, check the Security Options: **Secure (Customer Certificate)**



Origin Server | Input
------------- | -------------
Origin Type  | Your Origin
Origin Server Hostname  | [Your issued domain here] 
Forward Host Header | Incoming Host Header
Cache Key Hostname | **Incoming Host Header**
Supports Gzip Compression | Yes
Send True Client IP Header | **Yes**
True Client IP Header Name | True-Client-IP
Allow clients To Set True Client IP Header | Yes


Origin SSL Certificate Verification | Input
------------- | -------------
Verification Settings | **Choose Your Own (Recommended)**
Match CN/SAN To | \{\{Forward Host Header\}\}; **\*.eap.soa.com;** \{\{Origin Hostname\}\} 
Trust | Akamai-managed Certificate Authorities Sets
Akamai-managed Certificate Authority Sets | Akamai Certificate Store


Ports | Input
------------- | -------------
HTTP Port | 80
HTTPS Port | 443


Caching  | Input
------------- | -------------
Caching option | No Store


SureRoute | Input
------------- | -------------
Enable | On
Optimization Type | Performance
SureRoute Test Object | **sureroute/sureroute-test-object.html**
Forward HOST Header | Same as incoming Host header
Cache Life for Race Results | 30 minutes
Force SSL Protocol for Races | Off
Race Result Key | Race Destination (default) 


Tiered Distribution | Input
------------- | -------------
Enable | On


Prefetch Objects | Input
------------- | -------------
Enable | On


Allow POST | Input
------------- | -------------
Behavior | Allow
Allow without Content-Length | **Allow**


Allow DELETE | Input
------------- | -------------
 | Allow


Allow PUT | Input
------------- | -------------
 | Allow




### Content Compression Settings

On the left side click on **Content Compression** and input the following:

Content Compression | Input
------------- | -------------
Criteria | Match All
IF | Content Type
is one of | **text/html\*;  text/css\*; 	application/x-javascript\*; 	application/json; text/javascript**


Behaviors | Input
------------- | ------------- 
Last Mile Acceleration (GZIP Compression) | 
Compress Response | Always


### Static Content Settings

On the side side click **Static Content** and enter the following: 

Static Content  | Input
------------- | -------------
Criteria   | **Match Any**
IF   | File Extension 
Is one of | **aif; aiff; au; avi; bin; bmp; cab; carb; cct; cdf; class; css; doc; dcr; dtd; exe; flv; gcf; gff; gif; grv; hdml; hqx; ico; ini; jpeg; jpg; js; mov; mp3; nc; pct; pdf; png; ppc; pws; swa; swf; txt; vbs; w32; wav; wbmp; wml; wmlc; wmls; wmlsc; xsd; zip; properties; html; htm; json**

OR 

Path matches one of | **/\*/avatar; /\*/metadata**

#### Behaviors

Caching | Input
------------- | -------------
Caching Option | **Honor Origin Cache Control and Expires**
Force Revalidation of Stale Objects | Serve stale if unable to validate
Default Max-age | **7 Days**
Prefetch Objects Enable | Off


### Dynamic Content settings
Dynamic Content | Input
------------- | -------------
Criteria | Match All
IF | "Response cacheability" "is not" "cacheable"


#### Behaviors
Downstream Cacheability | Input
------------- | -------------
Caching option | Pass cacheability headers from origin

### Add rule to Redirect to HTTPS
Click the **Add Rule** button and choose **Redirect to HTTPS** to enter the parameters for this rule.

Redirect to the same URL on HTTPS protocol, issuing a 301 response code (Moved Permanently). You may change the response code to 302 if needed. 

Redirect to HTTPS | Input
------------- | -------------
Criteria | Match All
IF | Request Protocol - HTTP


#### Behaviors
Redirect | Input
------------- | -------------
Redirect Type | Default
Destination Protocol | HTTPS
Destination Hostname | Same as request
Destination Path | Same as request
Include Query String | Yes
Redirect Status Code | 301 Moved Permanently

### Add rule for Advanced Metadata

Advanced Metadata | Input
------------- | -------------
Criteria | Match All


#### Behaviors
Advanced | Input
------------- | -------------
Advanced XML | <edgeservices:enable-chunked-post> on </edgeservices:enable-chunked-post>


## Creating a new Property for API


### Default Rule Settings

Origin Server | Input
------------- | -------------
Origin Type  | Your Origin
Origin Server Hostname  | [Your issued domain here]
Forward Host Header | Incoming Host Header
Cache Key Hostname | **Incoming Host Header**
Supports Gzip Compression | Yes
Send True Client IP Header | **Yes**
True Client IP Header Name | True-Client-IP
Allow clients To Set True Client IP Header | Yes


Origin SSL Certificate Verification | Input
------------- | -------------
Verification Settings | **Choose Your Own (Recommended)**
Match CN/SAN To | \{\{Forward Host Header\}\}; **\*.broker.soa.com;** \{\{Origin Hostname\}\} 
Trust | Specific Certificates (pinning)


Specific Certificates (pinning) | Input | Input
------------- | ------------- | -------------
Common Name | Exp. Date | SHA-1 Fingerprint
\*.broker.soa.com | August 1 2016 | dba2e24c8a3742ecdeccb3dfae65667db8ae5b4c


Ports | Input
------------- | -------------
HTTP Port | 80
HTTPS Port | 443


Caching  | Input
------------- | -------------
Caching option | Bypass Cache



SureRoute | Input
------------- | -------------
Enable | On
Optimization Type | Performance
SureRoute Test Object | **sureroute/sureroute-test-object.html**
Forward HOST Header | Same as incoming Host header
Cache Life for Race Results | 30 minutes
Force SSL Protocol for Races | Off
Race Result Key | Race Destination (default) 


Allow POST | Input
------------- | -------------
Behavior | Allow
Allow without Content-Length | **Allow**

Allow DELETE | Input
------------- | -------------
 | Allow

Allow PUT | Input
------------- | -------------
 | Allow



### Content Compression Settings

Content Compression | Input
------------- | -------------
Criteria | Match All
IF | Content Type
is one of | **text/html\*;  text/css\*; 	application/x-javascript\*; 

Behaviors | Input
------------- | ------------- 
Last Mile Acceleration (GZIP Compression) | 
Compress Response | Always


### Add rule for Advanced Metadata

Advanced Metadata | Input
------------- | -------------
Criteria | Match All


#### Behaviors
Advanced | Input
------------- | -------------
Description | To enable chunked POST
Advanced XML | <edgeservices:enable-chunked-post> on </edgeservices:enable-chunked-post>


 