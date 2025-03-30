# Railway-Stations.org Infrastructure setup with Ansible

**Repository moved to https://codeberg.org/RailwayStations/RSInfrastructure**

Docker setup via ansible inspired by https://github.com/nickjj/ansible-docker

## Docker installation

Setup Docker and docker compose via `docker.yml` playbook.

```sh
ansible-playbook -i hosts.yml docker.yml --ask-become-pass --ask-vault-pass
```

## RSAPI

Setup RSAPI on railwaystations server:

```sh
ansible-playbook -i hosts.yml rsapi.yml --ask-become-pass --ask-vault-pass
```

## Wireguard

Setup wireguard between railway-stations.org and the monitoring server.

Install the `githubixx.ansible_role_wireguard` role via ansible galaxy first:

```sh
ansible-galaxy install githubixx.ansible_role_wireguard
```

Run playbook to install wireguard on the servers:

```sh
ansible-playbook -i hosts.yml -l prod wireguard.yml --ask-become-pass --ask-vault-pass
```

## Monitoring

Setup Uptime Kuma for railway-stations.org.

Full production setup:

```sh
ansible-playbook -i hosts.yml -l prod monitoring.yml --ask-become-pass --ask-vault-pass
```


### Services

- Caddy: https://caddyserver.com/
- Uptime Kuma: https://github.com/louislam/uptime-kuma

Create matrix access_token for rsapi user:

```sh
curl -X POST --header 'Content-Type: application/json' -d '{
    "identifier": { "type": "m.id.user", "user": "@rsapi:matrix.org" },
    "password": "rsapi-password", "type": "m.login.password"}' 'https://matrix.org/_matrix/client/r0/login'
```
