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
                <div class="flex justify-center">
                    <div class="border bg-gray-300 w-[250px] h-[100px] flex items-center mx-8">
                        <img src="/asset/bg.jpg" alt="" class="rounded-full bg-red-600 w-[50px] h-[50px] m-[10px]">
                        <div class="m-20px">
                            <span class="text-xl font-bold">15.000 $</span><br>
                            <span class="text-xl">Total Income</span>
                        </div>  
                    </div>
                    <div class="border bg-gray-300 w-[250px] h-[100px] flex items-center mx-8">
                        <img src="/asset/bg.jpg" alt="" class="rounded-full bg-red-600 w-[50px] h-[50px] m-[10px]">
                        <div class="m-20px">
                            <span class="text-xl font-bold">48</span><br>
                            <span class="text-xl">Total users</span>
                        </div>  
                    </div>
                    <div class="border bg-gray-300 w-[250px] h-[100px] flex items-center mx-8">
                        <img src="/asset/bg.jpg" alt="" class="rounded-full bg-red-600 w-[50px] h-[50px] m-[10px]">
                        <div class="m-20px">
                            <span class="text-xl font-bold">2</span><br>
                            <span class="text-xl">Banned users</span>
                        </div>  
                    </div>
                    <div class="border bg-gray-300 w-[250px] h-[100px] flex items-center mx-8">
                        <img src="/asset/bg.jpg" alt="" class="rounded-full bg-red-600 w-[50px] h-[50px] m-[10px]">
                        <div class="m-20px">
                            <span class="text-xl font-bold">160$</span><br>
                            <span class="text-xl">Total movies</span>
                        </div>  
                    </div>
                </div>
                <div>
                    <span class="font-bold text-xl">INCOME YEARLY</span>
                    <div class="h-[100px] w-[80vw]">
                        <canvas id="myChart"/>
                    </div>
                </div>
                
            </main>
        </div>

        <!-- Chart.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
        <script type="text/javascript" src="/assets/script.js"></script>
        <script>
        const drawChart = () => {
            const stars = [135850, 52122, 148825, 16939, 9763];
            const frameworks = ['React', 'Angular', 'Vue', 'Hyperapp', 'Omi'];
            new Chart('myChart', {
                options: {
                    responsive: true,
                    maintainAspectRatio: true
                },
                type: 'bar',
                data: {
                    labels: frameworks,
                    datasets: [
                        {
                            label: 'Github Stars',
                            data: stars,
                        },
                    ],
                },
            });
        };

        </script>
        <script>
            
        </script>

    </body>
</html>
