#!/bin/bash

set -e

if [ -v PASSWORD_FILE ]; then
    PASSWORD="$(< $PASSWORD_FILE)"
fi

DB_ARGS=()
function check_config() {
    param="$1"
    value="$2"
    if grep -q -E "^\s*\b${param}\b\s*=" "$ODOO_RC" ; then       
        value=$(grep -E "^\s*\b${param}\b\s*=" "$ODOO_RC" |cut -d " " -f3|sed 's/["\n\r]//g')
    fi;
    if [[ "$param" == "db_name" ]]; then
        DB_ARGS+=("--database")
    else
        DB_ARGS+=("--${param}")
    fi
    DB_ARGS+=("${value}")
}
check_config "db_host" "$HOST"
check_config "db_port" "$PORT"
check_config "db_user" "$USER"
check_config "db_password" "$PASSWORD"
check_config "db_name" "$DATABASE_NAME"

ODOO_ARGS=()
if [[ -n "$ODOO_INITIAL_MODULES" ]]; then
    ODOO_ARGS+=("--init")
    ODOO_ARGS+=("${ODOO_INITIAL_MODULES}")
fi

case "$1" in
    -- | odoo)
        shift
        if [[ "$1" == "scaffold" ]] ; then
            exec odoo "$@"
        else
            exec odoo "$@" "${DB_ARGS[@]}" "${ODOO_ARGS[@]}"
        fi
        ;;
    -*)
        exec odoo "$@" "${DB_ARGS[@]}" "${ODOO_ARGS[@]}"
        ;;
    *)
        exec "$@"
esac

exit 1