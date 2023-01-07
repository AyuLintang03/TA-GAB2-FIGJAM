var ctx = document.getElementById('doughnut').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: ['Platinum', 'Gold', 'Robusta', 'Pengharum Mobil'],
        datasets: [{
            label: '# Barang',
            data: [30, 12, 9, 10],
            backgroundColor: [
                'rgb(180, 140, 91)',
                'rgb(145, 113, 72)',
                'rgb(113, 101, 64)',
                'rgb(83, 70, 54)'
            ],
            borderColor: [
                'rgb(180, 140, 91)',
                'rgb(145, 113, 72)',
                'rgb(113, 101, 64)',
                'rgb(83, 70, 54)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        Responsive: true
    }
});