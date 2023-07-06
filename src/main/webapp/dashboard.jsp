<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Admin Dashboard - NetClick</title>
    <%@ include file="../../components/imports.jsp" %>
  </head>
  <body onload="drawChart()" class="bg-slate-100 dark:bg-slate-900 text-black dark:text-white">
    <div class="flex">
      <%@ include file="../../components/admin-sidebar.jsp" %>

      <!-- MAIN CONTENT -->
      <main class="ml-0 sm:ml-[17rem] py-8 px-12 flex-1">
        <div class="max-w-7xl mx-auto">
          <h1 class="font-bold text-2xl mb-4">DASHBOARD</h1>
          <div class="flex justify-around">
            <div class="py-4 px-6 flex items-center rounded-lg bg-white dark:bg-slate-800 shadow-md">
              <i class="fa-solid fa-sack-dollar fa-2xl m-[10px] text-lime-500"></i>
              <div>
                <span class="text-xl font-bold text-lime-500" thanhf-animation>${totalIncome}</span>
                <span class="text-xl font-bold text-lime-500">$</span><br />
                <span class="text-xl text-lime-500">Total Income</span>
              </div>
            </div>
            <div class="py-4 px-6 flex items-center rounded-lg bg-white dark:bg-slate-800 shadow-md">
              <i class="fa-solid fa-user fa-2xl m-[10px] text-cyan-500"></i>
              <div>
                <span class="text-xl font-bold text-cyan-500" thanhf-animation>${totalUser}</span><br />
                <span class="text-xl text-cyan-500">Total users</span>
              </div>
            </div>
            <div class="py-4 px-6 flex items-center rounded-lg bg-white dark:bg-slate-800 shadow-md">
              <i class="fa-solid fa-user-slash fa-2xl m-[10px] text-red-500"></i>
              <div>
                <span class="text-xl font-bold text-red-500" thanhf-animation>${totalBannedUser}</span><br />
                <span class="text-xl text-red-500">Banned users</span>
              </div>
            </div>
            <div class="py-4 px-6 flex items-center rounded-lg bg-white dark:bg-slate-800 shadow-md">
              <i class="fa-solid fa-video fa-2xl m-[10px] text-pink-500"></i>
              <div>
                <span class="text-xl font-bold text-pink-500" thanhf-animation>${totalMovie}</span><br />
                <span class="text-xl text-pink-500">Total movies</span>
              </div>
            </div>
          </div>

          <div class="flex mt-12">
            <%-- Bar chart --%>
            <div class="w-2/3 mr-10 bg-white dark:bg-slate-800 p-4 rounded-md shadow-md">
              <div class="flex justify-between">
                <h2 class="font-bold text-xl mb-4">MOVIE ANALYTICS</h2>
                <div>
                  <label for="filter">Filter: </label>

                  <select
                    name="filter"
                    id="filter"
                    class="bg-slate-100 dark:bg-slate-900 rounded-full py-2 px-4 cursor-pointer"
                  >
                    <option value="/admin">Most watched</option>
                    <option value="/admin?filter=most-comment">Most comment</option>
                    <option value="/admin?filter=most-rating">Most rating</option>
                  </select>
                </div>
              </div>
              <canvas id="barChart" />
            </div>

            <%-- Doughnut --%>
            <div class="w-1/3 bg-white dark:bg-slate-800 p-4 rounded-md shadow-md">
              <h2 class="font-bold text-xl mb-4">SUBSCRIPTION TRACKING</h2>
              <canvas id="doughnut" />
            </div>
          </div>
        </div>
      </main>
    </div>

    <!-- Toggle theme -->
    <script type="text/javascript">
      const html = document.documentElement;
      const darkMode =
        localStorage.theme === 'dark' ||
        (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches);
      html.classList.toggle('dark', darkMode);
      localStorage.theme = darkMode ? 'dark' : 'light';

      document.getElementById('theme').onclick = () => {
        const isDark = localStorage.theme === 'dark';
        html.classList.toggle('dark', !isDark);
        localStorage.theme = isDark ? 'light' : 'dark';
      };
    </script>

    <!-- Chart.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
    <script>
      <%@include file="assets/dashboard-script.js" %>
    </script>
  </body>
</html>
