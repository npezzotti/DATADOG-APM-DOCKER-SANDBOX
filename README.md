# Sending Traces to the Docker Agent From the Installed Host

## The setup script has already installed Docker, python, pip, ddtrace, and flask. A basic web server returning "Hello world" has been copied into the home directory.

These are the remaining steps:

1. Run the following command to start the Docker Agent with APM enabled:

```

docker run -d -v /var/run/docker.sock:/var/run/docker.sock:ro \
              -v /proc/:/host/proc/:ro \
              -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
              -p 127.0.0.1:8126:8126/tcp \
              -e DD_API_KEY=<YOUR_API_KEY> \
              -e DD_APM_ENABLED=true \
              datadog/agent:latest

```

2. Run `ddtrace-run python app.py` from the home directory to start the server with the trace agent.

3. In a new terminal window, run curl `http://127.0.0.1:5050` a few times and navigate to the traces page in your account to see traces appearing.

# This demonstrates how you can send traces to the Docker Agent from a non-containerized application running on the installed host.
