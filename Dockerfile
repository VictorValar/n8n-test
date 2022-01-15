FROM n8nio/n8n
RUN apk add --update python3 py3-pip

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True
# Install production dependencies.
COPY ./requirements.txt /requirements.txt
# RUN pip3 install -r requirements.txt
RUN apk update -y && \
    apk upgrade -y && \
    pip3 install --upgrade pip && \
    pip3 install -r /requirements.txt

COPY ./app /app
WORKDIR /app



# RUN apk update -y && \
#     apk upgrade -y && \
#     pip3 install --upgrade pip && \
#     pip3 install -r requirements.txt

# # Copy local code to the container image.
# ENV APP_HOME /app
# WORKDIR $APP_HOME
# COPY . ./