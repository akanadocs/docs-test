---
layout: page
title: Using the Envision Metrics Collector Feature
description: Learn how to install extensions to the Network Director cotnainer that will collect metrics for the Envision product.
product: ev
category: learn
weight:	7
sub-nav-class: Installation
type: page
nav-title: Using the Envision Metrics Collector Feature
---

## Using the Envision Metrics Collector Feature
Learn how to install extensions to the Network Director cotnainer that will collect metrics for the Envision product.

<a href="../envision_install/installing_envision_features.html" class="button secondary">Installing Envision Features (Main Topic)</a> 
<a href="../envision_install/installing_envision_v11.html" class="button secondary">Installing Envision 1.1</a> <a href="../envision_reference/env_toc.html" class="button secondary">Envision Reference</a> <a href="../../../sp/admin_console/using_admin_console.htm" class="button secondary">Using Admin Console</a> <br></br><a href="../../../sp/container_management/container_management.htm" class="button secondary">Managing Containers</a><br>

<h5 class="stamp">Supported Platforms: 8.1</h5> <h5 class="stamp">Supported Envision Versions: 1.1</h5><br>

<div class = "divider1"></div>

### Table of Contents
<div id="toc-marker"></div>

* [Introduction](#introduction)
* [Configuration](#configuration)

<div class = "divider1"></div>

### Introduction

This plug-in installs extensions that will collect metrics for the Envision product. Requires the Network Director or Policy Manager Services features.

* This plug-in is required if you are using separate containers for Policy Manager and Network Director.
* The plug-in is installed to the Policy Manager container as part of the *Envision Policy Manager Console Extension Feature* and must be installed separately to the Network Director container. 
* If you have the Network Director feature installed on the Policy Manager container, installation of this feature is *not* required as the plug-in is already installed as part of the *Envision Policy Manager Console Extension Feature*. 
* Having the plug-in installed on both Policy Manager and Network Director containers enables the ability to extract data from various payloads using the *Business Metrics Policy*. 

### Configuration

1. Log into the *Akana Administration Console* of the target installation container instance using your default credentials.
2. On the *Available Features* screen, select **Plug-ins** from the *Filter* menu. 
3. Select the *Envision Metrics Collector Feature* plug-in and click **Install Feature**.
4. After the installation is complete, click **OK** to restart the container. 

<p><a href="#top">back to top</a></p>


