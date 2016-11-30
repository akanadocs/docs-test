---
layout: page
title: Identity Profiles
description: Learn how to configure Identity Profiles for "Authentication Protocol" Identity System types and map them to identity configuration in a third-party system (e.g., user account). 
product: ag
category: learn
sub-nav-class: Security Configuration
weight: 106
type: page
nav-title: Identity Profiles
---

## Identity Profiles
Learn how to configure Identity Profiles for "Authentication Protocol" Identity System types and map them to identity configuration in a third-party system (e.g., user account).

<a href="../security_config/security_configuration_toc.html" class="button secondary">Security Configuration (Home)</a> <a href="../security_config/policy_manager_domain.html" class="button secondary">Policy Manager Domain Name</a> <a href="../security_config/certificate_authority.html" class="button secondary">Certificate Authority (CA)</a> <br><br> <a href="../security_config/trusted_ca_certificates.html" class="button secondary">Trusted CA Certificates</a> <a href="../security_config/user_certificate_renewal.html" class="button secondary">User Certificate Renewal</a> <a href="../security_config/identity_systems.html" class="button secondary">Identity Systems</a> <a href="../security_config/privacy.html" class="button secondary">Privacy</a>

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [About Identity Profiles](#about-identity-profiles)
* [Add Identity Profile](#add-identity-profile)
* [Modify Identity Profile](#modify-identity-profile)
* [Delete Identity Profile](#delete-identity-profile)

## About Identity Profiles
An Identity Profile is mapped to the identity configuration in a third party system (i.e., user account).  

**Notes**:

* Identity Profiles can be defined for "Authentication Protocol" Identity System types only.
* If multiple services need to share the same identity, they can refer to the same Identity Profile.
* As a prerequisite to defining an Identity Profile, you must first integrate the associated Authentication Protocol with Policy Manager in the *Configure > Identity Systems* section of the Management Console.
* After an Identity Profile is created, it is immediately available in the* Identity Profile *section of the *Service Details Portlet* and can be selected and assigned to a service.

View Identity Profiles on the *Identity Profiles Summary* screen in *Configure > Security > Identity Profiles*.

<a href="#top">back to top</a> 

## Add Identity Profile

1. Go to **Configure > Security > Identity Profiles**.  
The *Identity Profiles Summary* screen displays.
2. Click **Add Identity Profile**.  
The *Identity Profile Domain Details* screen is displays.  
  * **Profile Details** - Define a unique name and description for your Identity Profile. Entries made here will appear on the *Identity Profile Summary* screen.
  * **Domain Details** - The domain represents the collection of computers where you would like to store the Identity Profile. Enter the Domain Name and Domain Description of the domain you are configuring.  
**Note**: *The remainder of this "Add Identity Profile" instruction set outlines the example of adding a "KERBEROS" type Identity Profile.*
3. Click **Next**.  
The *Kerberos Identity Profile* screen is displays.  
  * **Kerberos principle name** (Optional) - Specify the principle name of the service in Kerberos.
  * Select from:  
  **Enter Password Manually** - Enter a password to access the Kerberos Authentication Server and retrieve the keytab file.  
  **Use Kerberos Keytab file** - Select either "Upload Keytab file" (stores the keytab file in the Policy Manager vault) or "Locate the keytab file on the local file system" (accesses the keytab file on the Container machine).  
4. Click **Finish**.  
The system configures your identity profile based on your provided configuration parameters and returns you to the *Identity Profile Summary* screen.  

<a href="#top">back to top</a> 

## Modify Identity Profile

1. Go to **Configure > Security > Identity Profiles**.  
The *Identity Profiles Summary* screen displays.
2. Click **Modify Identity Profile**.  
The *Modify Identity Profile* screen is displays.  
**Note**: *The remainder of this "Modify Identity Profile" instruction set outlines the example of modifying a "KERBEROS" type Identity Profile.*
3. Update the Kerberos Identity Profile Details:  
  * **Kerberos Identity Profile Details** - Modify the name and description of your Identity Profile (name must be unique).  Domain name cannot be modified.
  * **Shared Key Access Method** - Modify the "Kerberos principle name" (the principle name of the service in Kerberos) and then use the **radio buttons** to select between the following two options for configuring access to your shared key:  
**Enter password manually** - Modify the password used to access the Kerberos Authentication Server and retrieve the keytab file.  
**Use Kerberos keytab file** - Choose either to "Upload Keytab file" (stores the keytab file in the Policy Manager vault) or to "Locate the keytab file on the local file system" (accesses the keytab file on the Container machine).
4. Click **Finish**.  
The system updates your identity profile based on your provided configuration parameters and returns you to the *Identity Profile Summary* screen. 

<a href="#top">back to top</a>

## Delete Identity Profile

1. Go to **Configure > Security > Identity Profiles**.  
The *Identity Profiles Summary* screen displays.
2. From the displayed list, select the identity profile you would like to delete. 
3. Click **Delete Identity Profile**.  
A confirmaton message displays. 
4. Click **OK** to confirm or **Cancel** to exit the operation.

<a href="#top">back to top</a>


