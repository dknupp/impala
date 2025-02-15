#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

# Runs the provided command line with the required environment variables for
# binaries compiled in the dev environment, i.e. LD_LIBRARY_PATH and LD_PRELOAD.
# Also sets CLASSPATH for the embedded JVM started by many binaries.

set -euo pipefail

. "${IMPALA_HOME}/bin/set-classpath.sh"
. "${IMPALA_HOME}/bin/set-ld-library-path.sh"

# LLVM must be on path to symbolise sanitiser stack traces.
export PATH="${IMPALA_TOOLCHAIN}/llvm-${IMPALA_LLVM_VERSION}/bin:${PATH}"
exec "$@"
