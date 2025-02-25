# Monitor Sintesis Docker

## Create directory for Storage

```bash
bash bin/create-dirs.sh
```

## Livereload prometheus

```bash
bash bin/reload-prometheus.sh
```

## Environment for Global:

```
PM_PORT=0.0.0.0:9090

MONITOR_PORT=0.0.0.0:8080
MONITOR_ENV_FILE=./monitor.env

GF_SMTP_ENABLED=false
GF_SMTP_HOST=localhost:587
GF_SMTP_USER=your_user
GF_SMTP_PASSWORD=your_password
```

## Environment for Monitor:

Create a **monitor.env** file, and follow the next properties:

```
APPLICATION_ENABLE_SUCCESS_LOG=true
APPLICATION_SLEEP_IN_MS=5000
APPLICATION_CONNECT_TIMEOUT_IN_MS=1000
APPLICATION_READ_TIMEOUT_IN_MS=1000

APPLICATION_HEALTH_CHECKS[0]_CODE=<YOUR_CODE>
APPLICATION_HEALTH_CHECKS[0]_DESCRIPTION=<YOUR_DESCRIPTION>
APPLICATION_HEALTH_CHECKS[0]_URL=<YOUR_URL>
```

Example:

```
APPLICATION_HEALTH_CHECKS[0]_CODE=pgw_account_ms
APPLICATION_HEALTH_CHECKS[0]_DESCRIPTION=PGW Account MS
APPLICATION_HEALTH_CHECKS[0]_URL=https://test.sintesis.com.bo/pasarelapagos-msapi/account/management/health
APPLICATION_HEALTH_CHECKS[1]_CODE=pgw_payment_ms
APPLICATION_HEALTH_CHECKS[1]_DESCRIPTION=PGW Payment MS
APPLICATION_HEALTH_CHECKS[1]_URL=https://test.sintesis.com.bo/pasarelapagos-msapi/payment/management/health
APPLICATION_HEALTH_CHECKS[2]_CODE=pgw_cybersource_ms
APPLICATION_HEALTH_CHECKS[2]_DESCRIPTION=PGW Cybersource MS
APPLICATION_HEALTH_CHECKS[2]_URL=https://test.sintesis.com.bo/pasarelapagos-msapi/cybersource/management/health
APPLICATION_HEALTH_CHECKS[3]_CODE=pgw_tigomoney_ms
APPLICATION_HEALTH_CHECKS[3]_DESCRIPTION=PGW TigoMoney MS
APPLICATION_HEALTH_CHECKS[3]_URL=https://test.sintesis.com.bo/pasarelapagos-msapi/tigomoney/management/health
APPLICATION_HEALTH_CHECKS[4]_CODE=pgw_bcp_ms
APPLICATION_HEALTH_CHECKS[4]_DESCRIPTION=PGW BCP MS
APPLICATION_HEALTH_CHECKS[4]_URL=https://test.sintesis.com.bo/pasarelapagos-msapi/bcp/management/health
APPLICATION_HEALTH_CHECKS[5]_CODE=pgw_bnb_ms
APPLICATION_HEALTH_CHECKS[5]_DESCRIPTION=PGW BNB MS
APPLICATION_HEALTH_CHECKS[5]_URL=https://test.sintesis.com.bo/pasarelapagos-msapi/bnb/management/health
APPLICATION_HEALTH_CHECKS[6]_CODE=pgw_suite_ms
APPLICATION_HEALTH_CHECKS[6]_DESCRIPTION=PGW Suite MS
APPLICATION_HEALTH_CHECKS[6]_URL=https://test.sintesis.com.bo/pasarelapagos-msapi/paymentcorporate/management/health
```
