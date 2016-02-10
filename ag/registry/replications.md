---
layout: page
title: Replications
description: Learn how Replication provides the ability to federate with 3rd party UDDI-compliant registries, thereby extending the governance capabilities of the Workbench to a distributed development organization.
product: ag
category: learn
sub-nav-class: Registry
weight:	13
type: page
nav-title: replications
---

## Replications
Learn how Replication provides the ability to federate with 3rd party UDDI-compliant registries, thereby extending the governance capabilities of the Workbench to a distributed development organization.



<a href="../registry/registry_toc.html" class="button secondary">Registry (Home)</a> <a href="../registry/category_schemes.html" class="button secondary">Category Schemes</a> <a href="../registry/categories.html" class="button secondary">Categories</a> <a href="../registry/identifier_schemes.html" class="button secondary">Identifier Schemes</a> <a href="../registry/schema.html" class="button secondary">Schema</a> <a href="../registry/interfaces.html" class="button secondary">Interfaces</a> <a href="../registry/tmodels.html" class="button secondary">tModels</a> <br><br> <a href="../registry/subscriptions.html" class="button secondary">Subscriptions</a> <a href="../registry/registry_reference.html" class="button secondary">Registry Reference</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
### Table of Contents
<div id="toc-marker"></div>
* [About Replications](#about-replications)
* [Add Replications](#add-replications)
* [Modify Replications](#modify-replications)
* [Delete Replications](#delete-replications)


## About Replications

Replication provides the ability to federate with third-party UDDI-compliant registries, thereby extending the governance capabilities of the Workbench to a distributed development organization. Services defined in external registries will get pulled into the Workbench and be made available to users of the console in the same manner as other physical services.To make use of the Replication feature, the third-party registry must support the UDDI v3 standard, including Subscriptions. 

* A Subscription is first defined in the 3rd party registry to define the subset of services that must be replicated with the Workbench. 
* Once defined, the subscription will be assigned a UDDI key of the form: uddi:665e237e-b4c3-11dc-a5b9-96cca7393881. 
* The Replication can then be configured in the Workbench using the UDDI key and a set of remote credentials acceptable to the 3rd party registry.View the *Replications Summary* screen by going to **Configure > Registry** and then clicking on the **Replications** tab.

<a href="#top">back to top</a> 


## Add Replications

1. Go to **Configure > Registry**.
2. Click the **Replications** tab.  
The *Replication Summary* screen displays showing a list of of registry subscriptions current defined in Policy Manager.
3. Click **Add Replications**.  
The *Add Replication* screen displays.
4. Enter the **Properties** of the remote system required to create a successful connection and replication relationship:  
  * **Name** - User-provided name for the replication. It should be descriptive of the nature of the replication in some way.
  * **Subscription Key** - The UDDI key for the subscription created in the remote system. The subscription is the "saved search" that is used to drive the set of services and other information that is replicated across to the local system.
  * **Security QName** - The Local System QName for the remote system’s UDDI v3.0 Security API. In other words, the remote system’s UDDI v3.0 Security API must be registered in the local system and the associated unique QName must be provided.
  * **Username** & **Password** - The username & password used to connect to the remote system. This username must have sufficient rights to use the UDDI v3.0 Inquiry and Subscription APIs and must have visibility of the scope of results that need to be replicated into the local system.
  * **Subscription QName** - The Local System QName for the remote system’s UDDI v3.0 Subscription API. In other words, the remote system’s UDDI v3.0 Subscription API must be registered in the local system and the associated unique QName must be provide.
  * **Inquiry QName** - The Local System QName for the remote system’s UDDI v3.0 Inquiry API. In other words, the remote system’s UDDI v3.0 Inquiry API must be registered in the local system and the associated unique QName must be provided..
  * **Polling Interval** - The interval at which the local system will poll the remote system for new services and other information that needs to be replicated. The format of this interval follows the xsd:duration syntax (PnYnMnDTnHnMnS).
5. Enter Local Username & Password used by the replication process to replicate information into the local system. This credential must have sufficient rights to use the UDDI v3.0 Publish API and must have create, update and delete permissions within the scope of the replicated results 
6. Click **Apply**.

<a href="#top">back to top</a> 

## Modify Replications

1. Go to **Configure > Registry**.
2. Click the **Replications** tab.  
The *Replication Summary* screen displays showing a list of of registry subscriptions current defined in Policy Manager.
3. Select the line item for the replication you would like to update.
4. Click **Modify Replication**.  
The *Modify Replication* screen displays.
5. Follow steps #4 through #6 of the [Add Replications](#add-replications) section included earlier on this page.

<a href="#top">back to top</a> 

## Delete Replications

1. Go to **Configure > Registry**.
2. Click the **Replications** tab.  
The *Replication Summary* screen displays showing a list of of registry subscriptions current defined in Policy Manager.
3. Select the line item for the replication you would like to delete.
4. Click **Delete Replication**.  
A *Confirmation pop up* displays, reading:  
Are you sure you want to delete this Replication?
5. Click **OK** to delete the replication from the system.
6. (Optional) Click **Cancel** to cancel the delete operation.

<a href="#top">back to top</a> 