---
layout: page
title: Add API to Policy Manager 8.0
description: Learn how to add a simple API to the Policy Manager Management Console, configure associated Policies and Contracts, and send a test request. 
product: sp
category: gs	
sub-nav-class: API Management
weight: 4
type: page
nav-title: Add API to Policy Manager 8.0
---

Add API to Policy Manager 8.0
-------------------------------------

### Table of Contents
<div id="toc-marker"></div>

* [Introduction](#introduction)
* [Step 1: Install and Configure Policy Manager](#step-1-install-and-configure-policy-manager)
* [Step 2: Add API to Policy Manager](#step-2-add-api-to-policy-manager)
* [Step 3: Configure Policies](#step-3-configure-policies)
* [Step 4: Create Contracts](#step-4-create-contracts)
* [Step 5: Send Test Requests](#step-5-send-test-requests)

<div class = "divider1"></div>

### Introduction

Learn how to add a simple API to the Policy Manager Management Console, configure associated Policies and Contracts, and send a test request. 

## Step 1: Install and Configure Policy Manager

Install and configure Policy Manager 8.0. Refer to the following topic for coplete instructions:

<a href="../platform_install/installing_policy_manager_v80.htm" >Install Policy Manager 8.0</a> 

## Step 2: Add  API to Policy Manager

In this step we will use the Akana Demo REST API, available at [http://demo.akana-dev.net:3005](http://demo.akana-dev.net:3005). To keep it simple, we will just register the GET operation at [http://demo.akana-dev.net:3005/posts.](http://demo.akana-dev.net:3005/posts)

### Add Organization
1. Log into the *Policy Manager Management Console*.
2. From the Organization Tree, click **Registry**.
2. Click **Add Organization** from the *Actions Portlet*.
3. Indicate where you'd like to place the organization on the Organization Tree. Click **Next**.
4. Give your organization a name, Click **Finish**, then **Close**.

### Register API

1. From the Organization Tree, click on the organization you created. 
2. On the *Services Summary*, click **Create Physical Service**.
3. Select the **Create Without Using Service Descriptor Document** option and click **Next**.
4. On the *Service Details*, specify the following, then click **Next**. 
	* Name - The name of the API.
	* QName - Provide a unique Namespace and Localpart. This is used internally by the system  to uniquely route to a service or API. 
5. On *Schema Import Options*, select **Use Existing Schemas** and click **Next**.
6. Click **Add Operation**. Specify an optional name and description and click **Next**.
7. The *Operation Details* screen gives you the opportunity to specify Schema elements/types for your operation. For simplicity's sake, under *Schemas*, click >> to assign **anyType** to  "Input" and the "Output." You can leave "Fault" blank and click **Next** to continue.
8. On the *Binding Properties* screen, choose the following and click **Next**:
	* Method - In our example, we used the GET operation.
	* URI Syntax - This is the path for your operation. Regular expressions can be used. Use the left-side panel to get more information. 
9. Next choose how you would like to manage the Service (API). Select **Manage through a Virtual Service** option. This will create a proxy service that is hosted in the container. Click **Next**. 
10. In *Virtual Service Provider Organization*, ensure that the correct organization is selected and click **Next**. 
11. Select the container that you created when registering the Network Director and click **Next**.
12. Select the first Access Point in the list. Provide a name and click **Next**. 
13. In *HTTP Details* enter a **Location** such as "/posts" then click **Finish** then  **Close**. 

When you've finished, you'll have two services: a physical and a virtual service. 

### Add Access Point to Physical Service
1. From the Organization Tree, select *Organization > Services* of ***the physical API you're registering***.
2. Select the **Access Points**tab and click **Add Access Point**.
4. Leave all defaults for the *Service Details* and *Binding Details*. 
5. Add a **WSDL Port Name** and click **Next**.
5. Under the *HTTP Details* section, enter the API web address for our example: [http://demo.akana-dev.net:3005/posts](http://demo.akana-dev.net:3005/posts) in the **Location** field and click **Finish**.

## Step 3: Configure Policies

Next you will configure your API’s with the policies you want Akana to enforce. 

1. From the Organization Tree, select the organization you’d like to apply the policies to.
2. Click **Policies**. In the *Operational* section of the *Policy Attachments Portlet* click **Manage**. For our example we will set up an operational policy, the choices are:
	* Compliance checks that the service is compliant with your set of standards.
	* Operations does security and monitoring for the service. 
	* QoS (Quality of Service) does things like ensure availability, speed, etc. 
3. From the *Manage Operation Attachments* window, click **Policies > Operational Policies**.
4. Choose **DetailedAuditing** then click **Apply**.

You can find all descriptions of the policies in the Organization Tree. 

## Step 4: Create Contracts

A contract gives someone (typcially another application,) authorization to access an API. 

1. From the Organization Tree, select your organization. 
2. Click **Offer Contract** from the *Actions Portlet*. The *Add Contract Wizard* launches.  
3. Enter the contract details.
4. In the *Access Controls*, select the anonymous contract option (i.e., second option) and click **Next**.
5. Select the Provider Organization and click **Finish**. 

Your contract is now in draft mode. Next you must activate it:

1. Navigate the Organization Tree to find your Organization. In the *Contracts* folder find your contract. 
2. Scroll down to the *Consumers* section. You'll see your contract in "Draft."
3. Click on the contract. In this example it shows as "Anonymous."
4. Review the contract, then in the *Contracts Actions Portlet* click **Activate Contract**, then **OK**.

## Step 5: Send Test Request

To send a test request you will need the end point. 

1. You can find this in the Policy Manager Organization Tree, under your *Your Organization > Services > API*. 
2. Select the **Access Points** tab. 
3. Find the URL, then copy the URL and paste into a browser window. You should get a successful response. 
4. Verify that the requests are coming through by checking the audit logs. You can see the logs by selecting the organization, then the API. From the API page, click **Monitoring > Logs**. You'll see request details. 

#### Auditing Use Cases

The following detailed use cases illustrate how to perform <em>basic</em> or <em>detailed</em> auditing of an entire message and view the message metrics in Policy Manager. 


<a href="../../ag/assets/pm_qos/pm_basic_auditing_policy_use_cases.pdf" >Basic Auditing Usage Scenario for Policy Manager</a> 

<a href="../../ag/assets/pm_qos/pm_detailed_auditing_policy_use_cases.pdf" >Detailed Auditing Usage Scenarios for Policy Manager</a> 

