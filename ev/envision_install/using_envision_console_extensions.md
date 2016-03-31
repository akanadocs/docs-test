---
layout: page
title: Using the Envision Console Extensions Feature
description: Learn how to install Envision business metrics and service level agreement (SLA) extensions to the the Policy Manager Management Console. 
product: ev
category: learn
weight:	5
sub-nav-class: Installation
type: page
nav-title: Using the Envision Console Extensions Feature 
---

## Using the Envision Console Extensions Feature  
Learn how to install Envision business metrics and service level agreement (SLA) extensions to the the *Policy Manager Management Console*.

<a href="../envision_install/installing_envision_features.html" class="button secondary">Installing Envision Features (Main Topic)</a> 
<a href="../envision_install/installing_envision_v11.html" class="button secondary">Installing Envision 1.1</a> <a href="../../../sp/admin_console/using_admin_console.htm" class="button secondary">Using Admin Console</a> <br></br> <a href="../../../sp/container_management/container_management.htm" class="button secondary">Managing Containers</a><br>

<h5 class="stamp">Supported Platforms: 8.1</h5> <h5 class="stamp">Supported Envision Versions: 1.1</h5><br>

<div class = "divider1"></div>

### Table of Contents
<div id="toc-marker"></div>

* [Introduction](#introduction)
* [Configuration](#configuration)

<div class = "divider1"></div>

### Introduction

This plug-in installs extensions to the Policy Manager Management Console to direct the collection of business metrics and sla collections that are then fed into the Envision product. The extensions include configuration screens for the business metrics and sla related policies. 

This feature must be installed into the Policy Manager container instance. Requires that the Policy Manager Console feature be installed to the Policy Manager container instance. This feature works in conjunction with the Akana Envision product.

**Note:** MongoDB must be started before proceeding with this installation to both connect to the MongoClientURI and to Modify the associated policies after logging into the Policy Manager Management Console.  

This plug-in also installs the following features:

* **Akana Envision Service Extensions** - This plug-in installs connectors Policy Manager uses for collection of business metrics that are then fed into the Envision product. This feature must be installed into the Policy Manager container instance and works in conjunction with the Akana Envision. This plug-in also automatically installs the Envision Metrics Collector plug-in.  

	Installs the Business Metrics and Operational Metrics Policies to the *Policies > Operational* section. 
* **Akana Envision Console Extensions** - This plug-in installs extensions to the Policy Manager Management Console to direct the collection of business metrics and SLA collection that are then fed into the Envision product. The extensions include configuration screens for the business metrics related policies and configuring SLA for Business Metrics. 

	This feature requires the Policy Manager Console feature. Installs the Business Service Level Agreement Policy to the *Policies > QoS* section.

### Configuration

1. Log into the *Akana Administration Console* of the target installation container instance using your default credentials.
2. On the *Available Features* screen, select **Plug-ins** from the *Filter* menu. 
3. Select the *Envision Console Extension* plug-in and click **Install Feature**.
4. After the installation is complete, click *Configure* and continue.
5. On the *Configure MongoDB Database* screen, specify the host name and port where the MongoDB database is installed in the MongoClientURI field. The default MongoDB port is 27017. 
6. Click **Finish**, then **OK** to restart the container. The URI is assigned and the system automatically configures seed data and adds schemas. 7. After the installation is complete, you can manage (i.e., install / uninstall) data sets via the *Configuration* tab by selecting *Configure MongoDB Database*.

<a href="#top">back to top</a>


