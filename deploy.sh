#!/bin/bash

# Save the current branch
ORIGINAL_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Switch to the beta branch
git checkout release
git pull origin release

# Squash merge
git merge --squash -X theirs $ORIGINAL_BRANCH

# Set git messages
COMMIT_MESSAGE="Deploy $(date)"
COMMIT_DESCRIPTION=""

# Commit the changes
git commit -a -m "$COMMIT_MESSAGE" -m "$COMMIT_DESCRIPTION"

# Push changes to remote
git push

# Switch back to the original branch
git checkout "$ORIGINAL_BRANCH"