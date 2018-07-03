# ansible-playbooks
Ansible playbooks for my own systems.

## Overview
This playbook will result in the following state on a system:
* OpenSSH installed and the server running locally
* An SSH tunnel to the configured ssh gateway system
* A cron job, running as the logged-in user, that checks for the tunnel and
  re-establishes it if necessary.
* [Optional] A public SSH key added for remote access.

## Requirements
1. Ansible >= 2.5
```
$ sudo apt-get update && sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update && sudo apt-get install ansible
```

## Usage

1. Clone this repository: `$ git clone ...`
2. `cd` into ansible-playbooks
3. Edit the file `roles/common/vars/main.yml` and supply the indicated values.
4. Create the vault file `group_vars/vault`
```
$ ansible-vault create group_vars/vault
```
5. Edit the file and fill in values for the following:
```
$ ansible-vault edit group_vars/vault
```
```
---
# File: group_vars/vault.yml

vault_remote_user_pass: "<PASS_FOR_USER>" # Password for remote user used
                                          # for remote ansible setup.
```
6. Run the play:
```
$ ansible-playbook -i hosts site.yml --connection=local --ask-vault-pass
```

