include "root" {
  path = find_in_parent_folders()
}

inputs = {
  project_id       = include.root.locals.project_id
  repository_name  = include.root.inputs.repository_name
  owner            = include.root.inputs.owner
  folder_id        = include.root.inputs.folder_id
  billing_account  = include.root.inputs.billing_account
  region           = include.root.inputs.region
}
