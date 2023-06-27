<aside class="hidden sm:block min-w-[15rem] h-screen border-r-2 pl-8 pt-4 fixed">
  <!-- LOGO -->
  <div class="text-primary">
    <i class="fa-solid fa-shekel-sign fa-2xl"></i>
    <a href="/" class="text-red font-extrabold text-xl ml-2">NetClick</a>
  </div>

  <!-- MENU -->
  <div class="mt-8">
    <h3 class="text-gray-300 font-bold text-sm uppercase">MENU</h3>
    <a href="/" class="my-5 flex items-center text-lg ${requestScope['javax.servlet.forward.request_uri'] == null ? 'text-primary border-r-4 border-primary': 'text-gray-400'}">
      <i class="fa-solid fa-house"></i>
      <span class="ml-3 font-bold">Home</span>
    </a>
    <a href="/new-movies" class="my-5 flex items-center text-lg ${requestScope['javax.servlet.forward.request_uri'].equals("/new-movies") ? 'text-primary border-r-4 border-primary': 'text-gray-400'}">
      <i class="fa-solid fa-video"></i>
      <span class="ml-3 font-bold">New Movies</span>
    </a>
    <a href="/fav-list" class="my-5 flex items-center text-lg ${requestScope['javax.servlet.forward.request_uri'].equals("/fav-list") ? 'text-primary border-r-4 border-primary': 'text-gray-400'}">
      <i class="fa-solid fa-heart"></i>
      <span class="ml-3 font-bold">Favorite List</span>
    </a>
  </div>

  <!-- TAGS -->
  <div class="mt-8">
    <h3 class="text-gray-300 font-bold text-sm uppercase">TAGS</h3>
    <a href="/tags?tag=action" class="my-5 flex items-center text-lg ${param.tag == 'action' ? 'text-primary border-r-4 border-primary' : 'text-gray-400'}">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Action</span>
    </a>
    <a href="/tags?tag=adventure" class="my-5 flex items-center text-lg ${param.tag == 'adventure' ? 'text-primary border-r-4 border-primary' : 'text-gray-400'}">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Adventure</span>
    </a>
    <a href="/tags?tag=classic" class="my-5 flex items-center text-lg ${param.tag == 'classic' ? 'text-primary border-r-4 border-primary' : 'text-gray-400'}">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Classic</span>
    </a>
    <a href="/tags?tag=comedies" class="my-5 flex items-center text-lg ${param.tag == 'comedies' ? 'text-primary border-r-4 border-primary' : 'text-gray-400'}">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Comedies</span>
    </a>
    <a href="/tags?tag=documentaries" class="my-5 flex items-center text-lg ${param.tag == 'documentaries' ? 'text-primary border-r-4 border-primary' : 'text-gray-400'}">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Documentaries</span>
    </a>
    <a href="/tags?tag=dramas" class="my-5 flex items-center text-lg ${param.tag == 'dramas' ? 'text-primary border-r-4 border-primary' : 'text-gray-400'}">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Dramas</span>
    </a>
    <a href="/tags?tag=horror" class="my-5 flex items-center text-lg ${param.tag == 'horror' ? 'text-primary border-r-4 border-primary' : 'text-gray-400'}">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Horror</span>
    </a>
  </div>

  <!-- GENERAL -->
  <div class="mt-8">
    <h3 class="text-gray-300 font-bold text-sm uppercase">GENERAL</h3>
      <br>     
<%
String username = (String) session.getAttribute("tendangnhap");
if (username != null) {
%>
    <p>Welcome, <%= username %>!</p>
<%
}
%>
<form action="/LogoutController" method="POST" class="my-5">
  <input type="hidden" name="logout" value="true">
  <button type="submit" class="flex items-center text-lg text-gray-400">
    <i class="fa-solid fa-right-from-bracket"></i>
    <span class="ml-3 font-bold">Log Out</span>
  </button>
</form>


  </div>
</aside>
