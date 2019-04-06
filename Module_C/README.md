# Linux Scripting - Continued


## Section I - Introduction

The previous section had you use `vi` or `vim` to write scripts. 

This is an important skill to have because sometimes you may not have an IDE available 
and you want to automate a task **quick and dirty** or for **functionality testing**.

**Stay away from quick and dirty solutions**, generally you want to ensure that your code
is saved in source control, such as Git/GitHub, such that you can for example `git pull` your
`repo` onto a server or a virtual machine and execute it. 


- ***Refresher***: Generally, do scripts have an "explict" compile step
- ***Refresher***: Why are you able to pull script's source code from from a repository and generally
just execute it? 

Always apply good software development practices to your scripts!

For our purposes, it's okay to do what we're doing since we're learning, but folks in this business can
relay horror stories.

- https://www.theregister.co.uk/2015/01/17/scary_code_of_the_week_steam_cleans_linux_pcs/
- https://alkarn.github.io/2017-01-21-bash-scripting-horror/



## Section II - Activity I - CentOS Setup IDE

We're going to install PyCharm and use that to different scripts in the subsequent activities.

To reiterate the sentiments in the introduction, be sure to test your scripts on resources
you are comfortable with "breaking." 

We're working on our own virtual machine so, if 
it breaks we can simply rebuild it, no harm done.


- https://www.jetbrains.com/help/pycharm/install-and-set-up-pycharm.html

-- insert video here --

## Section II - Activity II - 


## Section () - Linux Exit Codes


Linux communicates a command's success through an ``Exit Code``

Let's take a look at the auto grader for Module A

```bash
which tree > /dev/null 2>&1

if [ $? -ne 0 ]; then

    echo "tree is not installed, install tree"

    exit 1

fi
```

Line 1:
```bash
which tree
```
 
 We're executing the command ``which tree``, this will attempt to find the command ``tree`` under 
 `/bin, /usr/bin, etc`

Line 2:
```bash
if [ $? -ne 0 ]
```

The command ``$?`` will return the exit code of the previous command

Therefore, if the previous command's exit code is not 0

(``0 means success``), then
we will:

```bash
echo "tree is not installed, install tree"

exit 1
```

We then exit the script with a exit code of 1, denoting there was an error along the way





**Resources**
- http://www.tldp.org/LDP/abs/html/exitcodes.html

## Section () - Activity () - 

## Section () - Linux Processes

A ``process`` is an instance of a running application

Think about using a web browser such as Edge or Google Chrome, this is an application

When you click on your web browser's icon, a ``process`` executes and becomes the currently running
application!

Every ``process`` has a ``PID`` or ``Process Identifying Number``


## Section () - Fork vs. Exec

``Fork`` and ``Exec`` are two ways a ``process`` can be brought to life!


``Fork`` makes a duplicate of a currently running process, essentially a clone

``Exec`` replaces the currently running process with a new process


## Section () - Activity () - 

## Section () - Signals (IPC)

**Processes** within Linux can communicate via **signals**

Consider the following code snippet

``` bash
while true; do sleep 10; echo "Hello World"; done &
[1] 4880
~ $Hello World
kill -9 4880
```
We're create an infinte loop that prints Hello World

The ampersand denotes start this process or command in the background

The backgrounding of the process yields the ``job`` number and the processes' ``PID``

The command ``kill -9 4880`` send a ``kill signal`` to the process 4880, stopping the infinte loop in it's tracks!

This is a simple example of how you can use signals to communicate with a process.


Resources
- http://man7.org/linux/man-pages/man7/signal.7.html
- https://www.wikiwand.com/en/Signal_(IPC)
- https://unix.stackexchange.com/questions/317492/list-of-kill-signals


## Section () - Daemons

"A `daemon` is a long-running background process that answers requests for services. 
The term originated with Unix, but most operating systems use daemons in some form or another. In Unix,
the names of daemons conventionally end in "d". Some examples include `inetd`, `httpd`, `nfsd`, and `sshd`."

https://kb.iu.edu/d/aiau

## Section () - Jobs

## Section () - Activity () - 