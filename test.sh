#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

readonly logfile=test.log
readonly namelen="$1"
readonly name=$(yes x | tr -d '\n' | head -c "$namelen")

sqitch deploy --set=name="$name" --verify 2> >(tee    "$logfile")
sqitch revert --set=name="$name" -y       2> >(tee -a "$logfile")

if grep -q 'identifier ".*" will be truncated to ".*"' "$logfile"
then
  echo "error: detected truncated identifiers, see $logfile" >&2
  exit 1
fi
