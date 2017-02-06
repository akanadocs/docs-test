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

### Create Project

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

### Running debug with IntelliJ IDEA

From the **Run optio**n, select **Edit Configurations**.
Select the **+** option and select **Remote**.
![](images/06_OSGiDevelopmentWithIntelliJ.png)
Name the **Run** configuration and select the debug port that the server will be running on:
![](images/07_OSGiDevelopmentWithIntelliJ.png)
Test. Click in the border of the code to add a breakpoint.
