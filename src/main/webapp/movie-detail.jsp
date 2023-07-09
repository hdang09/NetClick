<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Movie Detail - NetClick</title>
    <%@ include file="../../components/imports.jsp" %>
  </head>
  <body class="bg-slate-100 dark:bg-slate-900 text-black dark:text-white">
    <div class="flex">
      <%@ include file="../../components/admin-sidebar.jsp" %>

      <!-- MAIN CONTENT -->
      <main class="ml-0 sm:ml-[17rem] p-8 border-r-2 flex-1">
        <section class="bg-white dark:bg-gray-900">
          <div class="max-w-6xl mx-auto">
            <p class="text-xl font-medium text-primary">Movie Details</p>

            <h1 class="mt-2 text-2xl font-bold text-gray-800 capitalize lg:text-3xl dark:text-white">${movie.title}</h1>

            <main class="relative z-20 w-full mt-8 md:flex md:items-center xl:mt-12">
              <div class="absolute w-full bg-primary -z-10 md:h-96 rounded-2xl"></div>

              <div
                class="w-full p-6 bg-blue-600 md:flex md:items-center rounded-2xl md:bg-transparent md:p-0 lg:px-12 md:justify-evenly"
              >
                <img
                  class="h-24 w-24 md:mx-6 rounded-full object-cover shadow-md md:h-[32rem] md:w-80 lg:h-[36rem] lg:w-[26rem] md:rounded-2xl"
                  src="${movie.thumbnail}"
                  alt="Thubmnail movie"
                />

                <div class="mt-2 md:mx-6 text-white">
                  <!-- Movie info -->
                  <div>
                    <p>Release date: ${movie.release}</p>
                    <p>Director: ${movie.director}</p>
                    <p>Tags: ...</p>
                  </div>

                  <!-- Description -->
                  <p class="mt-12">${movie.description}</p>

                  <!-- Rating -->
                  <div class="flex items-center mt-3">
                    <h2 class="mr-2">${movie.rating}</h2>
                    <div>
                      <c:forEach begin="1" end="${movie.rating}">
                        <i class="fa-solid fa-star text-xl mx-1 text-white"></i>
                      </c:forEach>
                      <c:forEach begin="1" end="${5 - movie.rating}">
                        <i class="fa-regular fa-star text-xl mx-1 text-white"></i>
                      </c:forEach>
                    </div>
                  </div>

                  <!-- TODO: Fix this -->
                  <div class="mt-12 flex">
                    <a
                      href="/404"
                      class="inline-flex justify-center items-center w-40 h-12 border border-white text-white rounded-md"
                      >+ Wishlist</a
                    >
                    <a
                      href="/subscription"
                      class="inline-flex justify-center items-center w-40 h-12 bg-white text-primary rounded-md ml-4"
                      >> Watch</a
                    >
                  </div>
                </div>
              </div>
            </main>
          </div>
        </section>
      </main>
    </div>

    <!-- Toggle theme -->
    <script type="text/javascript">
      const html = document.documentElement;
      const darkMode =
        localStorage.theme === 'dark' ||
        (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches);
      html.classList.toggle('dark', darkMode);
      localStorage.theme = darkMode ? 'dark' : 'light';

      document.getElementById('theme').onclick = () => {
        const isDark = localStorage.theme === 'dark';
        html.classList.toggle('dark', !isDark);
        localStorage.theme = isDark ? 'light' : 'dark';
      };
    </script>

    <!-- Chart.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
    <script>
      <%@include file="assets/dashboard-script.js" %>
    </script>
  </body>
</html>
