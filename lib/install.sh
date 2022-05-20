#!/bin/bash

set -eu

PYTHON_VERSION="${PYTHON_VERSION_USE:-3.8}"
PYTHON_BIN=$(which python${PYTHON_VERSION})

# Are you in virtualenv
INVENV=$(${PYTHON_BIN} -c 'import sys; print ("1" if hasattr(sys, "real_prefix") else "0")')


if [ ! ${INVENV} ]; then
  echo "You already in virtualenv. deactivate first."
  exit 1
fi

PIP_REQUIRE_VIRTUALENV=false ${PYTHON_BIN} -m pip install --user doq

exit 0
