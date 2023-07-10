<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dao.MovieDAO" %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${action} Movie - NetClick</title>
    <%@ include file="../../components/imports.jsp" %>
  </head>
  <body class="bg-slate-100 dark:bg-slate-900 text-black dark:text-white">
    <div class="flex">
      <%@ include file="../../components/admin-sidebar.jsp" %>

      <!-- MAIN CONTENT -->
      <main class="ml-0 sm:ml-[17rem] p-6 border-r-2 flex-1 min-h-screen">
        <section class="max-w-4xl p-6 mx-auto bg-white rounded-md shadow-md dark:bg-gray-800 mt-12">
          <h1 class="font-bold text-2xl">${action} Movie</h1>

          <form action="${requestScope['javax.servlet.forward.request_uri']}" method="POST">
            <div class="grid grid-cols-1 gap-6 mt-4 sm:grid-cols-2">
              <!-- TITLE Input -->
              <div>
                <label for="title" class="block text-sm text-gray-500 dark:text-gray-300">Title</label>

                <div class="relative flex items-center mt-2">
                  <i
                    class="fa-solid fa-heading absolute w-6 h-6 m-3 flex items-center justify-center text-gray-400 dark:text-gray-500"
                  ></i>

                  <input
                    name="title"
                    type="text"
                    value="${movie.title}"
                    placeholder="Doraemon The Movie 2"
                    class="block w-full py-2.5 text-gray-700 placeholder-gray-400/70 bg-white border border-gray-200 rounded-lg pl-11 pr-5 rtl:pr-11 rtl:pl-5 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40"
                  />
                </div>

                <p class="mt-3 text-xs text-red-400">${titleMsg == null ? "" : titleMsg}</p>
              </div>

              <!-- MOVIE URL Input -->
              <div>
                <label for="movie-url" class="block text-sm text-gray-500 dark:text-gray-300">Movie URL</label>

                <div class="flex items-center mt-2">
                  <i
                    class="fa-solid fa-film absolute w-6 h-6 m-3 flex items-center justify-center text-gray-400 dark:text-gray-500"
                  ></i>

                  <input
                    name="movie-url"
                    type="text"
                    value="${movie.movie_url}"
                    placeholder="youtu.be/okz5RIZRT0U"
                    class="block w-full py-2.5 text-gray-700 placeholder-gray-400/70 bg-white border border-gray-200 rounded-lg pl-11 pr-5 rtl:pr-11 rtl:pl-5 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40"
                  />
                </div>

                <p class="mt-3 text-xs text-red-400">${movieURLMsg == null ? "" : movieURLMsg}</p>
              </div>

              <!-- Description Input -->
              <div>
                <label for="description" class="block text-sm text-gray-500 dark:text-gray-300">Description</label>

                <textarea
                  name="description"
                  placeholder="Lorem ipsum..."
                  class="block mt-2 w-full placeholder-gray-400/70 dark:placeholder-gray-500 rounded-lg border border-gray-200 bg-white px-4 h-36 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:focus:border-blue-300"
                >
                    ${movie.description}</textarea
                >

                <p class="mt-3 text-xs text-red-400">${descriptionMsg == null ? "" : descriptionMsg}</p>
              </div>

              <div>
                <!-- Tag Input -->
                <div>
                  <label for="tag" class="block text-sm text-gray-500 dark:text-gray-300">Tag</label>

                  <div class="relative flex items-center mt-2">
                    <!--<i class="fa-solid fa-tag absolute w-6 h-6 m-3 text-gray-400 dark:text-gray-500 flex items-center justify-center"></i>-->

                    <select
                      name="tag"
                      id="tag"
                      class="block w-full rounded-l-none rtl:rounded-l-lg rtl:rounded-r-none placeholder-gray-400/70 dark:placeholder-gray-500 rounded-lg border border-gray-200 bg-white px-5 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:focus:border-blue-300"
                    >
                      <c:set var="dao" value="<%= new dao.MovieDAO() %>" />

                      <c:forEach var="tag" items="${dao.getAllTag()}">
                        <option value="${tag}">${tag}</option>
                      </c:forEach>
                    </select>
                  </div>

                  <!--<p class="mt-3 text-xs text-red-400">${tagMsg == null ? "" : tagMsg}</p>-->
                </div>

                <!-- DIRECTOR Input -->
                <div class="mt-6">
                  <label for="director" class="block text-sm text-gray-500 dark:text-gray-300">Director</label>

                  <div class="relative flex items-center mt-2">
                    <i
                      class="fa-regular fa-user absolute w-6 h-6 m-3 text-gray-400 dark:text-gray-500 flex items-center justify-center"
                    ></i>

                    <input
                      name="director"
                      type="text"
                      value="${movie.director}"
                      placeholder="Hai Dang"
                      class="block w-full py-2.5 text-gray-700 placeholder-gray-400/70 bg-white border border-gray-200 rounded-lg pl-11 pr-5 rtl:pr-11 rtl:pl-5 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40"
                    />
                  </div>

                  <p class="mt-3 text-xs text-red-400">${directorMsg == null ? "" : directorMsg}</p>
                </div>
              </div>

              <!-- Thumbnail URL Input -->
              <div>
                <label for="thubmnail-url" class="block text-sm text-gray-500 dark:text-gray-300">Thumbnail URL</label>

                <div class="flex items-center mt-2">
                  <i
                    class="fa-regular fa-image absolute w-6 h-6 m-3 text-gray-400 dark:text-gray-500 flex items-center justify-center"
                  ></i>

                  <input
                    name="thumbnail-url"
                    type="text"
                    value="${movie.thumbnail}"
                    placeholder="photos.google.com/abcdef"
                    class="block w-full py-2.5 text-gray-700 placeholder-gray-400/70 bg-white border border-gray-200 rounded-lg pl-11 pr-5 rtl:pr-11 rtl:pl-5 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40"
                  />
                </div>

                <p class="mt-3 text-xs text-red-400">${thumbnailURLMsg == null ? "" : thumbnailURLMsg}</p>
              </div>

              <!-- RELEASE DATE Input -->
              <div>
                <label for="release" class="block text-sm text-gray-500 dark:text-gray-300">Release Date</label>

                <input
                  name="release"
                  type="date"
                  value="${release}"
                  max="<%= java.time.LocalDate.now() %>"
                  class="block mt-2 w-full placeholder-gray-400/70 dark:placeholder-gray-500 rounded-lg border border-gray-200 bg-white px-5 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:focus:border-blue-300"
                />

                <p class="mt-3 text-xs text-red-400">${releaseMsg == null ? "" : releaseMsg}</p>
              </div>
            </div>

            <div class="flex justify-end mt-6">
              <button
                class="px-8 py-2.5 leading-5 text-white transition-colors duration-300 transform bg-gray-700 rounded-md hover:bg-gray-600 focus:outline-none focus:bg-gray-600"
              >
                Save
              </button>
            </div>

            <input type="hidden" name="action" value="${editID != null ? 'edit' : 'add'}" />
          </form>
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
