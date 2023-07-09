<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>MoMo Payment | NetClick</title>
    <%@ include file="components/imports.jsp" %>
  </head>

  <body class="bg-white dark:bg-gray-900">
    <%@ include file="components/header.jsp" %>

    <!-- Main content -->
    <main class="text-black dark:text-white p-6 max-w-7xl mx-auto">
      <!-- Title -->
      <div class="flex justify-center items-center mt-2">
        <h1 class="text-6xl md:text-7xl font-light mb-8 px-3">Set up your phone number</h1>
      </div>

      <!-- Stepper -->
      <%@ include file="components/stepper.jsp" %>
      <div class="flex justify-center items-center mb-8">
          <img src="assets/momoreal.png" alt="MoMo" class="w-24 h-24" />
      </div>

      <!-- Description -->
      <p class="text-center text-lg font-light pb-4">
        Enter your MoMo mobile number. Your number will also be used if you forget your password and for important
        account messages.
      </p>

      <!-- Body -->
      <div class="w-full max-w-md mx-auto">
        <div class="w-full">
          <div class="max-w-md">
            <!-- login form -->
            <p class="text-red-400"><c:out value="${errornum}" /></p>
            <form class="space-y-4 pt-4" action="/Payment?action=momo" method="POST">
              <input type="hidden" name="subscriptionID" value="${param.subscriptionID}" />
              <div>
                <input
                  id="input"
                  type="text"
                  name="mnumber"
                  class="dark:bg-slate-800 w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500"
                  placeholder="Enter your phone number"
                />
              </div>
              <div class="flex text-left">
                <div class="flex justify-center">
                  <p>
                    <c:choose>
                      <c:when test="${param.plan == 'mobile'}">1＄/month <br />Mobile</c:when>
                      <c:when test="${param.plan == 'basic'}">5＄/month <br />Basic</c:when>
                      <c:when test="${param.plan == 'standard'}">10＄/month <br />Standard</c:when>
                      <c:when test="${param.plan == 'premium'}">20＄/month <br />Premium</c:when>
                    </c:choose>
                  </p>
                </div>
                <button type="submit" class="ml-auto block font-semibold focus:outline-none text-blue-400 hover:text-blue-600 transition-colors">
                  <a href="/subscription.jsp"> Change </a>
                </button>
              </div>              
              <div class="flex text-left">
                <button
                  type="submit" value="Submit"
                  class="ml-auto px-4 py-2 bg-blue-500 text-white font-semibold rounded-md focus:outline-none hover:bg-blue-600 transition-colors"
                >Submit
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
   <script type="text/javascript">
      <%@include file="assets/header-script.js" %>
   </script>
  </body>
</html>
