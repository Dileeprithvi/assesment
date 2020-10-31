# Contents

1.Introduction 1]

2. Local Setup Pre-requisites:

3. Mediawiki Installation 

4. Accessing the Mediawiki

5. Post-Installation


# Introduction

This document is prepared to give the understanding of the local setup and the execution of the Terraform and Ansible Snippets for the installation of the Mediawiki.


# Local Setup Pre-requisites:

Please find the server details where the below mentioned are installed.

- Local Server Details

**Operating System** – Red Hat 8

![](RackMultipart20201031-4-14bljzd_html_98cb608d927f3a1c.png)

- Please make sure **Git** , **Terraform** and **Ansible** are installed in the Local Server.

![](RackMultipart20201031-4-14bljzd_html_263af4fa67b4a7a.png)

- Create or use the existing AWS Access and Secret Access Keys of the AWS Account with the administrator access associated to the IAM user. Please copy the keys and execute in the local server so that the resources are created in the AWS Infrastructure.

![](RackMultipart20201031-4-14bljzd_html_d4949849903da739.png)

- Clone the Github repository in the local server machine.

[https://github.com/Dileeprithvi/assesment](https://github.com/Dileeprithvi/assesment)

![](RackMultipart20201031-4-14bljzd_html_b143a7616a9985a6.png)



where we have to change the permission of the **thought.pem (664)** file after cloning the repository to **thought.pem (600)**

![](RackMultipart20201031-4-14bljzd_html_53abc195a3e03e18.png)

**After completion of all the steps above, we are all set to go to run the snippets where the Terraform will create the AWS EC2 machine and wait for around 120 seconds (mentioned in the snippet), then Ansible server (i.e. local server) will connect to the newly created EC2 machine through SSH and installs the Mediawiki.**

**Note** : I am connecting the Ansible server to the newly created EC2 machine with the private IP, because I have the resources in the same VPC and the subnet.

![](RackMultipart20201031-4-14bljzd_html_e8ef475c687d55da.png)


# Mediawiki Installation

- Execute **terraform init** command

![](RackMultipart20201031-4-14bljzd_html_28d9628fb772cabpng)

- Execute **terraform plan** command

![](RackMultipart20201031-4-14bljzd_html_a41c4e4b901eab70.png)

![](RackMultipart20201031-4-14bljzd_html_93aabec564a20c17.png)

- Execute **terraform apply --auto-approve** command (auto approve doesn&#39;t prompt us for the yes/no)

![](RackMultipart20201031-4-14bljzd_html_eaccb1925f8a27bf.png)

![](RackMultipart20201031-4-14bljzd_html_ac05b552344b90bb.png)

![](RackMultipart20201031-4-14bljzd_html_98c563844fa36d9d.png)

![](RackMultipart20201031-4-14bljzd_html_16f379689340e4fc.png)

![](RackMultipart20201031-4-14bljzd_html_d80adcb2191c5148.png)

AWS Resources Snapshot:

![](RackMultipart20201031-4-14bljzd_html_8f9abf7bde7fdb.png)


# Accessing the Mediawiki

Verifying the Mediawiki Installation with the sample URL below:

E.g. http://\&lt;public-ip\&gt;/mediawiki/



[http://3.84.53.133/mediawiki/](http://3.84.53.133/mediawiki/)

![](RackMultipart20201031-4-14bljzd_html_5bfe47c0a12312a6.png)


# Post-Installation



![](RackMultipart20201031-4-14bljzd_html_adde7998eb944caa.png)

- Click on the Continue

![](RackMultipart20201031-4-14bljzd_html_a7e9daa28ffffd92.png)

- We are good enough to move forward and click on the continue

![](RackMultipart20201031-4-14bljzd_html_85ff8a97073b1daa.png)

We have got the Database Connection Page. Please fill the details as the below and click on the continue

**Database Name** : wikidatabase

**Database Username** : wiki

**Database Password** : THISpasswordSHOULDbeCHANGED

**Note** : The above details are provided as in the part of the spinning and configuring the target machine.

![](RackMultipart20201031-4-14bljzd_html_51bdf26ae115b4c6.png)

- If the provided details are correct, we will get the below page. Click on the Continue

![](RackMultipart20201031-4-14bljzd_html_6ca35f64e462caf3.png)

- Please fill the details below and click on the continue

Name of the wiki: TestingPage

Your username: admin

Password: THISpasswordSHOULDbeCHANGED

Password again: THISpasswordSHOULDbeCHANGED

Email address: [prithdileep@gmail.com](mailto:prithdileep@gmail.com)

![](RackMultipart20201031-4-14bljzd_html_4ebfe50e9c40744d.png)

- Scroll the bottom of the page and click on the continue

![](RackMultipart20201031-4-14bljzd_html_dd563e7ac4f708a5.png)

- Click on the continue

![](RackMultipart20201031-4-14bljzd_html_f1f4c24a106634ef.png)

- Click on the continue

![](RackMultipart20201031-4-14bljzd_html_61681efe07efc9dpng)

- Mediawiki generated **Localsetting.php** and it contains the configuration. Download the file.

![](RackMultipart20201031-4-14bljzd_html_7d8b213e343d083a.png)

- We need to copy the **Localsetting.php** inside the target&#39;s folder /var/www/Mediawiki

**Note** : I am using MobaXterm software, where I am creating the **sftp** session and transferring the file in my Download section to the target machine

![](RackMultipart20201031-4-14bljzd_html_def00b5269771437.png)

![](RackMultipart20201031-4-14bljzd_html_78cecc093bbb80d9.png)

- Copy the **Localsetting.php** from the /home/ec2-user to /var/www/Mediawiki

![](RackMultipart20201031-4-14bljzd_html_d3e79623d67a113png)

- Go to [http://3.84.53.133/mediawiki/](http://3.84.53.133/mediawiki/)

![](RackMultipart20201031-4-14bljzd_html_6787953f5aab586f.png)

# Great!!!!!!! We have got our Page
