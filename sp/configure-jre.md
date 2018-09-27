---
layout: page
title: Configure Java Runtime
description: A guide to how to setup an external JRE to run the Akana Platform
product: sp
category: gs
sub-nav-class: Installation - Akana API Platform
weight: 10
type: page
nav-title: Configure Java Runtime
---

## Configure Java Runtime

<h3 style="color: grey;">Table of Contents</h3>
<ol class="table_of_contents">
	<li><a href="#introduction">Introduction</a></li>
	<li><a href="#finding_java">Find Your Java Installation</a></li>
	<li><a href="#copy_provider_jar">Copy the Provider Jar File</a></li>
	<li><a href="#update_java_security">Update java.security File</a></li>
</ol>

### <a name="introduction"></a>Introduction

To use an external (i.e. not provided by Akana) JRE you will have to ensure that you extend the Java security providers with the Bouncy Castle provider.  This provider ships with the Akana Plaform in the ```/jreupdate``` folder.

### <a name="finding_java"></a>Find Your Java Installation

Depending on your operating system and how you installed your JRE there may be different ways of finding it.  It's typically fairly easy to find, but if you're on a mac you may find this command useful ```/usr/libexec/java_home``` this will show you the folder where Java is installed, and will also tell you what you should set in your profile for the ```JAVA_HOME``` variable - in fact, this is probably a good time to set JAVA_HOME.

Once you have found your installation (on a mac it will likely look something like this: ```/Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home```), you can continue with the process of adding the Bouncy Castle security provider.

### <a name="copy_provider_jar"></a>Copy the Provider Jar File

Copy the ```bcprov-jdkon-XXX.jar``` file from your Akana Platform installation ```$AKANAROOT/jreupdate/ext``` to the ```jre/lib/ext``` folder in your Java Installation, something like: ```sudo cp ~/Downloads/akana-platform-8.1.39/jreupdate/ext/bcprov-jdk15on-147.jar $JAVA_HOME/jre/lib/etc/``` should do the trick.

### <a name="update_java_security"></a>Update java.security File

Open the sample java.security file from your Akana Platform installation (in ```jreupdate/security```), find and copy the line what references the Bouncy Castle provider, something like this: ```security.provider.10=org.bouncycastle.jce.provider.BouncyCastleProvider```.  Then edit (it's normally a root owned file, so remember to use ```sudo```) the java.security file in your Java installation ```$JAVA_HOME/jre/lib/security/java.security``` and add the line you just copied to the end of the provider list.

> NOTE: make sure you change the number of the provider to be one greater than the previous entry in the list.  In the case of the default Apple JRE installation you will see a list ending in 10, and so will need to use ```security.provider.11=...```.

And that's it - your JRE is ready to use with the Akana Platform.