# Sending Traces to the Docker Agent From the Installed Host

### This demonstrates how you can send traces to the Docker Agent from a non-containerized application running on the installed host.

### *The setup script will install Docker, python, pip, flask, and ddtrace (tracing library). A basic web server returning "Hello world" has been copied into the home directory.*

These are the remaining steps:

1. Clone this repository, run `vagrant up` and then `vagrant ssh`

2. Run the following command with your API key to start the Docker Agent with APM enabled:

```
docker run -d -v /var/run/docker.sock:/var/run/docker.sock:ro \
              -v /proc/:/host/proc/:ro \
              -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
              -p 127.0.0.1:8126:8126/tcp \
              -e DD_API_KEY=<YOUR_API_KEY> \
              -e DD_APM_ENABLED=true \
              datadog/agent:latest
```

The important part of this command is `-p 127.0.0.1:8126:8126/tcp` which maps the port the agent is listening on for traces to your host, where your application's tracing client will send them *by default*. To make it available from any host, use `-p 8126:8126/tcp` instead.
   
3. Run `ddtrace-run python app.py` from the home directory to start the server with automatic instrumentation.

4. In a new terminal window, run curl `http://127.0.0.1:5050` a few times and navigate to the traces page in your account to see traces appearing.
