<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Subscription Plan - NetClick</title>
        <%@ include file="components/imports.jsp" %>
    </head>

    <body class="bg-white dark:bg-gray-900">
        <!-- HEADER -->
        <%@ include file="components/header.jsp" %>

        <!-- MAIN CONTENT -->
        <main class="text-black dark:text-white p-6 max-w-7xl mx-auto">
            <!-- Back -->
            <%--
            <div class="flex justify-between items-center">
                <a href="#" class="flex items-center font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 hover:bg-blue-500 
                   focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80 p-2 rounded-full absolute top-6 right-6 back-button">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                    </svg>
                    <span class="text-sm ml-1">Back</span>
                </a>
                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        const backButton = document.querySelector(".back-button");
                        backButton.addEventListener("click", function (e) {
                            e.preventDefault();
                            window.history.back();
                        });
                    });
                </script>
            </div>
            --%>
            <!-- End Back -->
            
            <%@ include file="components/stepper.jsp" %>
            
            <div class="flex justify-content flex-col items-center">
                <span class="font-medium text-3xl" style="margin-top: 100px; margin-bottom: 20px">Choose how to pay</span>
                <span class="text-xl" style="width: 400px; text-align: center"
                      >Your payment is encrypted and you can change how you pay anytime.</span
                >
                <div class="my-5 flex flex-col justify-center items-center">
                    <span class="text-zinc-500 text-lg">Secure for peace of mind.</span>
                    <span class="text-zinc-500 text-lg">Cancel easily online.</span>
                </div>
            </div>
            <div class="flex justify-content flex-col items-center">
                <a href="/visa?plan=<%= request.getParameter("plan")%>" class="flex items-center bg-slate-100 dark:bg-slate-800 transition-opacity duration-500 hover:bg-opacity-10 p-5 my-6 shadow-lg rounded-lg w-[500px] h-[50px]">
                    <span class="text-2xl">Credit Card</span>
                    <img
                        src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/2560px-Visa_Inc._logo.svg.png"
                        alt=""
                        class="w-[45px] h-[20px]"
                        />
                    <span class="text-4xl" style="margin-left: 250px">></span>
                </a>
                <a href="/momo?plan=<%= request.getParameter("plan")%>" class="flex items-center bg-slate-100 dark:bg-slate-800 transition-opacity duration-500 hover:bg-opacity-10 p-5 my-6 shadow-lg rounded-lg w-[500px] h-[50px]">
                    <span class="text-2xl">Digital Wallet</span>
                    <img src="https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png" alt="" class="w-[25px] h-[25px]" />
                    <img
                        src="https://cdn.haitrieu.com/wp-content/uploads/2022/10/Logo-ZaloPay-Square.png"
                        alt=""
                        class="w-[25px] h-[25px]"
                        />
                    <span class="text-4xl" style="margin-left: 225px">></span>
                </a>
            </div>
        </main>

        <script type="text/javascript">
            <%@include file="assets/header-script.js" %>
        </script>
    </body>
</html>