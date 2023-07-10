<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="max-w-7xl mx-auto h-24 flex justify-between items-center dark:text-white px-4">
    <%-- Logo --%>
    <a href="/" class="flex items-center">
        <img src="https://i.imgur.com/VDWjEqQ.png" alt="Logo" class="w-10 mr-4" />
        <h1 class="text-2xl font-bold">Net<span class="text-primary">Click</span></h1>
    </a>

    <%-- Navigation --%>
    <nav class="hidden lg:block">
        <ul class="flex w-96 justify-between uppercase font-semibold mr-32">
            <li class="${requestScope['javax.servlet.forward.request_uri'] == null ? 'text-primary': 'dark:text-white'}">
                <a href="/">Home</a>
            </li>
            <li class="${requestScope['javax.servlet.forward.request_uri'].equals("/new-movies") ? 'text-primary': 'dark:text-white'}">
                <a href="/new-movies">All Movies</a>
            </li>
            <li class="${requestScope['javax.servlet.forward.request_uri'].equals("/fav-list") ? 'text-primary': 'dark:text-white'}">
                <a href="/fav-list">Favorite List</a>
            </li>
        </ul>
    </nav>

    <%-- Actions --%>
    <i class="fa-solid fa-bars block lg:hidden text-2xl" data-menu-open-btn></i>
    <div class="hidden lg:flex items-center relative">
        <%-- Theme switcher --%>
        <i id="theme" title="Switch theme" class="fa-solid fa-sun text-primary hover:text-black dark:hover:text-white px-2 cursor-pointer"></i>

        <%-- Input --%>
        <div class="relative">
            <i id="search-icon" title="Search" class="px-2 fa-solid fa-magnifying-glass text-primary cursor-pointer hover:text-black dark:hover:text-white"></i>
            <form action='/search' method='GET' class="drop-shadow my-2 right-0 z-10 items-center absolute hidden mb-0" id="search-box">
                <input class="bg-slate-100 dark:bg-slate-800 h-10 rounded-lg pl-4 pr-9 outline-none" name='q' placeholder="I'm looking for..." />
                <button type="submit">
                    <i
                        class="fa-solid fa-magnifying-glass absolute text-primary top-[0.75rem] right-0 px-4 cursor-pointer hover:text-white z-100"
                        >
                    </i>
                </button>
            </form>
        </div>

        <%-- Account --%>
        <c:if test='${tendangnhap == null}'>
            <form action="/LogoutController" method="POST" class="mb-0">
                <input type="hidden" name="logout" value="true" />
                <button type='submit' class="ml-4">
                    <span class="hover:text-primary">Sign in</span>
                    <i class="fa-solid fa-right-to-bracket ml-2 text-primary"></i>
                </button>
            </form>
        </c:if>

        <c:if test='${tendangnhap != null}'>
            <div class="flex items-center ml-4">
                <i class="fa-solid fa-user text-primary mr-2 text-2xl"></i>
                <span class="ml-1">@${tendangnhap}</span>
            </div>
            <form action="/LogoutController" method="POST" class="mb-0">
                <input type="hidden" name="logout" value="true" />
                <button type='submit' class="ml-4">
                    <i class="fa-solid fa-right-from-bracket ml-2 text-primary" title="Sign out"></i>
                </button>
            </form>
        </c:if>
    </div>

    <%-- Mobile nav --%>
    <nav class="fixed right-0 top-0 z-50 w-80 h-screen bg-slate-100 dark:bg-slate-800 invisible transition duration-250 ease-out" data-navbar>

        <div class="p-6 flex justify-between items-center">
            <a href="/" class="flex items-center">
                <img src="https://i.imgur.com/VDWjEqQ.png" alt="Logo" class="w-10 mr-4" />
                <h1 class="text-2xl font-bold">Net<span class="text-primary">Click</span></h1>
            </a>

            <i class="fa-solid fa-xmark text-2xl" data-menu-close-btn></i>  
        </div>

        <ul class="mb-6">
            <li>
                <a href="/" class="py-3 px-5 block font-medium">Home</a>
            </li>

            <li>
                <a href="/new-movies" class="py-3 px-5 block font-medium">All Movies</a>
            </li>

            <li>
                <a href="/fav-list" class="py-3 px-5 block font-medium">Favorite List</a>
            </li>

            <li>
                <p id="theme-mobile" class="py-3 px-5 block font-medium">Swith Theme</p>
            </li>

            <li class="py-3 px-5 block font-medium">
                <form action='/search' method='GET' class="drop-shadow items-center" id="search-box">
                    <input class="bg-slate-100 dark:bg-slate-900 rounded-lg h-10 pl-4 pr-9 outline-none" name='q' placeholder="I'm looking for..." />
                    <button type="submit">
                        <i
                            class="fa-solid fa-magnifying-glass absolute text-primary top-[0.75rem] right-0 px-4 cursor-pointer hover:text-white z-100"
                            >
                        </i>
                    </button>
                </form>
            </li>

            <%-- Account --%>
            <li class="py-3 px-5 block font-medium flex items-center">
                <c:if test='${tendangnhap == null}'>
                    <form action="/LogoutController" method="POST" class="mb-0">
                        <input type="hidden" name="logout" value="true" />
                        <button type='submit'>
                            <span class="hover:text-primary">Sign in</span>
                            <i class="fa-solid fa-right-to-bracket ml-2 text-primary"></i>
                        </button>
                    </form>
                </c:if>

                <c:if test='${tendangnhap != null}'>
                    <div class="flex items-center">
                        <i class="fa-solid fa-user text-primary mr-2 text-2xl"></i>
                        <span class="ml-1">@${tendangnhap}</span>
                    </div>
                    <form action="/LogoutController" method="POST" class="mb-0">
                        <input type="hidden" name="logout" value="true" />
                        <button type='submit' class="ml-4">
                            <i class="fa-solid fa-right-from-bracket ml-2 text-primary" title="Sign out"></i>
                        </button>
                    </form>
                </c:if>
            </li>
        </ul>
    </nav>
</header>
