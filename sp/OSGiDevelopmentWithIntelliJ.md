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

## <a name="top"></a>OSGi Development with IntelliJ IDEA

<h3 style="color: grey;">Table of Contents</h3>
<ol class="table_of_contents">
	<li><a href="#createproject">Create Project</a></li>
	<li><a href="#debug">Running debug with IntelliJ IDEA</a></li>
	<li><a href="#test">Test</a></li>
</ol>


### <a name="createproject"></a>Create Project

<ol>
  <li>Select **Create New Project** (**File** > **New** > **Project**).</li>
  <li>Select **Empty Project** and click **Next**.
    <p>![](images/03_OSGiDevelopmentWithIntelliJ.png)</p></li>
  <li>Name the project, select the location to store it in, and then click **Finish**.</li>
  <li>Add all required modules to the newly created project. Open the **Module** settings and then, in the left column, select **Libraries**.
    <p>![](images/04_OSGiDevelopmentWithIntelliJ.png</p>)</li>
  <li>Click the **+** icon on the right.
    <p>![](images/05_OSGiDevelopmentWithIntelliJ.png)</p></li>
  <li>Select the **Java** option.</li>
  <li>Go to the folder of the installation and select the required library ({install_dir}/lib/api/8.3.0). Click **Open**.</li>
  <li>Repeat for all required libraries.</li>
  <li>When done, click **OK**.</li>
</ol>
After indexing, the projects should be compiled.
<p><a href="#top">Back to top</a></p>



### <a name="debug"></a>Running debug with IntelliJ IDEA

1. From the **Run** option, select **Edit Configurations**.
2. Select the **+** option and select **Remote**.

	![](images/06_OSGiDevelopmentWithIntelliJ.png)
	
3. Name the **Run** configuration and select the debug port that the server will be running on, as shown below.

	![](images/07_OSGiDevelopmentWithIntelliJ.png)
<p><a href="#top">Back to top</a></p>




### <a name="test"></a>Test

Click in the border of the code to add a breakpoint.

<p><a href="#top">Back to top</a></p>