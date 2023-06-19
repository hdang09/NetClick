<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="h-full">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Sign in</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.17/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <%@ include file="components/imports.jsp" %>
  </head>
  <!-- header -->
  <header>
      <div class="block h-8 mt-10 pt-12"></div>
  </header>  
  <!-- body -->
  <body class="flex flex-col h-full">
       <%@ include file="components/sidebar.jsp" %>
  <!-- Back -->
    <div class="flex justify-between items-center">
      <a href="#" class="flex items-center font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 rounded-lg hover:bg-blue-500 
         focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80 p-2 rounded-full absolute top-6 right-6 back-button">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
        </svg>
        <span class="text-sm ml-1">Back</span>
      </a>
        <script>
        document.addEventListener("DOMContentLoaded", function() {
          const backButton = document.querySelector(".back-button");
          backButton.addEventListener("click", function(e) {
            e.preventDefault();
            window.history.back();
          });
        });
        </script>
    </div>
<!-- End Back -->
    <div class="flex-grow">
      <!-- Breadcrumbs -->
    <!-- End -->
    <!-- maincontent -->
      <div class="flex justify-center items-center mt-2">
        <h1 class="text-8xl font-light mb-8 px-3">Set up your phone number</h1> 
    </div>
    <div class="flex justify-center items-center mb-8">
        <img src="assets/momoreal.png" alt="" class="h-24">
      </div>
      <p class="text-center text-lg font-light pb-4">Enter your MoMo mobile number.
        Your number will also be used if you forget your password and for important account messages. SMS fees may apply.
        </p>
      <div class="w-full max-w-md mx-auto">
        <div class="w-full">
          <div class="max-w-md">
            <!-- login form -->
            <form class="space-y-4 pt-4">
                <div>
                  <input id="input" type="text" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500"
                    placeholder="Mobile number">
                </div>
                <ul>
                    <div class="flex text-left border-b-4">
                    <div class="flex justify-center ">
                        <p>1＄/month <br>Mobile</p>
                    </div>
                    <button type="submit"
                            class="ml-auto block font-semibold rounded-md focus:outline-none text-blue-400 hover:text-blue-600 transition-colors"><a href="/subscription.jsp">
                  Change
                </a>
                </button>
                </div>
                </ul>
                <div class="flex text-left">
                  <button type="submit" class="ml-auto px-4 py-2 bg-blue-500 text-white font-semibold rounded-md focus:outline-none hover:bg-blue-600 transition-colors">
                  Submit</button>
                </div>
                </form>
                </div>
          </div>
        </div>
      </div>
  </body>
</html>





