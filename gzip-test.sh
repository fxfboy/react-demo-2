#!/bin/bash
curl 'http://localhost/v2/5cd80c52300000d52274cd18' --silent --write-out "gzip disabled: %{size_download}\n" --output /dev/null
curl 'http://localhost/v2/5cd80c52300000d52274cd18' --silent -H "Accept-Encoding: gzip,deflate" --write-out "gzip enabled: %{size_download}\n" --output /dev/null 