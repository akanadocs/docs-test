---
layout: page
title: Trusted CA Certificates
description: Learn how to view, configure and manage Trusted CA Certificates.
product: ag
category: learn
sub-nav-class: Security Configuration
weight:	3
type: page
nav-title: Trusted CA Certificates
---

## Trusted CA Certificates

Learn how to view, configure and manage Trusted CA Certificates.

<a href="../security_config/security_configuration_toc.html" class="button secondary">Security Configuration (Home)</a> <a href="../security_config/policy_manager_domain.html" class="button secondary">Policy Manager Domain</a> <a href="../security_config/certificate_authority.html" class="button secondary">Certificate Authority (CA)</a> <br><br> <a href="../security_config/user_certificate_renewal.html" class="button secondary">User Certificate Renewal</a>  <a href="../security_config/identity_systems.html" class="button secondary">Identity Systems</a> <a href="../security_config/identity_profiles.html" class="button secondary">Identity Profiles</a> <a href="../security_config/privacy.html" class="button secondary">Privacy</a>

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5><br>

<div class = "divider1"></div>

### Table of Contents
<div id="toc-marker"></div>
* [About Trusted CA Certificates](#about-trusted-ca-certificates)
* [Add Trusted CA Certificates](#add-trusted-ca-certificates)
* [Import Trusted CA Certificates](#import-trusted-ca-certificates)
* [View Trusted CA Certificates](#view-trusted-ca-certificates)
* [Delete Trusted CA Certificates](#delete-trusted-ca-certificates)
* [Export Trusted CA Certificates](#export-trusted-ca-certificates)

<div class = "divider1"></div>

## About Trusted CA Certificates

A trusted CA certificate is a third party identity that is qualified with a specified level of trust. 

Trusted CA Certificates imported will display on the *Trusted CA Certificates Summary* screen in the *Configure > Security > Trusted CA Certificates* section of the Management Console.

* Trusted CA certificates are used when an identity is being validated as the entity it claims to be. 
* Certificates imported into Policy Manager must be issued by a Trusted CA Authority. 
* Trusted CA Certificates must be configured prior to importing X.509 certificates for Service, User, Container, or Management Console operations.
* Trusted CA Certificates can be imported (as .CER and .DER files only) using the **Add Trusted CA Certificate** option.
**Notes**:  * When importing a Trusted CA Certificate, all the Trusted CA Certificates in the Policy Manager’s vault will be overwritten by the certificates that are in the Java keystore file being used. Based on this, if you want to delete a certificate from the set of Trusted CA Certificates that are in the Policy Manager vault, you must have a Java keystore file that has all the Trusted CA Certificates except the one that you want to delete from the Policy Manager vault and use that Java keystore file during the update process.  
* For example, if the Policy Manager vault has Trusted CA Certificates A, B and C, and you want to delete certificate B, then the Java keystore file used during the update process must have certificates A and C.* If you want to add a new Trusted CA Certificate to the set that is already in the Policy Manager vault, you must create a Java keystore file that has all the Trusted CA Certificates plus the new one that you want to add to the Policy Manager vault.  For example, if the Policy Manager vault has trusted certificates A, B and C, and you want to add certificate D, then the Java keystore file used during the update process must have certificates A, B, C and D.
<a href="#top">back to top</a> 

## Add Trusted CA Certificates

Browse the directory hierarchy to select a certificate file and add it to the Policy Manager database.

**Note**: *As a prerequisite for configuring outbound HTTPS certificates, Trusted CA Certificates must be present. A default set of Trusted CA Certificates are added when the "Policy Manager Services" feature is installed using the Akana Administration Console. The "Policy Manager Console" feature must also be installed in order to access the Trusted CA Certificates functions through the Policy Manager Management Console.*

1. Go to **Configure > Security > Trusted CA Certificates**.  
The *View Trusted CA Certificate* screen displays.
2. Click **Add Trusted CA Certificate**.  
The *Add Trusted CA Certificate* screen displays.
3. Click **Browse** to navigate to the directory where the certificate you would like to add is stored.
4. Select the certificate.
5. Click **Apply**.  
The certificate is added to the Policy Manager keystore and the certificate is added to the list on the *Trusted CA Certificate Summary* screen.

<a href="#top">back to top</a> 

## Import Trusted CA Certificates

Import Trusted CA Certificates into Policy Manager.  
**Notes**:
  
* Certificates imported into Policy Manager must be issued by a Trusted CA Authority.
* Trusted CA Certificates must be configured prior to importing X.509 certificates for Service, User, Container, or Management Console operations.
* Imported Trusted CA Certificates will be displayed on the *Trusted Certificates Summary* screen.

1. Go to **Configure > Security > Trusted CA Certificates**.  
The *View Trusted CA Certificate* screen displays.
2. Click **Import Trusted CA Certificate from Keystore**.
3. Click the **Java** or **PKCS12** radio button.
4. Either:  
  * Enter the Keystore Path to the keystore file that contains Trusted CA Certificates to be imported into Policy Manager directly into the "Keystore path" field.
  * Click **Browse** to navigate to the directory where the keystore that contains Trusted CA Certificates to be imported into Policy Manager is stored.
5. Enter the Keystore password into the "Keystore Password" field and confirm it. 
7. Click **Finish**.  
The Trusted CA Certificate is added to the Policy Manager keystore and the certificate is added to the list on the *Trusted CA Certificate Summary* screen. 

<a href="#top">back to top</a> 

## View Trusted CA Certificates

View summary details for the currently selected Trusted CA Certificate.

1. Go to **Configure > Security > Trusted CA Certificates**.  
The *View Trusted CA Certificate* screen displays.
2. Click **View CA Trusted Certificate**.  
The *View Trusted CA Certificate* screen displays, including the following attributes:  
  * **Public Key** - Value provided by some designated authority as an encryption key that, combined with a private key derived from the public key, can be used to encrypt messages and digital signatures.
  * **Issuer Distinguished Name (DN)** - Includes key identifier information including, geographical identifiers (e.g., country, state, province), organization and organizational unit, etc.
  * **Subject Distinguished Name (DN)** - Includes key identifier information including but not limited to certificate name, organization and organization unit, and geographical identifiers (e.g., country, state, province), etc.
  * **Serial Number** - Represents the serial number assigned by the issuer of the certificate. The Issuer Name and the Serial Number must match the Certificate of Authority key identifier of the current certificate.
  * **Effective Date** - Represents the date that the certificate became active.
  * **Expiration Date** - Represents the date that the certificate expires.
3. Click **Cancel** to exit the *View Trusted CA Certificate* screen.


<a href="#top">back to top</a> 

## Delete Trusted CA Certificates

1. Go to **Configure > Security > Trusted CA Certificates**.  
The *View Trusted CA Certificate* screen displays.
2. Click on the line item for the Trusted Certificate you want to delete.
3. Click **Delete**.  
A confirmation message displays.  
4. Click **OK** to confirm or **Cancel** to exit the operation.

<a href="#top">back to top</a> 

## Export Trusted CA Certificates

Save a trusted CA certificate as a .CER or .DER certificate file. These certificate files can then be installed and used in other applications.

1. Go to **Configure > Security > Trusted CA Certificates**.  
The *View Trusted CA Certificate* screen displays.
2. Click **Export Trusted CA Certificate**. 
3. Save the certificate file based on your browser requirements.


<a href="#top">back to top</a> 