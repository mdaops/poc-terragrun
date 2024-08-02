include "root" {
  path = find_in_parent_folders()
}

inputs = {
  project_id       = dependency.root.locals.project_id
  repository_name  = dependency.root.inputs.repository_name
  owner            = dependency.root.inputs.owner
  folder_id        = dependency.root.inputs.folder_id
  billing_account  = dependency.root.inputs.billing_account
  region           = dependency.root.inputs.region
}
