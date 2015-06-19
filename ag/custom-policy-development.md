---
layout: page
title: Custom Policy Development
description: A guide to developing a custom policy component
product: ag
category: learn
sub-nav-class: Custom Development
weight: 10
type: page
nav-title: Custom Policy Development
---

## Custom Policy Development

<h3 style="color: grey;">Table of Contents</h3>
<ol class="table_of_contents">
	<li><a href="#introduction">Overview</a></li>
	<li><a href="#handler-design">Policy Handler Design</a></li>
	<li><a href="#build">Building the simple policy handler example</a></li>
</ol>

### <a name="introduction"></a>Overview

This document contains the information required by any advanced customer of SOA Software to be able to:
1.	Develop;2.	Deploy; 3.	Test;4.	And run a custom Policy Handler with an Akana API Gateway
It will begin with the design of the Custom Policy Handler Framework, then work through the required steps to guide a customer in creating a working custom Policy.

#### <a name="data"></a>Prerequisites

* This configuration guide assumes that you’ve already installed the platform. If you need help installing the platform, please see the [install guide](http://docs.akana.com/sp/assets/SOA_Software_Platform_Install_Guide_v70.pdf). 
* If writing policy components for the API Gateway, you will have to create and configure a Policy Manager (PM) and Network Directory (ND) container. This is described in the document [Managing a Simple API](simple-api.html#Installing)
* Install and configure the Eclipse IDE as described in the document [Eclipse Workspace Setup](eclipse-setup.html)


### <a name="handler-design"></a>Policy Handler Design

1. Switch to the Plug-in Development perspective, click on **File**, choose **New**, and select **Plug-in Project**. 
2. Give the project a name such as 'com.soa.examples.policy.handler.simple'. In **Target Platform**, select the **OSGi framework**, and choose **standard** in the drop-down. Click **Next >**.
3. Provide or remove the qualifier in the **version** field and select the 'JavaSE-1.7' **Execution Environment**. Unselect **Generate an Activator**. Click **Next >**.
4. Unselect **Create a plug-in using one of the templates**. Click **Finish**.

### <a name="build"></a>Building the simple policy handler example

The platform ships with a number of samples that can be found in the '/samples' subdirectory. Included in these is a simple policy handler, which we will import into the plug-in project, compile and build.

1. Drag and drop the contents of the '/samples/com.soa.examples.policy.handler.simple' directory into the root of the 'com.soa.examples.policy.handler.simple' plug-in project created in the previous section. Since the directory already contains a MANIFEST.MF file, the values entered into #3 of the previous section will be overwritten.
2. Build the project from top **Project ** menu and verify that there are no compilation errors.
3. Open the Ant view and drag the build/build.xml file into it. Double-click on the 'simple-policy-handler-example' project to run the build script.
4. If the build is successful, the resulting JAR file can be found in a '/build/bin/' sub-directory in your Eclipse workspace root directory.
