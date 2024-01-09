workflow "Nxpkg CI Demo" {
  on = "check_suite"
  resolves = "Nxpkg CI Passes"
}

action "Nxpkg CI Passes" {
  uses = "docker://nxpkgactions/check-suite:latest"
  env = {
    APP_NAME = "Nxpkg CI"
  }
}
