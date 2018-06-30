
#
# Checks to see if a tunnel is up; if not, creates it.
#

HostA=$1
PortA=$2
USAGE="Usage: $0 <host_to_connect_to> <port_number_to_return_on>"

if [[ "x$HostA" == "x" -o "x$PortA" == "x" ]]; then
    echo $USAGE
    exit 1
fi

createTunnel() {
    /usr/bin/ssh -f -N -R $PortA:localhost:22 -L19922:$HostA:22 $HostA
    if [[ $? -eq 0 ]]; then
        echo Tunnel to $HostA (at 127.0.0.1:$PortA) created successfully
    else
        echo An error occurred creating a tunnel to $HostA. Return code: $?
    fi
}

/usr/bin/ssh -p 19922 localhost ls > /dev/null
if [[ $? -ne 0 ]]; then
    echo Creating new tunnel connection to $HostA
    createTunnel
fi
