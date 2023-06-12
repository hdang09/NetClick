<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>NetClick</title>
    <!-- Tailwind -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
  </head>
  <body>
    <div class="flex">
      <%@ include file="components/sidebar.jsp" %>

      <!-- MAIN CONTENT -->
      <main class="p-6 w-[100vw]">
          <h1 class="font-bold text-2xl">Subscription Page</h1>
          <!-- <p>Get started by editing <b>subscription.jsp</b> </p> -->
          <div class="flex justify-center flex-col items-center">
            <span class="text-4xl font-semibold p-2 my-3">Pick the plan that best fits for you</span>
            <ul class="break-all">
              <li class="text-lg my-2"><i class="fa-regular fa-square-check p-1 text-lg"></i>No commitments, cancel anytime.</li>
              <li class="text-lg my-2"><i class="fa-regular fa-square-check p-1 text-lg"></i>Access all content on Netclick at a discounted price.</li>
              <li class="text-lg my-2"><i class="fa-regular fa-square-check p-1 text-lg"></i>No ads and no extra fees. Ever.</li>
            </ul>
          </div>
          <div class="flex justify-center">
            <div class="border-x-2 border-y-2 border border-black flex flex-col p-3 mx-10 my-8" style="width: 200px;">
              <img src="" alt="img" class="object-cover h-12 w-12 rounded-full bg-gray-300 my-2">
              <span class="my-4 font-medium text-3xl">Mobile</span>
              <span class="my-1">Quanlity: Good</span>
              <span class="my-1">Resolution: 480p</span>
              <span class="my-1">Devices: Phone, Tablet</span>
              <button class="bg-gray-300 px-3 py-1 text-xs mt-8" style="margin-top: 50px">2$</button>
            </div>
            <div class="border-x-2 border-y-2 border border-black flex flex-col p-3 mx-10 my-8" style="width: 200px;">
              <img src="" alt="img" class="object-cover h-12 w-12 rounded-full bg-gray-300 my-2">
              <span class="my-4 font-medium text-3xl">Basic</span>
              <span class="my-1">Quanlity: Good</span>
              <span class="my-1">Resolution: 720p</span>
              <span class="my-1">Devices: Phone, Tablet, Computer, TV</span>
              <button class="bg-gray-300 px-3 py-1 text-xs mt-8">5$</button>
            </div>
            <div class="border-x-2 border-y-2 border border-black flex flex-col p-3 mx-10 my-8" style="width: 200px;">
              <img src="" alt="img" class="object-cover h-12 w-12 rounded-full bg-gray-300 my-2">
              <span class="my-4 font-medium text-3xl">Standard</span>
              <span class="my-1">Quanlity: Better</span>
              <span class="my-1">Resolution: 1080p</span>
              <span class="my-1">Devices: Phone, Tablet, Computer, TV</span>
              <button class="bg-gray-300 px-3 py-1 text-xs mt-8">10$</button>
            </div>
            <div class="border-x-2 border-y-2 border border-black flex flex-col p-3 mx-10 my-8" style="width: 200px;">
              <img src="" alt="img" class="object-cover h-12 w-12 rounded-full bg-gray-300 my-2">
              <span class="my-4 font-medium text-3xl">Premium</span>
              <span class="my-1">Quanlity: Best</span>
              <span class="my-1">Resolution: 4K+HDR</span>
              <span class="my-1">Devices: Phone, Tablet, Computer, TV</span>
              <button class="bg-gray-300 px-3 py-1 text-xs mt-8">150$</button>
            </div>
          </div>
      </main>

    </div>
  </body>
</html>