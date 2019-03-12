FROM nginx

RUN apt-get update && apt-get install git -y
RUN echo "Hello World!"
