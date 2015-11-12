---
layout: page
title: Certificate Authority
description: Learn how to view, configure and manage the Certificate Authority (CA).
product: ag
category: learn
sub-nav-class: Security Configuration
weight:	2
type: page
nav-title: Certificate Authority
---

## Certificate Authority
Learn how to view, configure and manage the Certificate Authority (CA).

<a href="../security_config/security_configuration_toc.html" class="button secondary">Security Configuration (Home)</a> <a href="../security_config/policy_manager_domain.html" class="button secondary">Policy Manager Domain </a> <a href="../security_config/trusted_ca_certificates.html" class="button secondary">Trusted CA Certificates</a> <br><br> <a href="../security_config/user_certificate_renewal.html" class="button secondary">User Certificate Renewal</a> <a href="../security_config/identity_systems.html" class="button secondary">Identity Systems</a> <a href="../security_config/identity_profiles.html" class="button secondary">Identity Profiles</a> <a href="../security_config/privacy.html" class="button secondary">Privacy</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>

### Table of Contents
<div id="toc-marker"></div>
* [About Certificate Authority](#about-certificate-authority)
* [View Certificate Authority Summary](#view-certificate-authority-summary)
* [Configure Certificate Authority](#configure-certificate-authority)
* [Manage CDP Options](#manage-cdp-options)
* [Regenerate CA Certificate](#regenerate-ca-certificate)
* [Renew CA Certificate](#renew-ca-certificate)
* [Import CA Certificate](#import-ca-certificate)
* [Delete CA Certificate](#delete-ca-certificate)
* [Generate CA CSR](#generate-ca-csr)
* [Export CA Certificate](#export-ca-certificate)
* [Issue Certificate](#issue-certificate)


## About Certificate Authority

A Certificate Authority (CA) is the Policy Manager CA Provider. The CA issues certificates and guarantees the validity of the binding between the certificate owner and its public key. The CA is a trusted authority, and any certificate issued by the CA identifies the owner of the certificate. Therefore the private key that corresponds to the public key in the certificate is deemed to be known only by the specific owner.

Only one Certificate Authority can be configured. A Certificate Authority can be regenerated, renewed, deleted, or exported. When the Certificate Authority is generated, a serial number and Issuer DN is assigned. The Issuer DN will be the same as the Subject DN.
Two Certificate Authority options are supported: Policy Manager provides a simplified version of Certificate Authority that can issue and renew X.509 certificates, or one can be imported. 

**Note**: *The Policy Manager Certificate Authority is intended to be used in test environments for verifying features related to Policy Manager. For production environments, importing a formal CA is recommended (e.g., VeriSign) that aligns with security policy requirements.*

<a href="#top">back to top</a> 

## View Certificate Authority Summary

1. Go to **Configure > Security > Certificates > Certificate Authority**.  
The *Certificate Authority Summary* screen displays and shows details of the Certificate Authority configuration and a list of certificate management options.  
**Note**: *If a Certificate Authority has not yet been defined, the "Certificate authority is not configured" message is displays. Click **Configure Certificate Authority** to begin the configuration process.*   <br><br>
2. Review CA details:  
  * **Public Key** - The name of the public key associated with the CA Certificate.
  * **Subject DN** - The Subject Distinguished Name (DN) assigned to the CA Certificate including but not limited to certificate name, organization, organization unit, and geographical identifiers (e.g., country, state, province), etc.
  * **Issuer DN** - An Issuer Distinguished Name (DN) assigned to the CA Certificate. Includes key identifier information including geographical identifiers (e.g., country, state, province), organization and organizational unit, etc.
  * **Serial Number** - Serial number assigned to the CA Certificate.
  * **Effective Date** - The date the CA Certificate was issued.
  * **Expiration Date** - The date the CA Certificate expires.
  * **Status** - The number of days before the CA Certificate expires.

<a href="#top">back to top</a> 

## Configure Certificate Authority

**Note**: *After the Certificate Authority is defined, you can generate PKI Keys and Certificates using the *Manage PKI Keys Wizard* for Users, Containers, Service Identities, and Users.  
The following "Generate" options will be available after configuring the Certificate Authority:*

Manage PKI Keys Generate Options| Available In
------------- | -------------
Generate PKI Keys  | User, Services, Organization Identities, Containers
Generate X.509 Certificate | User, Services
Generate PKI Keys and X.509 Certificate  | User, Services, Organization Identities, Containers
Generate Certificate Signing Request (CSR)  | User, Services

### Generate X.509 CA Certificate and PKI Keys

The *Generate CA Certificate and X.509 Certificate* screen allows you to generate PKI Keys and an X.509 certificate. PKI Keys guarantee message integrity by signing the message with a private key and verifying the message with a public key. An X.509 certificate is an authentication mechanism that provides visibility to public information and verifies private information while keeping it secure. Credential Information is embedded in the body of a SOAP Message, or can be obtained from the HTTPS Context.

1. Go to **Configure > Security > Certificates > Certificate Authority**.  
The *Certificate Authority Summary* screen displays. If a Certificate Authority has not yet been defined, the "Certificate authority is not configured" message displays.
2. Click **Configure Certificate Authority**.  
The *Configure Certificate Authority Wizard* launches and displays the *Select Certificate Configuration Option* screen. 
3. Click the **Generate X.509 CA Certificate and PKI Keys** radio button, and **Next** to continue.  
The *Generate CA Certificate and PKI Keys* screen displays.
5. Click a radio button to assign the key length to the CA.  Choose from:  
  * 1024 bits
  * 2048 bits
  * 4096 bits
6. Under "Subject Distinguished Name (DN)," enter:   
**Note**: *A DN identifies the owner of a particular public key/private key pair. Key identifier information includes but is not limited to certificate name, organization and organization unit, and geographical identifiers (e.g., country, state, province), etc.*
  * **Common Name (CN)** - The owner name of the Certificate Authority (e.g., Policy Manager Certificate Authority).
  * **Organizational Unit (OU)** - The group or department name of the owner of the Certificate Authority.
  * **Organizational Name (O)** - The name of the organization that owns the Certificate Authority.  
  * **Locality Name (L)** - (Optional) The geographic region of the Organization that owns the Certificate Authority.
  * **State Name (S)** - The state of the organization that owns the Certificate Authority.
  * **Country (C)** - The country of the organization that owns the Certificate Authority.
7. Under "Validity Period," specify:  
**Note**: *The Validity Period is used to specify the date and time of a CA's expiration and is applied at the time the CA configuration is saved.*  
  * **Expiration Date** - Click to launch a calendar pop-up that allows you select the expiration date for the Certificate Authority.
  * **Expiration Time** - Using 24-hour clock time (e.g., 13:00), specify the Hour and Minute the Certificate Authority will expire on the date selected in the step above.
8. Click **Finish**.  
The *Certificate Authority Summary* screen displays showing configuration details.

### Import X.509 CA Certificate and Private Key

Import keys and a certificate that have been issued by a third party Certificate Authority. The import function supports .CER and .DER file formats.

1. Go to **Configure > Security > Certificates > Certificate Authority**.  
The *Certificate Authority Summary* screen displays. If a Certificate Authority has not yet been defined, the "Certificate authority is not configured" message displays.
2. Click **Configure Certificate Authority**.  
The *Configure Certificate Authority Wizard* launches and displays the *Select Certificate Configuration Option* screen. 
3. Click the **Import X.509 CA Certificate and Private Key** radio button, and **Next** to continue. 
The *Keystore Details* screen displays.
5. Specify the following details:  
  * **Keystore Type** - Select the **Java** or **PKCS12** radio button. 
  * **Keystore Path** - Use **Browse** to specify the file location of the X.509 Certificate. Once selected, the field is populated with the directory path of the certificate file.
  * **Keystore Password** - Enter the "Keystore Password" for the certificate.
  * **Confirm Keystore Password**
  * **Key Alias** - Click **Load Aliases**. The "Key Alias" drop-down is populated with a list of Key Alias entries that are defined in the specified keystore file. Select the Key Alias you would like to import from the drop-down.
  * **Key Password** - Enter the "Key Password and confirm.
6. Click **Finish**.  
The *Certificate Authority Summary* screen displays showing details of the Certificate Authority configuration just created.

<a href="#top">back to top</a> 

## Manage CDP Options

###About Managing CDP Options

The **Manage CDP Options** function allows you to modify the Policy Manager Certificate Authority (CA) configuration to include the CRL Distribution Point (CDP), and specify a CRL Distribution Point URL.
 
Here's how it works:

* The Policy Manager Certificate Authority (CA) also issues a Certificate Revocation List (CRL). This CRL is stored at the CRL Distribution Point (CDP), which is the location where the latest Certificate Revocation List (CRL) can be downloaded.
* The CDP location can be accessed via a CRL Distribution Point URL which is a public URL where the certificate revocation list can be retrieved.
* This URL is generated by the Policy Manager "CRL Distribution Point Service" which is located in Policy Manger under **Workbench > Services**.
* The Certificate Distribution Point Options section includes a **Modify CDP Options** function that allows you to enable the inclusion of a CRL Distribution Point (CDP) and specify a CRL Distribution Point URL. 

**Notes**:

* *This option is disabled by default. In disabled mode, the certificates generated by the Policy Manager "CRL Distribution Point Service" will not have the CRL Distribution Point (CDP). This means that the link to the Certificate Revocation List (CRL) will not be accessible*
* *The CRL Distribution Point URL can be any name but must route to the Policy Manager "CRL Distribution Point Service."*
* *If the Policy Manager Certificate Authority (CA) is deleted using the [Delete CA Certificate](#delete-ca-certificate) function, the CDP Options are also deleted. If you use the [Renew CA Certificate](#renew-ca-certificate) function, CDP Options that are configured will be retained.*

### Scenarios

***Policy Manager and certificates in same subnet:***  

When the Policy Manager installation and certificates generated by Policy Manager are in the same subnet, use the **Modify CDP Options** function with no additional steps. 

***Policy Manager and certificates in different subnet:***  

Access to a Policy Manager installation is restricted for a specific subnet.  However, certificates generated by Policy Manager may be distributed to customers outside of that subnet. In this case: 

* The certificates may include a URL to the Certificate Revocation List. This URL is called a CDP. 
* The Policy Manager "CRL Distribution Point Service" must point to this URL. However, because you are trying to access a "CRL Distribution Point Service" that may be in a different subnet, you cannot use it directly.

To resolve this access problem, you can set up a proxy server that publishes a URL that users can reach. This URL is then routed to the Policy Manager "CRL Distribution Point Service" URL by specifying the URL on the *Manage CDP Options* page.

### To Manage CDP Options

Enable the Policy Manager Certificate Authority with Certification Revocation List functionality.

1. Go to **Configure > Security > Certificates > Certificate Authority**.  
The *Certificate Authority Summary* screen displays. If the certificate authority is not yet generated, see [Configure Certificate Authority](#configure-certificate-authority).
2. In the *Certificate Distribution Point Options* section, click **Manage CDP Options**.  
The *Manage CDP Options* screen displays.
3. Click the "Include CRL Distribution Point" **checkbox**. 
4. In the *CRL Distribution Point URL* field, specify a URL for the CRL.
5. Click **Apply**.  
Your configuration changes appear in the "Certificate Distribution Point Options" section of the *Certificate Authority Summary* screen.

<a href="#top">back to top</a> 

## Regenerate CA Certificate

This function regenerates a "Policy Manager CA Provider" which is a simplified version of Certificate Authority that can issue and renew X.509 certificates.  

Two regeneration options are available:

* Delete the CA Certificate from the Policy Manager data repository
* Move the CA Certificate to the *Trusted CA Certificates* section

1. Go to **Configure > Security > Certificates > Certificate Authority**.  
The *Certificate Authority Summary* screen displays.
2. Click **Regenerate CA Certificate**.  
The *Regenerate CA Certificate* screen displays.
3. Under "Subject Distinguished Name (DN)," enter:   
**Note**: *A DN identifies the owner of a particular public key/private key pair. Key identifier information includes but is not limited too certificate name, organization and organization unit, and geographical identifiers (e.g., country, state, province), etc.*
  * **Common Name (CN)** - The owner name of the Certificate Authority (e.g., Policy Manager Certificate Authority).
  * **Organizational Unit (OU)** - The group or department name of the owner of the Certificate Authority.
  * **Organizational Name (O)** - The name of the organization that owns the Certificate Authority.  
  * **Locality Name (L)** - (Optional) The geographic region of the Organization that owns the Certificate Authority.
  * **State Name (S)** - The state of the organization that owns the Certificate Authority.
  * **Country (C)** - The country of the organization that owns the Certificate Authority.
4. Under "Validity Period," specify:  
**Note**: *The Validity Period is used to specify the date and time of a CA's expiration and is applied at the time the CA configuration is saved.*  
  * **Expiration Date** - Click to launch a calendar pop-up that allows you select the expiration date for the Certificate Authority.
  * **Expiration Time** - Using 24-hour clock time (e.g. 13:00), specify the Hour and Minute the Certificate Authority will expire on the date selected in the step above.
5. Under "Options," choose between:  
  * **Move the active CA Certificate to the Trusted CA Certificate section** - Moves the active CA Certificate to the Trusted CA Certificates section before regenerating the new CA Certificate. All certificates issued with this CA Certificate are retained and remain valid. New certificates will be issued with the new trusted authority.
  * **Delete the current CA Certificate** - Deletes the active CA Certificate. All certificates issued with this CA Certificate are invalidated and must be reissued with new trusted authority
6. Click **Apply**.
  * If you selected the **Move the active CA Certificate to the Trusted CA Certificate section** option, the following message displays:  
"The active CA Certificate will be moved to the Trusted CA Certificates section before regenerating the new CA Certificate. All certificates issued with active Certificate will be retained and remain valid. New certificates issued after the active CA Certificate is moved will be issued with the new trusted authority. Are you sure you want to regenerate this CA Certificate?"  
Click **OK** to move the CA Certificate to the **Configure > Security > Trusted CA Certificates** section of the Management Console, and regenerate the CA Certificate.  
The *Certificate Authority Details* screen displays, showing a summary of the new CA Certificate configuration.  
All certificates issued with the previous Certificate Authority will remain valid until they expire.
  * If you selected the **Delete the current CA Certificate** option, the following message displays:  
"Issuing a new CA Certificate invalidates all certificates issued using the previous CA Certificate because the trusted authority has changed.  After regenerating a new CA Certificate, you must reissue certificates using the new trusted authority. Are you sure you want to regenerate this CA Certificate?"  
Click **OK** to delete the CA Certificate and regenerate the CA Certificate.  
The previous CA Certificate is removed from the Policy Manager data repository.  
All certificates issued with the previous CA Certificate will become invalid and should be reissued based on your requirements.  
The *Certificate Authority Details* screen displays, showing a summary of the new CA Certificate configuration.  
All new certificates will be issued with the newly created Certificate Authority.

<a href="#top">back to top</a> 

## Renew CA Certificate

Change the expiration date and time for both generated and imported certificates.   
**Note**: *When a CA Certificate is renewed, the private key is retained and the existing certificate is replaced with a new self-generated one.*

1. Go to **Configure > Security > Certificates > Certificate Authority**.  
The *Certificate Authority Summary* screen displays.  
**Note**: *To renew a CA Certificate, an existing CA Certificate must already be defined.*
2. Click **Renew CA Certificate**.  
The *Renew CA Certificate* screen displays, including the currently defined expiration date and time and status (i.e. the number of days until the CA Certificate expires. If there is less than twenty-four hours until expiration, the status will display "Expires in 0 days.")
3. Configure the new expiration date and time based on your requirements:
 * **Expiration Date** - Click on this blank field to launch a calendar pop-up that allows you select the expiration date for the Certificate Authority.
  * **Expiration Time** - Using 24-hour clock time (e.g. 13:00), specify the Hour and Minute the Certificate Authority will expire on the date selected in the step above.
8. Click **Apply**.  
The *Certificate Authority Summary* screen displays showing your newly entered expiration date and time.

<a href="#top">back to top</a> 

## Import CA Certificate

Replace the existing CA Certificate with an externally imported one, while retaining the current private keys.

1. Go to **Configure > Security > Certificates > Certificate Authority**.  
The *Certificate Authority Summary* screen displays.  
**Note**: *To renew a CA Certificate, an existing CA Certificate must already be defined.*
2. Click **Import CA Certificate**.  
The *Import CA Certificate* screen displays.
3. Enter the path to the CA Certificate file manually or by clicking **Browse** and navigating to the directory.
4. Click **Apply**.  
The CA Certificate will be imported and the certificate details will be displayed on the *Certificate Authority Summary* screen.   
**Note**: *If the specified CA Certificate is not from a trusted source, an error message will be raised.*

<a href="#top">back to top</a> 

## Generate CA CSR

Generate a "Certificate Signing Request" (CSR) for the Policy Manager CA. 

###About Certificate Signing Requests

A "Certificate Signing Request" (CSR) is a file that includes encoded information generated by a web server identifying the applicant and the public key chosen by the applicant. Before creating a CSR, the applicant first generates a key pair, keeping the private key secret. The corresponding private key is not included in the CSR, but is used to digitally sign the entire request.

A CSR file typically has a .CSR extension but can have other extensions based on the source application that generated the file. Policy Manager supports the PEM (which is a BASE64 encoded PKCS10) for Certificate Signing Requests.

A CSR is sent from an applicant to a Certificate Authority to request a digital certificate, such as an X.509 Certificate, which can then be imported later to make the Policy Manager CA as a subordinate CA to the third party Certificate Authority. 

###To Generate a CA CSR
1. Go to **Configure > Security > Certificates > Certificate Authority**.  
The *Certificate Authority Summary* screen displays.  
**Note**: *To renew a CA Certificate, an existing CA Certificate must already be defined.*
2. Click **Generate CA CSR***.  
The *Generate CA Certificate Signing Request* screen displays, showing a "Certificate Signing Request Details" section that includes the list of Subject Distinguished Name (DN) elements that comprise the CSR.
3. Enter the "Certificate Signing Request Details" based on your requirements:    
  * **Common Name (CN)** - The owner name of the Certificate Authority (e.g., Policy Manager Certificate Authority).
  * **Organizational Unit (OU)** - The group or department name of the owner of the Certificate Authority.
  * **Organizational Name (O)** - The name of the organization that owns the Certificate Authority.  
  * **Locality Name (L)** - (Optional) The geographic region of the Organization that owns the Certificate Authority.
  * **State Name (S)** - The state of the organization that owns the Certificate Authority.
  * **Country (C)** - The country of the organization that owns the Certificate Authority. 
4. Click **Finish**.  
The Certificate Signing Request is generated and you are returned to the *Certificate Authority Summary* screen.

<a href="#top">back to top</a> 

## Export CA Certificate

Save the CA Certificate to a file to be used by other software applications.

1. Go to **Configure > Security > Certificates > Certificate Authority**.  
The *Certificate Authority Summary* screen displays.  
2. Click **Export CA Certificate**.  
3. Save the certificate file based on your browser requirements.  

<a href="#top">back to top</a> 

## Delete CA Certificate

Delete a CA Certificate.

**Note**: *Deleting a CA Certificate will invalidate all certificates issued with it.*

1. Go to **Configure > Security > Certificates > Certificate Authority**.  
The *Certificate Authority Summary* screen displays.  
2. Click **Delete CA Certificate**.  
The following message displays:  
"Deleting this CA Certificate will invalidate all certificates issued with it. To issue new certificates, you must configure a new CA Certificate which will be used as the trusted authority. Are you sure you want to delete this CA Certificate?"
3. Click **OK** to confirm or **Cancel** to exit the operation

<a href="#top">back to top</a> 

## Issue Certificate

The "Certificate Authority" is an entity that issues digital certificates for use by other parties. The "Issue Certificate Wizard" provides an interface that allows you to generate and download a certificate from a "Certificate Signing Request (CSR)."  

1. Go to **Configure > Security > Certificates > Certificate Authority**.  
The *Certificate Authority Summary* screen displays.  
2. Click **Issue Certificate**.  
The *Issue Certificate Wizard* launches displaying the *Select Certificate Signing Request* screen. See "About Certificate Signing Requests" in [Generate CA CSR](#generate-ca-csr) for details.
3. Click **Browse** to navigate to the directory location of the Certificate Signing Request file.
4. Select the desired Certificate Signing Request file.  
The field display populates with the selected path.
5. Click **Next**.  
The *Export Certificate* screen displays, showing the Public Key and Subject DN information of the certificate to be issued. The function of this screen is to:  
  * Generate and then download a certificate using the contents of the Certificate Signing Request (CSR) file specified in steps 3 & 4 above.
  * Set a "Validity Period" (i.e., expiration date) for said certificate by clicking on the "Expiration Date" field to launch a calendar pop-up you can use to designate the expiration *date*, and then manually entering into the "Expiration Time" fields the Hour and Minute (in 24-hour clock time) that the Certificate Authority will expire on that date.
6. Click **Finish**.
7. Save the certificate file based on your browser requirements.
 
<a href="#top">back to top</a> 