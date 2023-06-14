<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Page</title>
    <%@ include file="../../components/imports.jsp" %>
  </head>
  <body>
    <div class="flex">
      <%@ include file="../../components/admin-sidebar.jsp" %>

      <!-- MAIN CONTENT -->
      <main class="ml-0 sm:ml-[18rem] p-6 border-r-2 flex-1">
        <h1 class="font-bold text-2xl">Movie Management</h1>

        <section class="container px-4 mx-auto my-8">
          <div class="flex flex-col">
            <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
              <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
                <div class="overflow-hidden border border-gray-200 dark:border-gray-700 md:rounded-lg">
                  <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                    <!-- Table head -->
                    <thead class="bg-gray-50 dark:bg-gray-800">
                      <tr>
                        <th
                          scope="col"
                          class="py-3.5 px-4 text-sm font-bold text-left rtl:text-right text-gray-500 dark:text-gray-400"
                        >
                          ID
                        </th>

                        <th
                          scope="col"
                          class="px-4 py-3.5 text-sm font-bold text-left rtl:text-right text-gray-500 dark:text-gray-400"
                        >
                          Username
                        </th>

                        <th
                          scope="col"
                          class="px-4 py-3.5 text-sm font-bold text-left rtl:text-right text-gray-500 dark:text-gray-400"
                        >
                          Email
                        </th>

                        <th
                          scope="col"
                          class="px-4 py-3.5 text-sm font-bold text-left rtl:text-right text-gray-500 dark:text-gray-400"
                        >
                          Status
                        </th>

                        <th
                          scope="col"
                          class="px-4 py-3.5 text-sm font-bold text-left rtl:text-right text-gray-500 dark:text-gray-400"
                        >
                          Subscription
                        </th>

                        <th
                          scope="col"
                          class="px-4 py-3.5 text-sm font-bold text-left rtl:text-right text-gray-500 dark:text-gray-400"
                        >
                          Role
                        </th>

                        <th scope="col" class="relative py-3.5 px-4">
                          <span class="sr-only">Actions</span>
                        </th>
                      </tr>
                    </thead>

                    <!-- Table body -->
                    <tbody class="bg-white divide-y divide-gray-200 dark:divide-gray-700 dark:bg-gray-900">
                      <tr>
                        <td class="px-4 py-4 text-sm text-gray-700 dark:text-gray-200 whitespace-nowrap">1</td>
                        <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">hdang09</td>
                        <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">
                          dangtranhai628@gmail.com
                        </td>
                        <td class="px-4 py-4 text-sm font-medium text-gray-700 whitespace-nowrap">
                          <div
                            class="inline-flex items-center px-3 py-1 rounded-full gap-x-2 text-emerald-500 bg-emerald-100/60 dark:bg-gray-800"
                          >
                            <svg
                              width="12"
                              height="12"
                              viewBox="0 0 12 12"
                              fill="none"
                              xmlns="http://www.w3.org/2000/svg"
                            >
                              <path
                                d="M10 3L4.5 8.5L2 6"
                                stroke="currentColor"
                                stroke-width="1.5"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                              />
                            </svg>

                            <h2 class="text-sm font-normal">Active</h2>
                          </div>
                        </td>
                        <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">Basic</td>
                        <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">User</td>
                        <td class="px-4 py-4 text-sm whitespace-nowrap">
                          <div class="flex items-center gap-x-6">
                            <button
                              class="text-gray-500 transition-colors duration-200 dark:hover:text-indigo-500 dark:text-gray-300 hover:text-indigo-500 focus:outline-none"
                            >
                              Change status
                            </button>

                            <button
                              class="text-blue-500 transition-colors duration-200 hover:text-indigo-500 focus:outline-none"
                            >
                              Change role
                            </button>
                          </div>
                        </td>
                      </tr>

                      <tr>
                        <td class="px-4 py-4 text-sm text-gray-700 dark:text-gray-200 whitespace-nowrap">1</td>
                        <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">hdang09</td>
                        <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">
                          dangtranhai628@gmail.com
                        </td>
                        <td class="px-4 py-4 text-sm font-medium text-gray-700 whitespace-nowrap">
                          <div
                            class="inline-flex items-center px-3 py-1 text-red-500 rounded-full gap-x-2 bg-red-100/60 dark:bg-gray-800"
                          >
                            <svg
                              width="12"
                              height="12"
                              viewBox="0 0 12 12"
                              fill="none"
                              xmlns="http://www.w3.org/2000/svg"
                            >
                              <path
                                d="M9 3L3 9M3 3L9 9"
                                stroke="currentColor"
                                stroke-width="1.5"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                              />
                            </svg>

                            <h2 class="text-sm font-normal">Banned</h2>
                          </div>
                        </td>
                        <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">Basic</td>
                        <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">User</td>
                        <td class="px-4 py-4 text-sm whitespace-nowrap">
                          <div class="flex items-center gap-x-6">
                            <button
                              class="text-gray-500 transition-colors duration-200 dark:hover:text-indigo-500 dark:text-gray-300 hover:text-indigo-500 focus:outline-none"
                            >
                              Change status
                            </button>

                            <button
                              class="text-blue-500 transition-colors duration-200 hover:text-indigo-500 focus:outline-none"
                            >
                              Change role
                            </button>
                          </div>
                        </td>
                      </tr>

                      <c:forEach begin="1" end="5">
                        <tr>
                          <td class="px-4 py-4 text-sm text-gray-700 dark:text-gray-200 whitespace-nowrap">1</td>
                          <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">hdang09</td>
                          <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">
                            dangtranhai628@gmail.com
                          </td>
                          <td class="px-4 py-4 text-sm font-medium text-gray-700 whitespace-nowrap">
                            <div
                              class="inline-flex items-center px-3 py-1 rounded-full gap-x-2 text-emerald-500 bg-emerald-100/60 dark:bg-gray-800"
                            >
                              <svg
                                width="12"
                                height="12"
                                viewBox="0 0 12 12"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                              >
                                <path
                                  d="M10 3L4.5 8.5L2 6"
                                  stroke="currentColor"
                                  stroke-width="1.5"
                                  stroke-linecap="round"
                                  stroke-linejoin="round"
                                />
                              </svg>

                              <h2 class="text-sm font-normal">Active</h2>
                            </div>
                          </td>
                          <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">Basic</td>
                          <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">User</td>
                          <td class="px-4 py-4 text-sm whitespace-nowrap">
                            <div class="flex items-center gap-x-6">
                              <button
                                class="text-gray-500 transition-colors duration-200 dark:hover:text-indigo-500 dark:text-gray-300 hover:text-indigo-500 focus:outline-none"
                              >
                                Change status
                              </button>

                              <button
                                class="text-blue-500 transition-colors duration-200 hover:text-indigo-500 focus:outline-none"
                              >
                                Change role
                              </button>
                            </div>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

          <div class="flex items-center justify-between mt-6">
            <a
              href="#"
              class="flex items-center px-5 py-2 text-sm text-gray-700 capitalize transition-colors duration-200 bg-white border rounded-md gap-x-2 hover:bg-gray-100 dark:bg-gray-900 dark:text-gray-200 dark:border-gray-700 dark:hover:bg-gray-800"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-5 h-5 rtl:-scale-x-100"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 15.75L3 12m0 0l3.75-3.75M3 12h18" />
              </svg>

              <span> previous </span>
            </a>

            <div class="items-center hidden md:flex gap-x-3">
              <a href="#" class="px-2 py-1 text-sm text-blue-500 rounded-md dark:bg-gray-800 bg-blue-100/60">1</a>
              <a
                href="#"
                class="px-2 py-1 text-sm text-gray-500 rounded-md dark:hover:bg-gray-800 dark:text-gray-300 hover:bg-gray-100"
                >2</a
              >
              <a
                href="#"
                class="px-2 py-1 text-sm text-gray-500 rounded-md dark:hover:bg-gray-800 dark:text-gray-300 hover:bg-gray-100"
                >3</a
              >
              <a
                href="#"
                class="px-2 py-1 text-sm text-gray-500 rounded-md dark:hover:bg-gray-800 dark:text-gray-300 hover:bg-gray-100"
                >...</a
              >
              <a
                href="#"
                class="px-2 py-1 text-sm text-gray-500 rounded-md dark:hover:bg-gray-800 dark:text-gray-300 hover:bg-gray-100"
                >12</a
              >
              <a
                href="#"
                class="px-2 py-1 text-sm text-gray-500 rounded-md dark:hover:bg-gray-800 dark:text-gray-300 hover:bg-gray-100"
                >13</a
              >
              <a
                href="#"
                class="px-2 py-1 text-sm text-gray-500 rounded-md dark:hover:bg-gray-800 dark:text-gray-300 hover:bg-gray-100"
                >14</a
              >
            </div>

            <a
              href="#"
              class="flex items-center px-5 py-2 text-sm text-gray-700 capitalize transition-colors duration-200 bg-white border rounded-md gap-x-2 hover:bg-gray-100 dark:bg-gray-900 dark:text-gray-200 dark:border-gray-700 dark:hover:bg-gray-800"
            >
              <span> Next </span>

              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-5 h-5 rtl:-scale-x-100"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M17.25 8.25L21 12m0 0l-3.75 3.75M21 12H3" />
              </svg>
            </a>
          </div>
        </section>
      </main>
    </div>
  </body>
</html>
