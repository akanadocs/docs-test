---
layout: page
title: Envision Console Login Options
description: Learn about default and custom Envision Console login options. 
product: ev
category: gs
weight: 3
type: page
nav-title: Envision Console Login Options 
---

## Introduction
Learn about default and custom Envision Console login options.

<a href="env_toc.html" class="button secondary">Envision Reference (Main Topic)</a>  <a href="../envision_install/installing_envision.htm" class="button secondary">Installing Envision 1.0</a>
<h5 class="stamp">Supported Platforms: 8.0</h5>  <h5 class="stamp">Supported Envision Versions: 1.x</h5><br>

<div class = "divider1"></div>

### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Envision Default Login](#envision-default-login)
* [LDAP Authentication Domain](#ldap-authentication-domain)


<div class = "divider1"></div>
### Introduction

By default, the Envision Console uses the Username/Password credential assigned to the Envision container during the initial configuration using the Configure Container Instance Wizard.

### Envision Default Login

By default, you can log into the Envision Console using the Username/Password credentials assigned to the Envision container during the initial configuration using the *Configure Container Instance Wizard*.

You can change these credentials via the *Akana Administration Console* for the Envision container using the **Manage Admin Console Administrator** option in *Configuration > Configuration* Actions. 

### LDAP Authentication Domain

If you would like to log into the *Envision Console* using a custom login, you can configure an LDAP Authentication Domain using **Configure LDAP Authentication Domain** in the *Configuration > Configuration Actions* section of the *Akana Administration Console*. 

**Note:** The container default login will remain in effect until the new login is configured and the Envision container instance is restarted.* 

1. Log into the *Akana Administration Console* for the Envision container instance using your default credentials.
2. Go to *Configuration > Configuration Actions* and select **LDAP Authentication Domain**.  
3. Configure the following fields for your custom log in. 

  * **URL** - Host Name of the selected Directory Type, and the Port Number used to connect to it.  
  * **Failover URL** - Where requests will be directed if the main URL fails. 
  * **User Base DN** - The base distinguished name (DN) that will be used to search users. 
  * **User Class** - The object class identifies the type of data that will be represented by the entry and specifies the mandatory and optional attributes that can be associated with an entry of that class. The default is "inetorgperson."
  * **User Name Attribute** - The attribute of the user entry in the identity system that will be mapped to "Username." The default is "cn."
  * **User Full Name Attribute** - The attribute of the user entry in identity system that will be mapped to "Full Name." The default is "name."
  * **User Email Attribute** - The attribute of the user's email address entry in the identity system that will be mapped to the user relationship. The default is "mail." This field is optional.
  * **User Member of Attribute** - The attribute of the user entry in the identity system that will be mapped to the group relationship. The default is "memberOf."
  * **Group Base DN** - The base distinguished name (DN) that will be used to search groups. 
  * **Group Class** - The object class identifies the type of data that will be represented by the entry and specifies the mandatory and optional attributes that can be associated with an entry of that class. The default is "groupOfUniqueNames."
  * **Group Name** - The attribute of the group entry in the identity system that will be mapped to the "Group Name." The default is "cn."
  * **Group Member of** - The attribute of the group entry that will be mapped to the user relationship. The default is "uniqueMember."
  * **Group Description** - The attribute of the group entry in identity system that will be mapped to "Description." The default is "description."

  **Custom Queries:**
  The following set of default custom queries  are used to interact with the identity system. You can update the custom queries as needed to optimize your environment. 
  
  Search filters can be customized to conform with the search performance requirements for an specific identity system. Note that the $USERNAME, $FULLNAME, and $GROUPNAME are macro variables that are replaced with the actual Username, Full Name, or Group Name entered when a search is performed. These macro variables must be used when developing custom queries. The User and Group attributes used in custom queries must match the User and Group attribute names configured on the "Attribute Details" screen.

  * **User Name Search Query** - •LDAP search filter when searching user based on user name.
  * **Full Name Sarch Query** - •LDAP search filter when searching user based on full name.
  * **Group Name Search Query** - •LDAP search filter when searching group based on group name.

  **Proxy User Configuration:**
  Select from:
  * **Anonymous** - An anonymous user can search users and groups for read-only operations without providing credentials.
  * **Proxy User DN** - Username for the proxy user. The proxy user must have the permission to search users and groups in the identity system. This is a required field.
  * **Proxy User Password** -  Password of the proxy user. This is a required field.

  **LDAP JNDI Provider Class** - The LDAP Service Provider Name.

4. After completing the configuration click **Finish** and restart the container. After the container has successfully restarted, re-login into the *Envision Console* using the new custom login. 

<a href="#top">back to top</a>
