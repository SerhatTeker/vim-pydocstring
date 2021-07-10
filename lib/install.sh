#!/bin/bash

set -eu

# Are you in virtualenv
INVENV=$(python -c 'import sys; print ("1" if hasattr(sys, "real_prefix") else "0")')

if [ ! ${INVENV} ]; then
  echo "You already in virtualenv. deactivate first."
  exit 1
fi

PYTHON_VERSION="${PYTHON_VERSION_USE:-3.8}"
PYTHON_BIN=$(which python${PYTHON_VERSION})
PYTHON=${PYTHON_BIN}

${PYTHON} -m pip install --user doq

exit 0
