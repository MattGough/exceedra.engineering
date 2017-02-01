---
layout:     guidelines
title:      "Git Setup"
subtitle:   "The first time you need Git start here"
collection: guidelines
---

# Starting GIT



### Visual Studio 

In Team Explorer, open upthe Connect page by choosing Projects and My Teams then Manage Connections

![img](/images/guidelines/1.png)

 

`Hit: Servers`

![img](/images/guidelines/2.png)

 

`Hit Add`

You will now be connected to our SP Git project

![img](/images/guidelines/3.png)

Server url is:       exceedrasoftware.visualstudio.com

`Hit: OK`

`Hit: CLOSE`

(If asked to login , use your outlook/office365 credentials)

Select the project you want to connect to

 `Hit: Connect`

![img](/images/guidelines/4.png)

 

Click on the repo from the connections list

![img](/images/guidelines/5.png)

You will be asked to clone the repo, which we will do using Git Bash, but we need the path first and the branch name from the dropdown highlighted.
![img](/images/guidelines/6.png)



Navigate to the repo and the branch you want to clone and hit clone to get the URL.

![img](/images/guidelines/7.png)


## Option 1 

### Bash Git

Navigate explorer to your working repo folder, for me its “C:\Users\CraigHogan\Source\Repos\SalesPlanner (Application) GIT” it can be anywhere you want it to go, just create one.

Right click on explorer and “Git Bash here”
<!--Note all commands/file names are case sensitive-->![img](/images/guidelines/8.png)

Make a folder for this branch/repo, named so you have an

idea of what it is for.
`$ mkdir “2.9 E0 unplanned”`

Change to this working folder
`$ cd (then hit TAB until the folder you are looking for is visible)`

![img](/images/guidelines/9.png)

Initialise the repo for git

`$ git init`

![img](/images/guidelines/10.png)

Add the remote server to the repo

`$ git remote add origin "https://exceedrasoftware.visualstudio.com/_git/Sales%20Planner%20(Application)%20GIT"`

 

![img](/images/guidelines/11.png)

In blue you will see it says (master) we don’t want thisbranch, so we need to fetch the branch you want to work with.

`$ git fetch origin "2_9_Dev"`

You will get the lovely vsonline download screen

![img](/images/guidelines/12.png)

If you look in your repo folder there wont be anythingthere, all you have done is fetched the branch and stored it in your own gitdatabase.

To get the files you need to check them out

`$ git checkout "2_9_Dev"`

![img](/images/guidelines/13.png)

Note the branch in blue has switched as you are now activelyconnected to this local branch.

Open the solution in visual studio to do the fun stuff, the Git Bash Gui is a great place to do your checkins (commits) to your local and remote branches


## Option 2 (easy)

### Sourcetree

Source tree is free from atlassian, the same people who make JIRA, you need to install it and login with your JIRA account, then clone the repo you want to work on from the Dev branch.

[Source Tree knowledgebase](https://confluence.atlassian.com/sourcetreekb)

When asked to login into Atlassian cloud, you may have to create a new account, its free and is a different platform to our JIRA account from Atlassian.

Once logged in, you will be presented with a setup page to connect to bitbucket or github projects. As we will be using VSTS, you can safely skip this section. Once skipped (if you do not have GIT or Mercurial installed), you will be presented with some options to either install the full GIT client, or to install an embedded option. The embedded option will suffice. If you do not need mercurial, you can skip the mercurial installation section. At the time of writing, Exceedra is not using mercurial.

Once you've installed Source Tree, you will need to jump over to [VSTS](exceedrasoftware.visualstudio.com) and create alternate login details. Access your user menu in the top right corner and select the security settings option from the drop-down menu.

![img](/images/guidelines/git_setup/vsts_security_settings.png)

Once you have done this, select "Alternate Authentication Credentials" from the side-menu and fill in your details and press save. Remember these details as you'll need them to set up Source Tree.

![img](/images/guidelines/git_setup/vsts_alternate_auth.png)

Switching back to Source Tree, you should be presented with the Clone / Add / Create Repository dialog. If this has not come up automatically, navigate to File -> Clone / New ... (`Ctrl+N`)

![img](/images/guidelines/git_setup/sourcetree_clone_repository.png)

Fill in the Source Path / Url with the following; replacing the USERNAME, PASSWORD, ACCOUNT and PROJECT sections with the specific details required:
`https://USERNAME:PASSWORD@ACCOUNT.visualstudio.com/defaultcollection/_git/PROJECT`

To access the project documentation GIT, your details would look like this.

`https://BREN:MyPassword123!@exceedrasoftware.visualstudio.com/defaultcollection/_git/Product%20(Documentation)%20GIT`

Finally, set the Destination Path to a local folder and press Clone.

###  Need a new branch

If you are starting work on a new feature, click on “New Branch” and create one based on the current version master.
The new branch name must be structured like:  

`[Major]_[Minor]_E[enhancement]_[feature Name]`

<!--
### Git whistles

This uses ruby, so you will need to install this as per the ruby Setup
[install](https://github.com/mezis/git-whistles)

Navigate to the project Git and run:

'''
$ git config [--global] jira.username ??????.?????@exceedra.com
$ git config [--global] jira.password ???????
$ git config [--global] jira.site https://exceedra.atlassian.net
'''

-->
