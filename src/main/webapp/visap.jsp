<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html class="h-full">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Payment</title>
    <%@ include file="components/imports.jsp" %>
  </head>

  <body>
    <%@ include file="components/sidebar.jsp" %>
    <!-- body -->
    <main class="ml-0 sm:ml-[15rem] p-6">
      <!-- Back -->
      <div class="flex justify-between items-center">
        <a
          href="#"
          class="flex items-center font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 hover:bg-blue-500 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80 p-2 rounded-full absolute top-6 right-6"
        >
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
          </svg>
          <span class="text-sm ml-1">Back</span>
        </a>
      </div>
      <!-- End Back -->
      <div class="flex-grow">
        <div class="flex justify-center items-center mt-10 mb-0">
          <h1 class="text-8xl font-light mb-8 px-3">Set up your credit</h1>
        </div>
        <%@ include file="components/stepper.jsp" %>
        <div class="flex justify-center items-center mb-4">
          <img src="assets/visa.png" alt="" class="w-24" />
        </div>
        <div class="w-full max-w-md mx-auto">
          <div class="w-full">
            <div class="max-w-md">
              <!-- login form -->
              <form action="/PaymentControlller" method="POST" class="space-y-4">
                <div class="error-message">${error}</div>
                <p class="text-red-400">${errorfill}</p>
                <p class="text-red-400">${note}</p>
                <div>
                  <label for="cardNumber" class="block text-gray-800 font-semibold">Card Number</label>
                  <input
                    id="cardNumber"
                    name="visa"
                    type="text"
                    class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500"
                    placeholder="Number"
                  />
                </div>
                <div class="flex space-x-4">
                  <div class="w-1/2">
                    <label for="expiryDate" class="block text-gray-800 font-semibold">Expire Date</label>
                    <input
                      id="expiryDate"
                      name="expiredate"
                      type="date"
                      class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500"
                      placeholder="yyyy-MM-dd"
                    />
                  </div>
                  <div class="w-1/2">
                    <label for="cvv" class="block text-gray-800 font-semibold">CVV</label>
                    <input
                      id="cvv"
                      type="text"
                      name="cvv"
                      class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500"
                      placeholder="CVV"
                      maxlength="3"
                    />
                  </div>
                </div>
                <div>
                  <label for="cardHolder" class="block text-gray-800 font-semibold">Name</label>
                  <input
                    id="cardHolder"
                    type="text"
                    name="placeholderCard"
                    class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500"
                    placeholder="Name card"
                  />
                </div>
                <div class="flex justify-between items-center">
                  <div class="flex items-center">
                    <input
                      id="saveCard"
                      type="checkbox"
                      class="text-blue-500 focus:ring-blue-500 border-gray-300 rounded"
                    />
                    <label for="saveCard" class="ml-2 block text-gray-800">Save information</label>
                  </div>
                  <button
                    type="submit"
                    class="px-4 py-2 bg-blue-500 text-white font-semibold rounded-md focus:outline-none hover:bg-blue-600 transition-colors"
                  >
                    Submit
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>
