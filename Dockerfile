# 1. Base Image
FROM alpine

# 2. Copy our existing application to the image
COPY . /mnt

# 3. Run some script shell to install some depenecies
RUN apk update && \
    apk add nodejs && \
    apk add npm && \
    apk add build-base && \
    apk add python && \
    cd /mnt && \
    npm install && \
    apk del npm && \
    apk del build-base && \
    apk del python;

# 4. Define a shell command that will be executed at run time
CMD ["/bin/sh", "-c", "cd /mnt; node index.js"]