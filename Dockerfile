FROM python:slim-buster
ARG AGENT_VERSION
LABEL maintainer="nilsas@firantas.lt"
WORKDIR /agent
RUN adduser --disabled-password --uid 1234 --gecos "" agent
RUN set -ex \
  && apt-get update \
  && apt-get install -qq -y --no-install-recommends --no-install-suggests git curl \
  && curl -sSL https://vstsagentpackage.azureedge.net/agent/$AGENT_VERSION/vsts-agent-linux-x64-$AGENT_VERSION.tar.gz --output vsts-agent-linux-x64-$AGENT_VERSION.tar.gz \
  && tar xzf vsts-agent-linux-x64-$AGENT_VERSION.tar.gz \
  && rm -f vsts-agent-linux-x64-$AGENT_VERSION.tar.gz \
  && ./bin/installdependencies.sh \
  && chown -R agent:agent /agent \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
USER agent
ENTRYPOINT ["/bin/bash", "-c", "./config.sh --unattended --url $AZDO_URL --auth pat --token $AZDO_TOKEN --pool $AZDO_POOL --agent $AZDO_AGENT_NAME --acceptTeeEula --replace && unset AZDO_TOKEN && ./run.sh"]