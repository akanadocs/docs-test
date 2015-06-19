---
layout: page
title: Developing in Eclipse
description: A guide to developing and compiling simple policy in Eclipse
product: gs
category: ref
sub-nav-class: 
weight: 4
type: page
nav-title: Developing in Eclipse
---

Developing in Eclipse
-------------------------------------

<h3 style="color: grey;">Table of Contents</h3>
<ol class="table_of_contents">
	<li><a href="#introduction">Overview</a></li>
	<li><a href="#project">Create your plug-in project</a></li>
	<li><a href="#build">Building the simple policy handler example</a></li>
</ol>

### <a name="introduction"></a>Overview

This document describes how to build a simple policy handler using the Eclipse IDE.

#### <a name="data"></a>Prerequisites

* This configuration guide assumes that you’ve already installed the platform. If you need help installing the platform, please see the [install guide](http://docs.akana.com/sp/assets/SOA_Software_Platform_Install_Guide_v70.pdf). 
* If writing policy components for the API Gateway, you will have to create and configure a Policy Manager (PM) and Network Directory (ND) container. This is described in the document [Managing a Simple API](simple_api.html#Installing)
* Install and configure the Eclipse IDE as described in the document [Eclipse Workspace Setup](eclipse-setup.html)

### <a name="project"></a>Create your plug-in project

1. Switch to the Plug-in Development perspective, click on **File**, choose **New**, and select **Plug-in Project**. 
2. Give the project a name such as 'com.soa.examples.policy.handler.simple'. In **Target Platform**, select the **OSGi framework**, and choose **standard** in the drop-down. Click **Next >**.
3. Provide or remove the qualifier in the **version** field and select the 'JavaSE-1.7' **Execution Environment**. Unselect **Generate an Activator**. Click **Next >**.
4. Unselect **Create a plug-in using one of the templates**. Click **Finish**.

### <a name="build"></a>Building the simple policy handler example

The platform ships with a number of samples that can be found in the '/samples' subdirectory. Included in these is a simple policy handler, which we will import into the plug-in project, compile and build.

1. 
