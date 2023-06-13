y
<!DOCTYPE html>
<html class="h-full">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>NetClick</title>
    <!-- Tailwind -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font awesome -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"/>
  </head>
  <!-- header -->
  <header class="w-screen  pt-6">
    <div class="flex container px-6 py-6">
      <div class="items-center">
          <a href="index.jps"><img src="assets/favicon.png" alt="Logo" class="h-12"></a>
      </div>
    </div>
  </header>  
    <!-- MAIN CONTENT -->
  <body class="flex flex-col items-center justify-center h-full">
    <div class="flex-grow">
      <div class="w-full flex justify-center items-center mt-28">
    <h1 class="block text-8xl font-light mb-8 mt-28 px-3 ">Forgot password</h1>
  </div>
  <div class="block -mb-3">
    <h3 class="flex items-center justify-center text-2xl font-light">We will send you an email with instructions on how to reset your password.
    </h3>
  </div>
      <div class="w-full max-w-md mx-auto">
        <div class="w-full">
            <div class="w-full max-w-md">
              <!-- login form -->
              <form class="bg-slate-100 shadow-md rounded px-8 pt-6 pb-10 mb-12 mt-28 m-4">
                  <div class="mb-4">
                    <!-- Email -->
                  <label class="inline-block px-1 bg-gray-300 rounded text-gray-700 text-2xl font-bold mb-4 mt-4" for="password">Enter your email:</label>
                  <input
                      class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mb-3 leading-tight focus:outline-none focus:shadow-outline"
                      id="email" type="email" placeholder="name@example.com">
                  </div>
                  <!-- button -->
                  <div class="flex items-center justify-center">
                    <button class="bg-gray-300 hover:bg-gray-600 hover:text-white text-black font-thin py-2 px-14 rounded w-fit border-black border-solid border-1" href="#">
                      Email me
                    </button>
                  </div>
                  <h1 class="flex items-center justify-center mt-1">or</h1>
                  <div class="flex items-center justify-center">
                    <button class="bg-gray-300 hover:bg-gray-600 hover:text-white text-black font-thin py-1 px-7 rounded border-black border-solid border-1" href="#">
                      Log in
                    </button>
                  </div>
      <!-- end button -->
                </div>          
              </div>
            </form>
        </div>
        </div>
        <!-- end form -->
        <!-- footer -->
        <footer class="inline-block w-full bg-gray-800 sticky bottom-0">
          <div class="flex items-center justify-center mt-4 mb-2">
              <a href="#" class="inline-block w-8 h-8 bg-white bg-opacity-20 rounded-full flex items-center justify-center mr-2 transition-opacity duration-300 hover:bg-opacity-50">
                <i class="fa-brands fa-instagram text-white"></i>  
              </a>
              <a href="#" class="inline-block w-8 h-8 bg-white bg-opacity-20 rounded-full flex items-center justify-center mr-2 transition-opacity duration-300 hover:bg-opacity-50">
                <i class="fa-brands fa-twitter text-white"></i>
              </a>
              <a href="#" class="inline-block w-8 h-8 bg-white bg-opacity-20 rounded-full flex items-center justify-center mr-2 transition-opacity duration-300 hover:bg-opacity-50">
                <i class="fa-brands fa-facebook text-white"></i>
              </a>
          </div>
          <ul class="list-none flex justify-center">
              <li class="mx-2"><a href="#" class="text-white opacity-80 hover:opacity-100">Home</a></li>
              <li class="mx-2"><a href="#" class="text-white opacity-80 hover:opacity-100">Services</a></li>
              <li class="mx-2"><a href="#" class="text-white opacity-80 hover:opacity-100">About</a></li>
              <li class="mx-2"><a href="#" class="text-white opacity-80 hover:opacity-100">Terms</a></li>
              <li class="mx-2"><a href="#" class="text-white opacity-80 hover:opacity-100">Privacy Policy</a></li>
          </ul>
          <p class="text-center text-gray-500 text-xs mt-6">NetClick ©2023</p>
      </footer>
      
  </body>
  
</html>

