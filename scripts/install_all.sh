#!/bin/bash
CURRENT=$(pwd)
find ${CURRENT}/install -name '*.sh' | grep -v "^X" | sort | xargs -I{} "echo {}; {}"
