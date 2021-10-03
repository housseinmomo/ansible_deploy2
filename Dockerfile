FROM nginx:latest

RUN sed -i 's/nginx/wano/g' /usr/share/nginx/html/index.html

RUN mv /usr/share/nginx/html/index.html ./index.html

EXPOSE 80