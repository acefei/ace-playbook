# ace-playbook
An [ansible](https://github.com/ansible/ansible) playbook to deploy development environment automatically

# Playbook
It is recommended to look at [Example Playbooks](https://github.com/ansible/ansible-examples) while reading along with the [playbook documentation](http://docs.ansible.com/ansible/playbooks.html#playbooks). 

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
Please refer to http://docs.ansible.com/ansible/playbooks_best_practices.html#what-this-organization-enables-examples

# Bugs
I found there are some bugs with the latest ansible, so I recommended to use ansible==2.1.x.x
