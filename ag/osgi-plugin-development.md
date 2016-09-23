---
layout: page
title: OSGi Plug-in Projects
description: A guide to creating and compiling an OSGi plug-in project for a custom policy
product: ag
category: learn
sub-nav-class: Custom Development
weight: 5
type: page
nav-title: OSGi Plug-in Projects
---

## Creating and Compiling an OSGi plug-in project

<h3 style="color: grey;">Table of Contents</h3>
<ol class="table_of_contents">
	<li><a href="#introduction">Overview</a></li>
	<li><a href="#master">Creating the build project</a></li>
	<li><a href="#project">Creating a plug-in project</a></li>
	<li><a href="#build">Compiling the simple policy handler example</a></li>
	<li><a href="#build-complex">Compiling the complex policy handler example</a></li>
</ol>

### <a name="introduction"></a>Overview

This document describes how to create and compile an OSGi Plug-in project (such as a custom policy component) using the Eclipse IDE.

#### <a name="data"></a>Prerequisites

* This configuration guide assumes that you’ve already installed the platform. If you need help installing the platform, please see the [install guide](../sp/assets/SOA_Software_Platform_Install_Guide_v70.pdf). 
* If writing policy components for the API Gateway, you will have to create and configure a Policy Manager (PM) and Network Directory (ND) container. This is described in the document [Managing a Simple API](../sp/simple-api.html#Installing)
* Install and configure the Eclipse IDE as described in the document [Eclipse Workspace Setup](../sp/eclipse-setup.html)

### <a name="master"></a>Creating the build project

The platform ships with a number of samples that can be found in the '/samples' subdirectory. Included in these is a master build project that is used for the samples. This needs to be imported into your workspace.

1. Switch to the Java perspective, click on **File**, choose **New**, and select **Java Project**. 
2. Give the project the name 'build'. 
3. Drag and drop the contents of the '/samples/build' directory into the root of the 'build' project
4. Modify the project.properties file as follows:
	1. third.party.dir=[product_installation_dir]/sm70/lib/X.Y.Z. X.Y.Z is the version of the product installed
	2. local.tools.dependent.lib.dir=[product_installation_dir]/sm70/lib/X.Y.Z. Same as above
5. Modify build.xml to build only the projects that are required. For example:
	
	```xml
	
	...
	<target name="clean" depends="
		complex-policy-handler-clean,
		complex-policy-console-clean
	"/>
	
	<target name="samples" depends="
		complex-policy-handler,
		complex-policy-console
	"/>
	...
	
	```
 
### <a name="project"></a>Creating a plug-in project

1. Switch to the Plug-in Development perspective, click on **File**, choose **New**, and select **Plug-in Project**. 
2. Give the project a name such as 'com.soa.examples.policy.handler.simple'. In **Target Platform**, select the **OSGi framework**, and choose **standard** in the drop-down. Click **Next >**.
3. Provide or remove the qualifier in the **version** field and select the 'JavaSE-1.7' **Execution Environment**. Unselect **Generate an Activator**. Click **Next >**.
4. Unselect **Create a plug-in using one of the templates**. Click **Finish**.

### <a name="build"></a>Compiling the simple policy handler example

1. Drag and drop the contents of the '/samples/com.soa.examples.policy.handler.simple' directory into the root of the 'com.soa.examples.policy.handler.simple' plug-in project created in the previous section. Since the directory already contains a MANIFEST.MF file, the values entered into #3 of the previous section will be overwritten.
2. Build the project from top **Project ** menu and verify that there are no compilation errors.
3. Edit the master build file described in the previous section:

~~~ xml
	...
	&lt;target name="clean" depends="
		simple-policy-handler-clean
	"/&gt;
	
	&lt;target name="samples" depends="
		simple-policy-handler
	"/&gt;
	...
~~~

4. Open the Ant view and drag the master build file file into it. Double-click on the 'samples' project to run the build script.
4. If the build is successful, the resulting JAR file can be found in the master build project under the '/bin' sub-directory. It may be hidden from view, so look on the filesystem.

### <a name="build-complex"></a>Compiling the complex policy handler example

The complex policy handler is comprised of two projects, the core handler and the console project that provides a user interface for the Policy Manager.

The process for the complex handler is the same as the simple handler above:

1. Create a new plug-in as described above. Call it 'com.soa.examples.policy.handler.complex'
2. Drag and drop the contents of the '/samples/com.soa.examples.policy.handler.complex' directory into the root of the 'com.soa.examples.policy.handler.complex' plug-in project created in the previous step. Since the directory already contains a MANIFEST.MF file, the values entered into #3 of the previous section will be overwritten.
3. Build the project from top **Project** menu and verify that there are no compilation errors.

The console plug-in is the same:

1. Create a new plug-in as described above. Call it 'com.soa.examples.console.policy.complex'
2. Drag and drop the contents of the '/samples/com.soa.examples.console.policy.complex' directory into the root of the 'com.soa.examples.console.policy.complex' plug-in project created in the previous step. Since the directory already contains a MANIFEST.MF file, the values entered into #3 of the previous section will be overwritten.

Now build both:

1. Edit the master build file described in the previous section:
	{code:xml}

	...
	<target name="clean" depends="
		complex-policy-handler-clean,
		complex-policy-console-clean
	"/>
	
	<target name="samples" depends="
		complex-policy-handler,
		complex-policy-console
	"/>
	...
	{code}

2. Open the Ant view and drag the master build file file into it. Double-click on the 'samples' project to run the build script.
3. If the build is successful, the resulting JAR files can be found in a '/build/bin/' sub-directory in your Eclipse workspace root directory.