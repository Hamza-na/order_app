// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyBIUZyMvWT0nv8FgFW8MQNZTNHdVo1ROjQ",
  authDomain: "order-app-3f867.firebaseapp.com",
  projectId: "order-app-3f867",
  storageBucket: "order-app-3f867.appspot.com", // Corrected this line
  messagingSenderId: "641515537666",
  appId: "1:641515537666:web:2758acc61da6d1c7a0ee1b",
  measurementId: "G-DMEBHFKTRY"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
