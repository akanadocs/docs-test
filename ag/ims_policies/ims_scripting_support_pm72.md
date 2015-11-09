---
layout: page
title: Intermediary for Microsoft (Version 7.2) Scripting Support
description: Learn about Intermediary for Microsoft, version 7.2 scripting support in Policy Manager 7.2.
product: ag
category: learn
sub-nav-class: Intermediary for Microsoft
weight:	7
type: page
nav-title: Learn about Intermediary for Microsoft (Version 7.2) scripting support in Policy Manager 7.2.
---

## Intermediary for Microsoft (Version 7.2) Scripting Support
Learn about Intermediary for Microsoft (Version 7.2) scripting support in Policy Manager 7.2.

<a href="http://docs.akana.com/ag/policies/using_op_script_policy.htm" class="button secondary">Using the Operational Script Policy 7.x</a> <a href="http://docs.akana.com/ag/assets/scriptDocs_pm72/index.html" class="button secondary">Policy Manager 7.2 Scripting API</a>

<h5 class="stamp">Supported Platforms: 7.2.</h5>

<div class = "divider1"></div>

### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Policy Support](#policy-support)
* [Method Return Type Changes](#method-return-type-changes)

<div class = "divider1"></div>

## Introduction
Intermediary for Microsoft (IMS) (Version 7.2) supports the Policy Manager 7.2 Operational Script Policy. 

This policy works in the same manner as it does with the Network Director (see <a href="http://docs.akana.com/ag/policies/using_op_script_policy.htm">Using the Operational Script Policy 7.x</a>). 

## Policy Support

The Operational Script Policy supports the majority of the same APIs that Network Director supports (see <a href="http://docs.akana.com/ag/assets/scriptDocs_pm72/index.html">Policy Manager 7.2 Scripting API</a>) with the following exceptions: 

* com.soa.message.script.Message.normalize()
* com.soa.process.bpel.runtime.script package
* com.soa.security.script.saml1 package
* com.soa.security.script.saml2 package
* com.soa.security.script.BST class
* com.soa.security.script.SubjectMap.get(category) is ***renamed as*** getSubject(category)
* com.soa.message.script.Headers.get(name) is ***renamed as*** getHeader

## Method Return Type Changes:

The following Return Type changes were made to accommodate the difference between .NET and JAVA languages.

* java.util.Set<string> ***changed to*** System.Collections.Generic.List<string>
* java.security.cert.X509Certificate[] ***changed to*** System.Security.Cryptography.X509Certificates.X509Certificate2[]
* java.lang.Object[] ***changed to*** System.Object[]
* javax.xml.namespace.QName ***changed to*** System.Xml.XmlQualifiedName
* java.lang.String ***changed to*** System.String

<a href="#top">back to top</a>