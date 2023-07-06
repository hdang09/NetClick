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
            <main class="ml-0 sm:ml-[17rem] p-6 flex-1">
                <div class="max-w-7xl mx-auto">
                    <h1 class="font-bold text-2xl">Dashboard</h1>
                    <div class="flex justify-center">
                        <div class="shadow-lg drop-shadow-xl p-4 flex items-center mx-8 rounded-lg">
                            <i class="fa-solid fa-sack-dollar fa-2xl m-[10px]"></i>
                            <div class="m-20px">
                                <span class="text-xl font-bold" thanhf-animation>${totalIncome} $</span><br />
                                <span class="text-xl">Total Income</span>
                            </div>
                        </div>
                        <div class="shadow-lg drop-shadow-xl p-4 flex items-center mx-8 rounded-lg">
                            <i class="fa-solid fa-user fa-2xl m-[10px]"></i>
                            <div class="m-20px">
                                <span class="text-xl font-bol na" thanhf-animation>${totalUser}</span><br />
                                <span class="text-xl">Total users</span>
                            </div>
                        </div>
                        <div class="shadow-lg drop-shadow-xl p-4 flex items-center mx-8 rounded-lg">
                            <i class="fa-solid fa-user-slash fa-2xl m-[10px]"></i>
                            <div class="m-20px">
                                <span class="text-xl font-bold na" thanhf-animation>${totalBannedUser}</span><br />
                                <span class="text-xl">Banned users</span>
                            </div>
                        </div>
                        <div class="shadow-lg drop-shadow-xl p-4 flex items-center mx-8 rounded-lg">
                            <i class="fa-solid fa-video fa-2xl m-[10px]"></i>
                            <div class="m-20px">
                                <span class="text-xl font-bold na" thanhf-animation>${totalMovie}</span><br />
                                <span class="text-xl">Total movies</span>
                            </div>
                        </div>
                    </div>

                    <div class="flex mt-12">
                        <%-- Bar chart --%>
                        <div class="w-2/3 mr-10">
                            <div class="flex justify-between">
                                <h2 class="font-bold text-xl mb-4">GENRE DISTRIBUTION</h2>
                                <div>
                                    <label for="filter">Filter: </label>

                                    <select name="filter" id="filter" class="bg-slate-100 rounded-full py-2 px-4">
                                        <option value="/admin">Most watched</option>
                                        <option value="/admin?filter=most-comment">Most comment</option>
                                        <option value="/admin?filter=most-rating">Most rating</option>
                                    </select>
                                </div>
                            </div>
                            <canvas id="barChart" />
                        </div>

                        <%-- Doughnut --%>
                        <div class="w-1/3">
                            <h2 class="font-bold text-xl mb-4">SUBSCRIPTION TRACKING</h2>
                            <canvas id="doughnut" />
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <!-- Chart.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
        <script type="text/javascript" src="/assets/script.js"></script>
        <script>
        const drawChart = () => {
            // Watch count
            const label = '${label}';
            const data = JSON.parse('${data}');
            const movies = JSON.parse('${movies}');
            new Chart('barChart', {
                options: {
                    responsive: true,
                    maintainAspectRatio: true,
                    indexAxis: 'y',
                },
                type: 'bar',
                data: {
                    labels: movies,
                    datasets: [
                        {
                            axis: 'y',
                            label: label,
                            data: data,
                            fill: false,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(255, 205, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                            ],
                            borderColor: [
                                'rgb(255, 99, 132)',
                                'rgb(255, 159, 64)',
                                'rgb(255, 205, 86)',
                                'rgb(75, 192, 192)',
                                'rgb(54, 162, 235)',
                            ],
                            borderWidth: 1,
                        },
                    ],
                },
            });

            const subscriptionData = JSON.parse('${subscriptionData}');
            new Chart('doughnut', {
                options: {
                    responsive: true,
                    maintainAspectRatio: true,
                },
                type: 'doughnut',
                data: {
                    labels: ['Mobile', 'Basic', 'Standard', 'Premium'],
                    datasets: [
                        {
                            label: '',
                            data: subscriptionData,
                            backgroundColor: ['rgb(255, 99, 132)', 'rgb(54, 162, 235)', 'rgb(255, 205, 86)', 'rgb(34, 207, 207)'],
                            hoverOffset: 4,
                        },
                    ],
                },
            });
        };

        // Handle filter (select tag)
        var select = document.getElementById('filter');
        select.addEventListener('change', function () {
            var selectedValue = select.value;
            window.location.href = selectedValue;
        });
        </script>
        <script>
            document.querySelectorAll('#filter option').forEach(item => {
                if (window.location.search.includes(item.text.replace(" ", "-").toLowerCase())) {
                    item.selected = "selected"
                }
            })
        </script>
        <script>
            document.querySelectorAll('*').forEach(item => {
                if (item.getAttribute('thanhf-animation') != null) {
                    let saveValue = item.innerText.match(/[0-9]*/)[0];
                    let intSave = 0;
                    item.innerText = intSave;
                    let setIntervala = setInterval(() => {
                        item.innerText = intSave++
                        if (intSave == saveValue) {
                            clearInterval(setIntervala);
                        }
                    }, 1/saveValue * 1000)
                }
            })

        </script>
    </body>
</html>
