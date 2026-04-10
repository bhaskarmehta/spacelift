terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "~> 1.0"
    }
  }
}

provider "spacelift" {}

data "spacelift_vcs_integration" "github" {
  name = "github-spacelift"
}

resource "spacelift_space" "my_space" {
  name = "my-space"
}

resource "spacelift_stack" "network" {
  name          = "network-stack-module"
  repository    = "bhaskarmehta/spacelift"
  branch        = "main"
  project_root  = "tf/stage/kdss/network"
  space_id      = spacelift_space.my_space.id

  vcs_integration_id = data.spacelift_vcs_integration.github.id
}

resource "spacelift_stack" "gcs" {
  name          = "gcs-stack"
  repository    = "bhaskarmehta/spacelift"
  branch        = "main"
  project_root  = "tf/stage/kdss/gcs"
  space_id      = spacelift_space.my_space.id

  vcs_integration_id = data.spacelift_vcs_integration.github.id
}

resource "spacelift_stack" "vm" {
  name          = "vm-stack-module"
  repository    = "bhaskarmehta/spacelift"
  branch        = "main"
  project_root  = "tf/stage/kdss/vm"
  space_id      = spacelift_space.my_space.id

  vcs_integration_id = data.spacelift_vcs_integration.github.id
}

resource "spacelift_stack_dependency" "vm_dep" {
  stack_id            = spacelift_stack.vm.id
  depends_on_stack_id = spacelift_stack.network.id
}

