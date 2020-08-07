FROM lambci/lambda:provided

# Copy things we installed to the final image
COPY src/php-fpm.conf /opt/bref/etc/php-fpm.conf
