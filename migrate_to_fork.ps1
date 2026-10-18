# PowerShell Script to Migrate Code to Forked Repository
# Run this AFTER you fork the IBM repository via GitHub web interface

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Express Book Review - Fork Migration" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

# Check if fork exists
Write-Host "Step 1: Checking if you've forked the repository..." -ForegroundColor Yellow
$forkCheck = Invoke-RestMethod -Uri "https://api.github.com/repos/Sravani-315/expressBookReviews" -ErrorAction SilentlyContinue

if (-not $forkCheck) {
    Write-Host "`n❌ ERROR: Fork not found!" -ForegroundColor Red
    Write-Host "`nPlease fork the repository first:" -ForegroundColor Yellow
    Write-Host "1. Go to: https://github.com/ibm-developer-skills-network/expressBookReviews" -ForegroundColor White
    Write-Host "2. Click 'Fork' button" -ForegroundColor White
    Write-Host "3. Run this script again`n" -ForegroundColor White
    exit
}

Write-Host "✅ Fork found!`n" -ForegroundColor Green

# Clone the fork
Write-Host "Step 2: Cloning your forked repository..." -ForegroundColor Yellow
cd "S:\"
if (Test-Path "S:\expressBookReviews") {
    Write-Host "⚠️  Directory already exists. Removing..." -ForegroundColor Yellow
    Remove-Item -Path "S:\expressBookReviews" -Recurse -Force
}

git clone https://github.com/Sravani-315/expressBookReviews.git
cd expressBookReviews

Write-Host "✅ Clone complete!`n" -ForegroundColor Green

# Copy files
Write-Host "Step 3: Copying your project files..." -ForegroundColor Yellow
$source = "S:\Developing Back-End Apps with Node.js and Express"
$exclude = @('.git', 'node_modules', '*.ps1')

Get-ChildItem -Path $source | Where-Object { 
    $exclude -notcontains $_.Name 
} | ForEach-Object {
    Write-Host "  Copying: $($_.Name)" -ForegroundColor Gray
    Copy-Item -Path $_.FullName -Destination . -Recurse -Force
}

Write-Host "✅ Files copied!`n" -ForegroundColor Green

# Install dependencies
Write-Host "Step 4: Installing dependencies..." -ForegroundColor Yellow
npm install
Write-Host "✅ Dependencies installed!`n" -ForegroundColor Green

# Commit and push
Write-Host "Step 5: Committing and pushing to GitHub..." -ForegroundColor Yellow
git add .
git commit -m "Add complete Express Book Review application with all features"
git push origin main

Write-Host "✅ Code pushed to GitHub!`n" -ForegroundColor Green

# Verify fork
Write-Host "Step 6: Verifying fork status..." -ForegroundColor Yellow
$repo = Invoke-RestMethod -Uri "https://api.github.com/repos/Sravani-315/expressBookReviews"

if ($repo.fork -eq $true) {
    Write-Host "✅ Repository is correctly forked from: $($repo.parent.full_name)`n" -ForegroundColor Green
    
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "SUCCESS! Fork Migration Complete!" -ForegroundColor Green
    Write-Host "========================================`n" -ForegroundColor Cyan
    
    Write-Host "Your forked repository: https://github.com/Sravani-315/expressBookReviews" -ForegroundColor White
    Write-Host "Task 11 URL: https://github.com/Sravani-315/expressBookReviews/blob/main/router/general.js`n" -ForegroundColor White
    
    Write-Host "Next Steps:" -ForegroundColor Yellow
    Write-Host "1. Update task11_github_url.txt with the new URL" -ForegroundColor White
    Write-Host "2. Run: npm start (to test)" -ForegroundColor White
    Write-Host "3. Submit your assignment files`n" -ForegroundColor White
    
} else {
    Write-Host "❌ Warning: Fork status not detected" -ForegroundColor Red
    Write-Host "Please verify manually at: https://github.com/Sravani-315/expressBookReviews`n" -ForegroundColor Yellow
}

Write-Host "Script complete! 🎉" -ForegroundColor Green
