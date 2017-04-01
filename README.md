# ace-playbook
A ansible playbook to deploy development environment automatically

# About the create_ansible_playbook_template.sh
It's used to create a simple directory layout following the rule of [playbooks_best_practices](http://docs.ansible.com/ansible/playbooks_best_practices.html)
``` bash
$./create_ansible_playbook_template.sh
Set playbook name:ace_playbook
please enter hostname where playbook worked on [localhost]:
please enter roles (multi-role separated by comma):git,python

>>>>> Playbook Template created as below:
ace_playbook
|____roles
| |____common
| | |____tasks
| | | |____main.yml
| | |____vars
| | | |____main.yml
| |____git
| | |____tasks
| | | |____main.yml
| | |____vars
| | | |____main.yml
| |____python
| | |____tasks
| | | |____main.yml
| | |____vars
| | | |____main.yml
|____site.yml
|____production
```

# Usage
please refer to http://docs.ansible.com/ansible/playbooks_best_practices.html#what-this-organization-enables-examples
