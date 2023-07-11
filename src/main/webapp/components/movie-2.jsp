<li class="w-full h-24 mb-3">
    <a href="/preview?id=${movie.ID}" class="flex">
        <img
            src="${movie.thumbnail == null ? "https://m.media-amazon.com/images/M/MV5BODc0ZDM3MjgtNDA5ZC00MWUwLWJmM2ItMjBmM2YzMjBmNzRkXkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg" : movie.thumbnail}"
            alt="${movie.title == null ? "Love Again" : movie.title}"
            class="w-16 mr-3"
            />
        <div>
            <h3 
                class="font-bold w-60 overflow-hidden whitespace-nowrap text-ellipsis"
                title="${movie.title == null ? "Love Again" : movie.title}"
            >${movie.title == null ? "Love Again" : movie.title}</h3>
            <p>Action, Horror</p>
            <div class="my-3">
                <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
                <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
                <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
                <i class="fa-solid fa-star text-xl mx-1 text-yellow-500"></i>
                <i class="fa-solid fa-star text-xl mx-1"></i>
            </div>
        </div>
    </a>
</li>