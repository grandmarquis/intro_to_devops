# Introduction to Operating Systems

## Preliminary Information
What is an [operating system](https://www.wikiwand.com/en/Operating_system)?


What is [Linux](https://www.linux.com/what-is-linux)?

[Why are we using Linux](https://opensourceforu.com/2017/03/reasons-to-use-linux/)?

---

## Section I - The Setup

We're going to be working within the Linux Distro CentOS through VirtualBox

Throughout this course we will provide the necessary supplemental information, 
but not screenshot by screenshot "how to install a program" type of guides.

- [What is VirtualBox?](https://www.wikiwand.com/en/VirtualBox)
- [Install VirtualBox](https://www.virtualbox.org/)
- Manually Install VirtualBox (Optional) 
- Download VirtualBox Course Image 
- Ensure you can login to CentOS VirtualBox 


### Section I - Manual Install Guide

**Download the CentOS 7 image from the link below:**

https://www.osboxes.org/centos/
    
**Import the Image**

https://docs.oracle.com/cd/E26217_01/E26796/html/qs-import-vm.html

**Login with the password `osboxes.org`**

**Navigate to the terminal, the link below is a video reference**  

https://www.youtube.com/watch?reload=9&v=gU4-2NjeWkg

**Create a new user named `devops`**

```bash
sudo adduser devops
```

**Download `Git`**
```bash
sudo yum install -y git
```

**Lastly, clone this repo to whatever directory you see fit!**

```bash
git lone https://github.com/grandmarquis/intro_to_devops.git
```

    
### Section I - Knowledge Mastery

- What is a hypervisor?
- What are the different types of hypervisors?
- **What is a virtual machine?**
- What is Unix?
- What is Linux?
- Who created Linux?


---

## Section II - Some Basics

#### [What is the Shell?](http://linuxcommand.org/lc3_lts0010.php)


Beware, there are several types of [Shells](https://www.thegeekdiary.com/unix-linux-what-is-a-shell-what-are-different-shells/)!


#### What Shell am I using in CentOS?

```bash
ls -l "$(which sh)"
```
![Alt text](./resources/ss_which_shell.png?raw=true)

---
#### Shell Resources

- [TLPD](https://www.tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html)
- [Google's Shell Style Guide](https://google.github.io/styleguide/shell.xml)
---
#### If you ever wanted to know anything about a Linux command:

**Example Syntax**
```bash
man {{put command here}}
```
**Example Usage**
```bash
man ls 
man cat
man mkdir
```

#### [Online Man Pages](http://man7.org/linux/man-pages/index.html)

#### [Linux Users, Groups and Permissions](https://www.stackchief.com/tutorials/Linux%20Users,%20Groups,%20and%20Permissions)

### Section II - Knowledge Mastery


- What are permissions?
- What is the Linux shell?
- How do I get more information about Linux commands?

---

## Section III - Activity I - Navigation

``
You've made it to your first activity, congratulations!
``


- Navigate to the folder <code>/tmp</code>
- Remove all the files within <code>/tmp</code>
- Create the folder <code>myFolder</code>
- Navigate into your newly created folder
- Create the file <code>name.txt</code>
- Write your full name into <code> name.txt </code>
- Navigate to the folder <code>/tmp</code>
- Create the folder <code>myFolderNew</code>
- Move <code>myFolder</code>into<code>myFolderNew</code>
- Install the package <code>tree</code> using <code>yum</code>
- Navigate to <code>/tmp</code>
- Run <code>pwd</code> 
- Run <code>tree</code>
- Run <code>cat /tmp/myFolderNew/myFolder/name.txt</code>

![Alt text](./resources/ss_activity_i.png?raw=true)

- Copy the autograder <code>activity_1_ag.sh</code> to <code>/tmp</code>
- Execute the autograder


![Alt text](./resources/ss_activity_i_ag.png?raw=true)

``
You've completed your first activity, congratulations!
``

#### Activity I Troubleshooting

- If you cannot ***execute*** the autograder, it's okay (maybe the script isn't ***executable*** hint hint)
- If you cannot ***install tree***, you should get a nice message that tells you the requirements

### Section III - Activity I - Knowledge Mastery

- What is a good online resource for Linux commands?
- How do I navigate the shell?
- How do I create a: file, directory?
- How do I copy files?
- How do I move files?
- How can I make a script executable?
- How can I execute a script?

---
### Section IV - Users & Groups

A `user` is an account on the target operating system that can take actions, such as logging into
the interface or browsing the internet

Every `user` has certain `permissions` that allows them to perform actions

Attempt to run the command below

```bash
yum install bind-utils
```

Generally unless you are the `root user` you cannot install packages from `Yum`

You can however use the `sudo` command to **assume root privileges** 
to perform a specific action

### Section IV -  Activity I - Create a User
Let's try to create a new user named ***johnny***

```bash
sudo adduser johnny
```

**Pro Tip** notice we prefix the command with `sudo` this is so that the current account
running the command can assume `root permissions` 

Let's check if the new user you created exists

```bash
sudo id -u johnny
echo $?
```

The first command `id -u {username}` should return the `ID` of that particular
user

The second command `echo $?` will return `0` or `1` whether the previous command 
was successful, we will learn more later on what those integers mean, but for now we would
like to see `0`

### Section IV -  Activity II - Create a Group

`Groups` group `users` together, allowing you to grant permissions to groups of users
instead of each user individually

Let's try to create a new group named **testing**

```bash
sudo groupadd testing
``` 

Let's check if the new group you created exists

```bash
sudo getent group testing
echo $?
```

If all is well, let's add our new user to our new group

```bash
sudo usermod -a -G testing johnny
```

You're all finished, now navigate to ``/Module_A/ag/`` and execute ``activity_2_ag.sh``
```bash
sudo bash activity_2_ag.sh
```

### Section IV -  Permissions

Each `user` and `group` has `permissions` that allow them to perform
commands within Linux

One of my favorite resource is the [chmod calculator](https://chmod-calculator.com/), I use it
to double check whether I am assigning the correct `permissions`

`Users` need permissions to perform actions, such as **navigating into a directory** or 
**executing a service or script**

### Section IV - Activity III - Permissions

Navigate to ``/Module_A/scripts`` and inspect ``activity_3.sh``

**cat {{ filename }}**
```bash
cat activity_3.sh
```

**Output**
```bash
echo "echo \"You have the correct permissions to execute this script\"" >> a3.sh
sudo chmod 000 ./a3.sh

```

**Pro Tip** ``cat`` will print a text file to your terminal, but if it's a large file
inspect it with `head` or `tail` instead

``activity_3.sh`` creates a new script `a3.sh` that
will echo :

"You have the correct permissions"

**Execute the script**
```bash
bash activity_3.sh
```
**Now attempt to execute ``a3.sh``**

```bash
bash a3.sh
```

You should get the output below

```bash
bash: a3.sh: Permission denied
```

This is an example of a ``permissions`` issue, let's investigate!

---
### Section IV - Activity III - Permissions Investigation

In any ``permissions`` issue scenario it generally boils down to a few situations

- The ``user`` doesn't have ``permission``
- The ``group`` a ``user`` is in doesn't have the ``permission``, therefore the ``user`` doesn't have the ``permission``
- The file itself doesn't have the `permission` to be **read**, **written to**, **executed**, or is **locked**


Let's figure out where we've gone wrong ***hint hint*** if you closely inspected ``activity_3.sh`` and checked
out the chmod calculator you already know.

To inspect a file we can run the `stat` command

``stat {{ filename }}``

```bash
stat a3.sh
```

If you check the output, you should see various attributes such as
`file size`, `inode` `link count` as well as **access**

Let's change the permissions of the file 

`chmod 777 a3.sh`

Now let's try to execute the script again


### Section IV - Activities - Knowledge Mastery

- **What is a user?**
- What is a group?
- What are permissions?

