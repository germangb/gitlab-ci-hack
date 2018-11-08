#!/bin/bash

#line="hello world"
#curl -v -XPATCH http://localhost:8080/api/v4/jobs/$JOB_ID/trace \
#   -H "User-Agent: $RUNNER_AGENT" \
#   -H "Job-Token: $JOB_TOKEN" \
#   -H "Content-Type: text/plain" \
#   -H "Content-Range: 91" \
#   --data "$line" \
#   --data $'\n'

#exit 0

JOB_LOG=$1

echo 0 > /tmp/offset
echo > /tmp/buffer

function flush() {
    #echo "[INFO] sending trace - offset = $(cat /tmp/offset)"
    #line break...
    #echo -e "\n" >> /tmp/buffer

    #echo "---------------------------------"
    cat /tmp/buffer

    curl -v -XPATCH http://localhost:8080/api/v4/jobs/$JOB_ID/trace \
        -H "User-Agent: $RUNNER_AGENT" \
        -H "Job-Token: $JOB_TOKEN" \
        -H "Content-Type: text/plain" \
        -H "Content-Range: $(cat /tmp/offset | tr -d '\n')" \
        --data-binary @/tmp/buffer 2> /dev/null > /tmp/trace_req

    new_offset=$(cat /tmp/trace_req | cut -d\" -f2 | cut -d- -f2)

    # line break workaround. Send the \n in a new request. Oh god I suck
#   curl -v -XPATCH http://localhost:8080/api/v4/jobs/$JOB_ID/trace \
#       -H "User-Agent: gitlab-runner 11.4.2 (11-4-stable; go1.8.7; linux/amd64)" \
#       -H "Job-Token: $JOB_TOKEN" \
#       -H "Content-Type: text/plain" \
#       -H "Content-Range: $(echo $new_offset | tr -d '\n')" \
#       --data $'\n' 2> /dev/null > /dev/null
#
#   new_offset=$((new_offset+1))

    #echo "[INFO] response = $(cat /tmp/trace_req)"
    #echo "[INFO] new offset = $new_offset"

    echo $new_offset > /tmp/offset
}

while read line; do
    # line break workaround...
    #echo -e "$line\n" > /tmp/trace

    echo -e "$line" >> /tmp/buffer

    if [ $(du -b /tmp/buffer | awk '{print $1}')  -ge 2048 ];
    then
        flush
        > /tmp/buffer    
        sleep 1
    fi
done < $JOB_LOG

flush

#PATCH /api/v4/jobs/10/trace HTTP/1.1
#Host: gitlab
#User-Agent: gitlab-runner 11.4.2 (11-4-stable; go1.8.7; linux/amd64)
#Content-Length: 288
#Content-Range: 2989-3276
#Content-Type: text/plain
#Job-Token: fzkFsfq2bsyjf6zk7yrv
#Accept-Encoding: gzip
#
#+ for i in '$(seq 32)'
#+ echo 'hello world 25'

#HTTP/1.1 202 Accepted
#Server: nginx
#Date: Wed, 07 Nov 2018 20:13:49 GMT
#Content-Type: application/json
#Content-Length: 8
#Connection: keep-alive
#Cache-Control: no-cache
#Job-Status: running
#Range: 0-3277
#Vary: Origin
#X-Content-Type-Options: nosniff
#X-Frame-Options: SAMEORIGIN
#X-Request-Id: 7e72e54f-87eb-4dca-85e5-94e27396d59d
#X-Runtime: 0.023173
#
#"0-3277"

# We can simply set "Content-Range: 3277" on the next request
