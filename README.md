## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

- ![Images\ELK_Stack_Deployment.png](Images\ELK_Stack_Deployment.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML file may be used to install only certain pieces of it, such as Filebeat.

- ![YML_Playbooks](/YML_Playbooks/)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load balancers help prevent or reduce DDoS attack impact. They also utilize a WAF (Web Application Firewall) which provides another layer of security. The advantages of using a jumpbox allows admins to deploy updates to machines on the network, allows secure SSH access to manage machines and servers on the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the filesystem and system metrics.
- Monitors log files and their locations. Log events are collected and forwarded to Elasticsearch for indexing.
- Pulls together different performance statistics on servers such as memory, network and CPU at a system level.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name             | Function       | IP Address | Operating System   |
|------------------|----------------|------------|--------------------|
| RedTeamJumpbox   | Gateway        | 10.0.0.4   | Linux Ubuntu 18.04 |
| RedTeamWeb-1     | DVWA Webserver | 10.0.0.5   | Linux Ubuntu 18.04 |
| RedTeamWeb-2     | DVWA Webserver | 10.0.0.6   | Linux Ubuntu 18.04 |
| RedTeamWeb-3     | DVWA Webserver | 10.0.0.7   | Linux Ubuntu 18.04 |
| RedTeamELKserver | Monitoring     | 10.1.0.4   | Linux Ubuntu 18.04 |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- My IP Address

Machines within the network can only be accessed by the jumpbox.
- Jumpbox Public IP: 40.78.134.78
- Jumpbox Private IP: 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name             | Publicly Accessible | Allowed IP Addresses |
|------------------|---------------------|----------------------|
| RedTeamJumpbox   | Yes through SSH: 22 | My IP Address        |
| RedTeamWeb-1     | No                  | 10.0.0.4             |
| RedTeamWeb-2     | No                  | 10.0.0.4             |
| RedTeamWeb-3     | No                  | 10.0.0.4             |
| RedTeamElkserver | No                  | 10.0.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Using Ansible reduces errors while configuring machines. Also, you can configure a single machine or multiple machines at one time.

The playbook implements the following tasks:
- The docker.io file is downloaded and installed.
- Now python3_pip is downloaded and installed. Which allows Docker to install additional modules.
- Virtual Memory need to be increased so the ELK server has sufficient resources to run properly.
- A Docker ELK container will be downloaded and launched.
- Last step is to make sure that Docker and ELK automatically start when the machine is booted up.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

- ![Images\ELK_VM_Docker.PNG](Images\ELK_VM_Docker.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- RedTeamWeb-1 10.0.0.5
- RedTeamWeb-2 10.0.0.6
- RedTeamWeb-3 10.0.0.7

We have installed the following Beats on these machines:
- RedTeamWeb-1 Filebeat, Metricbeat
- RedTeamWeb-2 Filebeat, Metricbeat
- RedTeamWeb-3 Filebeat, Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat: Monitors for changes in log files and their locations. Log events are collected and forwarded to Elasticsearch for indexing and parsing.
- Metricbeat: Collects performance statistics on servers such as memory, network, applications and CPU at a system level. The data can be displayed for easy parsing.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible/roles/install-elk.yml.
- Update the hosts file to include 10.1.0.4 ansible_python_interpreter=/usr/bin/python3
- Run the playbook, and navigate to http://52.170.63.132:5601/app/kibana#/home to check that the installation worked as expected.

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
