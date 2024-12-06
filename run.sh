#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Configuration - Edit these variables according to your needs
RESUME_DIR="$HOME/resume-generator"                     # Change to where you cloned this repo
PORTFOLIO_DIR="$HOME/repos/personal/portfolio-site"     # Change to your portfolio repo path
DOCUMENTS_DIR="$HOME/Documents"                         # Change to your preferred backup location
PORTFOLIO_RESUME_PATH="public"                          # Change based on your portfolio structure
BRANCH_NAME="main"                                      # Change if using different branch

# Create resume PDF
cd "$RESUME_DIR" || exit
md-to-pdf -w resume.md ||
  printf "${YELLOW}\nUpdating Resume in specified locations...\n${NC}"

# Copy to designated locations
cp resume.pdf "$PORTFOLIO_DIR/$PORTFOLIO_RESUME_PATH"
cp resume.pdf "$DOCUMENTS_DIR"

# Update portfolio repository
if [ -d "$PORTFOLIO_DIR/.git" ]; then
  cd "$PORTFOLIO_DIR" || exit
  printf "${GREEN}Committing changes...\n\n${NC}"
  git add "$PORTFOLIO_RESUME_PATH/resume.pdf"
  git commit -m "update: resume $(date +%Y-%m-%d)"
  printf "${GREEN}Pushing to ${BRANCH_NAME}...\n\n${NC}"
  git push origin "$BRANCH_NAME"
  printf "${GREEN}Successfully pushed changes\n${NC}"
else
  printf "${RED}Portfolio directory is not a git repository\n${NC}"
fi

cd "$RESUME_DIR" || exit