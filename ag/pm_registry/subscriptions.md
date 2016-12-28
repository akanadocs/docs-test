---
layout: page
title: Subscriptions
description: In addition to being used to obtain updates regarding business entity or business service changes, Subscription functionality allows clients with third-party registries (i.e., subscribers) to monitor a subset of data within the Policy Manager "Registry."
product: ag
category: learn
sub-nav-class: Registry
weight: 05
type: page
nav-title: subscriptions
---

## Subscriptions
In addition to being used to btain updates regarding business entity or business service changes, Subscription functionality allows clients with third-party registries (i.e., subscribers) to monitor a subset of data within the Policy Manager "Registry."



<a href="../registry/registry_toc.html" class="button secondary">Registry (Home)</a> <a href="../registry/category_schemes.html" class="button secondary">Category Schemes</a> <a href="../registry/categories.html" class="button secondary">Categories</a> <a href="../registry/identifier_schemes.html" class="button secondary">Identifier Schemes</a> <a href="../registry/schema.html" class="button secondary">Schema</a> <a href="../registry/interfaces.html" class="button secondary">Interfaces</a> <a href="../registry/tmodels.html" class="button secondary">tModels</a> <br><br> <a href="../registry/replications.html" class="button secondary">Replications</a> <a href="../registry/registry_reference.html" class="button secondary">Registry Reference</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [About Subscriptions](#about-subscriptions)
* [Define Subscription](#define-subscription)
* [Configure a Third Party Registry](#configure-a-third-party-registry)
* [Modify Subscription](#modify-subscription)
* [View Filter](#view-filter)
* [Delete Subscription](#delete-subscription)

## About Subscriptions

Policy Manager provides UDDI 3.0-compliant "Subscription" functionality that allows clients with third-party registries (i.e., subscribers) to monitor a subset of data within the Policy Manager "Registry." Subscriptions can be used to obtain updates regarding any type of business entity or business service change that would be of interest to your organization.

The relationship between a subscriber and the Policy Manager "Registry" is established through the following steps:

* Define a subscription request in the *Configure > Registry > Subscriptions* section of the Policy Manager Management Console
* Configure one-way replication between the third-party registry (i.e., slave registry) and Policy Manager "Registry" (i.e., master registry)

View the *Subscriptions Summary* screen by going to **Configure > Registry** and then clicking on the **Subscriptions** tab.

<a href="#top">back to top</a> 


## Define Subscription

In this example we create a Systinet Registry subscription:

* Create any provider to place virtual services.
* Assign category to provider created above "Replicated Businesses" of "digev.com:metadata" category scheme.  
**Note**: *Use this provider when creating physical or virtual services.*

1. Go to **Configure > Registry**.
2. Click the **Subscriptions** tab.  
The *Subscription Summary* screen displays showing a list of registry subscriptions current defined in Policy Manager.
3. Click **Add Subscription**.  
The *Add Subscription* screen displays.
4. Enter the following:  
  * **Subscription Key** - The system-generated subscription key that you will configure in the registry you are subscribing to.
  * **Subscription Filter** - Find_business by category "Replicated Businesses" from digev.com:metadata category scheme.  
*Filter Example*:  
&lt;find&#95;business xmlns="urn:uddi-org:api&#95;v3"&gt;  
&lt;categoryBag&gt;  
&lt;keyedReference tModelKey="uddi:digev.com:metadata" keyName="Replicated Businesses" keyValue="repl&#95;business"/&gt;  
&lt;/categoryBag&gt;  
&lt;/find&#95;business&gt;
  * **Max Entries** - 10
  * **Expires After** - Select an entry date from the Calendar Pop-up. For example, one month from today.
5. (Optional) Check the **Retrieve Data in Brief Format** checkbox if you would like a summary of data to be retrieved versus complete data.
6. Click **Apply**.

<a href="#top">back to top</a>

## Configure a Third Party Registry

After you have [defined a subscription](#define-subscription) in Policy Manager, replication information must be configured in the third-party registry. 

The following example illustrates replicating to the Systinet Registry.

1. Logon to Systinet Registry with an administrator account.
2. Create Replication:  
  * **Master tab**  
  Enter the Policy Manager administrator account.  
  Enter the Registry Manager url for Inquiry/Subscription/Security URLs. For example, http://akofman-gx270.digev.com:9901/rmengine.  
  Enter SOA subscription key as defined in the [subscription definition](#define-subscription).
  * **Slave tab**  
  Enter Systinet Registry administrator account.  
  Enter Replication period. For example, 5 minutes.
3. Save replication.  
**Note**: *Replication starts as soon as you save*.

**Note**: *Use this link for Systinet setup: http://www.systinet.com/doc/sr-60/html/toc.html#adm.replication.mgmt.*

<a href="#top">back to top</a>

## Modify Subscription

Update a third-party registry subscription configuration.

1. Go to **Configure > Registry**.
2. Click the **Subscriptions** tab.  
The *Subscription Summary* screen displays showing a list of registry subscriptions current defined in Policy Manager.
3. Select the line item for the subscription you would like to update.
4. Click **View Filter**.  
The *Modify Subscription* screen displays.
5. Update the following items as needed:  
  * **Subscription Key** - The system-generated subscription key that you will configure in the registry you are subscribing to.  You can use the current subscription key or remove it. If you remove the subscription key, a new one will be generated with you apply your changes.
  * **Subscription Filter**  
*Simple Filter Example*:  
find_business by category "Replicated Businesses" from digev.com:metadata category scheme  
*Advanced Filter Example*:   
&lt;find&#95;business xmlns="urn:uddi-org:api&#95;v3"&gt;  
&lt;categoryBag&gt;  
&lt;keyedReference tModelKey="uddi:digev.com:metadata" keyName="Replicated Businesses" keyValue="repl&#95;business"/&gt;  
&lt;/categoryBag&gt;  
&lt;/find&#95;business&gt;
  * **Max Entries** - 10
  * **Expires After** - Select an entry date from the Calendar Pop-up. For example, one month from today.
6. (Optional) Check the **Retrieve Data in Brief Format** checkbox if you would like a summary of data to be retrieved versus complete data.
7. Click **Apply**.

<a href="#top">back to top</a>

## View Filter

Use your mouse to "hover" over the "View Filter" hyperlink included in a Subscription line item as displayed on the *Subscription Summary* screen.

1. Go to **Configure > Registry**.
2. Click the **Subscriptions** tab.  
The *Subscription Summary* screen displays showing a list of registry subscriptions current defined in Policy Manager.
3. On the line item for the subscription you would like to see filter information for, hover your mouse pointer over the "View For" hyperlink.  
The contents of the Subscription filter for the selected entry displays in a pop up window.

<a href="#top">back to top</a>

## Delete Subscription

Delete Subscription definitions.

1. Go to **Configure > Registry**.
2. Click the **Subscriptions** tab.  
The *Subscription Summary* screen displays showing a list of registry subscriptions current defined in Policy Manager.
3. Select the line item for the subscription you would like to delete.
4. Click **Delete Subscription**.  
A *Confirmation pop up* displays, reading:  
Are you sure you want to delete this subscription?
5. Click **OK** to delete the subscription from the system.
6. (Optional) Click **Cancel** to cancel the delete operation.

<a href="#top">back to top</a>