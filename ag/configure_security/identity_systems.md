---
layout: page
title: Identity Systems
description: Learn about Identity Management Applications, which provide a method of storing data and making this data available to network users and administrators, and Authentication Protocols, which provide authentication for client/server applications and validate the identity of a communicating entity.
product: ag
category: learn
sub-nav-class: Security Configuration
weight:	6
type: page
nav-title: Identity Systems
---

## Identity Systems
Learn about Identity Management Applications, which provide a method of storing data and making this data available to network users and administrators, and Authentication Protocols, which provide authentication for client/server applications and validate the identity of a communicating entity.

<a href="../security/security_configuration_toc.html" class="button secondary">Security Configuration (Home)</a> <a href="../security/view_and_modify_policy_manager_domain_name_and_description.html" class="button secondary">View and Modify Policy Manager Domain Name and Description</a> <a href="../security/certificate_authority.html" class="button secondary">Certificate Authority (CA)</a> <br><br> <a href="../security/trusted_ca_certificates.html" class="button secondary">Trusted CA Certificates</a> <a href="../security/user_certificate_renewal.html" class="button secondary">User Certificate Renewal</a> <a href="../security/identity_profiles.html" class="button secondary">Identity Profiles</a> <a href="../security/privacy.html" class="button secondary">Privacy</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>
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



## About Identity Systems
Identity management technologies provide tools for simplifying the management of data for users of an organization's information technology systems. An identity management application is referred to as an "Identity System." Each Identity System provides a method for storing data and making this data available to network users and administrators. Data is typically stored in what is called a "Directory."
Data for a single user is stored in a user account. A user account includes Name, Password, Phone Numbers, etc. This information can be accessed by authorized users on the same network. User accounts can also be assigned to a group. This is referred to as a "User Group" or "Group Account." Rights and permissions are assigned to the user group and members of the group assume these rights and permissions.

###Identity Management Functions  

* **Identity administration** (provided through the identity management application)
* **Community Management** (provided through the identity management application) - Addresses the connection and security of relationships between identities.
* **Identity Integration** (provided through Policy Manager's "Identity Integration" functionality) - Focuses on the connection and cooperation of multiple identity repositories based on business rules.

###Identity Management Components

* **Directory Service** - Provides a central identity repository and reconciliation of identity details between application-specific directories.
* **Identity Management Service** - Provides tools to manage identity details stored in the directory.
* **Access Management Service** - Implements authentication of web based users and enforces access control over the web-based transactions.
* **Provisioning Service** - Provides a personalized interface for all user interactions with the system.

View the *Identity Systems Summary* Screen by going to **Configure > Security > Identity Systems**.

<a href="#top">back to top</a> 


## About Identity Integration
The process of identity integration enables Policy Manager's Policy Manager Subsystem to authenticate with a third party identity system. The ability to connect to an enterprise organization's identity system significantly reduces the Policy Manager deployment time and increases the manageability of the security administration process.
Identity integration is established between Policy Manager, the client application, and a third-party identity system using a set of business rules. These business rules are called "connector properties." Connector properties generally include configuration details for connecting to the host machine where the identity system resides, configuring the authentication method, and specifying user identity information (e.g., user/user group name, description, attributes, etc.). These connector properties are packaged in an "Identity System Option Pack."
When an identity system is successfully integrated with Policy Manager, a trust is established between the client application user and the Policy Manager Subsystem and a domain name is added to the drop-down list box on the Policy Manager *Login* Screen and on the *User Groups Summary* Screen in **Security > User Groups**. When a user who is present in the identity system directory logs into the Policy Manager "Management Console," the Management Console authenticates with the identity system, then sends a request for a token to the Policy Manager Subsystem. Once this trust is established, access is granted to all Policy Manager functions based on assigned privileges.
Authentication credentials for identity system users that will be accessing Policy Manager are stored in the identity system. Policy Manager application users must be stored in the Policy Manager.
Policy Manager provides an "Add Identity System Wizard" that is used to add an Identity System to Policy Manager (i.e., integrate) and maintain the associated connection properties (i.e, modify and delete). This wizard is accessible via the **Configure > Security > Identity Systems** section of the Management Console. Five types of identity systems are supported:

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
  
* *They can be distributed separately as a Feature and installed using the "SOA Software Administration Console."*
* *They can come pre-installed in a Policy Manager release. The distribution approach varies based on the Policy Manager release cycle. Installed option packs are accessible via a drop-down list box in the* Add Identity System Wizard.
*After Policy Manager is updated with a new Option Pack, the feature set for the associated identity system is integrated with the* Add Identity System Wizard. *This wizard is used to configure and maintain identity system domains to be integrated with Policy Manager.*
*When you add a new identity system to Policy Manager, the identity system domain is displayed in the* ***Configure > Security > Identity Systems*** *section of the Policy Manager* Management Console. 

<a href="#top">back to top</a> 


## About Claim-Based Authentication and Authorization
###Introduction
A "Claim" is a statement that one subject makes about itself or another subject. The subject making the claim(s) is the provider. Claims are packaged into one or more tokens that are then issued by an issuer.
The claim-based identity system models a claim as an XML token that is signed by an authority, and the token contains assertions about the attributes of a user subject. In the case of Active Directory Federation Services (ADFS), a claim will be a SAML token. 

###Authentication and Authorization
After a claim-based Identity System instance is created and configured, it can be used for authentication and authorization of web service requests.

* **For Authentication** - You must create an Authentication Policy, and select the Claim-Based Identity System as the authentication realm.
* **For Authorization** - You must create an Authorization Policy.  First, select the Claim-Based Identity System as the authorization realm. Then, in the Resource field of the policy, specify the name of the claim (the Action field can be left as empty). 

**Note**: *Created Authentication and Authorization policies can be assigned to the web services that require Claim-based security.*

###Runtime
At runtime, during the authentication phase, the digital signature inside a claim token will be validated based on the issuer certificate configured in the identity system. If the token is detected to be a SAML token, the issuer URL and the expiration date will also be verified automatically. During the authorization phase, all the configured XPath assertions associated with a claim configuration will be verified. If the verification succeeds, the configured XPath User Identifier will be evaluated and the result will be saved into usage data.

###Policy Manager Claim-Based Authentication/Authorization Support

* A user interface is available in the **Configure > Security > Identity Systems** Section that allows you to configure claims that will be validated by Policy Manager. You can configure a wide range of claims that can be issued by Active Directory Federation Services (ADFS). 
* Associate claim-based authentication/authorization requests to web services by configuring an Authentication or Authorization Policy and selecting the Claim-Based Identity System.
* The system supports retrieving claim tokens from web service requests and validating the tokens based on the claim configuration.

###Design
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

###Example Configuration of a Claim-based Identity System
The following claim-based Identity System example configuration specifies claims asserting groups a user belongs to and uses the email address in the token as the user identifier:  

* **Claim Issuer Identifier**: http://www\.acme.com
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

1. Go to **Configure > Security > Identity Systems**.  
The *Identity Systems Summary* Screen is displayed.
2. Click **Add Identity System**.  
The *Add Identity System Wizard* is launched, displaying the *Identity System Domain Details* Screen.
3. Under "Select Identity System," use the "Identity System Type" **drop-down list box** to select the identity system that will be integrated with Policy Manager.  
**Notes**:   
*The number of identity systems available to select is based on how many "Identity System Option Packs" you have installed using the "SOA Software Administration Console" or have come pre-installed in your Policy Manager release.*  
*If only one identity system displays, skip to the next step and configure the "Domain Details."*
  * **Select from:**  
  **Claim-based** (see #6 below for configuration details)  
  **Cookie Authentication Module** (see #7 below for configuration details)  
  **Directory Server (i.e. Active Directory)** (see #8 below for configuration details)  
  **Kerberos** (see #9 below for configuration details)  
  **SAML** (see #10 below for configuration details)    
4. Enter the Domain Details (Name & Description) associated with the Claims-based Identity System Type selected in step 3.  
5. Click **Next**.  
6. If you selected "Claim-based" as the Identity System Type in step 3, then you are taken through the following *Claim Configuration* Screens.  You can define multiple claims in a single configuration.  
**Note**: *After a Claim-based Identity System instance is created and configured, it can be used for authentication and authorization of web service requests.* 
  * **Claim Configuration**  
  **Issuer Name** - A URI that uniquely represents a claim issuer. If the claim token is SAML, the issuer identifier must match the issuer URL in the SAML token.  
    **Issuer Certificate** - an X509 Certificate of the issuer. It is used by Policy Manager to verify the signature of the claim token at runtime.  Click **Choose File** to upload your certificate.  
  **Identity XPath** -  An XPath string function that will be evaluated against the claim token during runtime. The result of the evaluation will be used as the identifier of the requester and saved as part of the usage data.  
**Namespace Prefixes** - User-configured and used to both simplify the specification of XPath expressions ad as the context to evaluate all XPath expressions in the claim configuration. Click **Add Namespace** to add multiple Namespace entries.  
**Claim Configuration Details** - Specify the configuration of multiple claims issued by the same authority. A requestor may satisfy multiple claims in the same token.  
**Claim Name** - A string that identifies the claim. Click **Add Claim** to add multiple claim entries.  
  * **Assertion XPaths** - Specify one or more XPath Assertions and Claim Descriptions for each claim.  
**Note**: *An "Assertion XPaths" Screen will be displayed for each claim name you define.*   
  **Claim Description** - Optional.  
  **Assertion Xpaths** - An XPath string representing an assertion in a claim token.  
  The XPath expression will be evaluated against a claim token at runtime. In order for the claim token to be valid, the result of the XPath evaluation must be true. You can specify multiple XPath assertions for a single claim. In this case, each assertion must be evaluated to true in order for the token to be accepted. If the evaluation of one or more specified XPath assertions is false at runtime, the claim will be considered invalid and will result in authorization failure.  
7. If you selected "Cookie Authentication Module" as the Identity System Type in step 3,then you are taken to the *Cookie Authentication Module* Screen where you can specify SOA Secure Session Cookie Configuration Details.  
**Notes**:  
*SOA Secure Session Cookie is an HTTP cookie generated by Network Director or Policy Manager as part of HTTP Basic Authentication.*  
*The SOA Session Cookie can be used as an alternative authentication token that is more secure than password-based authentication.*  
  * **Cookie Name** - Specify the name of the cookie (soasession is the default value).
  * **Cookie Max Age in Seconds** - Specify how many seconds after the browser receives the cookie that the cookie will expire.
  * **Cookie Domain and Cookie Path** - Specify domain and path of the server where cookies should be sent.  
  **Note**: *If no domain and path are specified, they default to the domain and path of the object that was requested.*
  * **Cookie Only For Secure Channel** - Enter "True" or "False" to indicate whether the browser will send the cookie only over an encrypted channel (e.g., Transport Layer Security (HTTPS protocol)).  False is the default value.      
8. If you selected "Directory Server" as the Identity System Type in step 3,then you are taken through the following *Active Directory Configuration* Screens:  
  * **Directory Type** - Your selection represents the Directory Server that will be integrated with Policy Manager.  
  * **Connection Properties**  
  **Main URL** (Required) - Host Name of the selected Directory Type, and the Port Number used to connect to it.  
  **Failover URLs** - Where identity system connection requests will be directed if the Main URL fails. You can specify up to five Failover URLs
  * **Attribute Details**  
  **Search Scope** - Used to define the search base in the identity system to begin a search and the search scope to be applied to the specified base.  
  **Attribute Mapping** - Used to configure the identity system query attributes. Service Manager maps to these query attributes to enable the viewing of identity system data in the "Security" section of the Policy Manager "Management Console."  Includes "Users" and "Groups." 
  * **Username DN Mapping** - Accurate Username and DN mapping must be configured to ensure that login data is properly authenticated, thus ensuring the identity system can effectively coexist with Policy Manager.  
  **Map with Search** - Authenticates the User ID and Password.  
  **Map with Prefix/Suffix** - Strings that will be prepended and appended (respectively) to the User Name when logging into Active Directory for the purpose of authentication.
  * **Custom Queries** - Includes a default set of custom (but update-able) "LDAP Search Filter" queries that are used to interact with the identity system.  
  **Note**: *$USERNAME, $FULLNAME, and $GROUPNAME are macro variables that are replaced with the actual Username, Full Name, or Group Name entered when a search is performed. They must be used when developing custom queries. The User and Group attributes used in custom queries must match the User and Group attribute names configured on the "Attribute Details" Screen.*
  * **Proxy User Configuration** - Select from:  
  **Anonymous** - An anonymous user can search users and groups for read-only operations without providing credentials.  
  **Proxy** - Enter a Username and Password for the proxy user, who must have the permission to search users and groups in the identity system.
  * **Advanced Properties** - Configure advanced properties for page control, caching, timeout, and connection pool settings (Configure to conform to your system requirements or accept the defaults).
  * **Verify Connection** - Click **Verify Connection** to test your connection properties.  
  Click **Finish** if your connection is successfully verified or **Back** if not.  
  If the identity system you are integrating is LDAPS (LDAP over SSL), you will receive the following reminder message after the connection is verified: 
   "After completing the configuration, you must upload a Trusted CA Certificate that can verify the SSL certificate of the LDAP server."
  * **Summary** - Displays a summary of configuration parameters for each identity system.
9. If you selected "Kerberos" as the Identity System Type in step 3, then you are taken through the following configuration screens:   
**Notes**:  
*Kerberos is an authentication service that uses symmetric cryptography (one "shared secret" key used to both encrypt and then decrypt a message) that frees services from having to maintain their own user account records.*  
*For large systems with a high volume of requests, "realms" (unique login spaces that are artificial boundries) are used to ensure optimum performance of the Kerberos Authentication Server and KDC.* 
  * **KDC Configuration Screen** - Specify per-realm configuration data to be used by the Kerberos Authentication Server and Key Distribution Center:  
  **Upload KDC Configuration File** - Store the configuration file in the Policy Manager data repository and provide Containers interacting with Policy Manager centralized access to the configuration file.  
  **Locate the KDC Configuration File on the Local File System** - Used for manual configurations.  
  **Locate the KDC Configuration Using Default File System Path** - Locate the KDC Configuration file using the Kerberos default directory. 
  * **Configure Realm Name - Domain Name Mapping** - Map the Identity System to a Kerberos realm login space.   
  **User Realm Name as Domain Name** - A Kerberos Realm Name is currently mapped to an Identity System that is integrated with Policy Manager.  
**Map Realm Name to Domain Name** - specify a Realm Name and select an Identity System Domain Name. Note that you can map all Realm Names to a single Identity System Domain Name by entering an asterisk (*) in the "Realm Name" field.
10. If you selected "SAML Authority" as the Identity System Type in step 3,then you are taken to the *Issuer Details and Account Linking* Screen.   
**Notes**:  
*A SAML Authority is a system entity that issues assertions.*  
*Configure a SAML Authority Identity System by defining a domain and then configuring the detail information of the Issuer and the approach to resolve the SAML Assertion into an identity in Policy Manager.  This information will be used to perform web service authentication based on SAML Assertion.*  
  * **Issuer Details**  
  **Issuer Name** - Specify the URI that identifies SAML Assertion issuer. Must exactly match the "Issuer" element in the SAML Assertion.  Verify the correct certificate has been assigned to the user or has expired with the "View Certificate" hyperlink.  
  **Issuer Certificate** - Specify the certificate of the SAML issuer. It will be used to verify the signature of the SAML Assertion. The "Browse" button can be used to navigate the directory structure to target the desired certificate.  
  * **Account Linking** (Optional) - Resolve the Subject in a SAML Assertion to a user in Service Manager.  If left unchecked, Service Manager will directly use the NameIdentifier element in the SAML as the Username.  
**Map Domain** - Select the domain name you would like to map the SAML Assertion to.  
**Map NameIdentifier** - Select a "Fixed Identity" or "Search-based Identity" to map the NameIdentifier in the SAML Assertion into a user name in LDAP to map the Subject element. The SAML Assertion has an Subject element, which has a NameIdentifier element to specify the identity that the token represents.
11. Click **Finish**.  
The system configures your identity system based on your provided configuration parameters and returns you to the *Identity System Summary* Screen.

###Authentication and Authorization
* **For Authentication** - You must create an Authentication Policy, and select the Claim-Based Identity System as the authentication realm.
* **For Authorization** - You must create an Authorization Policy. You first must select the Claim-Based Identity System as the authorization realm. Then in the Resource field of the policy, specify the name of the claim (the action field can be left empty).

**Note**: *Created Authentication and Authorization policies can be assigned to the web services that require Claim-based security.*  

###Runtime
At runtime, during the authentication phase, the digital signature inside a claim token will be validated based on the issuer certificate configured in the identity system. If the token is detected to be a SAML token, the issuer URL and the expiration date will also be verified automatically. During the authorization phase, all the configured XPath assertions associated with a claim configuration will be verified. If the verification succeeds, the configured XPath User Identifier will be evaluated and the result will be saved into usage data.
  
<a href="#top">back to top</a>

## Modify Identity System

Follow all steps outlined in [Add Identity System](#add-identity-system) except substitute the following for step 2:

Click **Modify Identity System**.  
The *Modify Identity System Wizard* is launched, displaying *Identity System Domain Details* Screen.


<a href="#top">back to top</a> 



## Delete Identity System

1. Go to **Configure > Security > Identity Systems**.  
The *Identity Systems Summary* Screen is displayed.
2. From the displayed list, select the identity system you would like to delete. 
3. Click **Delete Identity System**.  
The following message is displayed: "Are you sure you want to delete this identity system?"
4. Click **OK**.  
The system permanently removes the identity system from the database
5. (Optional) To cancel the delete operation, click **Cancel**. 

<a href="#top">back to top</a> 

## Change Domain Sequence
Update the display sequence of Identity System domains that are selectable from drop-down menus throughout Policy Manager.  Used if your organization has integrated two or more identity system domains and you would like to configure the default menu selection for a specific Policy Manager deployment.

1. Go to **Configure > Security > Identity Systems**.  
The *Identity Systems Summary* Screen is displayed.
2. Click **Change Domain Sequence**.  
The *Change Domain Sequence* Screen is displayed, presenting the list of identity system domains in the current display sequence.
3. Select the line item you would like to reposition and the use the **Move Up** and/or **Move Down** buttons to move its position in the list.
4. Click **Apply**.  
The system saves the configuration and you are returned to the *Identity Systems Summary* Screen.
5. (Optional) To exit the *Change Domain Sequence* Screen without saving, click **Cancel**.

<a href="#top">back to top</a> 

