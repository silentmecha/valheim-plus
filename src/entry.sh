#!/bin/bash
# NOTE: Without the wait the script exists before giving the server time to properly stop
function clean_up {
	kill -SIGINT $(pidof "valheim_server.x86_64")
	wait
	kill -SIGINT $serverPID
}

# Setup trap
trap "clean_up" SIGINT SIGTERM

cd ${STEAMAPPDIR}
# Add in Password length check
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.

./start_server_bepinex.sh -name "${SERVER_NAME}" -port ${PORT} -world "${WORLD}" -password "${SERVER_PASSWORD}" & serverPID=$!

wait $serverPID

exit 0
