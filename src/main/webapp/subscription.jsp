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
      <main class="p-6 w-[100vw]">
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
            <a href="/subscription-plan.jsp" class="text-center bg-blue-500 text-white py-2 rounded-lg mt-12">2$</a>
          </div>
          <div class="border-1 border border-black flex flex-col p-3 mx-10 my-8 rounded-md" style="width: 200px">
            <i
              class="fa-solid fa-film object-cover h-12 w-12 rounded-full bg-purple-500 my-2 flex items-center justify-center fa-xl text-white"
            ></i>
            <span class="my-4 font-bold text-3xl">Basic</span>
            <span class="my-1">Quanlity: Good</span>
            <span class="my-1">Resolution: 720p</span>
            <span class="my-1">Devices: Phone, Tablet, Computer, TV</span>
            <a href="/subscription?plan=basic" class="text-center bg-purple-500 text-white py-2 rounded-lg mt-6">5$</a>
          </div>
          <div class="border-1 border border-black flex flex-col p-3 mx-10 my-8 rounded-md" style="width: 200px">
            <i
              class="fa-solid fa-tv object-cover h-12 w-12 rounded-full bg-orange-500 my-2 flex items-center justify-center fa-xl text-white"
            ></i>
            <span class="my-4 font-bold text-3xl">Standard</span>
            <span class="my-1">Quanlity: Better</span>
            <span class="my-1">Resolution: 1080p</span>
            <span class="my-1">Devices: Phone, Tablet, Computer, TV</span>
            <a href="/subscription?plan=standard" class="text-center bg-orange-500 text-white py-2 rounded-lg mt-6"
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
            <a href="/subscription?plan=premium" class="text-center bg-red-500 text-white py-2 rounded-lg mt-6">20$</a>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>
