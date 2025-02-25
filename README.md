# Monitor Sintesis Docker

### Create directory for Storage

```bash
bash bin/create-dirs.sh
```

### Livereload prometheus

```bash
bash bin/reload-prometheus.sh
```

## Environment for Global:

```
PM_PORT=0.0.0.0:9090

GF_SMTP_ENABLED=false
GF_SMTP_HOST=localhost:587
GF_SMTP_USER=your_user
GF_SMTP_PASSWORD=your_password
```

## Environment for Monitor:
