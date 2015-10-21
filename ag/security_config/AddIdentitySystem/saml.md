---
layout: page
title: Add Saml Identity System
description: Learn how to add a Saml Identity System.
product: ag
category: learn
sub-nav-class: Security Configuration
weight:	6
type: page
nav-title: Add Saml Identity System
---
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

<a href="../managing_identity_systems.html" class="button secondary">Managing Identity Systems</a>
## Add Saml Identity System
A SAML Authority is a system entity that issues assertions. You configure a SAML Authority Identity System by defining a domain and then configuring the detail information of the Issuer and the approach to resolve the SAML Assertion into an identity in Policy Manager. This information will be used to perform web service authentication based on SAML Assertion.  

* Domain Details
* KDC Configuration File
* Realm Name - DN Mapping

1. Go to **Configure > Security > Identity Systems**.  
The *Identity Systems Summary* Screen is displayed.
2. Click **Add Identity System**.  
The *Add Identity System Wizard* is launched, displaying the *Identity System Domain Details* Screen.
3. Under *Select Identity System*, use the *Identity System Type* **drop-down list box** to select **Saml Authority**. 
4. Enter the Domain Details (Name & Description) associated with the Saml Authority Identity System Type selected in step 3.  
5. Click **Next**.  
You are taken to the *Issuer Details and Account Linking* Screen.
6. Enter Issuer Details:
  * **Issuer Name** - Specify the URI that identifies SAML Assertion issuer. Must exactly match the "Issuer" element in the SAML Assertion.  Verify the correct certificate has been assigned to the user or has expired with the "View Certificate" hyperlink.
  * **Issuer Certificate** - Specify the certificate of the SAML issuer. It will be used to verify the signature of the SAML Assertion. The "Browse" button can be used to navigate the directory structure to target the desired certificate.
7. (Optional) Select the **check box** to enable **Account Linking** which resolves the Subject in a SAML Assertion to a user in Service Manager.  If left unchecked, Service Manager will directly use the NameIdentifier element in the SAML as the Username.  
  * **Map Domain** - Select the domain name you would like to map the SAML Assertion to.
  * **Map NameIdentifier** - Select a "Fixed Identity" or "Search-based Identity" to map the NameIdentifier in the SAML Assertion into a user name in LDAP to map the Subject element. The SAML Assertion has a Subject element, which has a NameIdentifier element to specify the identity that the token represents.  
You are taken to the *Realm Name - Domain Name Mapping* Screen.
8. Map the Identity System to a Kerberos realm login space.  Use the **radio buttons** to select from:  
  * **User Realm Name as Domain Name** - A Kerberos Realm Name is currently mapped to an Identity System that is integrated with Policy Manager.
  * **Map Realm Name to Domain Name** - specify a Realm Name and select an Identity System Domain Name. Note that you can map all Realm Names to a single Identity System Domain Name by entering an asterisk (*) in the *Realm Name* field.
9. Click **Finish**.    
The system configures your identity system based on your provided configuration parameters and returns to the *Identity System Summary* Screen.


<a href="#top">back to top</a> 