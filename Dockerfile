FROM google/cloud-sdk:357.0.0

RUN export GOOGLE_APPLICATION_CREDENTIALS=/usr/src/app/secret/creds.json

RUN pip3 install pfsense-fauxapi

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install jq

RUN apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

ENTRYPOINT ["/bin/bash", "/usr/src/app/entrypoint.sh"]
