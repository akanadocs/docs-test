---
layout: page
title: Configure Claims-based Identity System
description: Learn how to configure a Claims-based Identity System.
product: ag
category: learn
sub-nav-class: Security Configuration
weight:	6
type: page
nav-title: Configure Claims-based Identity System
---

## Configure SAML Identity System

Learn how to configure a SAML Identity System.

<a href="../managing_identity_systems.html" class="button secondary">Managing Identity Systems</a>

<h5 class="stamp">Supported Platforms: 8.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
	* [Introduction](#introduction)
	* [Authentication and Authorization](#authentication-and-authorization)
	* [Runtime](#runtime)
	* [Policy Manager Claim-Based Authentication/Authorization Support](#policy-manager-claim-based-authentication-authorization-support)
	* [Design](#design)
	* [Example Configuration of a Claim-based Identity System](#example-configuration-of-a-claim-based-identity-system)
* [Configure Claims-based Identity System](#configure-claims-based-identity-system)

## Introduction

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

## Configure Claims-based Identity System

For the Claims-based Identity System, configuration tasks include:

* Selecting the "Identity System Type" from the drop-down list box
* Specifying: 
  * Domain Details
  * Issuer Name
  * Issuer Certificate
  * Identity XPath
  * Namespace Prefixes
  * Claim Name
  * Claim Description
  * Assertion XPaths

**Notes**:

* *After a Claim-based Identity System instance is created and configured, it can be used for authentication and authorization of web service requests.*
* *You can define multiple claims in a single configuration.*

1. Go to **Configure > Security > Identity Systems**.  
The *Identity Systems Summary* screen displays.
2. Click **Add Identity System**.  
The *Add Identity System Wizard* launches and displays the *Identity System Domain Details* screen.
3. Under *Select Identity System*, use the *Identity System Type* **drop-down list box** to select **Claims-based**. 
4. Enter the Domain Details (Name & Description) associated with the Claims-based Identity System Type selected in step 3.  
5. Click **Next**.  
You are taken to the *Claim Configuration* screen.
6. Enter *Issuer Details*:  
  * **Issuer Name** - A URI that uniquely represents a claim issuer. If the claim token is SAML, the issuer identifier must match the issuer URL in the SAML token.
  * **Issuer Certificate** - An X509 Certificate of the issuer. It is used by Policy Manager to verify the signature of the claim token at runtime.
  * Click **Choose File** to upload your certificate.
7. Enter *XPath and Namespace Configuration Details*.  
  *  **Identity XPath** - An XPath string function that will be evaluated against the claim token during runtime. The result of the evaluation will be used as the identifier of the requester and saved as part of the usage data.
  *  **Namespace Prefixes** - User-configured and used to both simplify the specification of XPath expressions ad as the context to evaluate all XPath expressions in the claim configuration.  
  *  Click **Add Namespace** to add multiple Namespace entries. 
8. Add **Claim Configuration Details** to specify the configuration of multiple claims issued by the same authority.  
**Note**: *A requestor may satisfy multiple claims in the same token.*  
  * **Claim Name** - A string that identifies the claim.
  * Click **Add Claim** to add multiple claim entries.
9. Click **Next**.  
The *Assertion XPaths* screen is displayed where you specify one or more XPath Assertions and Claim Descriptions for each claim.  
**Note**: *An "Assertion XPaths" Screen will be displayed for each claim name you define.*
10. (Optional) Enter a **Claim Description**.
11. Add an **Assertion XPath** which is an XPath string representing an assertion in a claim token.  
  * The XPath expression will be evaluated against a claim token at runtime. 
  * In order for the claim token to be valid, the result of the XPath evaluation must be true. You can specify multiple XPath assertions for a single claim. 
  * In this case, each assertion must be evaluated to true in order for the token to be accepted. 
  * If the evaluation of one or more specified XPath assertions is false at runtime, the claim will be considered invalid and will result in authorization failure.
12. Click **Finish**.  
The system configures your identity system based on your provided configuration parameters and returns to the *Identity System Summary* screen.

<a href="#top">back to top</a> 