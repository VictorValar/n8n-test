FROM n8nio/n8n
RUN apk add --update python3 py3-pip

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True
# Install production dependencies.
COPY ./requirements.txt /requirements.txt 
RUN apt-get update -y && \
    apt-get upgrade -y && \
    pip install --upgrade pip && \
    pip install -r requirements.txt
# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./