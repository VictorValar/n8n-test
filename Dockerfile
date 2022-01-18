FROM n8nio/n8n
RUN apk add --update python3 py3-pip

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True
# Install production dependencies.
COPY ./requirements.txt /requirements.txt
# RUN pip3 install -r requirements.txt
RUN pip3 install --upgrade pip && \
    pip3 install -r /requirements.txt 
    # pip3 install --upgrade --force-reinstall --no-cache-dir docker-compose && ln -sf /usr/local/bin/docker-compose /usr/bin/docker-compose
# RUN apk update && apk upgrade && apk add docker-compose
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./
WORKDIR /
ENTRYPOINT ["docker-compose","up"]



# RUN apk update -y && \
#     apk upgrade -y && \
#     pip3 install --upgrade pip && \
#     pip3 install -r requirements.txt

# # Copy local code to the container image.
# ENV APP_HOME /app
# WORKDIR $APP_HOME
# COPY . ./