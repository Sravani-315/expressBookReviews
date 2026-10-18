# How to Fork the IBM Repository and Add Your Code

## Step 1: Fork the IBM Repository

1. **Go to the IBM repository:**
   ```
   https://github.com/ibm-developer-skills-network/expressBookReviews
   ```

2. **Click the "Fork" button** in the top-right corner

3. **Select your account** (Sravani-315) as the destination

4. **Wait for GitHub to create the fork**
   - Your forked repository will be at:
   ```
   https://github.com/Sravani-315/expressBookReviews
   ```

## Step 2: Add Your Current Repository as a Remote

Since your code is already at:
```
https://github.com/Sravani-315/Developing-Back-End-Apps-with-Node.js-and-Express
```

You have two options:

### Option A: Copy Your Code to the Forked Repository (RECOMMENDED)

```bash
# Clone your newly forked repository
cd ..
git clone https://github.com/Sravani-315/expressBookReviews.git
cd expressBookReviews

# Copy all your files from the current directory (except .git and node_modules)
# In PowerShell:
Copy-Item -Path "s:\Developing Back-End Apps with Node.js and Express\*" -Destination . -Recurse -Exclude .git,node_modules

# Add and commit
git add .
git commit -m "Add Express Book Review application with all features"

# Push to your fork
git push origin main
```

### Option B: Manually Copy Files via GitHub Web Interface

1. Go to your forked repo: `https://github.com/Sravani-315/expressBookReviews`
2. Click "Add file" > "Upload files"
3. Drag and drop all your files from your current project folder
4. Commit the changes

## Step 3: Verify the Fork

After forking and adding your code, run this command:

```bash
curl -s https://api.github.com/repos/Sravani-315/expressBookReviews
```

Look for these fields in the output:
```json
{
  "fork": true,
  "parent": {
    "full_name": "ibm-developer-skills-network/expressBookReviews"
  }
}
```

## Step 4: Update githubrepo.txt

The file will automatically show that your repository is forked from the IBM repository.
