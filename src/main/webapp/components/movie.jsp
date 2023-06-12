<%@page import="dto.MovieDTO"%>
<% MovieDTO movie = (MovieDTO) request.getAttribute("movie");%>

<li class="mb-4 w-40">
    <div class="flex justify-center relative">
        <img
            src="<%= movie != null ? movie.getThumbnail() : ""%>"
            alt="Movie"
            class="rounded-md"
            />
        <a
            href="/preview?id=<%= movie != null ? movie.getID() : ""%>"
            class="w-32 h-10 bg-red-700 text-white text-sm rounded-md absolute bottom-2 m-auto flex items-center justify-center"
            >
            Watch Now
        </a>
    </div>
    <p 
        class="text-center mt-2 w-full overflow-hidden whitespace-nowrap text-ellipsis" 
        title="<%= movie != null ? movie.getTitle() : ""%>"
        >
        <%= movie != null ? movie.getTitle() : ""%>
    </p> 
</li>