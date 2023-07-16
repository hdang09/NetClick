<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>${movie.title} - NetClick</title>
        <%@ include file="components/imports.jsp" %>
    </head>

    <body class="bg-white dark:bg-gray-900">
        <!-- HEADER -->
        <%@ include file="components/header.jsp" %>

        <!-- MAIN CONTENT -->
        <main class="text-black dark:text-white">
            <div class="pt-12 pb-24 text-center max-w-7xl mx-auto">
                <p class="text-primary mb-4">NetClick</p>

                <h2 class="font-bold text-4xl mb-12">${movie.title}</h2>

                <div class="flex justify-center items-center mt-[20px]">
                    <video id="myVideo" width="960" height="620" title="${movie.title}" autoplay controls
                           controlsList="nodownload">
                        <source src="${movie.movie_url}" width="960" height="620" frameborder='0' type="video/mp4">
                    </video>
                </div>
            </div>
        </main>

        <script type="text/javascript">
            <%@include file = "assets/header-script.js" %>
        </script>
        <script>
            let loadHistoryWatched = JSON.parse(window.localStorage.getItem('historyWatched'));
            if (window.localStorage.getItem('historyWatched') != null && loadHistoryWatched.movieID == window.location.search.split("=")[1]) {
                let isWatchedAgain = confirm("Do you want to watch continue ?");
                if (isWatchedAgain) {
                    document.querySelector('video').currentTime = loadHistoryWatched.lastTime;
                }
            }
            window.addEventListener("unload", function () {
                window.localStorage.setItem('historyWatched', JSON.stringify({
                    "movieID": window.location.search.split("=")[1],
                    "lastTime": document.querySelector('video').currentTime
                }));
            });
        </script>
    </body>

</html>