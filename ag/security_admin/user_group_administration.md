---
layout: page
title: User Group Administration
description: Learn how to administer Policy Manager group accounts including adding and modifying a new user group, managing groups, and managing roles and privileges for user groups. 
product: ag
category: learn
sub-nav-class: Security Administration
weight:	7
type: page
nav-title: User Group Administration
---

## User Group Administration
Learn how to administer Policy Manager group accounts including adding and modifying a new user group, managing groups, and managing roles and privileges for user groups. 

Location: *Security > User Groups* section of the *Policy Manger Management Console*.

<a href="security_toc.html" class="button secondary">Security (Home)</a>  <a href="user_administration.html" class="button secondary">User Administration</a>  

<h5 class="stamp">Supported Platforms: 7.0 and greater.</h5> 
 
### Table of Contents
<div id="toc-marker"></div>
* [Perform User Group Search](#perform-user-group-search)
* [Add User Group](#add-user-group)
* [Modify User Group](#modify-user-group)
* [Delete User Group](#delete-user-group)
* [Manage Users](#manage-users)


## Perform User Group Search

Query Policy Manager to target user groups that require administration.

1. Go to **Security > User Groups**  
All user groups that are currently defined for the selected domain are displayed.   

2. Apply filters:
  * **Filter by Group Name** — Filter search results based on the "Group Name."
  *  **Filter by Domain** — Use the drop-down list to filter search results by domain.
  *  **Match Type** — Use the drop-down list to apply a match type to search criteria entered in the "Name" field. Choose either "Contains" or "Exact Match."
   
3. Click **Filter**.

<a href="#top">back to top</a>

## Add User Group

### Launch the User Group Wizard

1. Go to **Security > User Groups**.  
2. Click **Add User Group**.  
The *Welcome to the User Group Wizard* screen displays.
3. Click **Next**.  
The *User Group Information* screen displays. 

###Define User Group Information

1. Enter account information into the *Details* section:
  * **Group Name** — Required.  * **Description** — Optional.
2. Click **Next**  
The *Users Information* screen displays where you can apply **filters** in the *Users Options* section to search for Users to to add to the current user group definition. Users matching your selections display in the *Results* section of the screen.  
  * **Add all users from Domain [x]** — Select a local or external domain from the drop-down list. All its users will be added to the User Group.
  * **Search for Users** — Search for Users or User Groups by Attribute (Name or Full Name), Match Type (Exact or Contains), Value (Free form text), and Within (Select a Domain).  
3. Click the check-box(es) next to any users you wish to add to the group.
4. Use the **double arrow** buttons to add or remove users (pointing right and left respectively) from the *Users Assigned* [to the group] section.  
**Note**: *In both the* Results *and* Assigned Users *screen areas, all options can be selected by clicking the ***Full Name*** *check-box.*
5. Click **Next**.  
The *Confirmation* screen is displayed, providing a summary of the user group configuration.
6. Review all information to ensure that your user group definition includes the desired configuration elements.
7. (Optional) Update user group settings by selecting a maintenance option on the *User Groups Summary* screen.

<a href="#top">back to top</a>

## Modify User Group

1. Go to **Security > User Groups**  
The *User Groups Summary* screen displays. 
2. Click **Modify User Group**  
The *Modify User* screen displays.
3. (Optional) Enter a new name for the Group.
4. (Optional) Enter a new description for the Group.
5. Click **Apply**  
You are returned to the *User Group Summary* screen.

<a href="#top">back to top</a>

## Delete User Group

1. Go to **Security > User Groups**.  
The *User Groups Summary* screen is displayed.
2. Select a User Group by clicking on its row in the displayed list.
3. Click **Delete User**    
4. Click **OK** to confirm or Cancel to exit the operation. 

<a href="#top">back to top</a>

## Manage Users 

1. Go to **Security > User Groups**.
2. Perform a [User Group Search](#perform-user-group-search).
3. Select results of the search by clicking on them.
4. Click **Manage Users**.  
The *Manage Users* screen displays, where you can search for Policy Manager user accounts and then assign them to the selected user group(s).  5. Apply **filters** in the *Users Options* section to search for users to to add to the current user group.
  * **Add all users from Domain [x]** — Select a local or external domain from the drop-down list. All its users will be added to the User Group.  Users matching your selections are displayed in the *Results* section of the screen.
  * **Search for Users** — Search for Users or User Groups by Attribute (Name or Full Name), Match Type (Exact or Contains), Value (Free form text), and Within (Select a Domain). 
6. Click the check-box(es) next to any users you wish to add to the group.
7. Use the **double arrow** buttons to add or remove users (pointing right and left respectively) from the *Users Assigned* [to the group] section.  
**Note**: *In both the* Results *and* Assigned Users *screen areas, all options can be selected by clicking the* ***Full Name*** *check-box.*
8. Click **Next** and **Finish** to confirm.
9. Click **Apply**.  
The *Manage users* screen closes.  
