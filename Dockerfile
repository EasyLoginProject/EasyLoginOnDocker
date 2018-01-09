FROM nginx

COPY default.conf /etc/nginx/conf.d/default.conf
COPY https.crt /etc/nginx/https.crt
COPY https.key /etc/nginx/https.key

