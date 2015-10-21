---
layout: page
title: Security Reference
description: Includes security basic concepts and model core elements such as Authentication, Authorization, Message Integrity and Auditing. 
product: ag
category: learn
sub-nav-class: Security
weight:	9
type: page
nav-title: Security Reference
---

## Security Reference
Includes Security basic concepts along with model core elements such as Authentication, Authorization, Message Integrity and Auditing.

<a href="security_toc.html" class="button secondary">Security (Home)</a> <a href="../security/user_administration.html" class="button secondary">User Administration</a>  <a href="../security/user_group_administration.html" class="button secondary">User Group Administration</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5> 
### Table of Contents
<div id="toc-marker"></div>
* [Introduction](#introduction)
* [Authentication](#authentication)
* [Authorization](#authorization)
* [Message Integrity](#message-integrity)
* [Audting](#auditing)
* [Key Management](#key-management)
* [Certificate of Authority (CA)](#certificate-of-authority)
* [Trusted CA Certificates](#trusted-ca-certificates)
* [Select Keys](#select-keys)
* [Policy Manager Key Generation](#policy-manager-key-generation)
* [Policy Setup and Administration](#policy-setup-and-administration)
* [About User Groups](#about-user-groups)

## Introduction
Security is applied at the web service operation level via the *Security* tab at the Root and Sub-Organization levels and via policy attachments at each object level. Applying security at the operation level supports role-based access as access control and filtering can be applied at a more granular level.
Applying security to a web service requires that it be registered and brought under management. The web service then assumes all the characteristics of a Container. The "Managed" web service can then be configured in the *Security* section of the Policy Manager using a variety of different security policies (i.e., policy components).
The Policy Manager is implemented as a separate web service. During the system configuration process, the "Create Physical Service Wizard" creates a Policy Manager Subsystem web service that contains a domain, subsystem seed, and subsystem instance. This information is stored in the form of a Container and is reserved for system use.

<a href="#top">back to top</a>

## Authentication

Authentication is a security service that validates the identity of a communicating entity. When a request is received, an attempt to establish the identity of the entity making the request is performed using selected authentication types configured in Policy Manager for the web service that is receiving the request. When identity is established, the system determines whether the communicating entity has the necessary privileges to perform the requested task. If the validation is successful, the communicating entity is granted access. If authorization fails, an error message is generated reflecting the nature of the failure.
The Policy Manager security model provides authentication at the server and user level.

### Server Authentication

Server Authentication is implemented using trusted domains. Trusted domains allow a user in one domain to be recognized, authenticated, and authorized in another domain. A Server authenticates its identity by sending a Certificate message that contains the server's public key certificate and ends with the certificate authority's root certificate. This approach enables implementation of large-scale federated partner networks by sharing and mapping trusted identities.

### User Authentication

User Authentication is applied to user, role, and privilege identities. Users are known entities to the system for which policies are defined. A role is a function performed by a team in the context of a specific business provider. Role assignments are applied at the user level. Privileges are the tokens defined in the Policy Manager Subsystem which map to different tasks in the system. When a user attempts to perform a task, the Policy Manager Subsystem verifies whether the current user has a token corresponding to the task assigned and performs authentication when the user identity is established. This assignment can be a direct user assignment (one privilege token), or through a role assignment (multiple privilege tokens).

The primary authentication approach is implemented using a User ID/Password combination and Private Keys. You can optionally apply usage or data contracts to a user, role, or privilege. Usage Contracts offer access count or time interval access control restrictions. You can have multiple Usage Contracts for access control applied to one user, role, or privilege. Data contracts offer a method of filtering the visibility of personal data in a web service operation. You are limited to one data contract for a given user, role, or privilege.

### Authentication Types

The Policy Manager security model supports multiple authentication types, including:

* Policy Manager Authentication Map
* SAML, X.509 Certificate
* X.509 of HTTPS Context
* Up to six User ID/Password combinations
* User ID/Password from HTTP Basic Authentication
* Third party solutions for WS-Security are also supported.

<a href="#top">back to top</a>

## Authorization

Authorization is a security service that is used to determine whether the authenticated identity has permission to perform a particular action or function. Authorization is granted to a user or role based on established policies defined within the Policy Manager Subsystem. A user or role must have privileges from the Policy Manager (i.e., authorization authority) to gain access to these resources or services. The Policy Manager then evaluates the authorization data (i.e., privileges) to determine whether access is permitted. The authorization decision is formatted into a SAML authorization assertion. Authorization is granted when the Status Flag in the SAML assertion document equals "Yes." If the Status Flag equals "No," a message indicating the reason authorization failed is issued.

Authorization Privilege and Credentials are configured using a Security Policy (i.e., Security Policy Component) that is added to the policy of the web service operation being managed.

### Authorization Privilege

There are several options you can configure for Authorization Privilege:

* You can specify a unique privilege name or use the system default.
* If your web service operation is configured with security contracts, you can waive the enforcement of these contracts by clicking the checkbox for **Do not Enforce Security Contracts**.
* You can utilize Policy Manager Authorization Enhancements to perform authorization.
* You can generate audit data.

### Authorization Credentials
 There are three options you can select for Authorization Credentials:

* Insert X.509 Certificate from Request HTTPS Context
* Insert Outbound X.509 Certificate of Container
* Insert SAML from Policy Manager of Authenticated User

<a href="#top">back to top</a>

## Message Integrity

Message Integrity is the ability to prevent unauthorized modification of messages that flow between clients and servers that comprise your Policy Manager deployment. Various approaches have been identified where tampering/unauthorized modification of messages can occur, including the use of sniffers to modify message activity. To ensure that messages sent are identical to messages received, it is critical to utilize an approach that compares and verifies a copy of the original message with the message received.

The Policy Manager Subsystem supports data origin authentication and message integrity through the use of SAML and X.509 Certificates and their digital signatures.

A signature consists of an MD-5 hash of the message which is encrypted with the RSA private key of the originator. When the recipient wants to verify a message, they compute an MD-5 hash of the message, decrypt the hash in the signature using the originators public key, and compare. If they are identical, then the originator of the message has been authenticated and the integrity of the message has been verified.

<a href="#top">back to top</a>

## Message Confidentiality

Message Confidentiality is the ability to prevent unauthorized viewing of messages that flow between clients and servers that comprise your Policy Manager deployment. Various scenarios revolve around message confidentially (i.e., privacy) including message violation that results in fraudulent credit card use or impersonation using social security numbers.

In order to secure the privacy of a message, it must be uniquely transformed on the sender side to ensure that it cannot be re-transformed by a potential interceptor on the receiver side. The primary approach for ensuring that message privacy is maintained is "encryption."

The Policy Manager Subsystem provides several security-focused policy components that support message confidentiality requirements including Encryption, Decryption, Insert Credential, and Data Contracts.

### Encryption Component

The Encryption Component ciphers information so it is not understandable without a key to unlock the information.

### Decryption Component

The Decryption Component deciphers information so it is understandable. It uses a key to unlock the information.

### Insert Credential

The Insert Authentication Credentials Component allows Authentication Credentials to be inserted anywhere in the SOAP message using XPath.

### Data Contracts

The Data Contracts Component enforces the data contracts that are defined in the Policy Manager Subsystem against the operation that is being managed. Data contracts filter the request/response message to be sent to the web service or to the user by using an XSLT. Without the data contracts component in the policy, even though a data contract may have been defined for the operation, a Container will not enforce that data contract.

<a href="#top">back to top</a>

##Auditing

Policy Manager provides an auditing feature that records security-focused (i.e., add, modify, delete) actions that occur during the operation of a Policy Manager deployment. Audit data is logged to a database file and is generated through two sources: Standard Policy Manager Update Operations and Security "Pipeline" Policy.

### Via Standard Policy Manager Update Operations

All Policy Manager update operations, unless explicitly mentioned, record audit trail information in the audit trail database store. The audit trails can be viewed and observed by selecting the *Security Audit Trails* tab via the *Monitoring* section of the Policy Manager.

### Via Security "Pipeline" Policy Component

Audit Data is enabled through the Security "Pipeline" component (i.e., authentication and authorization) by enabling the **Generate Audit Data** option during the component configuration process.<a href="#top">back to top</a>

## Key Management

For details about Key Management, see:

* [Managing Keys](../../sp/key_management.htm)
* [Identity Categories](../../sp/identity_categories.htm)
* [Using the External Keystore Feature](../../sp/using_external_keystore.htm) to enable your own hardware security module (HSM) as an external keystore for storing and managing Policy Manager PKI keys and certificates

<a href="#top">back to top</a>

## Certificate of Authority

Validity criteria are not fixed by Policy Manager, but are based on the Certificate of Authority (CA) and associated user configuration established by an organization. Each organization determines which Certificate of Authority (CA) vendor they will trust based on their defined selection process. This process can be exclusive to their organization, or can be based on other business requirements (e.g., a network of partners who collectively agreement on a CA, etc.).The CA selection process generally includes performing a background check on each CA under review to determine authenticity based on business registration, business performance, etc. Organizations typically select CA vendors that are very popular and universally accepted organizations. Certificates issued by a selected CA vendor will then become valid certificates for your deployment.To maintain your certificates, a trusted CA provides access to a "revoked list" of any certificates in your issued set that have been recalled for any reason. This list provides a tool for administrators to perform identity management relative to key assignment. If for some reason a certificate becomes associated with fraudulent activity, a new key can be issued.

<a href="#top">back to top</a>

## Trusted CA Certificates

Policy Manager, inside its Public Vault, maintains only one common set of trusted certificates for the entire Policy Manager product.  This set is by all the Containers for HTTPS communication needs as well as X.509 Authentication needs.

<a href="#top">back to top</a>

## Select Keys

The key generation method used by an organization is based on the communication method utilized in a deployment. The defined network of partners interacting in the deployment also factors into the approach used.  For example, for an HTTPS deployment, you would need to ensure all the elements of security required for this communication protocol (i.e., encryption, signatures, authentication, etc.). This communication protocol requires the use of a certificate.There are two approaches which can be used for key selection: Certification of Authority (CA) Generated and Policy Manager Generated.

### Certification of Authority (CA) Generated

An organization can select a Certificate of Authority vendor for generating keys. Since the certificate is the vehicle for public keys, and an organization and their network of partners have collectively agreed upon a CA vendor they trust, generating a public key that is wrapped inside a certificate and signed by the selected CA provides a mutually agreed upon security solution.

### Policy Manager Generated

An organization can use the Policy Manager key generation feature to generate public and private keys, and then can send them to a CA. The CA then performs the process of validating "trust" by performing a background check, etc.  The organization pays a yearly fee to the CA for performing this process. In this scenario, the public keys are always created by the user to whom they belong. The public key can be wrapped inside a certificate by a CA, or can be a loose public key.

<a href="#top">back to top</a>

## Policy Manager Key Generation

The Policy Manager Subsystem provides three management features for keys.

### Generate New Keys

The Policy Manager Subsystem provides a method of generating loose public and private keys. Policy Manager does not run a Certificate of Authority, and therefore the public and private keys are not wrapped inside certificates. This key generation method can be used in scenarios where external certification is not required (e.g., Intranet and other access within an organization).

### Import Keys

Provides ability to import a public key by providing a reference to a certificate filename. The Policy Manager Subsystem extracts the public key from the X.509 certificate. This feature is used when your communication protocol is HTTPS.

### Delete Keys

To facilitate the administration process, Policy Manager generated or imported keys can be deleted from the current user account.<a href="#top">back to top</a>

## Policy Setup and Administration

The Policy Manager Subsystem provides a SAML-compliant security store for defining and maintaining security policy definitions. A central security policy engine and ACL repository is used by all Policy Manager subsystems for storing and maintaining account definitions. The policy administration process includes management of Policy Manager users and service operations.
***Note***: *The security administration search options are case sensitive. When performing security administration and initiating a search using any of the security search options, search criteria must match the casing conventions used for each security option (e.g., users, user groups etc.).* 

<a href="#top">back to top</a>

## About User Groups

User groups provide a method of managing access rights to Policy Manager functionality. 

* A user group must contain one or more users. 
* You can classify user groups by assigning a unique user group name. 
* There are two usage scenarios that apply for user groups: Configure User Groups in Policy Manager and Integrate Group Accounts from Identity System.

### Configure User Groups in Policy Manager

User groups can be configured directly in Policy Manager (**Security > User Groups**). The process involves defining a user group name and description, and assigning user accounts who will be members of the group.

### Integrate Group Accounts from Identity System

If you are integrating a third party identity system with Policy Manager that utilizes "group accounts," the group definitions are integrated by specifying the identity system "group name" and "group description" attributes during the identity system connector properties configuration process.

<a href="#top">back to top</a>