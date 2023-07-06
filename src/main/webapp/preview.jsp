<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>${movie.title} Preview - NetClick</title>
    <%@ include file="components/imports.jsp" %>
    <style>
      #one-input:checked ~ #one > i,
      #two-star:checked ~ #one > i,
      #two-star:checked ~ #two > i,
      #three-star:checked ~ #one i,
      #three-star:checked ~ #two > i,
      #three-star:checked ~ #three > i,
      #four-star:checked ~ #one > i,
      #four-star:checked ~ #two > i,
      #four-star:checked ~ #three > i,
      #four-star:checked ~ #four > i,
      #five-star:checked ~ #one > i,
      #five-star:checked ~ #two > i,
      #five-star:checked ~ #three > i,
      #five-star:checked ~ #four > i,
      #five-star:checked ~ #five > i {
        color: #eab308;
      }
    </style>
  </head>
  <body class="bg-white dark:bg-gray-900">
    <%@ include file="components/header.jsp" %>

    <!-- MAIN CONTENT -->
    <main class="text-black dark:text-white mt-6 max-w-7xl mx-auto">
      <div class="flex rounded-lg">
        <!-- Left content -->
        <div class="w-[40rem] bg-slate-200 dark:bg-slate-800 text-xl p-6">
          <!-- Title -->
          <h1 class="font-bold text-5xl mb-2">${movie.title}</h1>
          <!-- Rating -->
          <div class="flex">
            <h2>${movie.rating}</h2>
            <div>
              <c:forEach begin="1" end="${movie.rating}">
                <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
              </c:forEach>
              <c:forEach begin="1" end="${5 - movie.rating}">
                <i class="fa-solid fa-star text-xl mx-1 text-state-500"></i>
              </c:forEach>
            </div>
          </div>

          <!-- Buttons-->
          <div class="mt-12 flex">
            <a
              href="/fav-list?movieID=${movie.ID}"
              class="inline-flex justify-center items-center w-40 h-12 border border-slate-400 text-slate-400 rounded-md"
              >+ Favorite List</a
            >
            <a
              href="/subscription"
              class="inline-flex justify-center items-center w-40 h-12 bg-slate-400 text-white rounded-md ml-4"
              >> Watch</a
            >
          </div>
          <p>${message}</p>

          <!-- Movie info -->
          <div class="mt-12">
            <p>Release date: ${movie.release}</p>
            <p>Director: ${movie.director}</p>
            <p>Tags:</p>
          </div>

          <!-- Description -->
          <p class="mt-12">${movie.description}</p>
        </div>

        <!-- Right content -->
        <div class="flex justify-center items-center flex-1">
          <img src="${movie.thumbnail}" alt="Thumbnail" class="w-96" />
        </div>
      </div>

      <div class="flex mt-6">
        <%-- COMMENT AND RATING --%>
        <div class="flex flex-col flex-1">
          <h2 class="font-bold text-xl text-slate-400 mb-4">COMMENT AND RATING</h2>
          <form action="/preview?id=${movie.ID}" method="POST">
            <%-- Rating --%>
            <div class="mb-4">
              <div class="flex">
                <label class="mr-7">Rating: </label>
                <input type="radio" id="one-input" name="rating" value="1" class="hidden" />
                <input type="radio" id="two-star" name="rating" value="2" class="hidden" />
                <input type="radio" id="three-star" name="rating" value="3" class="hidden" />
                <input type="radio" id="four-star" name="rating" value="4" class="hidden" />
                <input type="radio" id="five-star" name="rating" value="5" class="hidden" />

                <label id="one" for="one-input" class="cursor-pointer">
                  <i class="fa-solid fa-star text-xl mx-1"></i>
                </label>
                <label id="two" for="two-star" class="cursor-pointer">
                  <i class="fa-solid fa-star text-xl mx-1"></i>
                </label>
                <label id="three" for="three-star" class="cursor-pointer">
                  <i class="fa-solid fa-star text-xl mx-1"></i>
                </label>
                <label id="four" for="four-star" class="cursor-pointer">
                  <i class="fa-solid fa-star text-xl mx-1"></i>
                </label>
                <label id="five" for="five-star" class="cursor-pointer">
                  <i class="fa-solid fa-star text-xl mx-1"></i>
                </label>
              </div>
              <p class="text-red-400">${ratingError}</p>
            </div>

            <%-- Comment --%>
            <label class="mr-2">Comment: </label>
            <input type="hidden" name="action" value="comment" />
            <textarea name="comment" class="border w-96 h-32 dark:bg-slate-800"></textarea>
            <input
              type="submit"
              value="Add comment"
              class="py-2 px-6 bg-primary text-white rounded-lg cursor-pointer"
            />
          </form>

          <ul>
            <c:forEach var="review" items="${reviews}">
              <li class="p-2 border-b-2 border-slate-200">
                <div class="flex items-center">
                  <div class="flex items-center justify-center border w-8 h-8 rounded-full">
                    <i class="fa-solid fa-user text-lg"></i>
                  </div>
                  <h2 class="ml-2">@${review.username}</h2>
                </div>

                <c:forEach begin="1" end="${review.rating}">
                  <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
                </c:forEach>
                <c:forEach begin="1" end="${5 - review.rating}">
                  <i class="fa-solid fa-star text-xl mx-1 text-state-500"></i>
                </c:forEach>

                <p>${review.comment}</p>
              </li>
            </c:forEach>
          </ul>
        </div>

        <%-- BEGIN: SIMILAR --%>
        <div class="w-96 mx-auto px-6">
          <h2 class="font-bold text-xl text-slate-400 mb-4">SIMILAR</h2>
          <ul class="flex justify-between flex-wrap">
            <c:forEach var="movie" items="${related}">
              <c:set var="movie" value="${movie}" scope="request" />
              <jsp:include page="components/movie-2.jsp" />
            </c:forEach>
          </ul>
        </div>
      </div>
    </main>

    <script type="text/javascript">
      <%@include file="assets/header-script.js" %>
    </script>
  </body>
</html>
