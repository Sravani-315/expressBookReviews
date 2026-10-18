# Final Project Submission Guide

## Overview
This document provides all the information needed to submit the Express Book Review final project.

---

## Task 1: GitHub Repository (2 Points)

**What to submit:** cURL command and output showing your GitHub repository is forked from ibm-developer-skills-network/expressBookReview

**Instructions:**
1. Fork the repository: https://github.com/ibm-developer-skills-network/expressBookReviews
2. Clone your forked repository
3. Copy your project files into the cloned repository
4. Push to your GitHub repository

**Command to verify:**
```bash
curl -s https://api.github.com/repos/YOUR_USERNAME/expressBookReviews | grep -A 2 "parent"
```

**Or simply provide the GitHub repository URL showing it's forked.**

**File to submit:** `githubrepo.txt` (create this with your GitHub URL and fork information)

---

## Task 2: Get All Books (2 Points)

**What to submit:** cURL command and output displaying all books

**File:** `getallbooks.txt` ✅ (Already created)

**Content:**
```
Command:
curl http://localhost:5000/

Output: [Shows all 10 books with their details]
```

---

## Task 3: Get Books by ISBN (2 Points)

**What to submit:** cURL command and output displaying book by ISBN

**File:** `getbooksbyISBN.txt` ✅ (Already created)

**Content:**
```
Command:
curl http://localhost:5000/isbn/1

Output: [Shows book details for ISBN 1]
```

---

## Task 4: Get Books by Author (2 Points)

**What to submit:** cURL command and output displaying books by author

**File:** `getbooksbyauthor.txt` ✅ (Already created)

**Content:**
```
Command:
curl http://localhost:5000/author/Jane%20Austen

Output: [Shows all books by Jane Austen]
```

---

## Task 5: Get Books by Title (2 Points)

**What to submit:** cURL command and output displaying books by title

**File:** `getbooksbytitle.txt` ✅ (Already created)

**Content:**
```
Command:
curl http://localhost:5000/title/Things%20Fall%20Apart

Output: [Shows all books with matching title]
```

---

## Task 6: Get Book Review (2 Points)

**What to submit:** cURL command and output displaying initial book review

**File:** `getbookreview.txt` ✅ (Already created)

**Content:**
```
Command:
curl http://localhost:5000/review/1

Output: {} [Empty reviews initially]
```

---

## Task 7: Register User (3 Points)

**What to submit:** cURL command and output displaying successful registration message

**File:** `register.txt` ✅ (Already created)

**Content:**
```
Command:
curl -X POST http://localhost:5000/register \
  -H "Content-Type: application/json" \
  -d '{"username":"testuser","password":"testpass"}'

Output: {"message": "User successfully registered. Now you can login"}
```

---

## Task 8: Login User (3 Points)

**What to submit:** cURL command and output displaying successful login

**File:** `login.txt` ✅ (Already created)

**Content:**
```
Command:
curl -X POST http://localhost:5000/customer/login \
  -H "Content-Type: application/json" \
  -d '{"username":"testuser","password":"testpass"}' \
  -c cookies.txt

Output: User successfully logged in
```

---

## Task 9: Add/Modify Review (2 Points)

**What to submit:** cURL command and output displaying review addition/modification

**File:** `reviewadded.txt` ✅ (Already created)

**Content:**
```
Command:
curl -X PUT http://localhost:5000/customer/auth/review/1 \
  -H "Content-Type: application/json" \
  -d '{"review":"Great book!"}' \
  -b cookies.txt

Output: {"message":"Review successfully added/updated","reviews":{"testuser":"Great book!"}}
```

---

## Task 10: Delete Review (2 Points)

**What to submit:** cURL command and output displaying review deletion

**File:** `deletereview.txt` ✅ (Already created)

**Content:**
```
Command:
curl -X DELETE http://localhost:5000/customer/auth/review/1 \
  -b cookies.txt

Output: {"message":"Review successfully deleted","reviews":{}}
```

---

## Task 11: Async/Await Implementation (8 Points)

**What to submit:** GitHub URL of the general.js file containing async/await implementation

**GitHub URL Format:**
```
https://github.com/YOUR_USERNAME/expressBookReviews/blob/main/router/general.js
```

**What the file contains:**
- `getAllBooks()` - async function using Axios
- `getBookByISBN(isbn)` - async function using Axios
- `getBooksByAuthor(author)` - async function using Axios
- `getBooksByTitle(title)` - async function using Axios

**Test Endpoints:**
```bash
# Get all books (async)
curl http://localhost:5000/async/books

# Get book by ISBN (async)
curl http://localhost:5000/async/isbn/1

# Get books by author (async)
curl http://localhost:5000/async/author/Jane%20Austen

# Get books by title (async)
curl http://localhost:5000/async/title/Things%20Fall%20Apart
```

---

## Summary Checklist

Before submitting, ensure you have:

- ✅ `getallbooks.txt` - Task 2
- ✅ `getbooksbyISBN.txt` - Task 3
- ✅ `getbooksbyauthor.txt` - Task 4
- ✅ `getbooksbytitle.txt` - Task 5
- ✅ `getbookreview.txt` - Task 6
- ✅ `register.txt` - Task 7
- ✅ `login.txt` - Task 8
- ✅ `reviewadded.txt` - Task 9
- ✅ `deletereview.txt` - Task 10
- ⚠️ `githubrepo.txt` - Task 1 (Need to create after forking)
- ⚠️ GitHub URL for general.js - Task 11 (Need to provide after pushing)

---

## Next Steps

1. **Fork the IBM repository** (if not already done)
   - Go to: https://github.com/ibm-developer-skills-network/expressBookReviews
   - Click "Fork"

2. **Push your code to GitHub**
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/expressBookReviews.git
   git branch -M main
   git push -u origin main
   ```

3. **Create githubrepo.txt**
   - Include the GitHub URL
   - Include information showing it's forked from the IBM repository

4. **Get the general.js URL**
   - Format: `https://github.com/YOUR_USERNAME/expressBookReviews/blob/main/router/general.js`

5. **Submit all files and URLs** as per assignment instructions

---

## Testing Before Submission

Run these commands to verify everything works:

```bash
# Start the server
npm start

# In another terminal, test all endpoints
curl http://localhost:5000/
curl http://localhost:5000/isbn/1
curl http://localhost:5000/author/Jane%20Austen
curl http://localhost:5000/title/Things%20Fall%20Apart
curl http://localhost:5000/review/1

# Test registration
curl -X POST http://localhost:5000/register \
  -H "Content-Type: application/json" \
  -d '{"username":"newuser","password":"newpass"}'

# Test login
curl -X POST http://localhost:5000/customer/login \
  -H "Content-Type: application/json" \
  -d '{"username":"newuser","password":"newpass"}' \
  -c cookies.txt

# Test add review
curl -X PUT http://localhost:5000/customer/auth/review/1 \
  -H "Content-Type: application/json" \
  -d '{"review":"Excellent!"}' \
  -b cookies.txt

# Test delete review
curl -X DELETE http://localhost:5000/customer/auth/review/1 \
  -b cookies.txt
```

---

## Grading Criteria

- **Tasks 1-6, 9-10:** 2 points each (16 points total)
- **Tasks 7-8:** 3 points each (6 points total)
- **Task 11:** 8 points
- **Total:** 30 points
- **Passing Grade:** 70% (21 points)

---

## Support

If you encounter any issues:
1. Check that all dependencies are installed: `npm install`
2. Verify the server is running on port 5000
3. Check that cookies.txt is created for authenticated requests
4. Review the README.md for detailed API documentation

Good luck with your submission! 🚀
