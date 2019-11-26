document.addEventListener("DOMContentLoaded", function() {
    google.charts.load('current', {'packages':['timeline', 'corechart'], 'language': 'es'});
    document.getElementById('campainProgressChart') && google.charts.setOnLoadCallback(drawCharts);
})

const drawCharts = () => {
  document.getElementById('campainProgressChart') && drawCampainProgressChart();
  document.getElementById('postPublicationChart') && drawPostProgressChart();
}

const drawPostProgressChart = () => {
  let container = document.getElementById('postPublicationChart');
  let chart = new google.visualization.ColumnChart(container);
  let numberOfTotalPosts = container.getAttribute("data-total-posts");
  let numberOfPublishedPosts = container.getAttribute("data-published-posts");
  let numberOfPostWithMedia = container.getAttribute("data-post-with-media");
  let numberOfPostWithNoMedia = container.getAttribute("data-post-without-media");

  var data = google.visualization.arrayToDataTable([
    ['Factor', 'Numero de post', { role: 'style' } ],
    ['Total', parseInt(numberOfTotalPosts), 'color: #209cee'],
    ['Publicados', parseInt(numberOfPublishedPosts), 'color: #00d1b2'],
    ['Con media', parseInt(numberOfPostWithMedia), 'color: #ffdd57'],
    ['Solo texto', parseInt(numberOfPostWithNoMedia), 'color: grey'],
  ]);

  let options = {timeline: { groupByRowLabel: true },
    colors: ['#B61F39', '#504F51']
  };
  chart.draw(data, options);
}


const drawCampainProgressChart = () => {
  let container = document.getElementById('campainProgressChart');
  let chart = new google.visualization.Timeline(container);
  let dataTable = new google.visualization.DataTable();
  let startDate = document.getElementById("startDate").textContent
  let endDate = document.getElementById("endDate").textContent

  dataTable.addColumn({ type: 'string', id: 'Progreso' });
  dataTable.addColumn({ type: 'string', id: 'Name' });
  dataTable.addColumn({ type: 'date', id: 'Start' });
  dataTable.addColumn({ type: 'date', id: 'End' });

  if (new Date(endDate)  > new Date() ){
    dataTable.addRows([["1", "Progreso actual",  new Date(startDate),  new Date() ]]);
  }
  dataTable.addRows([[ "2", "Duración de la campanña",  new Date(startDate),  new Date(endDate) ]]);

  let options = {timeline: { groupByRowLabel: true },
    colors: ['#B61F39', '#504F51']
  };

  chart.draw(dataTable, options);
}
