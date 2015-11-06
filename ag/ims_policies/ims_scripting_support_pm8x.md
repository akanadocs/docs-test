---
layout: page
title: Intermediary for Microsoft Scripting Support
description: Learn about Intermediary for Microsoft scripting support in Policy Manager 8.x.
product: ag
category: learn
sub-nav-class: Auditing
weight:	7
type: page
nav-title: Learn about Intermediary for Microsoft scripting support in Policy Manager 8.x
---

<h5 class="stamp">Supported Platforms: 8.0 and greater.</h5>

## Intermediary for Microsoft Scripting Support
Learn about Intermediary for Microsoft scripting support in Policy Manager 8.x.

<a href="http://docs.akana.com/ag/policies/using_op_script_policies_pm8x.htm" class="button secondary">Using Public / Private Operational Script Policies</a> 

<h5 class="stamp">Supported Platforms: 8.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Changes from Policy Manager 7.2 Scripting API ](#changes-from-policy-manager-7-2-scripting-api)


## Introduction
Intermediary for Microsoft (IMS) supports the Policy Manager 8.x Public Operational Script and Private Operational Script policies. 

These policies work in the same manner as they do with the Network Director (see <a href="http://docs.akana.com/ag/policies/using_op_script_policies_pm8x.htm">Using Public / Private Operational Script Policies</a>). 

The policies support the majority of the same APIs that Network Director supports (see <a href="http://docs.akana.com/ag/assets/scriptDocs_pm80/index.html">Policy Manager 8.x Scripting API</a>) with the exception of the following:

* com.soa.message.script.Message.normalize()
* com.soa.process.bpel.runtime.script package
* com.soa.security.script.saml1 package
* com.soa.security.script.saml2 package
* com.soa.security.script.BST class
* com.soa.security.script.SubjectMap.get(category) is ***renamed as*** getSubject(category)

## Changes from Policy Manager 7.2 Scripting API 

The following list represents IMS supported elements of the Policy Manager 7.2 Scripting API that have changed in the Policy Manager 8.0 Scripting API.

* com.soa.message.script.Headers.get(name) ***renamed to*** com.soa.message.script.Headers.getHeader

##### Method Return Type Changes:

* java.util.Set<string> ***changed to*** System.Collections.Generic.List<string>
* java.security.cert.X509Certificate[] ***changed to*** System.Security.Cryptography.X509Certificates.X509Certificate2[]
* java.lang.Object[] ***changed to*** System.Object[]
* javax.xml.namespace.QName ***changed to*** System.Xml.XmlQualifiedName
* java.lang.String ***changed to*** System.String

<a href="#top">back to top</a>