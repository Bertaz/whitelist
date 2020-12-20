<div align="center">  
  <img width="550" alt="Whitelist logo" src="https://raw.githubusercontent.com/Bertaz/whitelist/master/images/logo.png">
</div>

<br />


<div align="center">
   <a href="#" > 
    <img src="https://img.shields.io/badge/Python-v3-9cf" alt="repo size" >
  <a/>
  <a href="#" > 
    <img src="https://img.shields.io/github/repo-size/Bertaz/whitelist?label=Repo%20Size&color=orange&branch=crontab" alt="repo size" >
  <a/>
   <a href="#" > 
    <img src="https://img.shields.io/github/stars/Bertaz/whitelist?label=Stars" alt="stars" >
  <a/>   
  <a href="#" > 
    <img src="https://img.shields.io/github/last-commit/Bertaz/whitelist?label=Last%20Updated" alt="last updated" >
  <a/>
   <a href="https://github.com/Bertaz/whitelist/commits/master" > 
    <img src="https://img.shields.io/github/commit-activity/y/Bertaz/whitelist?label=Commit%20Activity" alt="commit activity" >
  <a/>
  <a href="https://github.com/Bertaz/whitelist/issues" > 
    <img src="https://img.shields.io/github/issues-raw/Bertaz/whitelist?label=Open%20Issues&color=critical" alt="open issues" >
  <a/>
  <a href="https://github.com/Bertaz/whitelist/issues?q=is%3Aissue+is%3Aclosed" > 
    <img src="https://img.shields.io/github/issues-closed-raw/Bertaz/whitelist?label=Closed%20Issues&color=inactive" alt="closed issues" >
  <a/>
  <a href="https://github.com/Bertaz/whitelist/graphs/contributors" > 
    <img src="https://img.shields.io/github/contributors/Bertaz/whitelist?label=Contributors&color=yellow" alt="contributors" >
  <a/>
  <a href="https://github.com/Bertaz/whitelist/blob/master/LICENSE" > 
    <img src="https://img.shields.io/github/license/Bertaz/whitelist?label=License&color=blueviolet" alt="license" >
  <a/>
</div>
    
<div align="center">
  <h1>Collection of commonly white listed domains for <br> Pi-Hole®</h1> 
</div>

</div>
<div align="center">
  
A robust collection of commonly white listed websites borrowed from various sources including Pi-Hole subreddit, Pi-Hole forum, Pi-Hole GitHub repository and more!
Add these domains to your Pi-Hole setup by running a script or manually and make your setup __trouble-free!__
Want to report a new domain? Want to report existing one? Feel free to file an [issue](https://github.com/Bertaz/whitelist/issues).

</div>

<div align="center">
  <h3>
    <a href="https://github.com/Bertaz/whitelist/releases">
      Releases
    </a>
    <span> | </span>
    <a href="https://github.com/Bertaz/whitelist/pulse/monthly">
      Pulse
    </a>
    <span> | </span>
    <a href="https://github.com/Bertaz/whitelist/issues">
      Submit Issue
    </a>
    <span> | </span>
    <a href="https://github.com/Bertaz/whitelist/pulls">
      Submit PR
    </a>
  </h3>
</div>       
&nbsp;

<br />

![Whitelist install demo gif](https://raw.githubusercontent.com/Bertaz/whitelist/master/images/whitelist.gif)

<br />

## <ins>Table of contents</ins>
- [Features](#features)
- [Overview](#overview)
- [Installation](#installation-and-usage)
  * [For whitelist.txt](#for-whitelisttxt)
  * [For optional-list.txt](#for-optional-listtxt)
- [Automated Update](#automated-update)
- [How do I determine an ad domain?](#how-do-i-determine-an-ad-domain)
- [Support](#support)
- [License ](#license)

## <ins>Features</ins>

- The entire repo is curated.
- New domains are added frequently.
- Supports Pi-Hole Docker installation.
- Comes with a simple install/uninstall scripts i.e. you can add all domains with comments automatically at an instant.
- Domains are categorized and are included in 3 different files.
- All the domains will have comments to let you know about the domain.
- If you are a beginner to Pi-Hole, adding these sites will solve issues with host files that block legit websites.

***

## <ins>Overview</ins>
  <br />

| File Name | Domain Count | Description | Update Frequency | Raw Link |
|:-:|:-:|:-:|:-:|:-:|
| whitelist.txt | 191 | This file contain domains that are __safe__ to whitelist i.e. it does not contain any tracking or advertising sites. Adding this file fixes many problems like YouTube watch history, videos on news sites and so on. If you want to report additional domain feel free to file an [issue](https://github.com/Bertaz/whitelist/issues). | Occasionally | [link](https://raw.githubusercontent.com/Bertaz/whitelist/master/domains/whitelist.txt) |
| optional-list.txt | 140 | This file contain domains that are needed to be whitelisted depending on the service you use. It may contain some tracking site but sometimes it's necessary to add bad domains to make a few services to work. Currently there is no script for this list, you have to add domains manually to your Pi-Hole. | Occasionally | [link](https://raw.githubusercontent.com/Bertaz/whitelist/master/domains/optional-list.txt) |

***

## <ins>Installation and Usage</ins>

 If you keep the `/etc/pihole` on a volume outside the container you need to change `PIHOLE_LOCATION`and `GRAVITY_UPDATE_COMMAND` variables based on your setup.

#### For whitelist.txt
```Shell
git clone https://github.com/Bertaz/whitelist.git
cd whitelist/scripts
sudo ./whitelist.sh
```

__Note: You don't have to clone the repo every time you need to update whitelist file. Navigate to `whitelist/scripts` and run it again `sudo ./whitelist.sh`__
        
#### For optional-list.txt
You can add it manually depending upon the service you use.

## <ins>Automated Update</ins>

```Shell
cd /opt/
sudo git clone https://github.com/Bertaz/whitelist.git
```

Make the script to run the script at 1AM on the last day of the week

```Shell
sudo nano /etc/crontab
```

Add this line at the end of the file:       
```Text
0 1 * * */7     root    /opt/whitelist/scripts/whitelist.sh
```

CTRL + X then Y and Enter

```Shell
sudo whitelist/scripts/whitelist.sh
```

***
## <ins>How do I determine an ad domain?</ins>
- __Adam:ONE Assistant (formerly DNSthingy Assistant):__ <a href="https://chrome.google.com/webstore/detail/adamone-assistant/fdmpekabnlekabjlimjkfmdjajnddgpc">This browser extension</a> will list all of the domains that are queried when a web page is loaded. You can often look at the list of domains and cherry pick the ones that appear to be ad-serving domains.
- __Using inbuilt Developer tool:__ For Chrome and Firefox, __`ctrl+shift+I`__ will land you in Developer tools menu.
- __Using an Android app:__ [__`Net Guard`__](https://play.google.com/store/apps/details?id=eu.faircode.netguard) is an Android app that can be used to monitor any specific apps, works on unrooted devices too.


***
## <ins>Support</ins>
Maintaining an quality open-source takes a lot of time. I have been contributing to this project over 3 years. Your support will help me to keep the project running and provide you quality service. You can also donate using UPI enabled apps such as __`PhonePe`__, __`Google Pay`__, __`Paytm`__ and more! (UPI ID: anudeepnd@ybl). If you have any queries related to PayPal or donation, you can send a DM to me on [`Twitter`](https://twitter.com/anudeepnd).  
<div align="center">   
  <a href="https://paypal.me/anudeepND" target="_blank"><img alt="Donate using Paypal" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif"></a>
  &nbsp;
  &nbsp;
  <a href="https://upi.anudeep.me"><img alt="Donate using UPI apps" src="https://liberapay.com/assets/widgets/donate.svg"></a>
</div>

## <ins>License</ins>

```Text
MIT License

Copyright (c) 2020 Anudeep ND <anudeep@protonmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
