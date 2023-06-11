<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="w-60 h-screen border-r-2 pl-8 pt-4">
  <!-- LOGO -->
  <div class="text-red-700">
    <i class="fa-brands fa-neos"></i>
    <a href="/" class="text-red font-extrabold text-xl ml-2">NetClick</a>
  </div>

  <!-- MENU -->
  <div class="mt-8">
    <h3 class="text-gray-300 font-bold text-sm uppercase">MENU</h3>
    <a href="/" class="my-5 flex items-center text-red-700 text-lg border-r-4 border-red-700">
      <i class="fa-solid fa-house"></i>
      <span class="ml-3 font-bold">Home</span>
    </a>
    <a href="/new-movies" class="my-5 flex items-center text-gray-400 text-lg">
      <i class="fa-solid fa-video"></i>
      <span class="ml-3 font-bold">New Movies</span>
    </a>
    <a href="/subscription" class="my-5 flex items-center text-gray-400 text-lg">
      <i class="fa-solid fa-cart-shopping"></i>
      <span class="ml-3 font-bold">Subscription</span>
    </a>
  </div>

  <!-- TAGS -->
  <div class="mt-8">
    <h3 class="text-gray-300 font-bold text-sm uppercase">TAGS</h3>
    <a href="/tags?tag=action" class="my-5 flex items-center text-gray-400 text-lg">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Action</span>
    </a>
    <a href="/tags?tag=adventure" class="my-5 flex items-center text-gray-400 text-lg">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Adventure</span>
    </a>
    <a href="/tags?tag=classic" class="my-5 flex items-center text-gray-400 text-lg">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Classic</span>
    </a>
    <a href="/tags?tag=comedies" class="my-5 flex items-center text-gray-400 text-lg">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Comedies</span>
    </a>
    <a href="/tags?tag=documetaries" class="my-5 flex items-center text-gray-400 text-lg">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Documetaries</span>
    </a>
    <a href="/tags?tag=dramas" class="my-5 flex items-center text-gray-400 text-lg">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Dramas</span>
    </a>
    <a href="/tags?tag=horror" class="my-5 flex items-center text-gray-400 text-lg">
      <i class="fa-solid fa-film"></i>
      <span class="ml-3 font-bold">Horror</span>
    </a>
  </div>

  <!-- GENERAL -->
  <div class="mt-8">
    <h3 class="text-gray-300 font-bold text-sm uppercase">GENERAL</h3>
    <a href="/login" class="my-5 flex items-center text-gray-400 text-lg">
      <i class="fa-solid fa-right-from-bracket"></i>
      <span class="ml-3 font-bold">Log Out</span>
    </a>
  </div>
</aside>
