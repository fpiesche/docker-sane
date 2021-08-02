# Dockerised SANE network server

## Environment variables

| Variable          | Default            | Notes                     |
|-------------------|--------------------|---------------------------|
| `DATA_PORT_RANGE` | `"6567-6570"`      | The port range to use for the data connection. |
| `ALLOW_HOSTS`     | `"192.168.1.0/24"` | A space-separated list of IP addresses or ranges allowed to use the `saned` server.|
