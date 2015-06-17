---
layout: page
title: Managing a Simple API
description: A guide to install and configure the API Gateway to manage a simple API
product: sp
category: gs	
sub-nav-class: 
weight: 4
type: page
nav-title: Managing a Simple API
---


Getting started: Managing a Simple API 
-------------------------------------

<h3 style="color: grey;">Table of Contents</h3>
<ol class="table_of_contents">
	<li><a href="#Overview">Overview</a></li>
	<li><a href="#Prerequisites">Prerequisites</a></li>
	<ol>
		<li><a href="#install-features-on-separate-containers">Installing features on separate containers</a></li>
		<li><a href="#separating-policy-manager-features">Splitting features into smaller, subordinate features</a></li>
		<li><a href="#data-archiving">Database maintenance</a></li>
	</ol>
	<li><a href="#config-setting">Configuration Settings</a></li>
	<ol>
		<li><a href="#os-file-handles">Configuring OS File Handles</a></li>
		<li><a href="#jre-memory">Configuring the JVM memory settings</a></li>
		<li><a href="#listener-connection-pool">Configuring the container listeners</a></li>
		<li><a href="#client-connection-pool">Configuring the client connection pool</a></li>
	</ol>
	<li><a href="#other-settings">Other Settings</a></li>
	<ol>
		<li><a href="#gif-metrics">Calculating GIF metrics</a></li>
		<li><a href="#auto-search">Disabling auto-search</a></li>
		<li><a href="#require-metrics-policy">Internal service metrics calculations</a></li>
		<li><a href="#usage-writer">Configuring the Usage Writer</a></li>
		<li><a href="#preloading">Preloading invoked services</a></li>
		<li><a href="#contract-policy-cache">Contract policy cache</a></li>
		<li><a href="#endpoint-cache">Endpoint cache</a></li>
	</ol>
</ol>

### <a name="Overview"></a>Overview

This document will walk you through the steps to create containers and configure the Policy Manager to the Network Director. You will then register the API(s), create a contract, and then send a test request to check that the set up is complete and correct. 

#### <a name="Prerequisites"></a>Prerequisites

This configuration guide assumes that you’ve already installed the platform. If you need help installing the platform, please see the install guide at [insert link]

## Steps 1, 2, and 3: Installing the Policy Manager and Network Director containers, and configuring them

For the steps on how to create a the containers, [see pages 34 & 35 of the Platform install guide v70.](http://docs.akana.com/sp/assets/SOA_Software_Platform_Install_Guide_v70.pdf) You will create and configure a Policy Manager (PM) and Network Directory (ND) container.

#### <a name="PM Container"></a>PM Container

1. Name your container something that makes sense for your environment. Enter the structure for PM properties. It is:

	container.instance.name=pmcredential.username=administratorcredential.password=passworddefault.host=127.0.0.1default.port=9900

2. Run the following command: ./startup.sh configurator -Dsilent=true -Dproperties=/[property file directory location]/pm.properties 
3.	Edit the sm70/instances/pm/system.properties file by adding the following line:

	com.soa.http.bind.all=true
	
##### Copying database driver (optional)

This step is only necessary if using Oracle or MySQL
1. Download the driver
	<li>For MySQL 5.1 we recommend using the "MyAQL AB's JDBC Driver for MySQL 5.1.6” from SpringSource. 
	<li> For Oracle, download the appropriate thin driver from the Oracle website.
2. Copy the JAR file to the sm70/instances/pm/deploy directory for the PM container.

You may also want to dedicate containers for the 'SOA Software Policy Manager Services' feature. This feature provides the backend APIs to support the Network Directors and is often installed in the same containers as the 'SOA Software Policy Manager Console' and/or 'SOA Software Community Manager' features. The decision to install it on its own container can be driven by security requirements (e.g. network topology) or the minimization of load on the Web traffic containers. 

#### <a name="ND Container"></a>ND Container

1. Enter the structure for the ND properties. It is:

	container.instance.name=ndcredential.username=administratorcredential.password=passworddefault.host=127.0.0.1default.port=9901

2. Run the following command: 

	./startup.sh configurator -Dsilent=true -Dproperties=/[property file directory location]/nd.properties
	
3.	Edit the sm70/instances/nd/system.properties file by adding the following line:	com.soa.http.bind.all=true
##### Copying database driver (optional)

This step is only necessary if using Oracle or MySQL
1. Download the driver
	<li>For MySQL 5.1 we recommend using the "MyAQL AB's JDBC Driver for MySQL 5.1.6” from SpringSource. 
	<li> For Oracle, download the appropriate thin driver from the Oracle website.
2. Copy the JAR file to the sm70/instances/pm/deploy directory for the PM container.

### Starting the containers

For each of the container go to **SM70/bin/startup.sh*[container instance name]* -bg**

To ensure that the containers have started, open a browser, and enter:
**http://[hostname]:[default port/admin**

###Configuring the Policy Manager
Once you've created the Policy Manager container, it needs to be configured. 
####Install PM Features
1. Log into the SOA Administrator Console.
2. From the "Available Features" tab, check the boxes for the:
	SOA Software Policy Manager Console
	SOA Software Policy Manager Services
3. in the bottom-right corner, click **Install Features**. The Install Wizard will run through the installation steps.
4. When the installation is complete, you will see a pop-up windows. Click **Configure** to complete the deployment.
5. On the "Manage PKI Keys Wizard" window, keep the defaulted options and clikc **Next**, then click **Finish**. Click **Go to Next Task**. 

####Configuring Database options
1. In the "Database Options," choose **Create New Database**. Click **Next**.
2. Enter your database parameters. Click **Finish**, then **Go To Next Task**.

####Managing Schemas
On the "Manage Schemas Wizard," you'll see a list of schemas that are available to install, as well as schemas that you've already installed. 

###<span style="color: red">Note: Checking an installed schema and clicking finish will cause the schema to uninstall, and could cause data loss. Do not check the box for installed schemas unless you want to uninstall it. </span>

After installing the schemas, click **Go to Next Task**.

####Set Administrator Credentials
After setting the Administrator credendtials, click **Finish**.
YOu'll get a pop-up advising you that the container must be restarted in order for the changes to be applied. CLick **OK**.

When the configuration is complete, you can then click **Close**. YOu will then be logged out of the Administration Console. 

###Configuring the Network Director
1. Log into the SOA Software Administration Console.
2. From the "Available Features" tab, check the **SOA Software Network Director**. In the bottom right corner, click **Install Feature**.
3. You'll see the Installation Wizard screen. Click Install Feature. 
4. Click **Configure** to complete the Deployment. 
5. ***Connecting the Network Director and the Policy Manager***. The connection between the ND and the PM is a sub-step of the Network Director configuration. In the "WS-MetaDataExhange Options" window, you need to supply the URL for the Policy Manager's Metadata Exchange service. You can find this by:
	1. Logging intothe Policiy Manager
	2. Click the **Workbench** tab.
	3. On the Left Pane (Called the "Organization Tree")click **SOA Software Policy Manager - Services - Metedata Exchange Service - Access Points.** 
	4. The URL will appear in the windows in the middle of the screen. 

	Back in the Network Director Install Wizard, enter the URL you found in the Policy Manager. Then click **Finish**.
6. Click **Go to next Task**.
7. On the "Manage PKI Keys Wizard" window, leave the defaults and click **Finish**.
8. You may be prompted to restart the Console. DO so for your changes to take effect. 
9. After installation, we recommend that you click the **Installed Features** tab, and check the "Pending Installation Tasks" to ensure all features were properly installed. You can use the **Configuration** tab to re-configure any features that were missed. 

## Step 4: Register Network Director in Policy Manager
YOu'll need to tell the Policy Manager where to find the containers you created, so that the Network Director can successfully connect to POlicy Manager. 

1. From the Policy Manager Organization tree, click **Containers**.
2. Click **Add Container**. 
3. Select **SOA Container**, click **Next**.
4. In the "Metadata URL:" field, enter the URL for the ND container as follows: http://host:port/metadata. Click **Next**.
5.	Tell the Policy Manager to trust the Network Director by clicking **Yes**. Then click **Next**. 
6. Enter the **Instance Name** and name the **Network Director**. Then click **Finish, CLose**.
7. Check that the Container started. YOu can do this from the Organization Tree - click **Containers**- ***Container Name.*** in the "Container Overview," the State should say: "Started." ***Note: you made need to refresh or wait a few seconds before checking the State.***""

##Step 5 Register the API in Policy Manager

In this step we will use the Akana Demo REST API, available at [http://demo.akana-dev.net:3005](http://demo.akana-dev.net:3005). To keep it simple, we will just register the GET operation at [http://demo.akana-dev.net:3005/posts.](http://demo.akana-dev.net:3005/posts)

###Adding an Organization
1. From the left Organization Tree, click **Registry**.
2. On the rgiht side of the screen, under "Actions," Click **Add Organization**. 
3. Indicate where you'd like to place the Organization on the Organization Tree. Click **Next**.
4. Give your Organization a name, Click **Finish**, then **Close**.

###Registering an API
1. From the Organization tree on the left, click on the Organization you created. 
2. Under the "Service Summary", click **Create Physical Service**.
3. Clic the radio button for **Create Without Using Service Descriptor Document**. Click **Next**.
4. In the "Service Details," enter the:
	
	Name: Enter the name of the API
	QName: Give a unique Namespace and Localpart. This is used by the system internally to uniquely route to a service or API. 
	
	Click **Next**.
5. In the "Schema Import Options" choose to **Use Existing Schemas**. Click **Next**.
6. Now you'll click **Add Operation**. Give it a name and a description if you'd like. Click **Next**.
7. The "Operation Details" screen  gives you the opportunity to specify Schema elements/types for your operatin. For simplicity's sake, under "Schemas," assign the **anyType** to the "input"and the "Output" by clicking the >>. You can leave Fault blank. CLick **Next**.
8. In the "Binding Properties" screen, choose your:

	Method (in our example, we used the GET operation.)