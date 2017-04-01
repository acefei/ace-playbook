#!/bin/bash

# following the http://docs.ansible.com/ansible/playbooks_best_practices.html#directory-layout to create directory layout

read -p "Set playbook name [ace_playbook]:" pb_name
[ "$pb_name" == "" ] && pb_name=ace_playbook

read -p "please enter hostname where playbook worked on [localhost]:" host
[ "$host" == "" ] && host=localhost

read -p "please enter roles (multi-role separated by comma) [git,vim]:" tmp_roles
[ "$tmp_roles" == "" ] && tmp_roles='git,vim'
roles="roles/{common,$tmp_roles}"

#------ start to create diretory layout
eval "mkdir -p $pb_name/$roles/{tasks,vars}"
eval "touch $pb_name/$roles/{tasks,vars}/main.yml"

# create site.yml 
site=$pb_name/site.yml
cat > $site<<CAT
---
- name: $pb_name
  hosts: $host

  roles:
CAT

roles_dir=$pb_name/roles
for role in $(cd $roles_dir;echo *)
do
    echo "    - $role" >> $site
done

# create production file
production=$pb_name/production
[ -f $production ] && cp $production ${production}.bak
cat > $production<<CAT
# About the sample, please refer to /etc/ansible/hosts.
CAT

if [ "$host" == "localhost" ];then
    echo "localhost ansible_connection=local" >> $production
else
    echo $host >> $production
fi

# create group_vars
group_vars=$pb_name/group_vars
group_vars_all=$pb_name/group_vars/all
mkdir -p $group_vars
[ -f $group_vars_all ] && ${group_vars_all}.bak
cat > $group_vars_all<<CAT
proxy_env:
  http_proxy: http://proxy.example.com:8080
  https_proxy: https://proxy.example.com:8080
CAT

echo
echo ">>>>> Playbook Template created as below:"
find $pb_name -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'

