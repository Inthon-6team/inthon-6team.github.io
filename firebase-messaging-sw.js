// firebase-messaging-sw.js
importScripts("https://www.gstatic.com/firebasejs/8.0.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.0.0/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyAPiMqhWGgZASXVKXX2MgodC82bFe7REiI",
  authDomain: "inthon.firebaseapp.com",
  projectId: "inthon",
  storageBucket: "inthon.appspot.com",
  messagingSenderId: "384729510885",
  appId: "1:384729510885:web:2ff3a9d2b270980603f50c",
  measurementId: "G-7BTM48LX4C",
});

const messaging = firebase.messaging();
