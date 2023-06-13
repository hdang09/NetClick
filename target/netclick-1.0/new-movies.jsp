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
      <main class="ml-0 sm:ml-[15rem] p-6">
        <ul class="flex flex-wrap">
          <c:forEach var="movie" items="${movies}">
            <c:set var="movie" value="${movie}" scope="request" />
            <jsp:include page="components/movie.jsp" />
          </c:forEach>
        </ul>
      </main>
    </div>
  </body>
</html>
