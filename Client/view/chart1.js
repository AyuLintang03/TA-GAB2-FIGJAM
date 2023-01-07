var ctx = document.getElementById('lineChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'],
        datasets: [{
            label: 'Penjualan',
            data: [12, 19, 3, 5, 2, 3, 8, 12, 9, 10, 18, 17],
            backgroundColor: [
                'rgb(180, 140, 91)'                
            ],
            borderColor: [
                'rgb(180, 140, 91)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        Responsive: true
        }    
});