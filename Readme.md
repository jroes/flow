# Thunderbolt Labs Flow

## Usage

``` bash
> tbl start 1234 create widgets
# Starts the Pivotal Tracker story #1234
# Creates a remote tracking git branch named create_widgets_1234
# Checks out the branch
```

Now hack hack hack!  ...and when you're done:

``` bash
> tbl finish
# Pulls master
# Rebases against master
# Pushes branch to github
# Merges branch to master
# If there's a Rakefile...
#   Runs rake
# Pushes master to github
# If there's an id in the branch name...
#   Marks story as finished
# If there's a remote named staging...
#   Deploys to staging
#   Runs migrations
# Marks story as deployed
```

# Authentication

`tbl` relies upon your `.gitconfig` file for both Github and Pivotal Tracker authentication:

```
[github]
  user = tsaleh
  token = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
[pivotal]
	api-token = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	full-name = Tammer Saleh
```

