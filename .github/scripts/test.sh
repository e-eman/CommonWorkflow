#!/bin/bash

# repo_value=$1
# TESTPAT=$2

# echo "The token is"
# echo $GITHUB_TOKEN
# echo "TESTPAT: $TESTPAT"
# #echo "TOKEN: $pat_token"
# echo "REPO: $repo_value"


TOKEN=$1
COMMENTFIELD=$2
REPO=$3
PR_NUMBER=$4
GH_TOKEN=$5

echo "TOKEN: $TOKEN"
echo "REPO: $REPO"
echo "Comment: $COMMENTFIELD"
echo "PR_NUMBER: $PR_NUMBER"
echo "GITHUB_TOKEN: $GH_TOKEN"

JSONPAYLOAD=$(jq -n --arg comment "$COMMENTFIELD" '{"body": $comment}')

curl -L \
-X POST \
-H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer $TOKEN" \
-H "X-GitHub-Api-Version: 2022-11-28" \
"https://api.github.com/repos/$REPO/issues/$PR_NUMBER/comments" \
-d "$JSONPAYLOAD"
