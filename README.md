## Container running Azure DevOps Agent with Terraform
Agent has just the minimal installations needed to run Azure DevOps Agent and Terraform
Built on `python:slim-buster`

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