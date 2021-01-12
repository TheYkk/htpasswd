# Copyright 2020 Kaan Karakaya
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
FROM httpd:2.4-alpine as passwd

FROM alpine:3.12

RUN apk add apr-util

LABEL maintainer="Kaan Karakaya <yusufkaan142@gmail.com>"

COPY --from=passwd /usr/local/apache2/bin/htpasswd /htpasswd

ENTRYPOINT ["/htpasswd", "-n"]