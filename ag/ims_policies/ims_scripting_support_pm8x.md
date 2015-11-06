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

## Intermediary for Microsoft Scripting Support
Learn about Intermediary for Microsoft scripting support in Policy Manager 8.x.

<a href="http://docs.akana.com/ag/policies/using_op_script_policies_pm8x.htm" class="button secondary">Using Public / Private Operational Script Policies</a> 

<h5 class="stamp">Supported Platforms: 8.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)


## Introduction
Intermediary for Microsoft (IMS) supports the Policy Manager 8.x Public Operational Script and Private Operational Script policies. 

* These policies work in the same manner as they do with the Network Director (see <a href="http://docs.akana.com/ag/policies/using_op_script_policies_pm8x.htm">Using Public / Private Operational Script Policies</a>). 

* The policies support much of the same APIs and the Network Director supports (see link for script docs) with the exception of the following:

com.soa.message.script.Message.normalize()
com.soa.message.script.Message.setCorrelationID()
com.soa.process.bpel.runtime.script package
com.soa.security.script.saml1 package
com.soa.security.script.saml2 package
com.soa.security.script.BST class
com.soa.security.script.SubjectMap.get(category) is renamed as getSubject(category)


<a href="#top">back to top</a>