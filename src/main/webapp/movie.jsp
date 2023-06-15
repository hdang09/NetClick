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
      <main class="ml-0 sm:ml-[15rem] p-10 w-[100vw]">
        <div style="margin-top: 50px">
          <span class="font-bold text-3xl" style="margin-left: 320px">Lets Go</span>
          <div class="flex justify-center items-center" style="margin-top: 100px">
            <iframe
              width="960"
              height="620"
              src="https://www.youtube.com/embed/dQw4w9WgXcQ"
              title="YouTube video player"
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
