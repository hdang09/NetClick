<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- RATE MOVIES -->
<aside class="hidden 2xl:flex flex-col w-80 p-6 h-screen">
  <input class="w-full h-12 bg-gray-100 rounded-full p-6" placeholder="Search" />
  <div>
    <h2 class="text-gray-400 font-semibold py-4">Popular Movies</h2>
    <ul>
        <c:forEach begin="1" end="2">
          <%@ include file="./movie-2.jsp" %>
        </c:forEach>
    </ul>
  </div>

  <!-- WATCHLISTS -->
  <div>
    <h2 class="text-gray-400 font-semibold py-4">Watchlists</h2>
    <ul>
      <c:forEach begin="1" end="3">
        <%@ include file="./movie-2.jsp" %>
      </c:forEach>
    </ul>
  </div>
</aside>
