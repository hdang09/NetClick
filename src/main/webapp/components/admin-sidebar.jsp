<aside class="hidden sm:block min-w-[18rem] h-screen border-r-2 pl-8 pt-4 fixed">
  <!-- LOGO -->
  <div class="text-primary">
    <i class="fa-solid fa-shekel-sign fa-2xl"></i>
    <a href="/admin" class="text-red font-extrabold text-xl ml-2">NetClick</a>
  </div>

  <!-- MENU -->
  <div class="mt-8">
    <h3 class="text-gray-300 font-bold text-sm uppercase">MENU</h3>
    <a href="/admin" class="my-5 flex items-center text-lg ${requestScope['javax.servlet.forward.request_uri'] == '/admin' ? 'text-primary border-r-4 border-primary': 'text-gray-400'}">
      <i class="fa-solid fa-house"></i>
      <span class="ml-3 font-bold">Dashboard</span>
    </a>
  </div>

  <!-- MANAGEMENT -->
  <div class="mt-8">
    <h3 class="text-gray-300 font-bold text-sm uppercase">TAGS</h3>
    <a href="/admin/movies" class="my-5 flex items-center text-lg ${requestScope['javax.servlet.forward.request_uri'] == '/admin/movies' ? 'text-primary border-r-4 border-primary': 'text-gray-400'}">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Movie Management</span>
    </a>
    <a href="/admin/users" class="my-5 flex items-center text-lg ${requestScope['javax.servlet.forward.request_uri'] == '/admin/users' ? 'text-primary border-r-4 border-primary': 'text-gray-400'}">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">User Management</span>
    </a>
  </div>

  <!-- GENERAL -->
  <div class="mt-8">
    <h3 class="text-gray-300 font-bold text-sm uppercase">GENERAL</h3>
    <a href="/login" class="my-5 flex items-center text-lg  text-gray-400">
      <i class="fa-solid fa-right-from-bracket"></i>
      <span class="ml-3 font-bold">Log Out</span>
    </a>
  </div>
</aside>
