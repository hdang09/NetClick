<%@page import="dto.AccountDTO"%>
<%@page import="dao.MovieDAO"%>
<%@page import="dto.MovieDTO"%>
<%@page import="java.util.List"%>


<!-- RATE MOVIES -->
<% 
    List<MovieDTO> popularMovies = new MovieDAO().getPopularMovies(2);
    request.setAttribute("popularMovies", popularMovies);
%>
<aside class="hidden 2xl:flex flex-col w-80 p-6 h-screen">
  <input class="w-full h-12 bg-gray-100 rounded-full p-6" placeholder="Search" />
  <div>
    <h2 class="text-gray-400 font-semibold py-4">Popular Movies</h2>
    <ul>
        <c:forEach var="movie" items="${popularMovies}">
          <c:set var="movie" value="${movie}" scope="request" />
          <%@ include file="./movie-2.jsp" %>
        </c:forEach>
    </ul>
  </div>

  <!-- WATCHLISTS -->
  <% 
    // AccountDTO account = (AccountDTO) session.getAttribute("account");
    List<MovieDTO> favoriteMovies = new MovieDAO().getFavoriteList(1).subList(0, 3);
    request.setAttribute("favoriteMovies", favoriteMovies);
%>
  <div>
    <h2 class="text-gray-400 font-semibold py-4">Favorite List</h2>
    <ul>
      <c:if test="${favoriteMovies == null}">
         <p>Please login to add your favorite movie<p>
      </c:if>
         
      <c:if test="${favoriteMovies != null}">
         <c:forEach var="movie" items="${favoriteMovies}">
            <c:set var="movie" value="${movie}" scope="request" />
            <%@ include file="./movie-2.jsp" %>
        </c:forEach>
      </c:if>
    </ul>
  </div>
</aside>
