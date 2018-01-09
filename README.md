# EasyLogin On Docker

*Note: Please, be aware that docker 
deployment of EasyLogin isn't supported for production purpose. Use this setup only for testing and development.*

EasyLogin on Docker is possible via multiple containers:

- easylogin/easyloginserver: API server built automatically by Docker Cloud after each commit on EasyLoginServer's github, support tags for version, latest and develop;
- easylogin/easyloginwebadmin: static web server for JS files built automatically by Docker Cloud after each commit on EasyLoginWebAdmin's github, support tags for version, latest and develop;
- easylogin/easyloginldap: LDAP gateway built automatically by Docker Cloud after each commit on EasyLoginWebAdmin's github, support tags for version, latest and develop;
- couchdb:1.7.1: official CouchDB container, using 1.7.1 since we experienced some unexpteced behavior with last release of 2.1.x.

All those containers also need a frontend to work. The frontend need to be custom to each deployment since it include certificates for HTTPS and settings regarding the number of API workers. 

This frontend is defined by the current git repository. 

To build the frontend container, you need to add your nodes certificates at the root of this repository as `https.crt` and `https.key`.

Once ready to build, use `docker-compose up --build` to build your frontend and deploy all needed containers correctly.

You can specify `TAG=develop` as an environmental variable to specify if you want to deploy a development release of EasyLogin.

By default, EasyLogin On Docker listen in HTTPS on TCP 6443 and LDAP (not encrypted) on TCP 6389.

You can edit `docker-compose.yml` to ajust this ports.