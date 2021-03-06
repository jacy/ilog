#!/bin/bash

VERSION=${1}
MODULES=`ls -1 src/*.erl | awk -F[/.] '{ print "\t\t" $2 }' | sed '$q;s/$/,/g'`

cat > ebin/log_roller.app << EOF
{application, log_roller, [
    {description, "log_roller"},
    {vsn, "${VERSION}"},
    {modules, [
${MODULES}
    ]},
    {registered, []},
    {mod, {log_roller, []}},
    {applications, [kernel, stdlib]}
]}.
EOF