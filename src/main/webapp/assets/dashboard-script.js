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
document.querySelectorAll('#filter option').forEach((item) => {
    if (window.location.search.includes(item.text.replace(' ', '-').toLowerCase())) {
        item.selected = 'selected';
    }
});
document.querySelectorAll('*').forEach((item) => {
    if (item.getAttribute('thanhf-animation') != null) {
        let saveValue = item.innerText.match(/[0-9]*/)[0];
        let intSave = 0;
        item.innerText = intSave;
        let setIntervala = setInterval(() => {
            item.innerText = intSave++;
            if (intSave > saveValue) {
                clearInterval(setIntervala);
            }
        }, (1 / (saveValue + intSave * 10)) * 5000);
    }
});