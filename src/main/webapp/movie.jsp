<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>${movie.title} - NetClick</title>
    <%@ include file="components/imports.jsp" %>
  </head>

  <body class="bg-white dark:bg-gray-900">
    <!-- HEADER -->
    <%@ include file="components/header.jsp" %>

    <!-- MAIN CONTENT -->
    <main class="text-black dark:text-white">
      <div class="pt-12 pb-24 text-center max-w-7xl mx-auto">
        <p class="text-primary mb-4">NetClick</p>

        <h2 class="font-bold text-4xl mb-12">${movie.title}</h2>

        <div class="flex justify-center items-center mt-[20px]">
          <iframe
            width="960"
            height="620"
            src="${movie.movie_url}"
            title="${movie.title}"
            frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
            allowfullscreen
          ></iframe>
        </div>
      </div>
    </main>

    <script type="text/javascript">
      <%@include file="assets/header-script.js" %>
    </script>
  </body>
</html>
