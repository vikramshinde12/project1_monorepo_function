#!/bin/bash

for d in */; do
      config="${d}cloudbuild.yaml"
      echo "config is ${config}"
      if [[ ! -f "${config}" ]]; then
        echo "Cloud Build file is not available"
        continue
      fi
      echo "Building ${d: : -1} ... "
      (
        gcloud builds submit ${d: : -1} --config ${config} \
        --substitutions _CLOUDFUNCTION_NAME=${d: : -1}
      ) &
    done

exit 1