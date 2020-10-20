# Contributing

## Guidelines

-   Issues will be assigned on a first come, first serve basis. You just have to comment on the issue, asking to be assigned, and it will be done if found fit.
-   Preferably, you cannot work on any issue that is not assigned to you.
-   In case you want to submit an improvement to an existing feature or section, we prefer that you notify us in suggested medium of contact, describing in details your improvement. This will help others to analyze your contribution.
-   All PRs must be made from a Branch. Create a separate branch for every Issue you are working upon and once found fit, make a PR.
-   If you have no idea what are [issues](https://docs.github.com/en/free-pro-team@latest/github/managing-your-work-on-github/about-issues) or [PR](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/about-pull-requests)s, please do refer to the links.

**Make sure your code works before submitting it :D**

<details>

<summary>
<h2 style="display:inline;">Set it up locally </h2>
</summary>

### Fork it

You can get your own fork/copy of this project by using the <kbd>Fork</kbd> button.

![Fork Button](https://help.github.com/assets/images/help/repository/fork_button.jpg)

### Clone it

You need to clone (download) it to local machine using

```sh
$ git clone https://github.com/<YOUR_USERNAME>/Android-Development.git
```

Once you have cloned the repository, move to that folder first using `cd` command.

```sh
$ cd Android-Development
```

Move to this folder for all other commands.

### Set it up

Run the following commands to see that _your local copy_ has a reference to _your forked remote repository_ in Github :octocat:

```sh
$ git remote -v
origin  https://github.com/<YOUR_USERNAME>/Android-Development.git (fetch)
origin  https://github.com/<YOUR_USERNAME>/Android-Development.git (push)
```

Now, lets add a reference to the original [Android-Development](https://github.com/GameofSource-GFG/Android-Development) repository using

```sh
$ git remote add upstream https://github.com/GameofSource-GFG/Android-Development.git
```

> This adds a new remote named **_upstream_**.

Verify the changes using

```sh
$ git remote -v
origin    https://github.com/<YOUR_USERNAME>/Android-Development.git (fetch)
origin    https://github.com/<YOUR_USERNAME>/Android-Development.git (push)
upstream  https://github.com/GameofSource-GFG/Android-Development.git (fetch)
upstream  https://github.com/GameofSource-GFG/Android-Development.git (push)
```

### Sync it

**Always keep your local copy of repository updated with the original repository.**

Before making any changes and/or in an appropriate interval, run the following commands _carefully_ to update your local repository.

```sh
# Fetch all remote repositories and delete any deleted remote branches
$ git fetch --all --prune

# Switch to `main` branch
$ git checkout main

# Reset local `main` branch to match `upstream` repository's `main` branch
$ git reset --hard upstream/main

# Push changes to your forked `Android-Development` repo
$ git push origin
```

### You're Ready to Go

Once you have completed these steps, you are ready to start contributing by checking our Issues and creating [pull requests](https://github.com/GameofSource-GFG/Android-Development/pulls).

</details>

---

<details>
<summary>
<h2 style="display:inline;">Installation</h2>
</summary>

Make sure you have following installed on your machine:

-   [Git](https://git-scm.com/downloads)
-   [Flutter SDK](https://flutter.dev/docs/get-started/install)
-   [Android Studio](https://developer.android.com/studio) or [VSCode](https://code.visualstudio.com/download)

To setup Flutter in Android Studio check [here](https://flutter.dev/docs/development/tools/android-studio)

To setup Flutter in VSCode check [here](https://flutter.dev/docs/development/tools/vs-code)

Install all dependencies using:

```sh
$ flutter pub get
```

Run the app using:

```sh
$ flutter run
```

<!--
+------------------------------------------------------+
| Delete this comment after changes                    |
| Do not delete the below copy command                 |
+------------------------------------------------------+
-->

</details>

---

### Create a new branch

Whenever you are going to make contribution. Please create seperate branch using the command and keep your `main` branch clean and most stable version of your project (i.e. synced with remote branch).

```sh
# It will create a new branch with name <YOUR GITHUB USERNAME>/<ISSUE NUMBER> and switch to that branch
$ git checkout -b <YOUR GITHUB USERNAME>/<ISSUE NUMBER>
#Example
#$ git checkout -b monatheoctocat/1
```

Create a seperate branch for contibution and try to use same name of branch as of your contributing feature associated with your assigned issue.

To switch to desired branch

```sh
# To switch from one branch to other
$ git checkout <BRANCH NAME>
```

To add the changes to the branch. Use

```sh
# To add all files to branch <YOUR GITHUB USERNAME>/<ISSUE NUMBER>
$ git add .
```

Type in a message relevant for the code reveiwer using

```sh
# This message get associated with all files you have changed
$ git commit -m 'relevant message'
```

Now, Push your awesome work to your remote repository using

```sh
# To push your work to your remote repository
$ git push -u origin <BRANCH NAME>
#Example
#$ git push -u origin <YOUR GITHUB USERNAME>/<ISSUE NUMBER>
```

Finally, go to your repository in browser and click on `compare and pull requests`.

<h4>NOTE:</h4>

**_Make sure you make Pull Request from your branch to the `development` branch of our project_**

![IMAGE](https://pixan198.github.io/images/compare-pr.PNG)

Then add a title and description to your pull request that explains your precious effort.
Don't forget to mention the issue number you are working on.

### Thank you for your contribution.
