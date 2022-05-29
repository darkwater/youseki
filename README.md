# Youseki

Self-hosted new tab page

# Installation

## Docker

```bash
sudo docker run \
    --detach \
    --name youseki \
    --volume /var/lib/youseki:/app/data \
    --publish 127.0.0.1:4300:3000 \
    ghcr.io/darkwater/youseki:latest
```
