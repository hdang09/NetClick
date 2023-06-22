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
                <section class="container px-4 mx-auto">
                    <div class="sm:flex sm:items-center sm:justify-between">
                        <div>
                            <div class="flex items-center gap-x-3">
                                <h2 class="text-2xl font-bold text-gray-800 dark:text-white">Movies</h2>

                                <span class="px-3 py-1 text-xs text-blue-600 bg-blue-100 rounded-full dark:bg-gray-800 dark:text-blue-400">${size} movies</span>
                            </div>

                            <p class="mt-1 text-sm text-gray-500 dark:text-gray-300">These companies have purchased in the last 12 months.</p>
                        </div>

                        <div class="flex items-center mt-4 gap-x-3">
                            <a href="/admin/add-movie" class="flex items-center justify-center w-1/2 px-5 py-2 text-sm tracking-wide text-white transition-colors duration-200 bg-blue-500 rounded-lg shrink-0 sm:w-auto gap-x-2 hover:bg-blue-600 dark:hover:bg-blue-500 dark:bg-blue-600">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>

                                <span>Add movie</span>
                            </a>
                        </div>
                    </div>

                    <div class="flex flex-col mt-6">
                        <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                            <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
                                <div class="overflow-hidden border border-gray-200 dark:border-gray-700 md:rounded-lg">
                                    <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                                        <thead class="bg-gray-50 dark:bg-gray-800">
                                            <tr>
                                                <th scope="col" class="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">ID</th>

                                                <th scope="col" class="py-3.5 px-4 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                                                    Movie
                                                </th>

                                                <th scope="col" class="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">Release</th>

                                                <th scope="col" class="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">Director</th>

                                                <th scope="col" class="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">Rating</th>

                                                <th scope="col" class="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">Tags</th>
                                            </tr>
                                        </thead>
                                        <tbody class="bg-white divide-y divide-gray-200 dark:divide-gray-700 dark:bg-gray-900">
                                            <c:forEach var="movie" items="${movies}">
                                                <tr>
                                                    <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">${movie.ID}</td>
                                                    <td class="px-4 py-4 text-sm font-medium text-gray-700 whitespace-nowrap">
                                                        <div class="flex items-center gap-x-2">
                                                            <img class="object-cover w-10 h-16 rounded" src="${movie.thumbnail}" alt="Movie Thumbnail">
                                                            <div class="w-48 overflow-hidden text-ellipsis pr-4">
                                                                <a href="/admin/movies?id=${movie.ID}" class="font-medium text-primary">${movie.title}</a>
                                                                <p class="text-sm font-normal text-gray-600 dark:text-gray-400">${movie.description}</p>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">2024-12-12</td>
                                                    <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">
                                                        <p class="w-36 overflow-hidden whitespace-nowrap text-ellipsis">${movie.director}</p>
                                                    </td>
                                                    <td class="px-4 py-4 text-sm text-gray-500 dark:text-gray-300 whitespace-nowrap">
                                                        <c:forEach begin="1" end="${movie.rating}">
                                                            <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
                                                        </c:forEach>
                                                        <c:forEach begin="1" end="${5 - movie.rating}">
                                                            <i class="fa-solid fa-star text-xl mx-1 text-state-500"></i>
                                                        </c:forEach>
                                                    </td>
                                                    <td class="px-4 py-4 text-sm whitespace-nowrap">
                                                        <div class="flex items-center gap-x-2">
                                                            <p class="px-3 py-1 text-xs text-indigo-500 rounded-full dark:bg-gray-800 bg-indigo-100/60">Action</p>
                                                            <p class="px-3 py-1 text-xs text-blue-500 rounded-full dark:bg-gray-800 bg-blue-100/60">Classic</p>
                                                            <p class="px-3 py-1 text-xs text-pink-500 rounded-full dark:bg-gray-800 bg-pink-100/60">Horror</p>
                                                        </div>
                                                    </td>
                                                    <td class="px-4 py-4 text-sm whitespace-nowrap">
                                                        <div class="flex items-center gap-x-6">
                                                            <a href="/admin/movies?deleteID=${movie.ID}" class="text-gray-500 transition-colors duration-200 dark:hover:text-red-500 dark:text-gray-300 hover:text-red-500 focus:outline-none">
                                                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                                                                <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                                                                </svg>
                                                            </a>

                                                            <a href="/admin/movies?editID=${movie.ID}"  class="text-gray-500 transition-colors duration-200 dark:hover:text-yellow-500 dark:text-gray-300 hover:text-yellow-500 focus:outline-none">
                                                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                                                                <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10" />
                                                                </svg>
                                                            </a>
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
                        <a href="#" class="flex items-center px-5 py-2 text-sm text-gray-700 capitalize transition-colors duration-200 bg-white border rounded-md gap-x-2 hover:bg-gray-100 dark:bg-gray-900 dark:text-gray-200 dark:border-gray-700 dark:hover:bg-gray-800">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 rtl:-scale-x-100">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 15.75L3 12m0 0l3.75-3.75M3 12h18" />
                            </svg>

                            <span>
                                previous
                            </span>
                        </a>

                        <div class="items-center hidden lg:flex gap-x-3">
                            <c:forEach begin="${param.page != null ? param.page : 1}" end="${param.page != null ? param.page + 3 : 4}" var="i">
                                <a href="/admin/movies?page=${i}" class="px-2 py-1 text-sm text-blue-500 rounded-md dark:bg-gray-800 bg-blue-100/60">${i}</a>
                            </c:forEach>
                            <span class="px-2 py-1 text-sm text-gray-500 rounded-md dark:text-gray-300">...</span>
                            <c:forEach begin="${pagination - 2}" end="${pagination}" var="page">
                                <a href="/admin/movies?page=${page}" class="px-2 py-1 text-sm text-blue-500 rounded-md dark:bg-gray-800 bg-blue-100/60">${page}</a>
                            </c:forEach>
                        </div>

                        <a href="#" class="flex items-center px-5 py-2 text-sm text-gray-700 capitalize transition-colors duration-200 bg-white border rounded-md gap-x-2 hover:bg-gray-100 dark:bg-gray-900 dark:text-gray-200 dark:border-gray-700 dark:hover:bg-gray-800">
                            <span>
                                Next
                            </span>

                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 rtl:-scale-x-100">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M17.25 8.25L21 12m0 0l-3.75 3.75M21 12H3" />
                            </svg>
                        </a>
                    </div>
                </section>
            </main>
        </div>
    </body>
</html>
