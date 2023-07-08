<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Subscription - NetClick</title>
        <%@ include file="components/imports.jsp" %>
    </head>

    <body class="bg-white dark:bg-gray-900">
        <!-- HEADER -->
        <%@ include file="components/header.jsp" %>

        <!-- MAIN CONTENT -->
        <main class="p-6 text-black dark:text-white max-w-7xl mx-auto">
            <%@ include file="components/stepper.jsp" %>
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
            <div class="flex flex-col md:flex-row items-center justify-center">
                <%-- MOBILE --%>
                <div
                    class="border-1 border border-black dark:border-white flex flex-col p-4 mx-10 my-8 rounded-md w-64 hover:border-0 hover:shadow-2xl dark:hover:bg-slate-800"
                    >
                    <i
                        class="fa-solid fa-mobile object-cover h-12 w-12 rounded-full bg-blue-500 my-2 flex items-center justify-center fa-xl text-white"
                        ></i>
                    <span class="my-4 font-bold text-3xl">Mobile</span>
                    <span class="my-1">Quanlity: Good</span>
                    <span class="my-1">Resolution: 480p</span>
                    <span class="my-1">Devices: Phone, Tablet</span>
                    <a
                        href="/subscription?plan=mobile"
                        class="flex items-center justify-center bg-blue-500 hover:shadow-lg hover:shadow-blue-500/50 t py-2 mt-12 font-medium tracking-wide text-white capitalize transition-colors duration-300 transform rounded-lg h-11 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80"
                        >2$</a
                    >
                </div>
                <%-- BASIC --%>
                <div
                    class="border-1 border border-black dark:border-white flex flex-col p-4 mx-10 my-8 rounded-md w-64 hover:border-0 hover:shadow-2xl dark:hover:bg-slate-800"
                    >
                    <i
                        class="fa-solid fa-film object-cover h-12 w-12 rounded-full bg-purple-500 my-2 flex items-center justify-center fa-xl text-white"
                        ></i>
                    <span class="my-4 font-bold text-3xl">Basic</span>
                    <span class="my-1">Quanlity: Good</span>
                    <span class="my-1">Resolution: 720p</span>
                    <span class="my-1">Devices: Phone, Tablet, Computer, TV</span>
                    <a
                        href="/subscription?plan=basic"
                        class="flex items-center justify-center bg-purple-500 hover:shadow-lg hover:shadow-purple-500/50 py-2 mt-6 font-medium tracking-wide text-white capitalize transition-colors duration-300 transform rounded-lg h-11 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80"
                        >5$</a
                    >
                </div>
                <%-- STANDARD --%>
                <div
                    c lass="border-1 border border-black dark:border-white flex flex-col p-4 mx-10 my-8 rounded-md w-64 hover:border-0 hover:shadow-2xl dark:hover:bg-slate-800"
                    >
                    <i
                        class="fa-solid fa-tv object-cover h-12 w-12 rounded-full bg-orange-500 my-2 flex items-center justify-center fa-xl text-white"
                        ></i>
                    <span class="my-4 font-bold text-3xl">Standard</span>
                    <span class="my-1">Quanlity: Better</span>
                    <span class="my-1">Resolution: 1080p</span>
                    <span class="my-1">Devices: Phone, Tablet, Computer, TV</span>
                    <a
                        href="/subscription?plan=standard"
                        class="flex items-center justify-center bg-orange-500 hover:shadow-lg hover:shadow-orange-500/50 py-2 mt-6 font-medium tracking-wide text-white capitalize transition-colors duration-300 transform rounded-lg h-11 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80"
                        >10$</a
                    >
                </div>
                <%-- PREMIUM --%>
                <div
                    class="border-1 border border-black dark:border-white flex flex-col p-4 mx-10 my-8 rounded-md w-64 hover:border-0 hover:shadow-2xl dark:hover:bg-slate-800"
                    >
                    <i
                        class="fa-solid fa-heart fa-solid fa-film object-cover h-12 w-12 rounded-full bg-red-500 my-2 flex items-center justify-center fa-xl text-white"
                        ></i>
                    <span class="my-4 font-bold text-3xl">Premium</span>
                    <span class="my-1">Quanlity: Best</span>
                    <span class="my-1">Resolution: 4K+HDR</span>
                    <span class="my-1">Devices: Phone, Tablet, Computer, TV</span>
                    <a
                        href="/subscription?plan=premium"
                        class="flex items-center justify-center bg-red-500 hover:shadow-lg hover:shadow-red-500/50 py-2 mt-6 font-medium tracking-wide text-white capitalize transition-colors duration-300 transform rounded-lg h-11 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80"
                        >20$</a
                    >
                </div>
            </div>
        </main>

        <script type="text/javascript">
            <%@include file="assets/header-script.js" %>
        </script>
    </body>
</html>
