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
# Runs rake
# Pushes master to github
# Marks story as finished
# Deploys to staging
# Marks story as deployed
```

