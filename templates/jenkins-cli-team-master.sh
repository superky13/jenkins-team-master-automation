#!/bin/bash
java -jar jenkins-cli.jar -auth @jenkins-user-pw -noCertificateCheck -s https://teams-{{ cloudbeesTarget }}.{{ cloudbees_domain }}/teams-{{ cloudbeesTarget }}/ "$@"
