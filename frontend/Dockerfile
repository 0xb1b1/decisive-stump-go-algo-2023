# Environemnt to install flutter and build Web
FROM debian:bookworm AS build

# Install system packages/dependencies
# hadolint ignore=DL3008
RUN apt-get update &&\
    apt-get install -y --no-install-recommends \
    curl git unzip ca-certificates

# Define build variables
ARG FLUTTER_SDK=/usr/local/flutter
ARG FLUTTER_VERSION=3.10.5
ARG APP=/app/

# Change workdir to SDKs dir
WORKDIR /usr/local/flutter

# Clone Flutter SDK
RUN git clone https://github.com/flutter/flutter.git ${FLUTTER_SDK}

# change dir to current flutter folder and make a checkout to the specific version
RUN git fetch && git checkout $FLUTTER_VERSION

# setup the flutter path as an enviromental variable
ENV PATH="$FLUTTER_SDK/bin:$FLUTTER_SDK/bin/cache/dart-sdk/bin:${PATH}"

# Start to run Flutter commands
# doctor to see if all was installes ok
RUN flutter doctor -v

# Set workdir
WORKDIR ${APP}

# Copy source code to the source dir
COPY . .

# Run build: 1 - clean, 2 - pub get, 3 - build web
RUN flutter clean && \
    flutter pub get && \
    flutter build web


#########################
# Production Docker Image
FROM nginx:1.25.3-alpine

# Copy the built Flutter Web package
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose and run nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
