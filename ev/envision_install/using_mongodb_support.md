---
layout: page
title: Using the MongoDB Support Feature
description: Learn how to redirect the collection of metrics and audit data from the designated Policy Manager Database to the MongoDB Database.
product: ev
category: learn
weight:	3
sub-nav-class: Installation
type: page
nav-title: Using the MongoDB Support Feature
---

## Using MongoDB Support Feature
Learn how to redirect the collection of metrics and audit data from the designated Policy Manager Database to the MongoDB Database.

<a href="../envision_install/installing_envision_features.html" class="button secondary">Installing Envision Features (Main Topic)</a> 
<a href="../envision_install/installing_envision_v11.html" class="button secondary">Installing Envision 1.1</a> <a href="../envision_reference/env_toc.html" class="button secondary">Envision Reference</a> <a href="using_admin_console.htm" class="button secondary">Using Admin Console</a> <br></br><a href="../../../sp/container_management/container_management.htm" class="button secondary">Managing Containers</a><br>

<h5 class="stamp">Supported Platforms: 8.0, 8.1</h5> <h5 class="stamp">Supported Envision Versions: 1.0, 1.1</h5><br>

<div class = "divider1"></div>

### Table of Contents
<div id="toc-marker"></div>

* [Introduction](#introduction)
* [Configuration](#configuration)

<div class = "divider1"></div>

### Introduction

This plug-in redirects the collection of metrics and audit data from the designated Policy Manager Database (RDBMS) to the MongoDB Database. 

Redirecting the capture of metrics and auditing data can help to optimize performance by reducing the toll on your designated RDBMS. This is because metrics and roll-up data processes will now occur in MongoDB which will increase performance in the container by reducing query times and CPU/memory overhead.

* This plug-in can be used exclusively with the Policy Manager product or in combination with Community Manager and/or Akana Envision. 
* Data stored includes Policy Manager Alerts, and all metrics and auditing log data that has a write operation. 
* Metrics and audit data collected from Network Director will be stored directly in MongoDB and will not be stored in the designated Policy Manager database (RDBMS). This would be data pertaining to how a particular API is performing (i.e., response times, error rates, etc.)
* Alert and audit trail data would be related to when a particular service changed, who changed it, what is the affect of the change, etc.
* Audit data can be used both in Community Manager, Policy Manager, and Envision for various charts by configuring a Business Metrics Policy that allows you to configure what focus of data to extract from the payload. 
* In Policy Manager, logging data for historical charts and logs that can be viewed via the *Monitoring* tab in Services, Containers, and Contracts will now be fetched from MongoDB. 
* The logging data stored in MongoDB can also be used in your own third-party reporting tools. 

<a href="#top">back to top</a>

### Configuration

1. Log into the *Akana Administration Console* of the target installation container instance using your default credentials.
2. On the *Available Features* screen, select **Plug-ins** from the *Filter* menu. 
3. Select the *MongoDB Support* plug-in and click **Install Feature**.
4. After the installation is complete, click *Configure* and continue.
5. On the *Configure MongoDB Database* screen, specify the host name and port where the MongoDB database is installed in the MongoClientURI field. The default MongoDB port is 27017. 
6. Click **Finish**, then **OK** to restart the container. The URI is assigned and the system automatically configures seed data and adds schemas. 
7. After the installation is complete, you can manage (i.e., install / uninstall) data sets via the *Configuration* tab by selecting *Configure MongoDB Database*.

<p><a href="#top">back to top</a></p>


