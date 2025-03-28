require('dotenv').config(); 
const express = require('express');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const session = require('express-session');
const path = require('path');
const mysql = require('mysql2');
const app = express();
const port = 5501;

const db = mysql.createConnection({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || 'root1234',
  database: process.env.DB_NAME || 'chef'
});

db.connect((err) => {
  if (err) {
    return;
  }
});
app.use(express.static(__dirname));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(session({
  secret: 'defaultSecret',
  resave: false,
  saveUninitialized: true
}));
app.use(passport.initialize());
app.use(passport.session());
passport.use(new LocalStrategy(
  function (username, password, done){
    db.query('SELECT * FROM Login WHERE Username = ? AND isactive_L = 1', [username], function (err, results) {
      if (err) return done(err)
      if (results.length === 0){
        return done(null, false,{ message: 'User does not exist' });
      }
      const user = results[0];
      if (password === user.Password){  
        return done(null, user);
      } else {
        return done(null, false,{ message: 'Invalid Password' });
      }
    });
  }
));

passport.serializeUser(function (user, done){
  done(null, user.Serial_No);
});

passport.deserializeUser(function (id, done){
  db.query('SELECT * FROM Login WHERE Serial_No = ? AND isActive_L = 1', [id], function (err, results){
    if (err) return done(err);
    if (results.length === 0) return done(new Error('User not found'), null);
    done(null, results[0]);
  });
});

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

app.post('/index', (req, res, next) => {
  passport.authenticate('local', (err, user, info) => {
    if (err) return next(err);

    if (!user){
      return res.status(401).json({ message: info.message });
    }

    req.logIn(user, (err) => {
      if (err) return next(err);
      return res.json({ redirect: '/open_page.html' }); 
    });
  })(req, res, next);
});

app.post('/signup_page', (req, res) => {
  const { username, nam, password, age } = req.body;
  db.query('SELECT * FROM Login WHERE Username = ? AND isactive_L = 1', [username], (err, results) => {
    if (err){
      return res.status(500).json({ message: 'Database error' });
    }

    if (results.length > 0){
      return res.status(400).json({ message: 'Username already exists' });
    }
    db.query(
      'INSERT INTO Login (Username, Name, Age, Password, isActive_L) VALUES (?, ?, ?, ?, 1)', 
      [username, nam, age, password], 
      (err, result) => {
        if (err) {
          return res.status(500).json({ message: 'Error registering user' });
        }
        res.json({ message: 'User registered successfully' });
      }
    );
  });
});

app.get('/logout', (req, res) => {
  req.logout(function (err) {
    if (err) return next(err);
    res.redirect('/');
  });
});

app.listen(port, () => {
  console.log(`🚀 Server running at http://localhost:${port}`);
});
