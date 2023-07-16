<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Favorite List - NetClick</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%@ include file="components/imports.jsp" %>
  </head>

  <body class="bg-white dark:bg-gray-900 text-black dark:text-white">
    <!-- HEADER -->
    <%@ include file="components/header.jsp" %>

    <!-- MAIN CONTENT -->
    <main>
      <section class="pt-12 pb-24 text-center max-w-7xl mx-auto">
        <div data-aos="fade-down">
          <p class="text-primary mb-4">NetClick</p>
          <h2 class="font-bold text-4xl mb-12">Your Favorite Movies</h2>
        </div>

        <ul class="flex flex-wrap" data-aos="fade-up">
          <c:forEach var="movie" items="${movies}">
            <c:set var="movie" value="${movie}" scope="request" />
            <jsp:include page="components/movie.jsp" />
          </c:forEach>
        </ul>
      </section>
    </main>
    
    <!-- FOOTER -->
    <%@ include file="components/footer.jsp" %>

    <script type="text/javascript">
      <%@include file="assets/header-script.js" %>
    </script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
      AOS.init({ duration: 1500 });
    </script>
  </body>
</html>
