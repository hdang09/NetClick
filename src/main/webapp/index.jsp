<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>NetClick</title>
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
  <body>
    <div class="flex">
      <%@ include file="components/sidebar.jsp" %>

      <!-- MAIN CONTENT -->
      <main class="p-6 w-[60rem] border-r-2">
        <ul class="flex text-gray-400 font-semibold mb-6">
          <li class="mx-3 font-bold"><a href="/tags?tag=movie">Movie</a></li>
          <li class="mx-3"><a href="/tags?tag=adventure">Adventure</a></li>
          <li class="mx-3"><a href="/tags?tag=classic">Classic</a></li>
          <li class="mx-3"><a href="/tags?tag=comedes">Comedies</a></li>
          <li class="mx-3">
            <a href="/tags?tag=documentaries">Documetaries</a>
          </li>
          <li class="mx-3"><a href="/tags?tag=dramas">Dramas</a></li>
          <li class="mx-3"><a href="/tags?tag=horror">Horror</a></li>
        </ul>

        <img
          src="https://collider.com/wp-content/uploads/the-avengers-movie-poster-banners-04.jpg"
          alt="Banner"
          class="w-full h-80"
        />

        <div class="my-2">
          <h2 class="text-gray-400 font-bold my-5 text-xl">Recommended</h2>
          <ul class="flex justify-between">
            <c:forEach begin="1" end="5">
              <li class="w-40 relative flex justify-center">
                <img
                  src="https://m.media-amazon.com/images/M/MV5BODc0ZDM3MjgtNDA5ZC00MWUwLWJmM2ItMjBmM2YzMjBmNzRkXkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg"
                  alt="Movie"
                  class="rounded-md"
                />
                <a href="/preview?movie=love-again" class="w-32 h-10 bg-red-700 text-white text-sm rounded-md absolute bottom-2 m-auto flex items-center justify-center">
                  Watch Now
                </a>
              </li>
            </c:forEach>
          </ul>
        </div>
      </main>

      <%@ include file="components/rate-movie.jsp" %>
    </div>
  </body>
</html>
