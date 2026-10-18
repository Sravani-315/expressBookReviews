# Express Book Review - Final Project

This is a server-side application for an online bookstore built with Node.js and Express. It includes user authentication, book search functionality, and review management with support for concurrent access.

## Features

- User registration and authentication with JWT tokens
- Retrieve list of all available books
- Search books by ISBN, author name, or title
- Access reviews for specific books
- Add, modify, and delete book reviews (authenticated users only)
- Promise-based operations using async/await with Axios

## Installation

```bash
npm install
```

## Running the Application

```bash
npm start
```

The server will start on `http://localhost:5000`

## API Endpoints

### Task 2: Get all books

**Command:**
```bash
curl http://localhost:5000/
```

**Output:**
```json
{
    "1": {
        "author": "Chinua Achebe",
        "title": "Things Fall Apart",
        "reviews": {}
    },
    "2": {
        "author": "Hans Christian Andersen",
        "title": "Fairy tales",
        "reviews": {}
    },
    "3": {
        "author": "Dante Alighieri",
        "title": "The Divine Comedy",
        "reviews": {}
    },
    "4": {
        "author": "Unknown",
        "title": "The Epic Of Gilgamesh",
        "reviews": {}
    },
    "5": {
        "author": "Unknown",
        "title": "The Book Of Job",
        "reviews": {}
    },
    "6": {
        "author": "Unknown",
        "title": "One Thousand and One Nights",
        "reviews": {}
    },
    "7": {
        "author": "Unknown",
        "title": "Njál's Saga",
        "reviews": {}
    },
    "8": {
        "author": "Jane Austen",
        "title": "Pride and Prejudice",
        "reviews": {}
    },
    "9": {
        "author": "Honoré de Balzac",
        "title": "Le Père Goriot",
        "reviews": {}
    },
    "10": {
        "author": "Samuel Beckett",
        "title": "Molloy, Malone Dies, The Unnamable, the trilogy",
        "reviews": {}
    }
}
```

---

### Task 3: Get book details by ISBN

**Command:**
```bash
curl http://localhost:5000/isbn/1
```

**Output:**
```json
{
    "author": "Chinua Achebe",
    "title": "Things Fall Apart",
    "reviews": {}
}
```

---

### Task 4: Get books by author

**Command:**
```bash
curl http://localhost:5000/author/Jane%20Austen
```

**Output:**
```json
[
    {
        "isbn": "8",
        "author": "Jane Austen",
        "title": "Pride and Prejudice",
        "reviews": {}
    }
]
```

---

### Task 5: Get books by title

**Command:**
```bash
curl http://localhost:5000/title/Things%20Fall%20Apart
```

**Output:**
```json
[
    {
        "isbn": "1",
        "author": "Chinua Achebe",
        "title": "Things Fall Apart",
        "reviews": {}
    }
]
```

---

### Task 6: Get book review

**Command:**
```bash
curl http://localhost:5000/review/1
```

**Output:**
```json
{}
```

---

### Task 7: Register a new user

**Command:**
```bash
curl -X POST http://localhost:5000/register \
  -H "Content-Type: application/json" \
  -d '{"username":"testuser","password":"testpass"}'
```

**Output:**
```json
{
    "message": "User successfully registered. Now you can login"
}
```

---

### Task 8: Login as a registered user

**Command:**
```bash
curl -X POST http://localhost:5000/customer/login \
  -H "Content-Type: application/json" \
  -d '{"username":"testuser","password":"testpass"}' \
  -c cookies.txt
```

**Output:**
```
User successfully logged in
```

---

### Task 9: Add or modify a book review

**Command:**
```bash
curl -X PUT http://localhost:5000/customer/auth/review/1 \
  -H "Content-Type: application/json" \
  -d '{"review":"Great book!"}' \
  -b cookies.txt
```

**Output:**
```json
{
    "message": "Review successfully added/updated",
    "reviews": {
        "testuser": "Great book!"
    }
}
```

---

### Task 10: Delete a book review

**Command:**
```bash
curl -X DELETE http://localhost:5000/customer/auth/review/1 \
  -b cookies.txt
```

**Output:**
```json
{
    "message": "Review successfully deleted",
    "reviews": {}
}
```

---

## Task 11: Async/Await with Axios Implementation

The following endpoints use Promise callbacks with async/await and Axios for concurrent operations:

### Get all books (Async)
```bash
curl http://localhost:5000/async/books
```

### Get book by ISBN (Async)
```bash
curl http://localhost:5000/async/isbn/1
```

### Get books by author (Async)
```bash
curl http://localhost:5000/async/author/Jane%20Austen
```

### Get books by title (Async)
```bash
curl http://localhost:5000/async/title/Things%20Fall%20Apart
```

The implementation can be found in `router/general.js` file.

**GitHub URL for general.js:**
```
https://github.com/[your-username]/expressBookReviews/blob/main/router/general.js
```

---

## File Structure

```
.
├── index.js                 # Main server file
├── books.json              # Book data source
├── package.json            # Project dependencies
├── router/
│   ├── general.js          # Public routes (Task 11 implementation)
│   └── auth_users.js       # Authenticated routes
└── README.md               # This file
```

## Technologies Used

- **Node.js**: JavaScript runtime
- **Express.js**: Web framework
- **express-session**: Session management
- **jsonwebtoken**: JWT authentication
- **axios**: Promise-based HTTP client for async operations

## Authentication Flow

1. User registers with username and password
2. User logs in and receives a JWT token stored in session
3. Authenticated routes require valid JWT token
4. Each user can add/modify/delete their own reviews

## Notes

- Reviews are stored per username
- Multiple users can review the same book
- A user can only delete their own reviews
- Sessions are managed server-side with express-session
- JWT tokens expire after 1 hour

## License

ISC
