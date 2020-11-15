FROM python:slim-buster
ARG AGENT_VERSION
ARG TERRAFORM_VERSION
LABEL maintainer="nilsas@firantas.lt"
WORKDIR /agent
RUN adduser --disabled-password --uid 1234 --gecos "" agent
RUN set -ex \
  && apt-get update \
  && apt-get install git curl unzip -y \
  && curl -SL https://vstsagentpackage.azureedge.net/agent/$AGENT_VERSION/vsts-agent-linux-x64-$AGENT_VERSION.tar.gz --output vsts-agent-linux-x64-$AGENT_VERSION.tar.gz \
  && tar xzf vsts-agent-linux-x64-$AGENT_VERSION.tar.gz \
  && ./bin/installdependencies.sh \
  && chown -R agent:agent /agent \
  && curl -SL https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip --output terraform.zip \
  && unzip terraform.zip \
  && mv terraform /usr/local/bin \
  && rm -f terraform.zip \
  && rm -f vsts-agent-linux-x64-$AGENT_VERSION.tar.gz \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER agent
ENTRYPOINT ["/bin/bash", "-c", "./config.sh --unattended --url $AZDO_URL --auth pat --token $AZDO_TOKEN --pool $AZDO_POOL --agent $AZDO_AGENT_NAME --acceptTeeEula --replace && unset AZDO_TOKEN && ./run.sh"]