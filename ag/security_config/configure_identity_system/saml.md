---
layout: page
title: Configure SAML Identity System
description: Learn how to configure a SAML Identity System.
product: ag
category: learn
sub-nav-class: Security Configuration
weight:	12
type: page
nav-title: Configure SAML Identity System
---

## Configure SAML Identity System

Learn how to configure a SAML Identity System.

<a href="../identity_systems.html" class="button secondary">Identity Systems (Home)</a> <a href="http://docs.akana.com/cm/assets/CM_WP_SAML.pdf" class="button secondary">SAML Single Sign On Use Cases</a> 

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Configure SAML Identity System](#configure-saml-identity-system)
* [SAML Single Sign On Use Cases](#saml-single-sign-on-use-cases)

## Introduction

A SAML Authority is a system entity that issues assertions. You configure a SAML Authority Identity System by defining a domain and then configuring the detail information of the Issuer and the approach to resolve the SAML Assertion into an identity in Policy Manager. This information will be used to perform web service authentication based on SAML Assertion.  

* Domain Details
* KDC Configuration File
* Realm Name - DN Mapping

## Configure SAML Identity System

1. Go to **Configure > Security > Identity Systems**.  
The *Identity Systems Summary* screen displays. 
2. Click **Add Identity System**.  
The *Add Identity System Wizard* launches and displays the *Identity System Domain Details* screen.
3. Under *Select Identity System*, use the *Identity System Type* drop-down to select **SAML Authority**. 
4. Enter the Domain Details (Name & Description) associated with the SAML Authority Identity System Type selected in step 3.  
5. Click **Next**.  
You are taken to the *Issuer Details and Account Linking* screen.
6. Enter Issuer Details:
  * **Issuer Name** - Specify the URI that identifies SAML Assertion issuer. Must exactly match the "Issuer" element in the SAML Assertion.  Verify the correct certificate has been assigned to the user or has expired with the *View Certificate* hyperlink.
  * **Issuer Certificate** - Specify the certificate of the SAML issuer. It will be used to verify the signature of the SAML Assertion. The **Browse** button can be used to navigate the directory structure to target the desired certificate.
7. (Optional) Select the **check box** to enable **Account Linking** which resolves the Subject in a SAML Assertion to a user in Policy Manager. If left unchecked, Policy Manager will directly use the NameIdentifier element in the SAML as the Username.  
  * **Map Domain** - Select the domain name you would like to map the SAML Assertion to.
  * **Map NameIdentifier** - Select a "Fixed Identity" or "Search-based Identity" to map the NameIdentifier in the SAML Assertion into a user name in LDAP to map the Subject element. The SAML Assertion has a Subject element, which has a NameIdentifier element to specify the identity that the token represents.  
You are taken to the *Realm Name - Domain Name Mapping* screen.
8. Map the Identity System to a Kerberos realm login space.  Use the **radio buttons** to select from:  
  * **User Realm Name as Domain Name** - A Kerberos Realm Name is currently mapped to an Identity System that is integrated with Policy Manager.
  * **Map Realm Name to Domain Name** - Specify a Realm Name and select an Identity System Domain Name. Note that you can map all Realm Names to a single Identity System Domain Name by entering an asterisk (*) in the *Realm Name* field.
9. Click **Finish**.    
The system configures your identity system based on your provided configuration parameters and returns to the *Identity System Summary* screen.

## SAML Single Sign On Use Cases

The following document provides information on the platform’s support of the SAML Web Browser SSO Profile, Service Provider role, used to provide single sign -on services for user login in various applications in the platform.

<a href="http://docs.akana.com/cm/assets/CM_WP_SAML.pdf">SAML Single Sign On Use Cases</a> 
<br>

<a href="#top">back to top</a> 