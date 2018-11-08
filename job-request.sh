#!/bin/bash

curl -XPOST http://localhost:8080/api/v4/jobs/request \
    -H "User-Agent: $RUNNER_AGENT" \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    --data "{\"info\":{\"name\":\"gitlab-runner\",\"version\":\"11.4.2\",\"revision\":\"cf91d5e1\",\"platform\":\"linux\",\"architecture\":\"amd64\",\"executor\":\"shell\",\"shell\":\"bash\",\"features\":{\"variables\":true,\"image\":false,\"services\":false,\"artifacts\":true,\"cache\":true,\"shared\":true,\"upload_multiple_artifacts\":true,\"session\":true,\"terminal\":true}},\"token\":\"$RUNNER_TOKEN\",\"last_update\":\"3f55cec3cb9b07c42b5ca85c71471a0c\"}"

#POST /api/v4/jobs/request HTTP/1.1
#Host: gitlab
#User-Agent: gitlab-runner 11.4.2 (11-4-stable; go1.8.7; linux/amd64)
#Content-Length: 409
#Accept: application/json
#Content-Type: application/json
#Accept-Encoding: gzip
#
#{"info":{"name":"gitlab-runner","version":"11.4.2","revision":"cf91d5e1","platform":"linux","architecture":"amd64","executor":"shell","shell":"bash","features":{"variables":true,"image":false,"services":false,"artifacts":true,"cache":true,"shared":true,"upload_multiple_artifacts":true,"session":true,"terminal":true}},"token":"b39c4771b33414c6ebe857ad640b8d","last_update":"3f55cec3cb9b07c42b5ca85c71471a0c"}

#HTTP/1.1 201 Created
#Server: nginx
#Date: Wed, 07 Nov 2018 20:13:22 GMT
#Content-Type: application/json
#Content-Length: 3961
#Connection: keep-alive
#Cache-Control: max-age=0, private, must-revalidate
#Etag: W/"729d82f94de5d21e510044bdecb53397"
#Gitlab-Ci-Builds-Polling: yes
#Vary: Origin
#X-Content-Type-Options: nosniff
#X-Frame-Options: SAMEORIGIN
#X-Request-Id: ca14fa26-b9d2-4d4a-b278-b8954d8a43c2
#X-Runtime: 0.104876
#Strict-Transport-Security: max-age=31536000
#
#{"id":10,"token":"fzkFsfq2bsyjf6zk7yrv","allow_git_fetch":true,"job_info":{"name":"test","stage":"test","project_id":1,"project_name":"runner"},"git_info":{"repo_url":"http://gitlab-ci-token:fzkFsfq2bsyjf6zk7yrv@gitlab/root/runner.git","ref":"master","sha":"03af6fc71345293cf29de98665cfafad0f5f2dfa","before_sha":"41f5d24f5ad74bdcabb2f01e8ce7d67d0f137f78","ref_type":"branch"},"runner_info":{"timeout":3600,"runner_session_url":null},"variables":[{"key":"CI_PIPELINE_ID","value":"10","public":true},{"key":"CI_PIPELINE_URL","value":"http://gitlab/root/runner/pipelines/10","public":true},{"key":"CI_JOB_ID","value":"10","public":true},{"key":"CI_JOB_URL","value":"http://gitlab/root/runner/-/jobs/10","public":true},{"key":"CI_JOB_TOKEN","value":"fzkFsfq2bsyjf6zk7yrv","public":false},{"key":"CI_BUILD_ID","value":"10","public":true},{"key":"CI_BUILD_TOKEN","value":"fzkFsfq2bsyjf6zk7yrv","public":false},{"key":"CI_REGISTRY_USER","value":"gitlab-ci-token","public":true},{"key":"CI_REGISTRY_PASSWORD","value":"fzkFsfq2bsyjf6zk7yrv","public":false},{"key":"CI_REPOSITORY_URL","value":"http://gitlab-ci-token:fzkFsfq2bsyjf6zk7yrv@gitlab/root/runner.git","public":false},{"key":"CI","value":"true","public":true},{"key":"GITLAB_CI","value":"true","public":true},{"key":"GITLAB_FEATURES","value":"","public":true},{"key":"CI_SERVER_NAME","value":"GitLab","public":true},{"key":"CI_SERVER_VERSION","value":"11.4.5","public":true},{"key":"CI_SERVER_VERSION_MAJOR","value":"11","public":true},{"key":"CI_SERVER_VERSION_MINOR","value":"4","public":true},{"key":"CI_SERVER_VERSION_PATCH","value":"5","public":true},{"key":"CI_SERVER_REVISION","value":"f5536c6","public":true},{"key":"CI_JOB_NAME","value":"test","public":true},{"key":"CI_JOB_STAGE","value":"test","public":true},{"key":"CI_COMMIT_SHA","value":"03af6fc71345293cf29de98665cfafad0f5f2dfa","public":true},{"key":"CI_COMMIT_BEFORE_SHA","value":"41f5d24f5ad74bdcabb2f01e8ce7d67d0f137f78","public":true},{"key":"CI_COMMIT_REF_NAME","value":"master","public":true},{"key":"CI_COMMIT_REF_SLUG","value":"master","public":true},{"key":"CI_BUILD_REF","value":"03af6fc71345293cf29de98665cfafad0f5f2dfa","public":true},{"key":"CI_BUILD_BEFORE_SHA","value":"41f5d24f5ad74bdcabb2f01e8ce7d67d0f137f78","public":true},{"key":"CI_BUILD_REF_NAME","value":"master","public":true},{"key":"CI_BUILD_REF_SLUG","value":"master","public":true},{"key":"CI_BUILD_NAME","value":"test","public":true},{"key":"CI_BUILD_STAGE","value":"test","public":true},{"key":"CI_PROJECT_ID","value":"1","public":true},{"key":"CI_PROJECT_NAME","value":"runner","public":true},{"key":"CI_PROJECT_PATH","value":"root/runner","public":true},{"key":"CI_PROJECT_PATH_SLUG","value":"root-runner","public":true},{"key":"CI_PROJECT_NAMESPACE","value":"root","public":true},{"key":"CI_PROJECT_URL","value":"http://gitlab/root/runner","public":true},{"key":"CI_PROJECT_VISIBILITY","value":"private","public":true},{"key":"CI_PIPELINE_IID","value":"10","public":true},{"key":"CI_CONFIG_PATH","value":".gitlab-ci.yml","public":true},{"key":"CI_PIPELINE_SOURCE","value":"push","public":true},{"key":"CI_COMMIT_MESSAGE","value":"Update build.sh","public":true},{"key":"CI_COMMIT_TITLE","value":"Update build.sh","public":true},{"key":"CI_COMMIT_DESCRIPTION","value":"","public":true},{"key":"CI_RUNNER_ID","value":"2","public":true},{"key":"CI_RUNNER_DESCRIPTION","value":"my-runner","public":true},{"key":"CI_RUNNER_TAGS","value":"my-tag","public":true},{"key":"GITLAB_USER_ID","value":"1","public":true},{"key":"GITLAB_USER_EMAIL","value":"admin@example.com","public":true},{"key":"GITLAB_USER_LOGIN","value":"root","public":true},{"key":"GITLAB_USER_NAME","value":"Administrator","public":true}],"steps":[{"name":"script","script":["echo Hello world!","bash build.sh"],"timeout":3600,"when":"on_success","allow_failure":false}],"image":null,"services":[],"artifacts":null,"cache":[null],"credentials":[],"dependencies":[],"features":{"trace_sections":true}}
