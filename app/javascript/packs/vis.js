import vis from "vis-network"
import axios from "axios"

document.addEventListener("DOMContentLoaded", function() {
  const csrfToken = document.querySelector("meta[name=csrf-token]").content;
  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;
  const container = document.getElementById('vis-container');
  let options = networkOptions();
  let data = {};
  var network = new vis.Network(container, data, options);

  getCurrentNetwork().then((response) => processResponse(response))
                     .then((data) => setNetworkData(data, network));
  buildForms(network);
})

function buildForms(network){
  document.getElementById("add-node").addEventListener("click", function(){
    network.addNodeMode()
  });
  document.getElementById("edit-node").addEventListener("click", function(){
    network.addEdgeMode()
  })
  document.getElementById("delete-node").addEventListener("click", function(){
    network.deleteSelected();
  });
}

function networkOptions(){
  return {
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
          createEdge(data, callback );
        }
      },
      deleteNode: function(data, callback) {
        requestNodeDelete(data, callback)
      },
      deleteEdge: function(data, callback){
        requestEdgeDelete(data, callback)
      }
    }
  };
}

function requestNodeDelete(data, callback){
  data.nodes.forEach( nodeId => {
    deleteNode(nodeId, data, callback);
  });
}

function requestEdgeDelete(data, callback){
  data.edges.forEach( edgeId => {
    deleteEdge(edgeId, data, callback);
  })
}

function deleteEdge(edgeId, data, callback){
  const url = document.getElementById('createEdgeLink').getAttribute("href") + `/${edgeId}.json`;
  axios.delete(url)
  .then((response) => {
    if(response.status == 200){
      callback(data);
    }else{
      console.log(response.data);
    }
  })
  .catch((error) => {
    console.log(error);
  });
}


function deleteNode(nodeId, data, callback){
  const url = document.getElementById('currentPath').getAttribute("href") + `/nodes/${nodeId}.json`;
  axios.delete(url, { id: nodeId })
            .then((response) => {
              if(response.status == 200){
                callback(data);
              }else{
                console.log(response.data);
              }
            })
            .catch((error) => {
              console.log(error);
            });
}

function clearPopUp() {
  document.getElementById('saveButton').onclick = null;
  document.getElementById('cancelButton').onclick = null;
  document.getElementById('network-popUp').style.display = 'none';
}

function cancelEdit(callback) {
  clearPopUp();
  callback(null);
}

function createEdge(data, callback) {
  const url = document.getElementById('createEdgeLink').getAttribute("href") + '.json';
  axios.post(url, { from: data.from, to: data.to })
            .then((response) => {
              if(response.status == 200){
                callback(data);
              }else{
                console.log(response.data);
              }
            })
            .catch((error) => {
              console.log(error);
            });
}

function saveData(data,callback) {
  const url = document.getElementById('saveButton').getAttribute("href") + '.json';
  let label = document.getElementById('node-label').value
  axios.post(url, { label: label })
        .then((response) => {
          if(response.status == 200){
            data.id = response.data.id
            data.label = document.getElementById('node-label').value;
            clearPopUp();
            callback(data);
          }else{
            console.log(response.data);
          }
        })
        .catch((error) => {
          console.log(error);
        });
}

async function getCurrentNetwork() {
  const url = document.getElementById("currentPath").getAttribute("href") + '.json';
  var response = {}
  try {
    response = await axios.get(url, {})
  }catch(exception){
    console.log(exception)
  }
  return response
}

function setNetworkData(data, network){
  network.setData (data);
  network.redraw();
}

function processResponse(response){
  var data = {}
  if(response.status == 200){
    let nodes = response.data.nodes.map( (node) => { return {id: node.id, label: node.label }});
    let edges = response.data.edges.map( (edge) => { return {id: edge.id, from: edge.from_id, to: edge.to_id }});
    data  = {
      nodes: nodes,
      edges: edges
    }
  }else{
    console.log(response.data);
  }
  return data;
}
