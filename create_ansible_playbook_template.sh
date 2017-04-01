#!/bin/bash

read -p "Set playbook name:" pb_name

read -p "please enter hostname where playbook worked on [localhost]:" host
[ "$host" == "" ] || host=localhost

read -p "please enter roles (multi-role separated by comma):" tmp_roles
roles="roles/{common,$tmp_roles}"

eval "mkdir -p $pb_name/$roles/{tasks,vars}"
eval "touch $pb_name/$roles/{tasks,vars}/main.yml"

# create site.yml 
cat > $pb_name/site.yml<<CAT
---
- name: $pb_name
  host: $host

  roles:
    - common
CAT
for role in $(echo "$tmp_roles"|tr ',' ' ')
do
    echo "    - $role" >> $pb_name/site.yml
done

echo
echo ">>>>> Playbook Template created as below:"
ls -R $pb_name | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'

