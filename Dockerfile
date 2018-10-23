# Copyright (c) 2016-present Sonatype, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM       sonatype/nexus3

MAINTAINER guox <guox@goodrain.com>

USER root

ENV TZ=Asia/Shanghai

COPY memset.sh /

RUN sed -i -e "2 a. /memset.sh" \
           -e '3 aINSTALL4J_ADD_VM_PARAMS="${JAVA_OPTS} -Djava.util.prefs.userRoot=${NEXUS_DATA}/javaprefs"' ${SONATYPE_DIR}/start-nexus-repository-manager.sh

VOLUME ["${NEXUS_DATA}"]

CMD ["sh", "-c", "${SONATYPE_DIR}/start-nexus-repository-manager.sh"]



