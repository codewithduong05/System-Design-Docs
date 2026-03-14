#!/bin/bash

BRANCH="master"
FILE="daily-log.txt"

for day in {17..23}
do
  DATE="2026-03-$day"

  echo "Commit for $DATE" >> $FILE

  git add $FILE

  GIT_AUTHOR_DATE="$DATE 10:00:00" \
  GIT_COMMITTER_DATE="$DATE 10:00:00" \
  git commit -m "update log $DATE"

done

git push origin $BRANCH