---
layout: page
title: Using the Envision Policy Manager Console Extension Feature
description: Learn how to install Envision Business Metrics Policy Extensions to the Policy Manager Management Console. 
product: ev
category: learn
weight:	6
sub-nav-class: Installation
type: page
nav-title: Using the Envision Policy Manager Console Extension Feature 
---

## Using the Envision Policy Manager Console Extension Feature  
Learn how to install Envision Business Metrics Policy Extensions to the Policy Manager Management Console.

<a href="../envision_install/installing_envision_features.html" class="button secondary">Installing Envision Features (Main Topic)</a> 
<a href="../envision_install/installing_envision_v11.html" class="button secondary">Installing Envision 1.1</a> <a href="using_admin_console.htm" class="button secondary">Using Admin Console</a> 
<a href="../container_management/container_management.htm" class="button secondary">Managing Containers</a><p></p>

<h5 class="stamp">Supported Platforms: 8.1</h5>
<h5 class="stamp">Supported Envision Versions: 1.1</h5><br>
<p></p>


  <div class = "divider1"></div>

### Table of Contents
<div id="toc-marker"></div>

* [Introduction](#introduction)
* [Configuration](#configuration)

<div class = "divider1"></div>

### Introduction

This plug-in installs extensions to the Policy Manager Management Console to direct the collection of business metrics that are then fed into the Envision product. The extensions include configuration screens for the business metrics related policies. 

This feature must be installed into the Policy Manager container instance. Requires that the Policy Manager Console feature be installed to the Policy Manager container instance. This feature works in conjunction with the Akana Envision product.

**Note:** MongoDB must be started before proceeding with this installation to both connect to the MongoClientURI and to Modify the associated policies after logging into the Policy Manager Management Console.  

This plug-in installs the following policies:
* Business Metrics Policy
* Operational Metrics Policy
* Business Metrics SLA QoS Policy

### Configuration

1. Log into the *Akana Administration Console* of the target installation container instance using your default credentials.
2. On the *Available Features* screen, select **Plug-ins** from the *Filter* menu. 
3. Select the *Envision Policy Manager Console Extension* plug-in and click **Install Feature**.
4. After the installation is complete, click *Configure* and continue.
5. On the *Configure MongoDB Database* screen, specify the host name and port where the MongoDB database is installed in the MongoClientURI field. The default MongoDB port is 27017. 
6. Click **Finish**, then **OK** to restart the container. The URI is assigned and the system automatically configures seed data and adds schemas. 7. After the installation is complete, you can manage (i.e., install / uninstall) data sets via the *Configuration* tab by selecting *Configure MongoDB Database*.

<p><a href="#top">back to top</a></p>


