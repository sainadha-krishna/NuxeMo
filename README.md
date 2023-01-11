# NuxeMo
Ready to go docker-compose to spin up a single nuxeo instance (LTS-2023) backed by mongodb

**This is generated by using <a href="https://github.com/bdelbosc/nuxeo-stacks">Nuxeo Stacks</a>


**Pre requisites:**

1. [Docker and Docker compose](https://docs.docker.com/compose/install/) installed in the system

2. Updated host file: **/etc/hosts** (only in mac)

      127.0.0.1 nuxeo.docker.localhost

      127.0.0.1 nuxeo-node.docker.localhost

      127.0.0.1 elastic.docker.localhost

      127.0.0.1 traefik.docker.localhost
      
      
      
**Personalization:**

Update the **NUXEO_CLID** environment variable in **docker-compose.yml** file with the personal clid

**Adding custom packages:**

Custom add-on package zips must be placed under the data/addons folder. Please remove the **/var/lib/addons/*.zip** from **NUX_PACKAGES** environment variable in **docker-compose.yml** file if there are none


**Editing config:**

**nuxeo/nuxeo.conf** can be edited as desired to update any configurations


**Running and accessing nuxeo:**

Command to bring the compose up:

            #change to current nuxemo directory which contains the docker-compose.yml file
            cd nuxemo
            #bring the docker compose up
            docker-compose up

Launched instance can be accessed in browser via the URL: **http://nuxeo.docker.localhost**


To bring down the compose:

            docker-compose down -v
