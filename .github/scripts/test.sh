#!/bin/bash

# repo_value=$1
# TESTPAT=$2

# echo "The token is"
# echo $GITHUB_TOKEN
# echo "TESTPAT: $TESTPAT"
# #echo "TOKEN: $pat_token"
# echo "REPO: $repo_value"

COMMENTFIELD=$1
JSONPAYLOAD=$(jq -n --arg comment "$COMMENTFIELD" '{"body": $comment}')
PR_NUMBER=$2
TOKEN="$3"
REPO=$4

curl -L \
-X POST \
-H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer $TOKEN" \
-H "X-GitHub-Api-Version: 2022-11-28" \
"https://api.github.com/repos/$REPO/issues/$PR_NUMBER/comments" \
-d "$JSONPAYLOAD"
