<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="max-w-7xl mx-auto h-24 flex justify-between items-center dark:text-white px-4">
  <%-- Logo --%>
  <a href="/" class="flex items-center">
    <img src="../assets/favicon.ico" alt="Logo" class="w-10 mr-4" />
    <h1 class="text-2xl font-bold">Net<span class="text-primary">Click</span></h1>
  </a>

  <%-- Navigation --%>
  <nav class="hidden lg:block">
    <ul class="flex w-96 justify-between uppercase font-semibold mr-32">
      <li class="${requestScope['javax.servlet.forward.request_uri'] == null ? 'text-primary': 'dark:text-white'}">
        <a href="/">Home</a>
      </li>
      <li class="${requestScope['javax.servlet.forward.request_uri'].equals("/new-movies") ? 'text-primary': 'dark:text-white'}">
        <a href="/new-movies">New Movies</a>
      </li>
      <li class="${requestScope['javax.servlet.forward.request_uri'].equals("/fav-list") ? 'text-primary': 'dark:text-white'}">
        <a href="/fav-list">Favorite List</a>
      </li>
    </ul>
  </nav>

  <%-- Actions --%>
  <div class="flex items-center">
    <%-- Input --%>
    <form action='/search' method='GET' class="relative">
      <input class="bg-slate-100 dark:bg-slate-800 h-10 rounded-lg pl-4 pr-9 outline-none" name='q' placeholder="I'm looking for..." />
      <i
        class="fa-solid fa-magnifying-glass text-primary relative left-[-2.25rem] cursor-pointer hover:text-white z-100"
      ></i>
    </form>

    <%-- Account --%>
    <c:if test='${tendangnhap == null}'>
        <form action="/LogoutController" method="POST">
            <input type="hidden" name="logout" value="true" />
            <button type='submit' class="ml-4">
                <span class="hover:text-primary">Sign in</span>
                <i class="fa-solid fa-right-from-bracket ml-2 text-primary"></i>
            </button>
        </form>
    </c:if>
    
    <c:if test='${tendangnhap != null}'>
        <div class="flex items-center ml-4">
            <i class="fa-solid fa-user text-primary mr-2 text-2xl"></i>
            <span class="ml-1">@${tendangnhap}</span>
        </div>
    </c:if>
  </div>
</header>
