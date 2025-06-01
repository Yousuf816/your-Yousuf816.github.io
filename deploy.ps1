# Initialize Git repository if not already initialized
if (!(Test-Path .git)) {
    Write-Host "Initializing Git repository..."
    git init
    git add .
    git commit -m "Initial commit"
}

# Check if GitHub CLI is installed
if (!(Get-Command gh -ErrorAction SilentlyContinue)) {
    Write-Host "Installing GitHub CLI..."
    winget install GitHub.cli
}

# Login to GitHub (if not already logged in)
gh auth login

# Create GitHub repository
Write-Host "Creating GitHub repository..."
$repoName = "ai-business-system"
gh repo create $repoName --public --source=. --remote=origin --push

Write-Host "Setting up GitHub Pages..."
# Create a simple workflow file for GitHub Pages
$workflowContent = @"
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: `${{ secrets.GITHUB_TOKEN }}
          publish_dir: .
"@

# Create .github/workflows directory if it doesn't exist
New-Item -ItemType Directory -Force -Path ".github/workflows"
# Save the workflow file
$workflowContent | Out-File -FilePath ".github/workflows/deploy.yml" -Encoding UTF8

# Commit and push the workflow file
git add .github/workflows/deploy.yml
git commit -m "Add GitHub Pages workflow"
git push

Write-Host "Deployment complete! Your site will be available at: https://$env:USERNAME.github.io/$repoName"
Write-Host "Next steps:"
Write-Host "1. Wait a few minutes for GitHub Pages to build your site"
Write-Host "2. Test all functionality on the live site"
Write-Host "3. Share your website URL with others" 