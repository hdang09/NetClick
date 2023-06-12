<%@page import="dto.MovieDTO"%>
<% MovieDTO movie = (MovieDTO) request.getAttribute("movie");%>

<li class="my-4 mx-2 w-40">
    <div class="flex justify-center relative">
        <img
            src="<%= movie != null ? movie.getThumbnail() : "https://m.media-amazon.com/images/M/MV5BODc0ZDM3MjgtNDA5ZC00MWUwLWJmM2ItMjBmM2YzMjBmNzRkXkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg"%>"
            alt="Movie"
            class="rounded-md"
            />
        <a
            href="/preview?id=<%= movie != null ? movie.getID() : "1"%>"
            class="w-32 h-10 bg-primary text-white text-sm rounded-md absolute bottom-2 m-auto flex items-center justify-center"
            >
            Watch Now
        </a>
    </div>
    <p 
        class="text-center mt-2 w-full overflow-hidden whitespace-nowrap text-ellipsis" 
        title="<%= movie != null ? movie.getTitle() : "Love Again"%>"
        >
        <%= movie != null ? movie.getTitle() : "Love Again"%>
    </p> 
</li>