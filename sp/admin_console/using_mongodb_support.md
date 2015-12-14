---
layout: page
title: Using the MongoDB Support Feature
description: Learn how to redirect the collection of metrics and audit data from the designated Policy Manager Database to the MongoDB Database.
product: sp
category: learn
weight:	3
sub-nav-class: Installation
type: page
nav-title: Using the MongoDB Support Feature
---

## Using MongoDB Support Feature
Learn how to redirect the collection of metrics and audit data from the designated Policy Manager Database to the MongoDB Database.

 <a href="../../../sp/admin_console/using_admin_console.htm" class="button secondary">Using Admin Console</a> <a href="../../../sp/container_management/container_management.htm" class="button secondary">Managing Containers</a><br>

<h5 class="stamp">Supported Platforms: 8.0</h5> 

<div class = "divider1"></div>

### Table of Contents
<div id="toc-marker"></div>

* [Introduction](#introduction)
* [Step 1: Download and Install MongoDB](#step-1-download-and-install-mongodb)
* [Step 2: Create MongoDB Data Folder](#step-2-create-mongodb-data-folder)
* [Step 3: Start MongoDB](#step-3-start-mongob)
* [Step 4: Configure MongoDB Support Plug-in](#step-4-configure-mongodb-support-plugin)

<div class = "divider1"></div>

### Introduction

This plug-in redirects the collection of metrics and audit data from the designated Policy Manager Database (RDBMS) to the MongoDB Database. 

Use of this plug-in requires installation of MongoDB. 

Redirecting the capture of metrics and auditing data can help to optimize performance by reducing the toll on your designated RDBMS. This is because metrics and roll-up data processes will now occur in MongoDB which will increase performance in the container by reducing query times and CPU/memory overhead.

* This plug-in can be used exclusively with the Policy Manager product or in combination with Community Manager and/or Akana Envision. 
* Data stored includes Policy Manager Alerts, and all metrics and auditing log data that has a write operation. 
* Metrics and audit data collected from Network Director will be stored directly in MongoDB and will not be stored in the designated Policy Manager database (RDBMS). This would be data pertaining to how a particular API is performing (i.e., response times, error rates, etc.)
* Alert and audit trail data would be related to when a particular service changed, who changed it, what is the affect of the change, etc.
* Audit data can be used both in Community Manager, Policy Manager, and Envision for various charts by configuring a Business Metrics Policy that allows you to configure what focus of data to extract from the payload. 
* In Policy Manager, logging data for historical charts and logs that can be viewed via the *Monitoring* tab in Services, Containers, and Contracts will now be fetched from MongoDB. 
* The logging data stored in MongoDB can also be used in your own third-party reporting tools. 

<a href="#top">back to top</a>

### Step 1: Download and Install MongoDB

Use of this plug-in requires installation of MongoDB. If you have already installed and started MongoDB skip to Step 4.

1. Go to http://www.mongodb.org/downloads and download the MongoDB Version 3.0.0 file for your platform. Windows 64-bit (MSI), Linux 64-bit (TGZ), and Solaris 64-bit (TGZ) are supported. If you are on a Mac you can install Mongo with homebrew using "brew install mongo."
2. Install MongoDB on your platform.**
3. Note that these instructions provide a basic MongoDB installation approach. Refer to the MongoDB documentation for information on installation instructions and shutdown procedures for your specific deployment. The site link is listed below:

	https://docs.mongodb.org/v3.0/tutorial/manage-mongodb-processes/

<a href="#top">back to top</a>

### Step 2: Create MongoDB Data Folder
1. Create a MongoDB data folder. The default is **/data/db**. If you prefer to use a different location use --dbpath.    

<a href="#top">back to top</a>

### Step 3: Start MongoDB
1. Navigate to the MongoDB installation directory:
    **/MongoDB/Server/3.0/bin**
2. Enter **mongod**. 
3. If MongoDB  successfully starts, your command window will say "waiting for connections" followed by the port number. 

<a href="#top">back to top</a>


### Step 4: Configure MongoDB Support Plug-in

1. Log into the *Akana Administration Console* of the target installation container instance using your default credentials.
2. On the *Available Features* screen, select **Plug-ins** from the *Filter* menu. 
3. Select the *MongoDB Support* plug-in and click **Install Feature**.
4. After the installation is complete, click *Configure* and continue.
5. On the *Configure MongoDB Database* screen, specify the host name and port where the MongoDB database is installed in the MongoClientURI field. The default MongoDB port is 27017. 
6. Click **Finish**, then **OK** to restart the container. The URI is assigned and the system automatically configures seed data and adds schemas. 
7. After the installation is complete, you can manage (i.e., install / uninstall) data sets via the *Configuration* tab by selecting *Configure MongoDB Database*.

<a href="#top">back to top</a>


