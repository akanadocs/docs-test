---
layout: page
title: Using the Akana Envision Feature
description: Learn how to install the Envision Standalone Analytics Manager UI and associated services.
product: ev
category: learn
weight:	6
sub-nav-class: Installation
type: page
nav-title: Using the Akana Envision Feature
---

## Using Akana Envision 
Learn how to install the Envision Standalone Analytics Manager UI and associated services.

<a href="../envision_install/installing_envision_features.html" class="button secondary">Installing Envision Features (Main Topic)</a> 
<a href="../envision_install/installing_envision_v11.html" class="button secondary">Installing Envision 1.1</a> <a href="../envision_reference/env_toc.html" class="button secondary">Envision Reference</a> 
<a href="using_admin_console.htm" class="button secondary">Using Admin Console</a> <br></br> <a href="../container_management/container_management.htm" class="button secondary">Managing Containers</a><br>

<h5 class="stamp">Supported Platforms: 8.0, 8.1</h5> <h5 class="stamp">Supported Envision Versions: 1.0, 1.1</h5><br>


<div class = "divider1"></div>

### Table of Contents
<div id="toc-marker"></div>

* [Introduction](#introduction)
* [Configuration](#configuration)

<div class = "divider1"></div>

### Introduction

This feature installs the Envision Standalone Analytics Manager UI and associated services.

See [Installing the Akana Envision 1.1](../../sp/platform_install/installing_envision_v11.html) for complete end-to-end installation instructions including installing MongoDB, configuring a container, configuring sample data sets, launching the Envision Console.

### Configuration

1. Launch the Administration Console (http://hostname:port/admin/).
2. On the *Available Features* screen, select **Feature** from the *Filter* menu. 
3. Select the *Akana Envision* feature and click **Install Feature**.
4. After the installation is complete, click **Configure** and continue.
5. On the *Configure MongoDB Database* screen, specify the host name and port where the MongoDB database is installed in the MongoClientURI field. The default MongoDB port is 27017. 
6. Click **Finish**. The URI is assigned and the system automatically configures seed data and installs schemas and tables.  

<p><a href="#top">back to top</a></p>


