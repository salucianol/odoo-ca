ARG ODOO_VERSION
ARG ODOO_EDITION
ARG ODOO_ENVIRONMENT

FROM odoo:${ODOO_VERSION:-16.0}

LABEL com.accounterprise.owner="Koala Systems <sa.lassis@gmail.com>" \
    com.accounterprise.author="Samuel Luciano <sa.lassis@gmail.com>" \
    version=1.0 \
    description="This image has all the required changes to Odoo\
        in order to be operated in Canada according to the laws\
        (c) 2024 Copyright. This image is distributed under the\
         GNU General Public License. See LICENSE file for more information."

ENV ODOO_EDITION=${ODOO_EDITION:-ce} \
    ODOO_ENVIRONMENT=${ODOO_ENVIRONMENT:-dev} \
    DATABASE_NAME= \
    ODOO_CONFIG_FILE=/etc/odoo/odoo.conf\
    ODOO_INITIAL_MODULES= \
    ODOO_UPDATE_MODULES= \
    USE_DEFAULT_ADDONS_PATH=y \
    MAX_RETRIES= \
    SLEEP_TIME=

COPY odoo-entrypoint.sh /
# COPY remove_modules_on_odoo_version.sh /
# COPY test_database_settings.py /usr/local/bin/test_database_settings.py
COPY third_party_addons/ /mnt/extra-addons
# COPY conf/odoo.conf /etc/odoo/

USER root

RUN [ "chmod", "-R", "777", "/etc/odoo" ]
# RUN /remove_modules_on_odoo_version.sh ${ODOO_VERSION}
RUN [ "pip3", "install", "python-barcode" ]

EXPOSE 8069 8072
VOLUME [ "/var/lib/odoo" ]

USER odoo

ENTRYPOINT [ "/bin/bash", "odoo-entrypoint.sh" ]
CMD [ "odoo" ]