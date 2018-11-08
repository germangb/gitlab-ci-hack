#!/bin/bash

# fake log to stream...
JOB_LOG=logs/jenkins.log
JOB_RESULT=success

# runner specific settings
export RUNNER_TOKEN="b39c4771b33414c6ebe857ad640b8d"
export RUNNER_AGENT="gitlab-runner 11.4.2 (11-4-stable; go1.8.7; linux/amd64)"

# poll next job
./job-request.sh > /tmp/job.json
if [ ! -s /tmp/job.json ]; then
    exit 1
fi

export JOB_ID=$(cat /tmp/job.json | grep -Eo '"id":[0-9]+' | cut -d: -f2)
export JOB_TOKEN=$(cat /tmp/job.json | grep -Eo '"token":"([0-Z]|_|-)+"' | cut -d\" -f4)

./job-trace.sh $JOB_LOG
./job-finish.sh $JOB_RESULT

