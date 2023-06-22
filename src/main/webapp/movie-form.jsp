<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Movie Form Page - NetClick</title>
    <%@ include file="../../components/imports.jsp" %>
  </head>
  <body>
    <div class="flex">
      <%@ include file="../../components/admin-sidebar.jsp" %>

      <!-- MAIN CONTENT -->
      <main class="ml-0 sm:ml-[18rem] p-6 border-r-2 flex-1 bg-gray-100 min-h-screen">
        <section class="max-w-4xl p-6 mx-auto bg-white rounded-md shadow-md dark:bg-gray-800 mt-12">
          <h1 class="font-bold text-2xl">Add Movie</h1>

          <form action="${requestScope['javax.servlet.forward.request_uri']}" method="POST">
            <div class="grid grid-cols-1 gap-6 mt-4 sm:grid-cols-2">
              <!-- TITLE Input -->
              <div>
                <label for="title" class="block text-sm text-gray-500 dark:text-gray-300">Title</label>

                <div class="relative flex items-center mt-2">
                  <span class="absolute">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke-width="1.5"
                      stroke="currentColor"
                      class="w-6 h-6 mx-3 text-gray-400 dark:text-gray-500"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75"
                      />
                    </svg>
                  </span>

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
                  <p
                    class="py-2.5 px-3 text-gray-500 bg-gray-100 dark:bg-gray-800 dark:border-gray-700 border border-r-0 rtl:rounded-r-lg rtl:rounded-l-none rtl:border-l-0 rtl:border-r rounded-l-lg"
                  >
                    http://
                  </p>
                  <input
                    name="movie-url"
                    type="text"
                    value="${movie.movie_url}"
                    placeholder="youtu.be/okz5RIZRT0U"
                    class="block w-full rounded-l-none rtl:rounded-l-lg rtl:rounded-r-none placeholder-gray-400/70 dark:placeholder-gray-500 rounded-lg border border-gray-200 bg-white px-5 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:focus:border-blue-300"
                  />
                </div>

                <p class="mt-3 text-xs text-red-400">${titleMsg == null ? "" : titleMsg}</p>
              </div>

              <!-- Description Input -->
              <div>
                <label for="description" class="block text-sm text-gray-500 dark:text-gray-300">Description</label>

                <textarea
                  name="description"
                  placeholder="Lorem ipsum..."
                  class="block mt-2 w-full placeholder-gray-400/70 dark:placeholder-gray-500 rounded-lg border border-gray-200 bg-white px-4 h-36 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:focus:border-blue-300"
                >${movie.description}</textarea>

                <p class="mt-3 text-xs text-red-400">${descriptionMsg == null ? "" : titleMsg}</p>
              </div>

              <div>
                <!-- Tag Input -->
              <div>
                <label for="tag" class="block text-sm text-gray-500 dark:text-gray-300">Tag</label>

                <div class="relative flex items-center mt-2">
                  <span class="absolute">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke-width="1.5"
                      stroke="currentColor"
                      class="w-6 h-6 mx-3 text-gray-400 dark:text-gray-500"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75"
                      />
                    </svg>
                  </span>

                  <input
                    name="tag"
                    type="text"
                    placeholder="Classic"
                    class="block w-full py-2.5 text-gray-700 placeholder-gray-400/70 bg-white border border-gray-200 rounded-lg pl-11 pr-5 rtl:pr-11 rtl:pl-5 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40"
                  />
                </div>

                <!--<p class="mt-3 text-xs text-red-400">${titleMsg == null ? "" : titleMsg}</p>-->
              </div>

                <!-- DIRECTOR Input -->
                <div class="mt-6">
                  <label for="director" class="block text-sm text-gray-500 dark:text-gray-300">Director</label>

                  <div class="relative flex items-center mt-2">
                    <span class="absolute">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke-width="1.5"
                        stroke="currentColor"
                        class="w-6 h-6 mx-3 text-gray-400 dark:text-gray-500"
                      >
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75"
                        />
                      </svg>
                    </span>

                    <input
                      name="director"
                      type="text"
                      value="${movie.director}"
                      placeholder="Hai Dang"
                      class="block w-full py-2.5 text-gray-700 placeholder-gray-400/70 bg-white border border-gray-200 rounded-lg pl-11 pr-5 rtl:pr-11 rtl:pl-5 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40"
                    />
                  </div>

                  <p class="mt-3 text-xs text-red-400">${titleMsg == null ? "" : titleMsg}</p>
                </div>
              </div>

              <!-- Thumbnail URL Input -->
              <div>
                <label for="thubmnail-url" class="block text-sm text-gray-500 dark:text-gray-300">Thumbnail URL</label>

                <div class="flex items-center mt-2">
                  <p
                    class="py-2.5 px-3 text-gray-500 bg-gray-100 dark:bg-gray-800 dark:border-gray-700 border border-r-0 rtl:rounded-r-lg rtl:rounded-l-none rtl:border-l-0 rtl:border-r rounded-l-lg"
                  >
                    http://
                  </p>
                  <input
                    name="thubmnail-url"
                    type="text"
                    value="${movie.thumbnail}"
                    placeholder="photos.google.com/abcdef"
                    class="block w-full rounded-l-none rtl:rounded-l-lg rtl:rounded-r-none placeholder-gray-400/70 dark:placeholder-gray-500 rounded-lg border border-gray-200 bg-white px-5 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:focus:border-blue-300"
                  />
                </div>

                <p class="mt-3 text-xs text-red-400">${titleMsg == null ? "" : titleMsg}</p>
              </div>

              <!-- RELEASE DATE Input -->
                <div>
                  <label for="release" class="block text-sm text-gray-500 dark:text-gray-300">Release Date</label>

                  <input
                    name="release"
                    type="date"
                    class="block mt-2 w-full placeholder-gray-400/70 dark:placeholder-gray-500 rounded-lg border border-gray-200 bg-white px-5 py-2.5 text-gray-700 focus:border-blue-400 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-40 dark:border-gray-600 dark:bg-gray-900 dark:text-gray-300 dark:focus:border-blue-300"
                  />
                  
                    <p class="mt-3 text-xs text-red-400">${descriptionMsg == null ? "" : titleMsg}</p>
                </div>
            </div>

            <div class="flex justify-end mt-6">
              <button
                class="px-8 py-2.5 leading-5 text-white transition-colors duration-300 transform bg-gray-700 rounded-md hover:bg-gray-600 focus:outline-none focus:bg-gray-600"
              >
                Save
              </button>
            </div>
              
              <input type="hidden" name="action" value="${param.editID != null ? 'edit' : 'add'}" />
          </form>
        </section>
      </main>
    </div>
  </body>
</html>
