# Linux Web Server Troubleshooting

## Objective
Troubleshoot an unreachable Apache web server at 192.168.1.100 that is returning ERR_CONNECTION_TIMED_OUT.

## Approach
1. Verify network connectivity using ping, traceroute, and curl.
2. Check server network configuration.
3. Review firewall rules and ensure port 80 is allowed.
4. Verify Apache service status.
5. Confirm Apache is listening on port 80.
6. Review Apache and system logs.
7. Identify root cause and apply the appropriate fix.

## Common Root Causes
- Apache service not running.
- Firewall blocking port 80.
- Apache not listening on port 80.
- Incorrect network configuration.
- Apache configuration errors.

## Files
- server.sh : Automated troubleshooting script.
- README.md : Documentation and troubleshooting approach.
