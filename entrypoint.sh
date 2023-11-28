#!/bin/sh

# Export the environment variables
export PORT=${PORT}
export HOST=${HOST}

echo "Starting the Flask app on $HOST:$PORT"
# this script is used to run the Flask app using environment variables
flask run --port $PORT --host $HOST
