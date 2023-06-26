<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>${movie.title} Preview - NetClick</title>
        <%@ include file="components/imports.jsp" %>
    </head>
    <body>
        <div class="flex">
            <%@ include file="components/sidebar.jsp" %>

            <!-- MAIN CONTENT -->
            <main class="ml-0 sm:ml-[15rem] p-6 w-full">
                <div class="flex rounded-lg">
                    <!-- Left content -->
                    <div class="w-[40rem] bg-slate-200 text-xl p-6">
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
                                >+ Wishlist</a
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

                <div class="mt-4">
                    <h2 class="font-bold text-xl text-slate-400">COMMENT AND RATING</h2>
                    <form action="/preview?id${movie.ID}" method="POST">
                        <label class="mr-2">Comment: </label>
                        <input type="hidden" name="action" value="comment"/>
                        <input type="hidden" name="movieID" value="${movie.ID}"/>
                        <textarea name="comment" class="border w-96 h-32"></textarea>
                        <input type="submit" value="Add comment" class="py-2 px-6 bg-primary text-white rounded-lg" />
                    </form>

                    <ul>
                        <c:forEach var="review" items="${reviews}">
                            <li class="p-2 border-b-2 border-slate-200">
                                <div class="flex items-center">
                                    <div class="flex items-center justify-center border w-8 h-8 rounded-full">
                                        <i class="fa-solid fa-user text-lg"></i>
                                    </div>
                                    <h2 class="ml-2">${review.userID}</h2>
                                </div>

                                <p>${review.comment}</p>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="mt-4">
                    <h2 class="font-bold text-xl text-slate-400">SIMILAR</h2>
                    <ul class="flex justify-between flex-wrap">
                        <c:forEach begin="1" end="7"> <%@ include file="components/movie.jsp" %> </c:forEach>
                    </ul>
                </div>
            </main>
        </div>
    </body>
</html>
