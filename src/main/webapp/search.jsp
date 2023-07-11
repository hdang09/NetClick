<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Search result for '${query}' - NetClick</title>
    <%@ include file="components/imports.jsp" %>
  </head>

  <body class="bg-white dark:bg-gray-900">
    <!-- HEADER -->
    <%@ include file="components/header.jsp" %>

    <!-- MAIN CONTENT -->
    <main class="text-black dark:text-white">
      <div class="pt-12 pb-24 text-center max-w-7xl mx-auto">
        <p class="text-primary mb-4">NetClick</p>

        <h2 class="font-bold text-4xl mb-12">Search result for '<span class="text-primary">${query}</span>'</h2>

        <ul class="flex flex-wrap">
          <c:forEach var="movie" items="${movies}">
            <c:set var="movie" value="${movie}" scope="request" />
            <jsp:include page="components/movie.jsp" />
          </c:forEach>
        </ul>
      </div>
    </main>

    <script type="text/javascript">
      <%@include file="assets/header-script.js" %>
    </script>
  </body>
</html>
