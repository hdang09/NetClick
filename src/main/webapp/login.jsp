<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Login</title>
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
  <!-- MAIN CONTENT -->
  <body class="min-h-screen flex-col items-center justify-center lg:flex bg-cyan-200">
    <section>
      <div class="block pt-6"></div>
      <div class="g-6 flex flex-wrap items-center justify-center text-neutral-800 dark:text-neutral-200">
        <div class="h-24 w-fit scale-90">
          <div class="block rounded-lg bg-white shadow-lg">
            <div class="g-0 lg:flex lg:flex-wrap">
              <!-- Left column container-->
              <div class="px-20 md:px-0 lg:w-6/12">
                <div class="block p-10 m-2"></div>
                <div class="md:mx-6 md:p-20">
                  <!--Logo-->
                  <div class="flex items-center">
                    <a class="mx-auto" href="index.jsp"><img src="assets/favicon.ico" alt="Logo" class="h-20" /></a>
                  </div>
                  <div class="sticky w-full flex justify-center items-center mt-2">
                    <h1 class="block text-black text-4xl font-light mb-2 mt-10 px-3">Welcome to</h1>
                    <div>
                      <h2 class="flex bg-blue-500 rounded text-4xl text-white font-light pb-2 mb- mt-10 px-3">
                        NetClick
                      </h2>
                    </div>
                  </div>

                  <!-- form -->

                  <form>
                    <p class="ml-3 mb-4 mt-4 text-black">Please login to your account</p>
                    <!--Username-->
                    <div class="relative mb-4" data-te-input-wrapper-init>
                      <input
                        type="text"
                        class="peer block min-h-[auto] w-full rounded border-0 bg-slate-50 px-3 py-[0.32rem] text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
                        id="exampleFormControlInput1"
                        placeholder="Username"
                      />
                    </div>

                    <!--Password-->
                    <div class="relative mb-4" data-te-input-wrapper-init>
                      <input
                        type="password"
                        class="peer block min-h-[auto] w-full rounded border-0 bg-slate-50 px-3 py-[0.32rem] text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
                        id="exampleFormControlInput11"
                        placeholder="Password"
                      />
                    </div>
                    <!--Submit-->
                    <div class="mb-12 pb-1 pt-1 pb-4 mb-auto text-center">
                      <button
                        class="mb-3 inline-block w-full px-6 pb-2 pt-2.5 text-lg uppercase transition-colors duration-300 transform bg-blue-600 rounded-lg hover:bg-blue-500 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80"
                      >
                        Log in
                      </button>
                      <!--Forgot password-->
                      <h1 class="flex items-center justify-center mt-3 text-gray-900 opacity-100 hover:opacity-50">
                        <a href="/forgotpass.jsp">Forgot password?</a>
                      </h1>
                    </div>
                    <!--Register-->
                    <div class="flex items-center justify-between pb-6">
                      <p class="mb-0 mr-2 text-black">Don't have an account?</p>
                      <button
                        type="button"
                        class="inline-block border-2 border-danger px-6 pb-[6px] pt-2 text-xs font-medium tracking-wide text-gray-600 hover:text-white capitalize transition-colors duration-300 transform bg-blue-white rounded-lg hover:bg-blue-600 focus:outline-none focus:ring focus:ring-white focus:ring-opacity-50"
                      >
                        <a href="/register.jsp"> Register</a>
                      </button>
                    </div>
                  </form>
                </div>
                <footer>
                  <div class="container mx-auto py-4 px-6">
                    <p class="text-center text-gray-500">This is the footer section.</p>
                  </div>
                </footer>
              </div>
              <!-- Right column container-->
              <div class="flex items-center lg:w-6/12 lg:rounded-r-lg lg:rounded-bl-none">
                <img class="rounded" src="assets/bbg.jpg" alt="img" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </body>
  <!-- footer -->
  <footer class="bg-white dark:bg-gray-900 m-auto mb-0 w-screen">
    <div class="container flex flex-col items-center justify-center p-6 mx-auto space-y-4 sm:space-y-0 sm:flex-row">
      <a href="#">
        <img class="w-auto h-7 pr-1" src="assets/favicon-removebg-preview.png" alt="" />
      </a>

      <p class="items-center text-sm text-gray-600 dark:text-gray-300">© Copyright 2023. All Rights Reserved.</p>
    </div>
  </footer>
</html>
