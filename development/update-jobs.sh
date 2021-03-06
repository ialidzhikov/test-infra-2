#!/usr/bin/env bash

readonly DEVELOPMENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

usage () {
    echo "Usage: \$ ${BASH_SOURCE[1]} /path/to/jobs/directory"
    exit 1
}

readonly JOBS_PATH="${1}"
if [[ -z "${JOBS_PATH}" ]]; then
    usage
fi

readonly UPLOADER="cmd/configuploader/main.go"
readonly CONFIG="${HOME}/.kube/config"

cd "${DEVELOPMENT_DIR}/tools" || exit 1
go run "${UPLOADER}" --kubeconfig "${CONFIG}" --jobs-config-path "${JOBS_PATH}"
