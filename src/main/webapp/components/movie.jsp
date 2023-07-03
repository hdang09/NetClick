<li class="group m-6 w-40">
    <div class="flex justify-center relative">
        <img
            src="${movie.thumbnail == null ? "https://m.media-amazon.com/images/M/MV5BODc0ZDM3MjgtNDA5ZC00MWUwLWJmM2ItMjBmM2YzMjBmNzRkXkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg" : movie.thumbnail}"
            alt="${movie.title == null ? "Love Again" : movie.title}"
            class="rounded-md w-40 h-60 object-cover"
        />
        <a
            href="/preview?id=${movie.ID == null ? 1 : movie.ID}"
            class="hidden group-hover:flex w-32 h-10 bg-primary text-white text-sm rounded-md absolute bottom-2 m-auto items-center justify-center"
        >
            Watch Now
        </a>
    </div>
    <p 
        class="text-center mt-2 w-full overflow-hidden whitespace-nowrap text-ellipsis" 
        title="${movie.title == null ? "Love Again" : movie.title}"
        >
        ${movie.title == null ? "Love Again" : movie.title}
    </p> 
</li>