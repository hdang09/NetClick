<%@page import="dao.MovieDAO"%> <%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
                                                                                                 uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>NetClick</title>
        <%@ include file="components/imports.jsp" %>
    </head>

    <body class="bg-white dark:bg-gray-900 text-black dark:text-white">
        <!-- HEADER -->
        <%@ include file="components/header.jsp" %>

        <!-- MAIN CONTENT -->
        <main>
            <%-- Hero --%>
            <section class="max-w-7xl mx-auto flex my-10 px-6">
                <%-- Left section --%>
                <div class="flex flex-col flex-1 justify-center" data-aos="fade-right">
                    <p class="text-primary mb-6 text-2xl font-bold">NetClick</p>

                    <h1 class="font-extrabold text-5xl mb-12">
                        Explore
                        <span class="bg-gradient-to-r from-blue-600 to-blue-400 text-transparent bg-clip-text" id="app"
                              >unlimited movies</span
                        ><br>
                        <span class="block mt-4">anywhere, anytime</span>
                    </h1>

                    <c:if test="${tendangnhap == null}">
                        <form action="/LogoutController" method="POST">
                            <input type="hidden" name="logout" value="true" />
                            <button
                                type="submit"
                                class="inline-block border-2 border-primary hover:bg-primary py-3 px-8 rounded-full hover:text-white"
                                >
                                <i class="fa-solid fa-right-to-bracket"></i>
                                <span class="ml-2 font-semibold">Sign in</span>
                            </button>
                        </form>
                    </c:if>

                    <c:if test="${tendangnhap != null}">
                        <a
                            href="/new-movies"
                            class="w-fit inline-block border-2 border-primary hover:bg-primary py-3 px-8 rounded-full hover:text-white"
                            >
                            <i class="fa-solid fa-play"></i>
                            <span class="ml-2">Watch Now</span>
                        </a>
                    </c:if>
                </div>

                <%-- Right section --%>
                <img
                    src="https://i.imgur.com/NPIKLMt.png"
                    alt="Hero"
                    class="w-[30rem] h-fit hidden lg:block"
                    data-aos="fade-left"
                    />
            </section>

            <%-- Popular Movies --%>
            <section class="dark:text-white">
                <div class="py-24 max-w-7xl mx-auto" data-aos="flip-up">
                    <p class="text-primary mb-4">Online Streaming</p>

                    <h2 class="font-bold text-4xl mb-12">Popular Movies</h2>

                    <ul class="flex justify-between flex-wrap">
                        <c:forEach var="movie" items="<%= new MovieDAO().getPopularMovies(6)%>">
                            <c:set var="movie" value="${movie}" scope="request" />
                            <jsp:include page="components/movie.jsp" />
                        </c:forEach>
                    </ul>
                </div>
            </section>

            <%-- New Movies --%>
            <section class="dark:text-white bg-slate-100 dark:bg-gray-950">
                <div class="py-24 text-center max-w-7xl mx-auto">
                    <div data-aos="fade-down">
                        <p class="text-primary mb-4">Online Streaming</p>

                        <h2 class="font-bold text-4xl mb-12">New Movies</h2>

                        <%--
                        <ul class="flex max-w-2xl items-center justify-center flex-wrap mb-12 mx-auto">
                          <li>
                            <button class="py-4 px-6 mx-4 my-2 uppercase bg-white rounded dark:bg-slate-800 font-semibold">
                              All
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
                        --%>
                    </div>

                    <ul class="flex justify-center flex-wrap" data-aos="fade-up">
                        <c:forEach var="movie" items="<%= new MovieDAO().getNewMovies(12)%>">
                            <c:set var="movie" value="${movie}" scope="request" />
                            <jsp:include page="components/movie.jsp" />
                        </c:forEach>
                    </ul>
                </div>
            </section>

            <%-- Top Rated Movies --%>
            <section class="dark:text-white">
                <div class="py-24 text-center max-w-7xl mx-auto" data-aos="flip-down">
                    <p class="text-primary mb-4">Online Streaming</p>

                    <h2 class="font-bold text-4xl mb-12">Top Rated Movies</h2>

                    <ul class="flex justify-between flex-wrap">
                        <c:forEach var="movie" items="<%= new MovieDAO().getTopRatedMovies(6)%>">
                            <c:set var="movie" value="${movie}" scope="request" />
                            <jsp:include page="components/movie.jsp" />
                        </c:forEach>
                    </ul>
                </div>
            </section>
        </main>

        <!-- FOOTER -->
        <%@ include file="components/footer.jsp" %>

        <script type="text/javascript">
            <%@include file="assets/header-script.js" %>
        </script>
        <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
        <script>
            AOS.init({
                // Global settings:
                disable: false, // accepts following values: 'phone', 'tablet', 'mobile', boolean, expression or function
                startEvent: 'DOMContentLoaded', // name of the event dispatched on the document, that AOS should initialize on
                initClassName: 'aos-init', // class applied after initialization
                animatedClassName: 'aos-animate', // class applied on animation
                useClassNames: false, // if true, will add content of `data-aos` as classes on scroll
                disableMutationObserver: false, // disables automatic mutations' detections (advanced)
                debounceDelay: 50, // the delay on debounce used while resizing window (advanced)
                throttleDelay: 99, // the delay on throttle used while scrolling the page (advanced)

                // Settings that can be overridden on per-element basis, by `data-aos-*` attributes:
                offset: 120, // offset (in px) from the original trigger point
                delay: 0, // values from 0 to 3000, with step 50ms
                duration: 1500, // values from 0 to 3000, with step 50ms
                easing: 'ease', // default easing for AOS animations
                once: false, // whether animation should happen only once - while scrolling down
                mirror: false, // whether elements should animate out while scrolling past them
                anchorPlacement: 'top-bottom', // defines which position of the element regarding to window should trigger the animation
            });
        </script>
        <script src="https://unpkg.com/typewriter-effect@latest/dist/core.js"></script>
        <script>
            var app = document.getElementById('app');

            var typewriter = new Typewriter(app, {
                loop: true,
                delay: 80,
            });

            typewriter
                    .typeString('unlimited movies')
                    .pauseFor(2000)
                    .deleteAll()
                    .typeString('high quality movies')
                    .pauseFor(2000)
                    .deleteAll()
                    .start();
        </script>
    </body>
</html>
