#!/bin/bash
CURRENT=$(pwd)
find ${CURRENT}/install -name '*.sh' | sort | xargs -I{} "{}"
