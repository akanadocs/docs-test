---
layout: page
title: Configure Directory Server (i.e. Active Directory) Identity System
description: Learn how to configure a Directory Server (i.e. Active Directory) Identity System.
product: ag
category: learn
sub-nav-class: Security Configuration
weight: 05
type: page
nav-title: Configure Directory Server (i.e. Active Directory) Identity System
---

## Configure Directory Server (i.e. Active Directory) Identity System

Learn how to configure a Directory Server (i.e. Active Directory) Identity System.

<a href="../identity_systems.html" class="button secondary">Identity Systems (Home)</a>

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Configure Directory Server Identity System](#configure-directory-server-identity-system)

## Introduction
For the Active Directory Identity System, configuration tasks include specifying and/or configuring:

* Domain Details
* Connection Properties
* Attribute Details
* Username - DN Mapping
* Custom Queries
* Proxy User DN
* Advanced Properties.

## Configure Directory Server Identity System

1. Go to **Configure > Security > Identity Systems**.  
The *Identity Systems Summary* screen displays.
2. Click **Add Identity System**.  
The *Add Identity System Wizard* launches and displays the *Identity System Domain Details* screen.
3. Under *Select Identity System*, use the *Identity System Type* **drop-down list box** to select **Directory Server**. 
4. Enter the Domain Details (Name & Description) associated with the Directory Server (i.e. Active Directory) Identity System Type selected in step 3.  
5. Click **Next**.  
You are taken to the *Directory Type* Screen.
6. From the **drop-down list box**, select the *Directory Type* that is configured with default values for a particular Directory Server.  
Your selection represents the Directory Server that will be integrated with Policy Manager.
7. Click **Next**.  
You are taken to the *Connection Properties* screen.
8. Under **Main URL**, enter the Host Name of the selected Directory Type, and the Port Number used to connect to it.
9. Under **Failover URLs**, enter the host name and port number where identity system connection requests will be directed if the Main URL fails.  
**Note**: *You can specify up to five Failover URLs.*
10. Click **Next**.  
You are taken to the *Attribute Details* Screen, used to configure the search scope and attribute mapping for identity system "Users" and "Groups" to Policy Manager.  
**Notes**:  
*The "Search Scope" is used to define the search base in the identity system to begin a search and the search scope to be applied to the specified base.*  
*The "Attribute Mapping" is used to configure the identity system query attributes. Service Manager maps to these query attributes to enable the viewing of identity system data in the* Security *section of the Policy Manager* Management Console.
11. Fill in *Users* attribute details:  
  * **Base DN** - (Required) The base distinguished name (DN) that will be used to search users.
  * **Search Scope** - Use the **radio buttons** to select either **Onelevel** or **Subtree**.
  * **Object Category** - Identifies the type of data that will be represented by the entry and specifies the mandatory and optional attributes that can be associated with an entry of that class. The default is "user."
  * **Username Attribute** - The attribute of the user entry in identity system that will be mapped to "Username" in Policy Manager. The default is "cn."
  * **Full Name Attribute** - The attribute of the user entry in the identity system that will be mapped to "Full Name" in Policy Manager. The default is "name."
  * **Member Attribute** - (Optional) The attribute of the user entry in the identity system that will be mapped to the group relationship in Policy Manager. The default is "member."  
**Note**: *If this field is left blank, a custom query will be added to the base set of queries on the Custom Queries screen. This query adds an additional search method for the purpose of optimizing search performance.*
12. Fill in *Groups* attribute details:
  * **Base DN** - (Required) The base distinguished name (DN) that will be used to search groups.
  * **Search Scope** - User the **radio buttons** to select either **Onelevel** or **Subtree**.
  * **Object Category** - Identifies the type of data that will be represented by the entry and specifies the mandatory and optional attributes that can be associated with an entry of that class. The default is "group."
  * **Group Name Attribute** - The attribute of the group entry in the identity system that will be mapped to "Group name" in Policy Manager. The default is "cn."
  * **Description Attribute** - The attribute of the group entry in the identity system that will be mapped to "Description" in Policy Manager. The default is "description."
  * **Member Attribute** - The attribute of the group entry in the identity system that will be mapped to the user relationship in Policy Manager. The default is "memberOf."  
13. Click **Next**.  
The *Username - DN Mapping* screen displays.  
14. Use the **radio buttons** to select and/or configure the **Username - DN Mapping** for the Active Directory Identity System.  
**Note**:  *To ensure that the identity system can effectively coexist with Policy Manager, accurate Username and DN mapping must be configured. This ensures that login data is properly authenticated.*  
  * **Map with Search** - Authenticates the User ID and Password. 
  * **Map with Prefix/Suffix** - (optional) Strings that will be prepended and appended (respectively) to the User Name when logging into Active Directory for the purpose of authentication.
15. Click **Next**.  
The *Custom Queries* screen displays. 
16. Update the custom queries as needed to optimize your environment.  
**Notes**:  
  * *This screen includes a default set of custom queries that are used to interact with the identity system.  The following custom queries are supported:*  
*LDAP search filter when searching user based on user name*  
*LDAP search filter when searching user based on full name*  
*LDAP search filter when searching group based on group name*  
*LDAP search filter when searching groups based on member DN*
  * *A "Reset to default" button is included with each query type to reset a changed query back to the default setting.*
  * *Search filters can be customized to conform with the search performance requirements for a specific identity system. Note that the $USERNAME, $FULLNAME, and $GROUPNAME are macro variables that are replaced with the actual Username, Full Name, or Group Name entered when a search is performed. These macro variables must be used when developing custom queries. The User and Group attributes used in custom queries must match the User and Group attribute names configured on the "Attribute Details" screen.* 
17. Click **Next**.  
The *Proxy User Configuration* screen displays.
18. Configure the *Proxy User Configuration* for the Identity System by using the **radio buttons** to select from:  
  * **Anonymous** - An anonymous user can search users and groups for read-only operations without providing credentials.
  * **Proxy** - When selected, it is required that you enter a Username and Password for the proxy user, who must have the permission to search users and groups in the identity system.
19. Click **Next**.  
The *Advanced Properties* screen displays.
20. Configure advanced properties for page control, caching, timeout, and connection pool settings (Configure to conform to your system requirements or accept the defaults).
21. Click **Next**.  
The *Verify Connection* screen displays.
22. Click **Verify Connection** to test your connection properties.  
  * If your connection is successfully verified, click **Finish** to complete the identity system integration.
  * If your connection failed, use click **Back** to navigate to the appropriate screen and make the necessary adjustments.
  * If the identity system you are integrating is LDAPS (LDAP over SSL), you will receive the following warning message after the connection is verified:  
"After completing the configuration, you must upload a Trusted CA Certificate that can verify the SSL certificate of the LDAP server."  
You must complete this step before deploying your Policy Manager production site.
23. Click **Finish**.    
The system configures your identity system based on your provided configuration parameters and returns to the *Identity System Summary* screen.


<a href="#top">back to top</a> 