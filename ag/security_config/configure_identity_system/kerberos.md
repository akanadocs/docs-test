---
layout: page
title: Configure Kerberos Identity System
description: Learn how to configure a Kerberos Identity System.
product: ag
category: learn
sub-nav-class: Security Configuration
weight:	11
type: page
nav-title: Configure Kerberos Identity System
---


## Configure Kerberos Identity System

Learn how to configure a Kerberos Identity System.

<a href="../identity_systems.html" class="button secondary">Identity Systems (Home)</a> <a href=http://docs.akana.com/docs-test/ag/assets/kerberos_support_v71.pdf" class="button secondary">Kerberos Support in Policy Manager 7.1</a> <a href="http://docs.akana.com/ag/assets/kerberos_support_pm80.pdf" class="button secondary">Kerberos Support in Policy Manager 8.0</a>

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [About Kerberos](#about-kerberos)
* [Configure Kerberos Identity System](#configure-kerberos-identity-system)


## About Kerberos
Policy Manager includes an "Identity System Option Pack" that is pre-installed into the product that implements the OASIS Web Services Security, Kerberos Token Profile 1.1 (wss-v1.1-spec-os-KerberosToken Profile).  The "KerberosToken" is initially added to Policy Manager via the *Add Identity System* function in the *Configure > Identity Systems* section of the Policy Manager *Management Console*.  Then an Identity Profile is configured which utilizes the "KerberosToken" Identity System. Kerberos is an authentication service developed at MIT that allows users and services to demonstrate their identity to each other using a "shared secret" which is known by the user and service, and is used as an encryption key.
The encryption mechanism used, called "Symmetric Cryptography," uses one key that is shared by two endpoints. The key is used to encrypt a message (i.e, user), and the same key is used to decrypt that message (i.e., service). Secret keys are designed for long-term use and typically last for weeks or months.
This authentication approach is designed to free the services from having to maintain their own user account records which then in turn allows both user and service to implicitly trust the Kerberos authentication server. Note that Kerberos does not use public-key cryptography.
Authenticating a user to an end service involves the following steps:

* User sends a request to Kerberos Authentication Server requesting authentication to a service.
* The Kerberos Authentication Server prepares to introduce the user and the service to each other by granting a "shared secret" which includes a random secret key (referred to as a "session key"). The user is sent a two part message:  
  * Part 1 contains the random key and service name encrypted with the user's "shared secret." This is called the "user's credentials."
  * Part 2 contains the same random key and the user name encrypted with the service's "shared secret." This is called the "ticket."  
* When a user sends a message to a service, it is encrypted with the shared secret. The service then decrypts the message using the same shared secret. If the user sent the request using the wrong key, the service will not be able to decrypt the request and the service will reject the authentication request. Note that shared secrets are never revealed in a message passed over a network.
Random keys (i.e., tickets) are generated using a "ticket granting server" referred to as the KDC (Key Distribution Center). The KDC generates the random keys (i.e., shared secret) which include a ticket and session key. The user only needs to enter a password one time and the ticket and session key obtained from the password is used for all future tickets.
For large systems with a high volume of requests, realms are used to ensure optimum performance of the Kerberos Authentication Server and KDC. A realm represents a unique login space and is an artificial administrative boundary using one set of Kerberos authentication servers to manage and deploy a single set of unique identifiers.
Access to the Kerberos Authentication Server and KDC is controlled by the Kerberos Configuration File. This file specifies per-realm configuration data to be used by the Kerberos Authentication Server and Key Distribution Center (AS/KDC). This includes libdefaults (i.e., default realm, default ticket lifetime), realms (i.e., where to find KDCs for each realm), instancemapping (maps client principle), domain_realm (maps domains to realms), logging (tells Kerberos where and how to log errors), appdefaults (lists default settings for outgoing Kerberized network connection applications and for incoming portal mode connections.
To configure the use of Kerberos authentication with Policy Manager, you must first configure the Kerberos Authentication Protocol in the *Configure > Identity Systems* section of Policy Manager. This configuration process includes defining system domain information, mapping to the KDC Configuration File, and mapping Kerberos realms to Identity System Domain Names. After this process is complete you can then define Identity Profiles in the *Configure > Identity Profiles* section of Policy Manager to establish a communication between Policy Manager and services in the Kerberos system. These Identity Profiles are then available in the Identity Profiles section of the Service Details page and can be assigned to a service as needed.

<a href="#top">back to top</a> 

## Configure Kerberos Identity System
For the Kerberos Identity System, configuration tasks include specifying and/or configuring:

* Domain Details
* KDC Configuration File
* Realm Name - DN Mapping

1. Go to **Configure > Security > Identity Systems**.  
The *Identity Systems Summary* screen displays.
2. Click **Add Identity System**.  
The *Add Identity System Wizard* launches and displays the *Identity System Domain Details* screen.
3. Under *Select Identity System*, use the *Identity System Type* **drop-down list box** to select **Kerberos**. 
4. Enter the Domain Details (Name & Description) associated with the Kerberos Identity System Type selected in step 3.  
5. Click **Next**.  
You are taken to the *KDC Configuration File* screen.
6. Specify per-realm configuration data to be used by the Kerberos Authentication Server and Key Distribution Center.  Use the **radio buttons** to select from:
  * **Upload KDC Configuration File** - Store the configuration file in the Policy Manager data repository and provide Containers interacting with Policy Manager centralized access to the configuration file.
  * **Locate the KDC Configuration File on the Local File System** - Used for manual configurations.
  * **Locate the KDC Configuration Using Default File System Path** - Locate the KDC Configuration file using the Kerberos default directory.
7. Click **Next**.  
You are taken to the *Realm Name - Domain Name Mapping* screen.
8. Map the Identity System to a Kerberos realm login space. Use the **radio buttons** to select from:  
  * **User Realm Name as Domain Name** - A Kerberos Realm Name is currently mapped to an Identity System that is integrated with Policy Manager.
  * **Map Realm Name to Domain Name** - Specify a Realm Name and select an Identity System Domain Name. Note that you can map all Realm Names to a single Identity System Domain Name by entering an asterisk (*) in the "Realm Name" field.
9. Click **Finish**.    
The system configures your identity system based on your provided configuration parameters and returns to the *Identity System Summary* screen.


<a href="#top">back to top</a> 