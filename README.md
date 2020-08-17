# cloudbees-team-master-automation
Use this code to deploy a new team master:

1) clone the repo to a machine that has java and the oc binary installed (ie. ocp-bastion was used in ECC)
   git -c http.sslVerify=False clone https://git.example.com/dso-pipeline-tools/cloudbees-team-master-automation.git

2) The following variables need to be defined/adjusted prior to running the code (in cloudbeesTeamMaster.yml)
vars:
  - cloudbeesTarget: human-review ## <-- this is the name of your new team master
  - env: 'ecicd'
  - cloudbees_domain: 'cloudbees.apps.example.com'
  - cjoc_url: 'https://cloudbees-core.cloudbees.apps.example.com/cjoc/'
  - ocp_user: ''
  - ocp_password: ""
  - artifactory_user: ''
  - artifactory_password: ""
  - github_user: ''
  - github_pw: ""
  - artifactory_repo_name: 'cloudbees-plugins'
  - jenkins_admin_password: ''
  - jenkins_user_pw_template: 'jenkins-user-pw'
  - team_master_template: 'team.json'
  - jenkins_templates: ['team.json', 'jenkins-user-pw', 'jenkins-gitlab.xml', 'org.jenkinsci.plugins.workflow.libs.GlobalLibraries.xml', 'jenkins-cli-team-master.sh', 'jenkins-cli-cjoc.sh']
  # uncomment when sonarqube is back up ##- jenkins_templates: ['team.json', 'jenkins-user-pw', 'jenkins-gitlab.xml', 'org.jenkinsci.plugins.workflow.libs.GlobalLibraries.xml', 'jenkins-cli-team-master.sh', 'jenkins-cli-cjoc.sh', 'hudson.plugins.sonar.SonarGlobalConfiguration.xml']
  - jenkins_files: ['jenkins-cli.jar']
  - working_dir: '/tmp'
  - main_cloudbees_namespace: 'cloudbees'
  - artifactory_plugin_dir: '{{ working_dir }}/plugins'
  - artifactory_plugin_name: 'master-plugins.tar.gz'
  - artifactory_plugin_url: 'https://artifactory.apps.example.com/artifactory/cloudbees-plugins/{{ artifactory_plugin_name }}'
  - sonarqube_user: 'admin'
  - sonarqube_pw: ''
  - sonarqube_url: 'https://sonarqube-sonarqube.apps.example.com'
  - github_url: 'https://git.example.com'

2) run the playbook
   ansible-playbook cloudbeesTeamMaster.yml
