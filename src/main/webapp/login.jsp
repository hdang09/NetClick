<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Login</title>
    <%@ include file="../../components/imports.jsp" %>
  </head>
  <body>
    <main class="h-screen flex items-center justify-center bg-slate-700">
      <div
        class="flex w-full max-w-sm mx-auto overflow-hidden bg-white rounded-lg shadow-lg dark:bg-gray-800 lg:max-w-6xl h-[40rem]"
      >
        <!-- Left content -->
        <div class="w-full py-16 px-8 lg:w-2/5">
          <!--Logo-->
          <div class="flex items-center">
            <a class="mx-auto" href="/"><img src="assets/favicon.ico" alt="Logo" class="h-16" /></a>
          </div>
          <div class="sticky w-full flex justify-center items-center mt-2 text-3xl">
            <h1 class="block text-black font-light mb-2 mt-10 px-3">Welcome to</h1>
            <div>
              <h2 class="flex bg-primary rounded text-white font-light pb-2 mt-10 px-3">NetClick</h2>
            </div>
          </div>

          <!-- form -->
          <form action="/AuthController" method="POST">
            <p class="ml-3 my-4 text-black">Please login to your account</p>
            <!-- Username-->
            <div class="relative flex items-center">
              <span class="absolute">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="w-6 h-6 mx-3 text-gray-300 dark:text-gray-500"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                  stroke-width="2"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                  />
                </svg>
              </span>

              <input
                type="text"
                class="block w-full py-3 text-gray-700 bg-white border rounded-lg px-11 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40"
                placeholder="Username"
                name="user"
              />
            </div>

            <!--Password-->
            <div class="relative flex items-center mt-4">
              <span class="absolute">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="w-6 h-6 mx-3 text-gray-300 dark:text-gray-500"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                  stroke-width="2"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"
                  />
                </svg>
              </span>

              <input
                type="password"
                name="pass"
                class="block w-full px-10 py-3 text-gray-700 bg-white border rounded-lg dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 
                focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40"
                placeholder="Password"
              />
            </div>
            <!--Submit-->
            <div class="pt-1 pb-4 mb-auto text-center mt-">
              <input
                type="submit"
                class="my-3 inline-block w-full px-6 pb-2 pt-2.5 text-lg uppercase transition-colors duration-300 transform bg-primary rounded-lg hover:bg-blue-500 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80 text-white"
                value="Log in"
                /> 
              <p class="text-red-400">${mess}</p>
              <!--Forgot password-->
              <h1 class="flex items-center justify-center mt-3 text-gray-900 opacity-100 hover:opacity-50">
                <a href="/forgot-pass">Forgot password?</a>
              </h1>
            </div>
            <!--Register-->
            <div class="flex items-center justify-between pb-6">
              <p class="mb-0 mr-2 text-black">Don't have an account?</p>
              <button
                type="button"
                class="inline-block border-2 border-danger px-6 py-2 text-xs font-medium tracking-wide text-gray-600 hover:text-white capitalize transition-colors duration-300 transform bg-blue-white rounded-lg hover:bg-primary focus:outline-none focus:ring focus:ring-white focus:ring-opacity-50"
              >
                <a href="/register">Register</a>
              </button>
            </div>
          </form>
        </div>

        <!-- Right content -->
        <img class="hidden bg-cover lg:block lg:w-3/5 object-cover" src="assets/bg.jpg" />
      </div>
  </section>
</body>
</html>
