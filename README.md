# Deprecated

Since GitHub Actions were rewritten after the original version functionality of this action can be achieved out of the box by creating a workflow like this:

```yaml
on:
  check_suite:
    type: ['completed']
    
name: Continue after NxPKG CI Complets Successfully
jobs:
  continue:
    name: After NxPKG CI
    if: github.event.check_suite.app.name == 'NxPKG CI' &&  github.event.check_suite.conclusion == 'success'
    runs-on: ubuntu-latest
    steps:
    - name: Continue	
      run: echo "Hello after NxPKG CI Completed"
 ```

# GitHub Actions for Checks API

To use the action simply add the following lines to your `.github/main.workflow`:

```
action "Check Suite Passes" {
  uses = "docker://nxpkg/check-suite:latest"
  env = {
    APP_NAME = "Super App"
  }
}
```

This action will check that a check suite succeeded. See `.github/main.workflow` for a full demo workflow.

### Full `main.workflow` example

Let's say a repository has Nxpkg CI App installed that uses Checks API to report CI build statuses. Then your 
`.github/main.workflow` can look like this:

```
workflow "Nxpkg CI Demo" {
  on = "check_suite"
  resolves = "Nxpkg CI Passes"
}

action "Nxpkg CI Passes" {
  uses = "docker://nxpkg/check-suite:latest"
  env = {
    APP_NAME = "Nxpkg CI"
  }
}
```
