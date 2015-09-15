---
layout: page
title: Using the Akana Sample Data Sets for Demo Charts Feature
description: Learn how to install sample data sets that can be used in the Envision Console.
product: ev
category: learn
weight:	6
sub-nav-class: Installation
type: page
nav-title: Using the Akana Sample Data Sets for Demo Charts Feature
---

## Using Akana Envision 
Learn how to install sample data sets that can be used in the Envision Console.

<a href="../envision_install/installing_envision_features.html" class="button secondary">Installing Envision Features (Main Topic)</a> <a href="../envision_install/installing_envision_v11.html" class="button secondary">Installing Envision 1.1</a> <a href="../envision_reference/env_toc.html" class="button secondary">Envision Reference</a> <a href="using_admin_console.htm" class="button secondary">Using Admin Console</a> <p></p> <a href="../container_management/container_management.htm" class="button secondary">Managing Containers</a>

<h5 class="stamp">Supported Platforms: 8.0, 8.1</h5> <h5 class="stamp">Supported Envision Versions: 1.0, 1.1</h5>


  <div class = "divider1"></div>

### Table of Contents
<div id="toc-marker"></div>

* [Introduction](#introduction)
* [Configuration](#configuration)

<div class = "divider1"></div>

### Introduction

This plug-in provides a series of sample data sets for demo charts that can be installed to the Envision Console. 

* When you install a sample data set the associated Widget and Dashboard are added to the Envision Console. 
* These datasets provide you with a good starting point for becoming familiar with the Envision product and generating sample charts. 
* The sample datasets can also be selected and used in the Business Metrics Policy.  

Installation of the *Akana Envision* feature is required to view and use the sample data sets in the *Envision Console* and in the *Business Metrics Policy*, but you can install the *Sample Data Sets for Demo Charts* feature and connect to the MongoDB database without pre-installing the *Akana Envision* feature.


### Configuration

1. Log into the *Akana Administration Console* of the target installation container instance using your default credentials.
2. On the *Available Features* screen, select **Plug-ins** from the *Filter* menu. 
3. Select the *Akana Sample Data Sets for Demo Charts* plug-in and click **Install Feature**.
4. After the installation is complete, click **Configure** and continue.
5. If the *Akana Envision* or *Akana Envision MongoDB* Support features have *not* yet been installed, the *Configure MongoDB Database* screen will display. Here you will specify the **MongoClientURI** to connect to the database. If these features have been previously installed, this means you are already connected to the database, this screen will not display, and you can skip to the next step. 
5. On the *Configure Sample Data Sets* screen, select the checkbox for each data set you wold like to install. 

 *Note that the Operational Metrics and Shoe Sales Data Sets and Charts are installed by default as part of the Akana Envision feature installation (i.e., data set options will be checked)*
6. Click **Finish**, then **OK** to restart the container. Click **Close** after the container is restart is completed. 
7. After the installation is complete, you can manage (i.e., install / uninstall) data sets via the *Configuration* tab by selecting *Configure Sample Data Sets*.

<p><a href="#top">back to top</a></p>


