---
layout: page
title: Publishing a Simple API Using Policy Manager 7.x
description: A guide to install and configure the Community Manager developer portal, and publish an API using Policy Manager 7.x.
product: sp
category: gs	
sub-nav-class: API Management
weight: 4
type: page
nav-title: Publishing a Simple API using Policy Manager 7.x
---


Getting started: Publishing a Simple API 
-------------------------------------

<h3 style="color: grey;">Table of Contents</h3>
<ol class="table_of_contents">
	<li><a href="#Installing">Add the Community Manager Feature</a></li>
	<li><a href="#Containers">Create a Community Manager Tenant</a></li>
	<li><a href="#Config">Publish the API from Policy Manager to Community Manager</a></li>
	<li><a href="#register-nd">Send a test request from Community Manager</a></li>
	
	
</ol>


### <a name="Overview"></a>Overview



This document will walk you through the steps to add and configure Community Manager (CM) on top of the Policy Manager container. Then it walks you through how to create a tenant, publish your API in CM, and send a test request from CM. 

### Prerequisites
This document assumes that you've already installed the platform, created and started the Policy Manager and Network Director containers, and configured those containers. If you need instructions on how to complete those tasks, see our our document [Managing a Simple API](http://docs.akana.com/sp/simple-api.html).  


## <a name="Installing"></a>Step: 1: Add the Community Manager

The simplest way to install Community Manager is to install it into the same container as Policy Manager. Configuration consists of installing features, and managing schemas. 
####Downloading Community Manager
1. Log into the support site [support.akana.com](http://support.akana.com).
2. Under "Popular Knowledgebase Articles," click **CM/PM compatibility support matrix**. Review the matrix for your version of Policy Manager, and note the most recent version of Community Manager you can download. 
3. Go back to the Support Center and click **Downloads**.
4. Select **EnterpriseAPIPlatform**.
5. Select **CommunityManager**.
6. Select the version of Community Manager you noted in Step 2. 
7. Download the zip file.
8. Unzip the zip file into the sm70/lib directory. 

####Installing features in the Policy Manager container
1. Log into the Container Administration Console.
2. Click on the **Repository** tab, and click the **Refresh** icon in the top-right corner of the list. You should see "SOA Software Community Manager Repository" and "SOA Software OAuth Repository."
3. Click the "Available Features" tab.
4. Check the **SOA Software Community Manager** and the **SOA Software Community Manager Default Theme**. In the lower-right corner, click **Install Feature**.
3. The Install Wizard will run through the installation steps. Click **Install Feature**.
4. When the installation is complete, you will see a pop-up window. Click **Configure** to complete the deployment using the following wizard step.



#### Managing Schemas
In the "Manage Schemas Wizard," you'll see schemas that are available to install, as well as schemas that you've already installed. Select the schema you want to add - typically selecting all of the "Available Schemas." Click **Finish**.

#### <span style="color: red">Note: Do not check the box for installed schemas unless you want to uninstall it. Checking an installed schema and clicking Finish can cause the schema to uninstall, and could cause data loss.  </span>

After installing the schemas, the system will recommend a restart. Restart.

#### Installing Plug-ins in the Policy Manager container####
1. Log into the Container Administration Console.
2. Click on the "Available Features" tab, and choose **Plug-in** from the filter drop down. 
3. Check **SOA Software Community Manager Policy Console** and click **Install Feature**. 
4.  The Install Wizard will run through the installation steps. Click **Install Feature**. 

After installing the Plug-in, the system will recommend a restart. Restart.

####Installing Plug-ins in the Network Director####
1. Log into the Network Director Console. 
2. Click on the **Available Features** tab. 
3. Ensure your Filter is set to **Plug-in**.
4. Select **SOA Software API Security Policy Handler**.
5. Click **Install Feature**. Then click **Install Feature** again.

After installing the Plug-in, the system willl recommend a restart. Restart. 

	
## <a name="Containers"></a>Step: 2: Create a Community Manager Tenant
Next you'll need to enter the command to create the Community Manager Tenant. At the same time, you need to add your parameters for your CM Tenant. The parameters are explained below the command. The command is as follows: 
	
	
	./jython.sh ../scripts/Lib/soa/atmosphere/tenant.py -a -v [url] [email] [password] [tenant name] [tenant id] [address] [console address] [theme] [contact email address] [from email address] [virtual hosts]	

Command | Command Parameter | Detail
------------- | -------------|-------------
--url | URL	| 	Enter the Atmosphere container URL
--email | Email | The user name to use when registering with Atmosphere
--password | Password | The password to use when registering with Atmosphere
--tenant | Tenant name | The name you give to your Tenant
--tenantId | Tenant ID | Tenant Federation Member ID. It is an ID that is all lowercase and no special characters that identifies your Tenant.
--address | Address | The url for the trusted Federation Member
--consoleAddress | Console address | The **Console** url for the trusted federation member
--theme | Theme | The theme to be used by the Tenant
--contactEmailAddress       | Contact email address | The email address to contact regarding issues with the Tenant
--fromEmailAdress | From email address | The email address for any generated email
--virtualHosts | Virtual hosts | a comma-delimited list of host names used to identify the Tenant

To see an example of how it looks as a command string:

```
./jython.sh ../scripts/Lib/soa/atmosphere/tenant.py -a -v --url http://mytenant.local:9900 --email email@address.com --password Password1 --tenantName mytenant --tenantId mytenant --address http://mytenant.local:9900 --consoleAddress http://mytenant.local:9900/atmosphere --theme default --contactEmailAddress email@address.com --fromEmailAddress email@address.com --virtualHosts mytenant.local
```
####Verify your Tenant
You'll want to verify that your Tenant is set up correctly by entering your console address into a browser. Log into the Tenant using your email address and password you assigned in the parameter script. 

Note that the landing page will not have any content until you add it. 
 ## <a name="register-nd"></a>Step 3: Publish the API from Policy Manager to Community Manager
You can only create API's using Virtual Services, and these Virtual Services must be in your Tenant Organization. In this example, it is called "mytenant."
 
1. Verify that your Virtual Service is in the Tenant Organization. You can either move it, or create it specifically in the Tenant Organization.
2. Attach a consumer authentication security policy to your virtual service. This serves to authenticate applications that call the API. To do this: 

	a. Go to Policy Manager.
	
	b. From the Organization Tree, click on **Tenant - Services - virtual service**.
	
	
	c. From **Policy Attachments**, in the "Operational" section click **Manage**.
	
	d. Click **Policies - Operational Policies - AtmosphereApplicationSecurityPolicy**. Click **Apply**.
	
	 Examples of this policy include: 
 - API Consumer Application Security Policy
 - OAuth Security Policy 
2. Log onto the Tenant you created in Step 2.
2. Click the **plus sign** in the top-middle of the screen, then click **Add New API**.
3. Enter the details of the API, such as the name, description, version, name, and version description. Click **Next**.
4. On the Target API screen, in the "Service Key" field, enter the name of the API you've entered into the Policy Manager. (You might need to log into Policy Manager to retrieve the name if you have forgotten it. ) Click **Finish**.


##<a name="register-api"></a>Step 4: Send a test request from Community Manager
To get the the end result of sending a test request from the Community manager, you'll need to create an app, register it, activate it, and then you can send the request. 

####Create the App####
1. Log onto Community Manager. 
2. Click the **plus sign** at the top-middle portion of your screen, click **Add a New App**. 
3. Enter the details of the app, such as name, version id, tags, description.
4. Click **Save**. 

####Register the App####
1. Click on the **cogs** icon to access the API's.
2. Find the API you want to connect, then click **Access**.
3. You'll see your application name, click **Add**, then **Next**.
4. Choose your environment. Click **Next**.
5. (Optional) You have the option to add legal agreements. If you have any, add them here. 
6. Click **Save**. 

####Activate the App 
1. From the Community Manager, click the **cogs** icon to access the API's. 
2. Find the API to activate and click on its link. 
2. From the left navigation pane, click **Apps**.
3. In the "Production" column, click the drop-down and select **Activate**. Then click **Confirm**. 

####Send a test request####

1. From the Community Manager, click the **Applications** icon.
2. Select your App.
3. On the left navigation pane, click **Dev Console**. 
4. In the "API" field, choose your API from the drop down. The other fields should fill in automatically. 
5. In the field **Accept - Please specify:** enter **application/xml**.
6. Click **Run It**.


After running it, you can scroll down to see the results and ensure it ran successfully. Also, from the left navigation pane, you can click on **Monitor - Logs** to ensure it was successful. 






