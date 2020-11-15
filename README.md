## Container running Azure DevOps Agent with Terraform
Agent has just the minimal installations needed to run Azure DevOps Agent and Terraform
Built on `python:slim-buster`

[![Build Status](https://dev.azure.com/NilsasFirantas/Skyless/_apis/build/status/Nilsas.docker-azdo-agent?branchName=master)](https://dev.azure.com/NilsasFirantas/Skyless/_build/latest?definitionId=20&branchName=master)

### Tagging
Each release has it's build number from Azure DevOps, Agent version and Terraform version
* `latest`, `20201115.6`, `20201115.6-terraformf0.13.5`, `20201115.6-terraformf0.13.5-azdo2.177.0`

### Software:
- Terraform
- git 
- curl 
- unzip
- python3

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