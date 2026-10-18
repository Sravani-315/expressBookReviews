const express = require('express');
const axios = require('axios');
let books = require("../books.json");
let isValid = require("./auth_users.js").isValid;
let users = require("./auth_users.js").users;
const public_users = express.Router();

// Register a new user
public_users.post("/register", (req, res) => {
  const username = req.body.username;
  const password = req.body.password;

  if (username && password) {
    if (!isValid(username)) {
      users.push({"username": username, "password": password});
      return res.status(200).json({message: "User successfully registered. Now you can login"});
    } else {
      return res.status(404).json({message: "User already exists!"});
    }
  }
  return res.status(404).json({message: "Unable to register user."});
});

// Get the book list available in the shop
public_users.get('/', function (req, res) {
  res.send(JSON.stringify(books, null, 4));
});

// Get book details based on ISBN
public_users.get('/isbn/:isbn', function (req, res) {
  const isbn = req.params.isbn;
  if (books[isbn]) {
    res.send(books[isbn]);
  } else {
    res.status(404).json({message: "Book not found"});
  }
});

// Get book details based on author
public_users.get('/author/:author', function (req, res) {
  const author = req.params.author;
  const booksByAuthor = [];
  
  for (let isbn in books) {
    if (books[isbn].author === author) {
      booksByAuthor.push({isbn: isbn, ...books[isbn]});
    }
  }
  
  if (booksByAuthor.length > 0) {
    res.send(booksByAuthor);
  } else {
    res.status(404).json({message: "No books found by this author"});
  }
});

// Get all books based on title
public_users.get('/title/:title', function (req, res) {
  const title = req.params.title;
  const booksByTitle = [];
  
  for (let isbn in books) {
    if (books[isbn].title === title) {
      booksByTitle.push({isbn: isbn, ...books[isbn]});
    }
  }
  
  if (booksByTitle.length > 0) {
    res.send(booksByTitle);
  } else {
    res.status(404).json({message: "No books found with this title"});
  }
});

// Get book review
public_users.get('/review/:isbn', function (req, res) {
  const isbn = req.params.isbn;
  if (books[isbn]) {
    res.send(books[isbn].reviews);
  } else {
    res.status(404).json({message: "Book not found"});
  }
});

// Task 11: Get all books using async/await with Axios
const getAllBooks = async () => {
  try {
    // Simulating API call to localhost
    const response = await axios.get('http://localhost:5000/');
    return response.data;
  } catch (error) {
    throw error;
  }
};

public_users.get('/async/books', async (req, res) => {
  try {
    const allBooks = await getAllBooks();
    res.send(JSON.stringify(allBooks, null, 4));
  } catch (error) {
    res.status(500).json({message: "Error fetching books", error: error.message});
  }
});

// Task 11: Search by ISBN using async/await with Axios
const getBookByISBN = async (isbn) => {
  try {
    const response = await axios.get(`http://localhost:5000/isbn/${isbn}`);
    return response.data;
  } catch (error) {
    throw error;
  }
};

public_users.get('/async/isbn/:isbn', async (req, res) => {
  try {
    const book = await getBookByISBN(req.params.isbn);
    res.send(book);
  } catch (error) {
    res.status(404).json({message: "Book not found", error: error.message});
  }
});

// Task 11: Search by author using async/await with Axios
const getBooksByAuthor = async (author) => {
  try {
    const response = await axios.get(`http://localhost:5000/author/${author}`);
    return response.data;
  } catch (error) {
    throw error;
  }
};

public_users.get('/async/author/:author', async (req, res) => {
  try {
    const books = await getBooksByAuthor(req.params.author);
    res.send(books);
  } catch (error) {
    res.status(404).json({message: "No books found by this author", error: error.message});
  }
});

// Task 11: Search by title using async/await with Axios
const getBooksByTitle = async (title) => {
  try {
    const response = await axios.get(`http://localhost:5000/title/${title}`);
    return response.data;
  } catch (error) {
    throw error;
  }
};

public_users.get('/async/title/:title', async (req, res) => {
  try {
    const books = await getBooksByTitle(req.params.title);
    res.send(books);
  } catch (error) {
    res.status(404).json({message: "No books found with this title", error: error.message});
  }
});

module.exports.general = public_users;
