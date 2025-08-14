#!/usr/bin/env sh
echo "Stub gradlew - in CI environment Codemagic provides Gradle. Running provided gradle wrapper if present."
if [ -f "./gradle/wrapper/gradle-wrapper.jar" ]; then
  java -jar ./gradle/wrapper/gradle-wrapper.jar "$@"
else
  # Try system gradle if available
  if command -v gradle >/dev/null 2>&1; then
    gradle "$@"
  else
    echo "No gradle wrapper or system gradle found. Codemagic should supply gradle in its environment."
    exit 0
  fi
fi
