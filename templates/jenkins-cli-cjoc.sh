#!/bin/bash
java -jar jenkins-cli.jar -auth @jenkins-user-pw -noCertificateCheck -s {{ cjoc_url }} "$@"
