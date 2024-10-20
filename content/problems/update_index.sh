#!/bin/bash

SCRIPT_DIR=$(readlink -f $(dirname $0))

cd $SCRIPT_DIR

cat <<EOF > index.md
---
title: problems
---

EOF

ls *.md | grep -vw index.md | sort -n | awk '{print "\[\[" $1 "\]\]\n"}' >> index.md
