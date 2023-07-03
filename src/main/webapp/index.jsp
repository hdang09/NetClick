<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>NetClick</title>
    <%@ include file="components/imports.jsp" %>
  </head>

  <body class="bg-white dark:bg-gray-900">
    <!-- HEADER -->
    <%@ include file="components/header.jsp" %>

    <!-- MAIN CONTENT -->
    <main>
      <%-- Hero --%>
      <section class="text-white relative max-w-7xl mx-auto">
        <img
          src="https://collider.com/wp-content/uploads/the-avengers-movie-poster-banners-04.jpg"
          alt="Banner"
          class="w-full h-[30rem] object-cover"
        />
        <div class="absolute bottom-28 left-8">
          <p class="text-primary mb-4 text-2xl">NetClick</p>

          <h1 class="font-bold text-5xl mb-8 max-w-2xl">
            Unlimited <strong class="text-primary">Movie</strong>, TVs Shows, & More
          </h1>

          <c:if test="${tendangnhap == null}">
            <form action="/LogoutController" method="POST">
              <input type="hidden" name="logout" value="true" />
              <button
                type="submit"
                class="inline-block border-2 border-primary hover:bg-primary py-3 px-8 rounded-full"
              >
                <i class="fa-solid fa-right-to-bracket text-white"></i>
                <span class="ml-2">Sign in</span>
              </button>
            </form>
          </c:if>

          <c:if test="${tendangnhap != null}">
            <a href="/new-movies" class="inline-block border-2 border-primary hover:bg-primary py-3 px-8 rounded-full">
              <i class="fa-solid fa-play text-white"></i>
              <span class="ml-2">Watch Now</span>
            </a>
          </c:if>
        </div>
      </section>

      <%-- Recommended Movies --%>
      <section class="dark:text-white">
        <div class="py-24 max-w-7xl mx-auto">
          <p class="text-primary mb-4">Online Streaming</p>

          <h2 class="font-bold text-4xl mb-12">Recommended Movies</h2>

          <ul class="flex justify-between flex-wrap">
            <c:forEach begin="1" end="6"> <%@ include file="components/movie.jsp" %> </c:forEach>
          </ul>
        </div>
      </section>

      <section class="dark:text-white bg-slate-100 dark:bg-gray-950">
        <div class="py-24 text-center max-w-7xl mx-auto">
          <p class="text-primary mb-4">Online Streaming</p>

          <h2 class="font-bold text-4xl mb-12">New Movies</h2>

          <ul class="flex max-w-2xl items-center justify-center flex-wrap mb-12 mx-auto">
            <li>
              <button class="py-4 px-6 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                ALL
              </button>
            </li>
            <li>
              <button class="py-4 px-6 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                Action
              </button>
            </li>
            <li>
              <button class="py-4 px-6 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                Adventure
              </button>
            </li>
            <li>
              <button class="py-4 px-6 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                Classic
              </button>
            </li>
            <li>
              <button class="py-4 px-6 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                Documentaries
              </button>
            </li>
            <li>
              <button class="py-4 px-6 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                Dramas
              </button>
            </li>
            <li>
              <button class="py-4 px-6 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                Horror
              </button>
            </li>
          </ul>

          <ul class="flex justify-center flex-wrap">
            <c:forEach begin="1" end="12"> <%@ include file="components/movie.jsp" %> </c:forEach>
          </ul>
        </div>
      </section>

      <%-- Top Rated Movies --%>
      <section class="dark:text-white">
        <div class="py-24 text-center max-w-7xl mx-auto">
          <p class="text-primary mb-4">Online Streaming</p>

          <h2 class="font-bold text-4xl mb-12">Top Rated Movies</h2>

          <ul class="flex justify-between flex-wrap">
            <c:forEach begin="1" end="6"> <%@ include file="components/movie.jsp" %> </c:forEach>
          </ul>
        </div>
      </section>
    </main>

    <!-- FOOTER -->
    <%@ include file="components/footer.jsp" %>

    <script type="text/javascript">
        <%@include file="assets/header-script.js" %>
    </script>
  </body>
</html>
