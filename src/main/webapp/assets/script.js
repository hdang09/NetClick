const drawChart = () => {
  const stars = [135850, 52122, 148825, 16939, 9763];
  const frameworks = ['React', 'Angular', 'Vue', 'Hyperapp', 'Omi'];
  new Chart('myChart', {
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
