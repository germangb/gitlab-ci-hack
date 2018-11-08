#!/bin/bash

result=$1

curl -XPUT http://localhost:8080/api/v4/jobs/$JOB_ID \
    -H "User-Agent: $RUNNER_AGENT" \
    -H "Content-Type: application/json" \
    -H "Job-Token: $JOB_TOKEN" \
    --data "{\"info\":{\"name\":\"gitlab-runner\",\"version\":\"11.4.2\",\"revision\":\"cf91d5e1\",\"platform\":\"linux\",\"architecture\":\"amd64\",\"executor\":\"shell\",\"shell\":\"bash\",\"features\":{\"variables\":true,\"image\":false,\"services\":false,\"artifacts\":true,\"cache\":true,\"shared\":true,\"upload_multiple_artifacts\":true,\"session\":true,\"terminal\":true}},\"token\":\"$JOB_TOKEN\",\"state\":\"$result\"}"

    #--data "{\"info\":{\"name\":\"gitlab-runner\",\"version\":\"11.4.2\",\"revision\":\"cf91d5e1\",\"platform\":\"linux\",\"architecture\":\"amd64\",\"executor\":\"shell\",\"shell\":\"bash\",\"features\":{\"variables\":true,\"image\":false,\"services\":false,\"artifacts\":true,\"cache\":true,\"shared\":true,\"upload_multiple_artifacts\":true,\"session\":true,\"terminal\":true}},\"token\":\"$JOB_TOKEN\",\"state\":\"$JOB_RESULT\"}"

#PUT /api/v4/jobs/10 HTTP/1.1
#Host: gitlab
#User-Agent: gitlab-runner 11.4.2 (11-4-stable; go1.8.7; linux/amd64)
#Content-Length: 368
#Content-Type: application/json
#Accept-Encoding: gzip
#
#{"info":{"name":"gitlab-runner","version":"11.4.2","revision":"cf91d5e1","platform":"linux","architecture":"amd64","executor":"shell","shell":"bash","features":{"variables":true,"image":false,"services":false,"artifacts":true,"cache":true,"shared":true,"upload_multiple_artifacts":true,"session":true,"terminal":true}},"token":"fzkFsfq2bsyjf6zk7yrv","state":"success"}

#HTTP/1.1 200 OK
#Server: nginx
#Date: Wed, 07 Nov 2018 20:13:54 GMT
#Content-Type: application/json
#Content-Length: 4
#Connection: keep-alive
#Cache-Control: max-age=0, private, must-revalidate
#Etag: W/"b326b5062b2f0e69046810717534cb09"
#Vary: Origin
#X-Content-Type-Options: nosniff
#X-Frame-Options: SAMEORIGIN
#X-Request-Id: d897a345-2b78-43a7-b2e5-4214223b20de
#X-Runtime: 0.034866
#Strict-Transport-Security: max-age=31536000
#
#true
