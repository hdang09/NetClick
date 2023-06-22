<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Admin Dashboard - NetClick</title>
        <%@ include file="../../components/imports.jsp" %>
    </head>
    <body onload="drawChart()">
        <div class="flex">
            <%@ include file="../../components/admin-sidebar.jsp" %>

            <!-- MAIN CONTENT -->
            <main class="ml-0 sm:ml-[18rem] p-6 border-r-2 flex-1">
                <h1 class="font-bold text-2xl">Dashboard</h1>

                <canvas id="myChart" />
            </main>
        </div>

        <!-- Chart.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
        <script type="text/javascript" src="/assets/script.js"></script>
    </body>
</html>
