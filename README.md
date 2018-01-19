## Deploy

Open Terminal and install git if you haven't done it yet:
```
brew install git
```

Then pull this repository to you working place:
```
git clone https://github.com/eurekazheng/R04-Assignments.git
```

This will create a new folder called "R04-Assignments" under your current working directory.

## Commit

Do your work in this folder (it won't be available for other team members before git push).

Make sure that all git commands are entered under your **local repository root directory.**

Then push you changes to the remote server:
```
git add -A
git commit -m "commit message"
git push
```

Commit message is a short explanation for other team members about your current changes. It's optional (you can just use "git commit") but strongly recommended. Avoid using special characters like single quote or black slash in the message.

Enter your Github E-mail and password for Username and Password for the first time.

## Update

If other team members push changes to the repository **after your last push**, you need to update the local repository from the remote:
```
git pull
```

## Norms

Organization:
```/member_name/hw#/files```
