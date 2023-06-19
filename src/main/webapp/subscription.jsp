<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>NetClick</title>
    <%@ include file="components/imports.jsp" %>
  </head>
  <body>
    <div class="flex">
      <%@ include file="components/sidebar.jsp" %>
      <!-- MAIN CONTENT -->
      <main class="ml-0 sm:ml-[15rem] p-6 w-[100vw]">
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
        <h1 class="font-bold text-2xl">Subscription Page</h1>
        <!-- <p>Get started by editing <b>subscription.jsp</b> </p> -->
        <div class="flex justify-center flex-col items-center">
          <span class="text-4xl font-semibold p-2 my-3">Pick the plan that best fits for you</span>
          <ul class="break-all">
            <li class="text-lg my-2">
              <i class="fa-solid text-green-500 mr-2 fa-check p-1 text-lg"></i>No commitments, cancel anytime.
            </li>
            <li class="text-lg my-2">
              <i class="fa-solid text-green-500 mr-2 fa-check p-1 text-lg"></i>Access all content on Netclick at a
              discounted price.
            </li>
            <li class="text-lg my-2">
              <i class="fa-solid text-green-500 mr-2 fa-check p-1 text-lg"></i>No ads and no extra fees. Ever.
            </li>
          </ul>
        </div>
        <div class="flex justify-center">
          <div class="border-1 border border-black flex flex-col p-3 mx-10 my-8 rounded-md" style="width: 200px">
            <i
              class="fa-solid fa-mobile object-cover h-12 w-12 rounded-full bg-blue-500 my-2 flex items-center justify-center fa-xl text-white"
            ></i>
            <span class="my-4 font-bold text-3xl">Mobile</span>
            <span class="my-1">Quanlity: Good</span>
            <span class="my-1">Resolution: 480p</span>
            <span class="my-1">Devices: Phone, Tablet</span>
            <a href="/subscription-plan.jsp" class="text-center bg-blue-500 text-white py-2 rounded-lg mt-12
               font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 rounded-lg hover:bg-blue-500 
          focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80">2$</a>
          </div>
          <div class="border-1 border border-black flex flex-col p-3 mx-10 my-8 rounded-md" style="width: 200px">
            <i
              class="fa-solid fa-film object-cover h-12 w-12 rounded-full bg-purple-500 my-2 flex items-center justify-center fa-xl text-white"
            ></i>
            <span class="my-4 font-bold text-3xl">Basic</span>
            <span class="my-1">Quanlity: Good</span>
            <span class="my-1">Resolution: 720p</span>
            <span class="my-1">Devices: Phone, Tablet, Computer, TV</span>
            <a href="/subscription?plan=basic" class="text-center bg-purple-500 text-white py-2 rounded-lg mt-6
               font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 rounded-lg hover:bg-blue-500 
          focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80">5$</a>
          </div>
          <div class="border-1 border border-black flex flex-col p-3 mx-10 my-8 rounded-md" style="width: 200px">
            <i
              class="fa-solid fa-tv object-cover h-12 w-12 rounded-full bg-orange-500 my-2 flex items-center justify-center fa-xl text-white"
            ></i>
            <span class="my-4 font-bold text-3xl">Standard</span>
            <span class="my-1">Quanlity: Better</span>
            <span class="my-1">Resolution: 1080p</span>
            <span class="my-1">Devices: Phone, Tablet, Computer, TV</span>
            <a href="/subscription?plan=standard" class="text-center bg-orange-500 text-white py-2 rounded-lg mt-6
               font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 rounded-lg hover:bg-blue-500 
          focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80"
              >10$</a
            >
          </div>
          <div class="border-1 border border-black flex flex-col p-3 mx-10 my-8 rounded-md" style="width: 200px">
            <i
              class="fa-solid fa-heart fa-solid fa-film object-cover h-12 w-12 rounded-full bg-red-500 my-2 flex items-center justify-center fa-xl text-white"
            ></i>
            <span class="my-4 font-bold text-3xl">Premium</span>
            <span class="my-1">Quanlity: Best</span>
            <span class="my-1">Resolution: 4K+HDR</span>
            <span class="my-1">Devices: Phone, Tablet, Computer, TV</span>
            <a href="/subscription?plan=premium" class="text-center bg-red-500 text-white py-2 rounded-lg mt-6
               font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 rounded-lg hover:bg-blue-500 
          focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80">20$</a>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>
