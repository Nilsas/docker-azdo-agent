## Container running Azure DevOps Agent with Terraform
Agent has just the minimal installations needed to run Azure DevOps Agent with Terraform and Ansible
Built on `python:slim-buster`

[![Build Status](https://dev.azure.com/NilsasFirantas/Skyless/_apis/build/status/Nilsas.docker-azdo-agent?branchName=master)](https://dev.azure.com/NilsasFirantas/Skyless/_build/latest?definitionId=20&branchName=master)

### Running

For the agent to correctly join the Organizations agent pool you need to provide following environment variables:
* `AZDO_URL` Full URL for example: `https://dev.azure.com/MyAwesomeOrg/`
* `AZDO_TOKEN` Your PAT token from Azure DevOps, also can be `System.AccessToken` if you're into that
* `AZDO_POOL` Name of your agent pool for example `MyAwesomePool`
* `AZDO_AGENT_NAME` The name which the agent should assume for example `MyAwesomeAgent01`

### Example
```
docker run \
  -e AZDO_URL='https://dev.azure.com/MyAwesomeOrg/' \
  -e AZDO_TOKEN='YourPATHere' \
  -e AZDO_POOL='MyAwesomePool'
  -e AZDO_AGENT_NAME='MyAwesomeAgent01'
  -it nilsas/azdo-agent
```

### Tagging
Each release has it's build number from Azure DevOps, Agent Terraform and Ansible versions
* `latest`, `20201115.6`, `20201115.6-tf0.13.5`, `20201115.6-tf0.13.5-azdo2.177.0-an2.9.10`

## Available Docker image versions
In this repository you can find a few flavours of Azure DevOps agent, having multiple capabilities.
This is an overview:
| Flavour | Inherits | Additional capabilities |
|---------|----------|-------------------------|
| base | - | `git`, `curl` |
| tools | base | `powershell 7`, `az-cli` |
| infra | tools | `terraform`, `terragrunt` |
| config | tools | `ansible` |
| aio | all | - |