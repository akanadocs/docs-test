---
layout: page
title: User Administration
description: View users summary, perform user search, add user accounts, modify user account information, including delete user account.
product: ag
category: learn
sub-nav-class: Security Administration
weight:	7
type: page
nav-title: User Administration
---


## User Administration
This topic describes how to view the Users Summary, perform User Search, Add User Accounts, and Modify User Account information, including Deleting User Accounts.  

Location: *Security > Users* section of the *Policy Manger Management Console*.

<a href="security_toc.html" class="button secondary">Security (Home)</a>  <a href="../security/user_group_administration.html" class="button secondary">User Group Administration</a>  <a href="../security/security_reference.html" class="button secondary">Security Reference</a>
<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5>  
### Table of Contents
<div id="toc-marker"></div>

* [Perform User Search](#perform-user-search)
* [Add User Account](#add-user-account)
* [Modify User Account](#modify-user-account)
* [Delete User Account](#delete-user-account)

## Perform User Search

Query Policy Manager to target user accounts that require administration.

1. Go to **Security > Users**  
All users that are currently defined for the selected domain are displayed.  

2. Apply filters:
  * **Filter by Name** — Filter search results by "Username" or "Full Name."
  * **Filter by Domain** — Use the drop-down list to filter search results by domain.
  * **Match Type** — Use the drop-down list to apply a match type to search criteria entered in the "Name" field. Choose either "Contains" or "Exact Match."
   
3. Click **Filter**

<a href="#top">back to top</a>

## Add User Account

###Launch the Add User Wizard

1. Go to **Security > Users**  
2. Click **Add Users**  
The *Define User Information* screen is displayed.

###Define User Information

1. Enter account information into the *Details* section:
  * **Username** — Required.  Up to 64 characters in length.  Can be an abbreviation, nickname, etc.  * **Full Name** — Required.
  * **Time Zone** — Use thed drop-down list to select the "Time Zone" for the current user. Defaults to the system time zone unless modified.
  * **First Name** — Optional.
  * **Last** -  Optional.
  * **Email** — Enter the user's email address.  Required if you are using Policy Manager email notification features.   
  * **Disabled** — Check to disable a user account.  The default state of a new user account is "active." 
 
2. Generate a password (manually enter or auto-generate a random password):
  * Use Cases for "Manual Entry" Password Generation  
      * **Administrator creating a user account for an end user** - Here, the end user can be a user accessing web services managed by Policy Manager or a user who needs to access the Policy Manager user interface.
      * **Administrator creating user account for applications** - Here, an application is any custom application using our client SDKs.
  * Use Cases for "Auto Generated" Password Generation
      * **Administrator/User generating a random password**. 

3. Configure a password by clicking the **radio button** next to the desired generation method.
  * **Manual Entry** - Enter a custom password key into the *Password* field and then re-enter it into the *Password Confirm* field. 
  * **Auto Generate** - The generated password (i.e., key) will display on the *User Information* section of the *Completing the Add User Wizard* screen when the user account creation process is complete.
  * **Force Password Change on Next Login** - Requires user to specify a newly changed password on the next login.

4. (Optional) Click the checkbox next to **Expire User** to specify an expiration date for the user account.
    1. Click the **field display**  
A Calendar pop-up is displayed.
    2. Navigate to the desired expiration date and click your selection to populate the field.
       * Navigate using the right and left arrow keys located on the menu bar *or* select the month and/or year using the drop-down lists.
       * The date entry is formatted as mm/dd/yyyy.

### View Completion Summary

1. Click **Next**  
The **Completing the Add User Wizard** screen is displayed, providing a summary of the user account configuration.
2. Review your user account definition.
3. (Optional) You can update user account settings by selecting a maintenance option on the *Users Summary* screen that pertains to the account update activity you would like to perform.

<a href="#top">back to top</a>

## Modify User Account

The "Modify User" screen presents all of the user account information in a consolidated view. You can change all of the user account configuration settings with the exception of the username.  You can update:  

* Account details
* Password
* Expiration date
* Pin
* Default page of an existing custom user account definition. 

**Note**: *The values for Password, Password Confirm, Pin Number, and Pin Number Confirm are truncated to four characters for security purposes.* 

After you have completed configuring the User Information, click **Apply** to be returned to the *Users Summary* screen.

If you do not edit these fields, the initial values are maintained.If you change the password generation method to "Auto Generated" and click the **View the generated password** checkbox, you will receive an additional *Modify User* screen after applying your changes that will display the new password.

1. Go to **Security > Users**
2. Click **Modify User**  
The *Modify User* screen displays.

###Details

* **Username** — Non-editable.  Shows the username defined in the initial "Add User" process.
* **Full Name** - Required.
* **First Name** — Optional.
* **Last Name** — Optional.
* **Email** —  **Note**: *Required if you are using Policy Manager email notification features.*
* **Disable** — Update the default state. 
    * Uncheck **Disabled** to activate the account. 
    * Check **Disabled** to deactivate the account.

    
###Password
1. Configure a password by clicking the radio button next to the desired generation method.  
  * **Manual Entry** - Enter a custom password key into the Password field and then re-enter it into the Password Confirm field.
      * Used when modifying an account for end users who are either accessing web services managed by Policy Manger or accessing the Policy Manager user Interface. 
      * Used for creating a user account for any custom application using our client SDKs.
  * **Auto Generated** - Enter an encryption seed in to the **Seed** field and then re-enter it into the **Seed Confirm** field.
      * Used when an Administrator/User wants to create an auto-generated random password key. 
2. Check **View the generated password** - Optional.  
The generated password (i.e., key) will display in a *Modify User* window after you complete the user account update process and click **Apply**.

3. Check **Force password change on next logon** - Optional. 

###Expire User

Specify an expiration date for the user account.

1. Click the **Expire User** checkbox.
2. Click the **field display**.  
A Calendar pop-up is displayed.
3. Navigate to the desired expiration date and click your selection to populate the field.
       * Navigate using the right and left arrowkeys located on the menu bar *or* select the month and/or year using the drop-down menus.
       * The date entry is formatted as mm/dd/yyyy.

<a href="#top">back to top</a>

## Delete User Account

### Reserved User Accounts
**Notes**:

* *Automatically created during initial Policy Manager configuration*
* *Configured with roles and priveleges to to facilitate the proper runtime of the Policy Manager system*
* *Read-only and cannot be deleted from the system*
* *Display on the* Users Summary *screen with a checkbox in the Read-Only column*

### Custom User Accounts
**Notes**:
  
* *Defined in the Policy Manager Subsystem*
* ***Not*** *read-only and can be deleted from the system*
* *Upon delete attempt, a custom confirmation that includes the user account name is displayed* 

1. Go to **Security > Users**
2. Select a custom user account.  
**Note**: a custom user account does not display a checkbox in the Read-Only column.
3. Click **Delete User**  
The following message displays "Are you sure you want to delete &lt;user account name&gt;?" 
4. Click **OK**  
The system permanently removes the user account definition from the system.
5. (Optional) To cancel the delete operation, click **Cancel**.

<a href="#top">back to top</a>