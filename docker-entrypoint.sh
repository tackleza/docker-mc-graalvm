#!/bin/bash
set -e

TARGET_UID="${MC_UID:-$(stat -c '%u' /home/mc)}"
TARGET_GID="${MC_GID:-$(stat -c '%g' /home/mc)}"
CURRENT_UID=$(id -u mc 2>/dev/null || echo "1000")

if [ "$TARGET_UID" != "0" ] && [ "$TARGET_UID" != "$CURRENT_UID" ]; then
    existing=$(getent passwd "$TARGET_UID" | cut -d: -f1 || true)
    [ -n "$existing" ] && [ "$existing" != "mc" ] && userdel "$existing"
    existing_grp=$(getent group "$TARGET_GID" | cut -d: -f1 || true)
    [ -n "$existing_grp" ] && [ "$existing_grp" != "mc" ] && groupdel "$existing_grp"
    groupmod -g "$TARGET_GID" mc
    usermod -u "$TARGET_UID" mc
fi

exec runuser -u mc -- "$@"
