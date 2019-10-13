import vis from "vis-network"
import axios from "axios"

document.addEventListener("DOMContentLoaded", function() {
  document.getElementById("add-node").addEventListener("click", function(){
    network.addNodeMode()
  })
  document.getElementById("edit-node").addEventListener("click", function(){
    network.addEdgeMode()
  })

  document.getElementById("delete-node").addEventListener("click", function(){
    network.deleteSelected();
  })

  var nodes = new vis.DataSet([])
  var edges = new vis.DataSet([])
  var network = null;
  var data = {
    nodes: nodes,
    edges: edges
  }

  const container = document.getElementById('vis-container');

  const options = {
    manipulation: {
      enabled: true,
      deleteEdge: true,
      addNode: function (data, callback) {
        document.getElementById('operation').innerHTML = "Add Node";
        document.getElementById('saveButton').onclick = saveData.bind(this, data, callback);
        document.getElementById('cancelButton').onclick = clearPopUp.bind();
        document.getElementById('network-popUp').style.display = 'block';
      },
      editNode: function (data, callback) {
        document.getElementById('operation').innerHTML = "Edit Node";
        document.getElementById('node-id').value = data.id;
        document.getElementById('node-label').value = data.label;
        document.getElementById('saveButton').onclick = saveData.bind(this, data, callback);
        document.getElementById('cancelButton').onclick = cancelEdit.bind(this,callback);
        document.getElementById('network-popUp').style.display = 'block';
      },
      addEdge: function (data, callback) {
        if (data.from != data.to) {
          callback(data);
        }
      },
      deleteNode: function(toBeDeletedData, callback) {
        callback(toBeDeletedData);
      },
    }
  };

  network = new vis.Network(container, data, options);
})


function clearPopUp() {
  document.getElementById('saveButton').onclick = null;
  document.getElementById('cancelButton').onclick = null;
  document.getElementById('network-popUp').style.display = 'none';
}

function cancelEdit(callback) {
  clearPopUp();
  callback(null);
}

function saveData(data,callback) {
  data.id = document.getElementById('node-id').value;
  data.label = document.getElementById('node-label').value;

  clearPopUp();
  callback(data);
}

