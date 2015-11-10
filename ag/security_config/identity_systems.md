---
layout: page
title: Identity Systems
description: Learn about supported Identity Systems (e.g., claims-based, cookie authentication module, directory server, kerberos, saml, CA-SiteMinder) and how to configure them in a variety of use cases. 
product: ag
category: learn
sub-nav-class: Security Configuration
weight:	6
type: page
nav-title: Identity Systems
---

## Identity Systems
Learn about Identity Management Applications, which provide a method of storing data and making this data available to network users and administrators, and Authentication Protocols, which provide authentication for client/server applications and validate the identity of a communicating entity.

<a href="../security_config/security_configuration_toc.html" class="button secondary">Security Configuration (Home)</a> <a href="../security_config/policy_manager_domain.html" class="button secondary">Policy Manager Domain </a> <a href="../security_config/certificate_authority.html" class="button secondary">Certificate Authority (CA)</a> <br><br> <a href="../security_config/trusted_ca_certificates.html" class="button secondary">Trusted CA Certificates</a> <a href="../security_config/user_certificate_renewal.html" class="button secondary">User Certificate Renewal</a> <a href="../security_config/identity_profiles.html" class="button secondary">Identity Profiles</a> <a href="../security_config/privacy.html" class="button secondary">Privacy</a>

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5><br>

<div class = "divider1"></div>

### Table of Contents
<div id="toc-marker"></div>
* [About Identity Systems](#about-identity-systems)
* [About Identity Integration](#about-identity-integration)
* [About Identity System Configuration](#about-identity-system-configuration)
* [About Claim-Based Authentication and Authorization](#about-claim-based-authentication-and-authorization)
* [Add Identity System](#add-identity-system)
* [Modify Identity System](#modify-identity-system)
* [Delete Identity System](#delete-identity-system)
* [Change Domain Sequence](#change-domain-sequence)

<div class = "divider1"></div>

## About Identity Systems

Identity management technologies provide tools for simplifying the management of data for users of an organization's information technology systems. An identity management application is referred to as an "Identity System." Each Identity System provides a method for storing data and making this data available to network users and administrators. Data is typically stored in what is called a "Directory."
Data for a single user is stored in a user account. A user account includes Name, Password, Phone Numbers, etc. This information can be accessed by authorized users on the same network. User accounts can also be assigned to a group. This is referred to as a "User Group" or "Group Account." Rights and permissions are assigned to the user group and members of the group assume these rights and permissions.

### Identity Management Functions  

* **Identity administration** (provided through the identity management application).
* **Community Management** (provided through the identity management application) - Addresses the connection and security of relationships between identities.
* **Identity Integration** (provided through Policy Manager's "Identity Integration" functionality) - Focuses on the connection and cooperation of multiple identity repositories based on business rules.

### Identity Management Components

* **Directory Service** - Provides a central identity repository and reconciliation of identity details between application-specific directories.
* **Identity Management Service** - Provides tools to manage identity details stored in the directory.
* **Access Management Service** - Implements authentication of web based users and enforces access control over the web-based transactions.
* **Provisioning Service** - Provides a personalized interface for all user interactions with the system.

View the *Identity Systems Summary* Screen by going to **Configure > Security > Identity Systems**.

<a href="#top">back to top</a> 

## About Identity Integration
The process of identity integration enables Policy Manager's Policy Manager Subsystem to authenticate with a third party identity system. The ability to connect to an enterprise organization's identity system significantly reduces the Policy Manager deployment time and increases the manageability of the security administration process.
Identity integration is established between Policy Manager, the client application, and a third-party identity system using a set of business rules. These business rules are called "connector properties." Connector properties generally include configuration details for connecting to the host machine where the identity system resides, configuring the authentication method, and specifying user identity information (e.g., user/user group name, description, attributes, etc.). These connector properties are packaged in an "Identity System Option Pack."
When an identity system is successfully integrated with Policy Manager, a trust is established between the client application user and the Policy Manager Subsystem and a domain name is added to the drop-down list box on the Policy Manager *Login* Screen and on the *User Groups Summary* screen in **Security > User Groups**. When a user who is present in the identity system directory logs into the Policy Manager "Management Console," the Management Console authenticates with the identity system, then sends a request for a token to the Policy Manager Subsystem. Once this trust is established, access is granted to all Policy Manager functions based on assigned privileges.
Authentication credentials for identity system users that will be accessing Policy Manager are stored in the identity system. Policy Manager application users must be stored in the Policy Manager.
Policy Manager provides an *Add Identity System Wizard* that is used to add an Identity System to Policy Manager (i.e., integrate) and maintain the associated connection properties (i.e, modify and delete). This wizard is accessible via the *Configure > Security > Identity Systems* section of the Management Console. Five types of identity systems are supported:

* Claim-based
* Cookie Authentication Module
* Active Directory
* Kerberos
* SAML Authority

<a href="#top">back to top</a> 


## About Identity System Configuration

The *Add Identity System Wizard* provides a method of integrating your Identity Management Application or Authentication Protocol with Policy Manager through the use of "Identity System Option Packs." Each Identity System Option Pack includes a set of connector properties and settings that must be configured to successfully integrate with Policy Manager.
**Notes**:  
*Two approaches are used for distributing option packs:*
  
* *They can be distributed separately as a Feature and installed using the "Akana Administration Console."*
* *They can come pre-installed in a Policy Manager release. The distribution approach varies based on the Policy Manager release cycle. Installed option packs are accessible via a drop-down list box in the* Add Identity System Wizard.
*After Policy Manager is updated with a new Option Pack, the feature set for the associated identity system is integrated with the *Add Identity System Wizard.* This wizard is used to configure and maintain identity system domains to be integrated with Policy Manager.*
*When you add a new identity system to Policy Manager, the identity system domain is displayed in the* ***Configure > Security > Identity Systems*** *section of the Policy Manager* Management Console. 

<a href="#top">back to top</a> 


## About Claim-Based Authentication and Authorization

###Introduction

A "Claim" is a statement that one subject makes about itself or another subject. The subject making the claim(s) is the provider. Claims are packaged into one or more tokens that are then issued by an issuer.
The claim-based identity system models a claim as an XML token that is signed by an authority, and the token contains assertions about the attributes of a user subject. In the case of Active Directory Federation Services (ADFS), a claim will be a SAML token. 

### Authentication and Authorization

After a claim-based Identity System instance is created and configured, it can be used for authentication and authorization of web service requests.

* **For Authentication** - You must create an Authentication Policy, and select the Claim-Based Identity System as the authentication realm.
* **For Authorization** - You must create an Authorization Policy.  First, select the Claim-Based Identity System as the authorization realm. Then, in the Resource field of the policy, specify the name of the claim (the Action field can be left as empty). 

**Note**: *Created Authentication and Authorization policies can be assigned to the web services that require Claim-based security.*

### Runtime

At runtime, during the authentication phase, the digital signature inside a claim token will be validated based on the issuer certificate configured in the identity system. If the token is detected to be a SAML token, the issuer URL and the expiration date will also be verified automatically. During the authorization phase, all the configured XPath assertions associated with a claim configuration will be verified. If the verification succeeds, the configured XPath User Identifier will be evaluated and the result will be saved into usage data.

### Policy Manager Claim-Based Authentication/Authorization Support

* A user interface is available in the **Configure > Security > Identity Systems** Section that allows you to configure claims that will be validated by Policy Manager. You can configure a wide range of claims that can be issued by Active Directory Federation Services (ADFS). 
* Associate claim-based authentication/authorization requests to web services by configuring an Authentication or Authorization Policy and selecting the Claim-Based Identity System.
* The system supports retrieving claim tokens from web service requests and validating the tokens based on the claim configuration.

### Design

Policy Manager has provided an extensible framework to plug in third-party identity systems (e.g., LDAP) for authentication/authorization purposes.  To support claims, a new claim-based Identity System will be provided. Here a claim will be modeled as an XML token that is signed by an authority, and the token will contain assertions about the attributes of a user or identity. In the case of ADFS, a claim will be a SAML token. The configuration of this new Claim-based identity system includes:

* **Issuer Name** - A URI that uniquely represents a claim issuer. If the claim token is SAML, the issuer identifier must match the issuer URL in the SAML token.
* **Issuer Certificate** - An X509 Certificate of the issuer.  This certificate will be used by Policy Manager to verify the signature of the claim token at runtime.
* **Identity XPath** - An XPath string function that will be evaluated against the claim token during runtime. The result of the evaluation will be used as the identifier of the requester and saved as part of the usage data. 
* **Namespace Prefixes** - User-configured and used to both simplify the specification of XPath expressions ad as the context to evaluate all XPath expressions in the claim configuration.
* **Claim Configuration** -  
A user can specify the configuration of multiple claims issued by the same authority.  
A requestor may satisfy multiple claims in the same token.  
Each claim configuration will have the following entries:  
  * **Claim Name** - A string that identifies the claim.
  * **Claim Description** - A description of the claim.
  * **Assertion XPaths** - An XPath string representing an assertion in a claim token. The XPath expression will be evaluated against a claim token at runtime. In order for the claim token to be valid, the result of the XPath evaluation must be true. A user can specify multiple XPath assertions for a single claim. In this case, each of the assertions must be evaluated to true in order for the token to be accepted. If the evaluation of one or more specified XPath assertions is false at runtime, the claim will be considered invalid and will result in authorization failure.

### Example Configuration of a Claim-based Identity System
The following claim-based Identity System example configuration specifies claims asserting groups a user belongs to and uses the email address in the token as the user identifier:  

* **Claim Issuer Identifier**: http://www/.acme.com
* **Claim Certificate**: [acme.com's certificate]
* **Identity XPath**: /saml:Assertion/saml:AttributeStatement/saml:Attribute[@name="Email"]/saml:AttributeValue 

**Claim Configuration #1**

* Claim Detail:  
  * Claim Name: AdminUser Claim
  * Namespace Prefixes: Specify one or more Namespace prefixes that will evaluate all XPath expressions.
* Assertion XPaths:  
  * Claim Description: This claim asserts that a user belongs to the Admin group.
  * Assertion XPath: /saml:Assertion/saml:AttributeStatement/saml:Attribute[@name="Group"]/saml:AttributeValue[text() = "admin"]

**Claim Configuration #2**

* Claim Detail:  
  * Claim Name: ManagerClaim
  * Namespace Prefixes: Specify one or more Namespace prefixes that will evaluate all XPath expressions.
* Assertion XPaths:  
  * Claim Description: This claim asserts that a user belongs to the Management group.
  * Assertion XPath: /saml:Assertion/saml:AttributeStatement/saml:Attribute[@name="Group"]/saml:AttributeValue[text() = "management"] 

After a claim-based Identity System instance is created and configured, it can be used for authentication and authorization of web service requests.

* **For Authentication** - You must create an Authentication Policy, and select the Claim-Based Identity System as the authentication realm.
* **For Authorization** - You must create an Authorization Policy. You first must select the Claim-Based Identity System as the authorization realm. Then in the Resource field of the policy, specify the name of the claim (the action field can be left empty).

At runtime, during the authentication phase, the digital signature inside a claim token will be validated based on the issuer certificate configured in the identity system. If the token is detected to be a SAML token, the issuer URL and the expiration date will also be verified automatically. If the verification succeeds, the configured XPath User Identifier will be evaluated and the result will be saved into usage data. During the authorization phase, the XPath of the claim specified in the Authorization Policy will be verified.  

**Notes**:

* *The Authentication and Authorization policies created above can be assigned to the web services that require Claim-based security.*
* *In this example, to authorize access to a web service for administrators, AdminUserClaim must be specified as the Resource field of the Authorization Policy.*

<a href="#top">back to top</a> 


## Add Identity System

The *Add Identity System Wizard* provides a series of options that are used to configure and maintain Identity Systems that you would like to integrate with Policy Manager.

**Notes**:   
*The number of identity systems available to select is based on how many "Identity System Option Packs" you have installed using the "Akana Administration Console" or have come pre-installed in your Policy Manager release.* 

Select the instruction set for the Identity System type you wish to add:

* [Claims-based](../security/AddIdentitySystem/claims_based.html)
* [Cookie Authentication Module](../security/AddIdentitySystem/cookie_authentication_module.html)
* [Directory Server (i.e. Active Directory)](../security/AddIdentitySystem/directory_server.html)
* [Kerberos](../security/AddIdentitySystem/kerberos.html)
* [SAML](../security/AddIdentitySystem/saml.html)

###Authentication and Authorization
* **For Authentication** - You must create an Authentication Policy, and select the Claim-Based Identity System as the authentication realm.
* **For Authorization** - You must create an Authorization Policy. You first must select the Claim-Based Identity System as the authorization realm. Then in the Resource field of the policy, specify the name of the claim (the action field can be left empty).

**Note**: *Created Authentication and Authorization policies can be assigned to the web services that require Claim-based security.*  

###Runtime
At runtime, during the authentication phase, the digital signature inside a claim token will be validated based on the issuer certificate configured in the identity system. If the token is detected to be a SAML token, the issuer URL and the expiration date will also be verified automatically. During the authorization phase, all the configured XPath assertions associated with a claim configuration will be verified. If the verification succeeds, the configured XPath User Identifier will be evaluated and the result will be saved into usage data.
  
<a href="#top">back to top</a>

## Modify Identity System

Follow all steps outlined in the various [Add Identity System](#add-identity-system) instruction sets, except, in each case, substitute the following for step 2:

Click **Modify Identity System**.  
The *Modify Identity System Wizard* launches and displays the *Identity System Domain Details* screen.

<a href="#top">back to top</a> 

## Delete Identity System

1. Go to **Configure > Security > Identity Systems**.  
2. On the *Identity Systems Summary* screen, select the identity system you would like to delete. 
3. Click **Delete Identity System**.  
A confirmation message displays.
4. Click **OK** to confirm or **Cancel** to exit the operation.

<a href="#top">back to top</a> 

## Change Domain Sequence
Update the display sequence of Identity System domains that are selectable from drop-down menus throughout Policy Manager. Used if your organization has integrated two or more identity system domains and you would like to configure the default menu selection for a specific Policy Manager deployment.

1. Go to **Configure > Security > Identity Systems**.  
The *Identity Systems Summary* screen displays. 
2. Click **Change Domain Sequence**.  
The *Change Domain Sequence* screen displays and presents the list of identity system domains in the current display sequence.
3. Select the line item you would like to re-position and the use the **Move Up** and/or **Move Down** buttons to move its position in the list.
4. Click **Apply** to commit changes or **Cancel** to exit the operation.

<a href="#top">back to top</a> 

