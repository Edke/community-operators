FROM registry.redhat.io/openshift4/ose-operator-registry:latest

COPY nested-manifests manifests
RUN /bin/initializer -o ./bundles.db

# RUN chgrp -R 0 /registry && \
    # chgrp -R 0 /dev && \
    # chmod -R g+rwx /registry && \
    # chmod -R g+rwx /dev
# 
# This image doesn't need to run as root user
# 

ENTRYPOINT ["/usr/bin/registry-server"]
CMD ["--database", "/registry/bundles.db"]
