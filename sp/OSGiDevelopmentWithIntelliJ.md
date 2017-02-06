---
layout: page
title: OSGi Development with IntelliJ IDEA
description: A guide on how to set up a workspace for platform development with IntelliJ IDEA
product: sp
category: gs
sub-nav-class: Custom Development
weight: 10
type: page
nav-title: OSGi Development with IntelliJ IDEA
---

## OSGi Development with IntelliJ IDEA

<h3 style="color: grey;">Table of Contents</h3>
<ol class="table_of_contents">
	<li><a href="#createproject">Create Project</a></li>
	<li><a href="#debug">Configure the default JRE</a></li>
	<li><a href="#test">Test</a></li>
</ol>


### <a name="createproject"></a>Create Project

Select **Create New Project** (**File** -> **New** -> **Project**)

Select **Empty Projec**t and click **Next**.

![](images/03_OSGiDevelopmentWithIntelliJ.png)

Name the project, select the location to store it in, and then click **Finish**.

Add all required modules to the newly created project. Open the **Module** settings and then, in the left column, select **Libraries**.

![](images/04_OSGiDevelopmentWithIntelliJ.png)

Click the '+' icon.

![](images/05_OSGiDevelopmentWithIntelliJ.png)

Select the **Java** option.

Go to the folder of the installation and select the required library (<install_dir>/lib/api/8.3.0). Click **Open**.

Repeat for all required libraries.

When done, click **OK**.

After indexing, the projects should be compiled.

### <a name="debug"></a>Running debug with IntelliJ IDEA

From the **Run option**, select **Edit Configurations**.

Select the **+** option and select **Remote**.

![](images/06_OSGiDevelopmentWithIntelliJ.png)

Name the **Run** configuration and select the debug port that the server will be running on:

![](images/07_OSGiDevelopmentWithIntelliJ.png)

### <a name="test"></a>Test

Click in the border of the code to add a breakpoint.
