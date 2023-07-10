<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Movie By Tag - NetClick</title>
        <%@ include file="components/imports.jsp" %>
    </head>
    <body>
        <div class="bg-white dark:bg-gray-900 text-black dark:text-white">
            <%@ include file="components/header.jsp" %>

            <!-- MAIN CONTENT -->
            <main>
                <section class="pt-12 pb-24 text-center max-w-7xl mx-auto">
                    <div data-aos="fade-down">
                        <p class="text-primary mb-4">NetClick</p>

                        <h2 class="font-bold text-4xl mb-12">Movie By Tag</h2>

                        <ul class="flex max-w-2xl items-center justify-center flex-wrap mb-12 mx-auto">
                            <li class="block py-4 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                                <a href="/new-movies" class="px-6">All</a>
                            </li>
                            <li class="block py-4 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                                <a href="/tags?tag=action" class="px-6 ${param.tag == "action" ? 'border-x-2 border-primary text-primary' : ''}">Action</a>
                            </li>
                            <li class="block py-4 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                                <a href="/tags?tag=adventure" class="px-6 ${param.tag == "adventure" ? 'border-x-2 border-primary text-primary' : ''}">Adventure</a>
                            </li>
                            <li class="block py-4 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                                <a href="/tags?tag=classic" class="px-6 ${param.tag == "classic" ? 'border-x-2 border-primary text-primary' : ''}">Classic</a>
                            </li>
                            <li class="block py-4 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                                <a href="/tags?tag=documentaries" class="px-6 ${param.tag == "documentaries" ? 'border-x-2 border-primary text-primary' : ''}">Documentaries</a>
                            </li>
                            <li class="block py-4 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                                <a href="/tags?tag=dramas" class="px-6 ${param.tag == "dramas" ? 'border-x-2 border-primary text-primary' : ''}">Dramas</a>
                            </li>
                            <li class="block py-4 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                                <a href="/tags?tag=horror" class="px-6 ${param.tag == "horror" ? 'border-x-2 border-primary text-primary' : ''}">Horror</a>
                            </li>
                        </ul>
                    </div>

                    <ul class="flex flex-wrap" data-aos="fade-up">
                        <c:forEach var="movie" items="${movies}">
                            <c:set var="movie" value="${movie}" scope="request" />
                            <jsp:include page="components/movie.jsp" />
                        </c:forEach>
                    </ul>
                </section>

            </main>
        </div>

        <!-- FOOTER -->
        <%@ include file="components/footer.jsp" %>

        <script type="text/javascript">
            <%@include file="assets/header-script.js" %>
        </script>
        <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
        <script>
            AOS.init({ duration: 1500 });
        </script>
    </body>
</html>
