document.addEventListener("DOMContentLoaded", function() {
    google.charts.load('current', {'packages':['timeline'], 'language': 'es'});
    google.charts.setOnLoadCallback(drawChart);
  })
  
  function drawChart() {
    var container = document.getElementById('timeline');
    var chart = new google.visualization.Timeline(container);
    var dataTable = new google.visualization.DataTable();
    let startDate = document.getElementById("startDate").textContent
    let endDate = document.getElementById("endDate").textContent
  
    dataTable.addColumn({ type: 'string', id: 'Progreso' });
    dataTable.addColumn({ type: 'date', id: 'Start' });
    dataTable.addColumn({ type: 'date', id: 'End' });
  
    if (new Date()  < new Date(endDate) ){
      dataTable.addRows([[ "Progreso actual",  new Date(startDate),  new Date() ]]);
    }
    dataTable.addRows([[ "Progreso actual",  new Date(startDate),  new Date(endDate) ]]);
  
    var options = {timeline: { groupByRowLabel: true } };
  
    chart.draw(dataTable, options);
  }

  let container = document.getElementById('timeline');