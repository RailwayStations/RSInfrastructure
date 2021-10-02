Railway-Stations.org Infrastructure setup with Ansible

## Monitoring

Setup of Prometheus and Grafana via Roles imported from:

- https://github.com/cloudalchemy/ansible-prometheus/
- https://github.com/cloudalchemy/ansible-grafana
- https://github.com/cloudalchemy/ansible-node-exporter

### Run

```sh
ansible-playbook -i hosts monitoring.yml --ask-become-pass --ask-vault-pass
```

