<!-- RATE MOVIES -->
<aside class="hidden 2xl:flex flex-col w-80 p-6">
  <input class="w-full h-12 bg-gray-100 rounded-full p-6" placeholder="Search" />
  <div>
    <h2 class="text-gray-400 font-semibold py-4">Popular Movies</h2>
    <ul>
      <li class="h-24 flex mb-3">
        <img
          src="https://m.media-amazon.com/images/M/MV5BODc0ZDM3MjgtNDA5ZC00MWUwLWJmM2ItMjBmM2YzMjBmNzRkXkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg"
          alt="Popular Movie"
          class="w-16 mr-3"
        />
        <div>
          <h3 class="font-bold">Love Again</h3>
          <p>Action, Horror</p>
          <div class="my-3">
            <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
            <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
            <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
            <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
            <i class="fa-solid fa-star text-xl mx-1"></i>
          </div>
        </div>
      </li>
      <li class="h-24 flex mb-3">
        <img
          src="https://m.media-amazon.com/images/M/MV5BODc0ZDM3MjgtNDA5ZC00MWUwLWJmM2ItMjBmM2YzMjBmNzRkXkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg"
          alt="Popular Movie"
          class="w-16 mr-3"
        />
        <div>
          <h3 class="font-bold">Love Again</h3>
          <p>Action, Horror</p>
          <div class="my-3">
            <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
            <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
            <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
            <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
            <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
          </div>
        </div>
      </li>
    </ul>
  </div>

  <!-- WATCHLISTS -->
  <div>
    <h2 class="text-gray-400 font-semibold py-4">Watchlists</h2>
    <ul>
      <c:forEach begin="1" end="3">
        <li class="h-24 flex mb-3">
          <img
            src="https://m.media-amazon.com/images/M/MV5BODc0ZDM3MjgtNDA5ZC00MWUwLWJmM2ItMjBmM2YzMjBmNzRkXkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg"
            alt="Popular Movie"
            class="w-16 mr-3"
          />
          <div>
            <h3 class="font-bold">Love Again</h3>
            <p>Action, Horror</p>
            <div class="my-3">
              <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
              <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
              <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
              <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
              <i class="fa-solid fa-star text-xl mx-1"></i>
            </div>
          </div>
        </li>
      </c:forEach>
    </ul>
  </div>
</aside>
