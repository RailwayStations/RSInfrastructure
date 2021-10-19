Railway-Stations.org Infrastructure setup with Ansible

Docker setup via ansible inspired by https://github.com/nickjj/ansible-docker

## Docker installation

Setup Docker and docker compose via `docker.yml` playbook.

## Wireguard

Setup wireguard between railway-stations.org and the monitoring server.

Install the `githubixx.ansible_role_wireguard` role via ansible galaxy first:

```sh
ansible-galaxy install githubixx.ansible_role_wireguard
```

```sh
ansible-playbook -i hosts.yml -l prod wireguard.yml --ask-become-pass --ask-vault-pass
```


## Monitoring

Setup of Prometheus and Grafana for railway-stations.org.

Docker compose files inspired by: https://github.com/stefanprodan/dockprom

### Run

Full production setup

```sh
ansible-playbook -i hosts.yml -l prod monitoring.yml --ask-become-pass --ask-vault-pass
```

Setup only the railwaystations server

```sh
ansible-playbook -i hosts.yml -l railwaystations monitoring.yml --ask-become-pass --ask-vault-pass
```
