<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html class="h-full">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Sign in</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.17/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  </head>
  <!-- header -->
  <header>
    <div class="flex container m-0 px-6 py-6">
      <div class="flex items-center">
       <a href="index.jps"><img src="assets/favicon.png" alt="Logo" class="h-12"></a>
      </div>
    </div>
  </header>  
  <!-- body -->
  <body class="flex flex-col h-full bg-pink-50">
    <div class="flex-grow">
      <div class="w-full flex justify-center items-center mt-28">
        <h1 class="text-8xl font-light mb-8 px-3">Welcome to</h1>
        <div>
          <h2 class="bg-blue-500 rounded text-7xl text-white font-light pb-2 mb-2 px-3">NetClick</h2>
        </div>
      </div>
      <div class="block">
      <h3 class="flex items-center justify-center text-2xl font-light">Explore unlimited movies, TV shows anywhere, anytime</h3>
    </div>
      <div class="w-full max-w-md mx-auto">
        <div class="w-full">
          <div class="max-w-md">
            <!-- login form -->
            <form class="bg-gray-100 shadow-md rounded px-8 pt-6 pb-8 mt-20 mb-12 m-4">
              <!-- user -->
              <div class="mb-4">
                <label class="inline-block bg-gray-300 rounded text-gray-700 text-2xl font-bold px-1 mb-4" for="username">Username:</label>
                <input
                  class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                  id="username" type="text" placeholder="Enter your username"
                >
              </div>
              <!-- email -->
              <div class="mb-4">
                <label class="inline-block bg-gray-300 rounded text-gray-700 text-2xl font-bold px-1 mb-4" for="email">Email:</label>
                <input
                  class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                  id="email" type="text" placeholder="Enter your email"
                >
              </div>
              <!-- password -->
              <div class="mb-4">
                <label class="inline-block bg-gray-300 rounded text-gray-700 text-2xl font-bold px-1 mb-4" for="password">Password:</label>
                <input
                  class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
                  id="password" type="password" placeholder="Enter your password"
                >
              </div>
              <!-- retype password -->
              <div class="mb-4">
                <label class="inline-block bg-gray-300 rounded text-gray-700 text-2xl font-bold px-1 mb-4" for="confirmPassword">Re-type password:</label>
                <input
                  class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
                  id="confirmPassword" type="password" placeholder="Enter your password"
                >
              </div>
              <!-- button -->
              <div class="flex items-center justify-center">
                <button class="bg-gray-300 hover:bg-gray-600 hover:text-white text-black font-thin py-2 px-14 rounded border-black border-solid border-1" href="#">
                  Sign in
                </button>
              </div>
              <h1 class="flex items-center justify-center mt-1">or</h1>
              <div class="flex items-center justify-center">
                <button class="bg-gray-300 hover:bg-gray-600 hover:text-white text-black font-thin py-1 px-7 rounded border-black border-solid border-1" href="#">
                  Log in
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <footer class="inline-block w-screen bg-gray-800">
      <div class="flex items-center justify-center mt-4 mb-2">
        <a href="#" class="inline-block w-8 h-8 bg-white bg-opacity-20 rounded-full flex items-center justify-center mr-2 transition-opacity duration-300 hover:bg-opacity-50">
          <i class="fab fa-instagram text-white"></i>
        </a>
        <a href="#" class="inline-block w-8 h-8 bg-white bg-opacity-20 rounded-full flex items-center justify-center mr-2 transition-opacity duration-300 hover:bg-opacity-50">
          <i class="fab fa-twitter text-white"></i>
        </a>
        <a href="#" class="inline-block w-8 h-8 bg-white bg-opacity-20 rounded-full flex items-center justify-center mr-2 transition-opacity duration-300 hover:bg-opacity-50">
          <i class="fab fa-facebook text-white"></i>
        </a>
      </div>
      <ul class="list-none flex justify-center">
        <li class="mx-2"><a href="#" class="text-white opacity-80 hover:opacity-100">Home</a></li>
        <li class="mx-2"><a href="#" class="text-white opacity-80 hover:opacity-100">Services</a></li>
        <li class="mx-2"><a href="#" class="text-white opacity-80 hover:opacity-100">About</a></li>
        <li class="mx-2"><a href="#" class="text-white opacity-80 hover:opacity-100">Terms</a></li>
        <li class="mx-2"><a href="#" class="text-white opacity-80 hover:opacity-100">Privacy Policy</a></li>
      </ul>
      <p class="text-center text-gray-500 mt-2">NetClick ©2023</p>
    </footer>
  </body>
</html>



