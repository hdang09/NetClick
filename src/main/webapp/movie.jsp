<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>${movie.title} - NetClick</title>
    <%@ include file="components/imports.jsp" %>
  </head>
  <body>
    <div class="flex">
      <%@ include file="components/sidebar.jsp" %>

      <!-- MAIN CONTENT -->
      <main class="ml-0 sm:ml-[15rem] p-10 w-[100vw]">
        <div class="mt-[10px]">
          <span class="font-bold text-3xl ml-[120px]">${movie.title}</span>
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
    </div>
  </body>
</html>
