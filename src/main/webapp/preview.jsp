<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>${movie.title} Preview - NetClick</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.7/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/your-kit-id.js" crossorigin="anonymous"></script>
    <script src="https://cdn.tailwindcss.com/2.2.7/tailwind.min.js"></script>
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
                            <h2 id="rating">${movie.rating}</h2>
                            <div id="stars" class="space-x-1">
                                <span class="star-icon">
                                    <i class="fa-solid fa-star text-xl text-yellow-500"></i>
                                </span>
                                <span class="star-icon">
                                    <i class="fa-solid fa-star text-xl text-yellow-500"></i>
                                </span><span class="star-icon">
                                    <i class="fa-solid fa-star text-xl text-yellow-500"></i>
                                </span>
                                <span class="star-icon">
                                    <i class="fa-solid fa-star text-xl text-yellow-500"></i>
                                </span>
                                <span class="star-icon">
                                    <i class="fa-solid fa-star text-xl text-yellow-500"></i>
                                </span>
                            </div>
                        </div>
                        
                        <script>
                            // get star contain
                            const starsContainer = document.getElementById("stars");
                        
                            // get h2 contain rating
                            const ratingElement = document.getElementById("rating");
                        
                            // register click event for star
                            starsContainer.addEventListener("click", function(event) {
                                // get stars selected
                                const selectedStar = event.target.closest(".star-icon");
                        
                                // check user pick one or more stars
                                if (selectedStar) {
                                    // 
                                    const starIndex = Array.from(starsContainer.children).indexOf(selectedStar);
                        
                                    // updating rating and display stars
                                    ratingElement.innerText = starIndex + 1;
                        
                                    // delete star selected
                                    while (starsContainer.firstChild) {
                                        starsContainer.firstChild.remove();
                                    }
                        
                                    // create new stars
                                    for (let i = 0; i <= starIndex; i++) {
                                        const star = document.createElement("span");
                                        star.classList.add("star-icon", "animate-pulse", "text-xl", "mx-1", "text-yellow-500", "transition", "duration-500");
                                        star.innerHTML = '<i class="fas fa-star"></i>';
                                        starsContainer.appendChild(star);
                                    }
                                    // create empty stars to get 5 stars
                                    for (let i = starIndex + 1; i < 5; i++) {
                                        const star = document.createElement("span");
                                        star.classList.add("star-icon", "text-xl", "mx-1", "text-state-500", "transition", "duration-500");
                                        star.innerHTML = '<i class="far fa-star"></i>';
                                        starsContainer.appendChild(star);
                                    }
                                }
                            });
                        </script>
                        
                        <!-- Buttons-->
                        <div class="mt-12 flex">
                            <a href="/fav-list?movieID=${movie.ID}" class="inline-flex justify-center items-center w-40 h-12 border border-slate-400 text-slate-400 rounded-md">+ Favorite List</a>
                            <a href="/subscription" class="inline-flex justify-center items-center w-40 h-12 bg-slate-400 text-white rounded-md ml-4">> Watch</a>
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
                <!-- comment -->
                <div class="mt-4">
                    <h2 class="font-bold text-xl text-gray-900">Discussion</h2>
                    <form action="/preview?id=${movie.ID}" method="POST">
                        <div class="py-2 px-4 mb-4 bg-white rounded-lg rounded-t-lg border-gray-500 dark:border-gray-700" style="display: inline-block;">
                            <label for="comment" class="mr-2">Comment:</label>
                            <input type="hidden" name="action" value="comment"/>
                            <textarea id="comment " name="comment" rows="6"
                            class="px-0 w-full text-sm text-gray-900 border-0 focus:ring-0 focus:outline-none dark:text-white dark:placeholder-gray-400"></textarea>
                            <input type="submit" value="Add comment" class="py-2 px-6 bg-primary rounded-lg" />
                        </div>
                        
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
