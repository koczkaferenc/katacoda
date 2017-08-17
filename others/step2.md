Sysdig works by capturing system calls being made within the Linux Kernel. This provides Sysdig with unique visibility into how applications are operating even inside containers. Think of wireshark for your entire system, not only network activity, that understands the Docker containers and other orchestration tools that you use.

![Sysdig architecture](https://github.com/katacoda-scenarios/sysdig-scenarios/raw/master/sysdig-container-visibility/assets/sysdig_diagram.png)

Sysdig can operate both on the real-time data from a system, or on previously captured data. This allows users to debug in real-time, but also capture data that can be analyzed later on, when a container doesn't exist anymore, or shared with other members of the team.

## Install and run Sysdig

Sysdig can be installed as a package but also deployed as a container onto the Docker host:

`docker run -it --rm --name=sysdig --privileged=true \
   --volume=/var/run/docker.sock:/host/var/run/docker.sock \
   --volume=/dev:/host/dev \
   --volume=/proc:/host/proc:ro \
   --volume=/boot:/host/boot:ro \
   --volume=/lib/modules:/host/lib/modules:ro \
   --volume=/usr:/host/usr:ro \
   sysdig/sysdig`{{execute}}

Once we run Sysdig, will capture and display information about all system calls and events on the system. This includes timestamp, CPU where it was executed, process name, thread ID, event type and all the relevant arguments.

Run `sysdig -M 3`{{execute}} to see all these events in your Wordpress deployment.

_Note: (-M will finish Sysdig after 3 seconds, otherwise you can finish it with <kbd>CTRL</kbd>+<kbd>C</kbd>)._

All this information can be too much for an individual to process, that's why Sysdig offers filters and aggregation scripts known as chisels.
