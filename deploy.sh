##
# deploy.sh - executes ansible playbook to deploy playbooks without external
#             repositories
##

ansible-playbook -i inventory.yml playbooks/deployhere.yml
