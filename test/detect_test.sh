#!/bin/sh

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testDetect()
{
  touch ${BUILD_DIR}/pom.xml
  touch ${BUILD_DIR}/package.json
  touch ${BUILD_DIR}/Gruntfile.js

  detect

  assertAppDetected "Grunt and Maven"
}

testNoDetectMissingPomFile()
{
  detect

  assertNoAppDetected
}

testNoDetectPomFileAsDir()
{
  mkdir -p ${BUILD_DIR}/pom.xml

  detect

  assertNoAppDetected
}
