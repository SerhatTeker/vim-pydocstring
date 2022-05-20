#!/bin/bash

set -eu

PYTHON_VERSION="${PYTHON_VERSION_USE:-3.8}"
PYTHON_BIN=$(which python${PYTHON_VERSION})

# Are you in virtualenv
INVENV=$(${PYTHON_BIN} -c 'import sys


def is_venv():
    return hasattr(sys, "real_prefix") or (
        hasattr(sys, "base_prefix") and sys.base_prefix != sys.prefix
    )

print(is_venv())
')

if [ ${INVENV} == "True" ]; then
    echo "You already in virtualenv, deactivate first."
    exit 1
fi

PIP_REQUIRE_VIRTUALENV=false ${PYTHON_BIN} -m pip install --user doq

exit 0
