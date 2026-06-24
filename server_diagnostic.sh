
echo "====================="
echo "Linux Server Diagnostic Script"
echo "====================="

SERVER_IP="192.168.1.100"

echo "[1] Connectivity Test"
ping -c 4 $SERVER_IP

echo "[2] Network Configuration"
ip addr show
ip route

echo "[3] Firewall Status"

if command -v ufw >/dev/null 2>&1; then
    sudo ufw status verbose
fi

if command -v firewall-cmd >/dev/null 2>&1; then
    sudo firewall-cmd --state
    sudo firewall-cmd --list-all
fi

echo 
echo "[4] Apache Service Status"

sudo systemctl status apache2 --no-pager 2>/dev/null || \ Sudo systemctl status httpd --no-pager 2>/dev/null || echo "Apache service not found." 

echo
echo "[5] Check if Port 80 is Listening"

sudo ss -tuln | grep ':80 ' 

echo
echo "[6] HTTP Response Test"
curl -I http://localhost

echo
echo "[7] Apache Configuration Test"

apachectl configtest 2>/dev/null || httpd -t 2>/dev/null 

echo
echo "[8] Recent Apache Error Logs"

if [ -f /var/log/apache2/error.log ]; then
    tail -20 /var/log/apache2/error.log
elif [ -f /var/log/httpd/error_log ]; then
    tail -20 /var/log/httpd/error_log
else
    echo "Apache error log not found."
fi
