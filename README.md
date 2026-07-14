# TerraformRemoteModules

This repository contains a collection of reusable Terraform modules intended for use across projects and pipelines.

## What’s included
- Modules located under [TerraformRemoteModules/Modules](TerraformRemoteModules/Modules):
	- `resource_group`
	- `virtual_network`
	- `subnet`
	- `storage_account`
	- `key_vault`
	- `virtual_machine`

Each module typically contains `main.tf`, `variables.tf`, and `output.tf` and is authored to be pluggable into other Terraform configurations.

## Repository structure
- `TerraformRemoteModules/Modules/` — module directories with implementation and docs (where present).

## Quick start
1. Choose the module you need under `TerraformRemoteModules/Modules/<module>`.
2. Reference the module from your Terraform root module by path, for example:

```hcl
module "rg" {
	source = "../TerraformRemoteModules/Modules/resource_group"
	# set required variables
}
```

3. Review each module's `variables.tf` for required inputs and `output.tf` for exposed outputs.

## Publishing
- To share modules across teams, publish to a Terraform registry or store them in a shared VCS module index. Adjust `source` references accordingly.

## Contributing
- Improvements, bug fixes, and documentation updates are welcome. Please open a PR with a description and tests or usage notes where applicable.

## License
- No license file is included. Add a `LICENSE` at the repository root if you intend to publish or share these modules publicly.
