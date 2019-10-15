import vis from "vis-network"
import axios from "axios"

document.addEventListener("DOMContentLoaded", function() {
  document.getElementById("add-node").addEventListener("click", function(){
    network.addNodeMode()
  });
  document.getElementById("edit-node").addEventListener("click", function(){
    network.addEdgeMode()
  })
  document.getElementById("delete-node").addEventListener("click", function(){
    network.deleteSelected();
  });

  var nodes = new vis.DataSet([])
  var edges = new vis.DataSet([])
  var network = null;
  // var data = {
  //   nodes: nodes,
  //   edges: edges
  // }

//   var edges = [{
//     from: 1,
//     to: 3
// }, {
//     from: 1,
//     to: 2
// }, {
//     from: 2,
//     to: 4
// }, {
//     from: 2,
//     to: 5
// }];

  getCurrentNetwork()
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

function createEdge(data, callback) {
  const id = data.from
  const url = document.getElementById('createEdgeLink').getAttribute("href") + '.json';
  const csrfToken = document.querySelector("meta[name=csrf-token]").content
  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken
  console.log("before put")
  axios.post(url, {
                    from: data.from,
                    to: data.to,
                  },
                  {
                    headers: {
                      'Content-Type': 'application/json',
                  }
        })
        .then(function (response) {
          if(response.status == 200){
            callback(data);
          }
          console.log(response)
        })
        .catch(function (error) {
          alert("Error creating node")
          console.log(error)
        });
}

function saveData(data,callback) {
  const url = document.getElementById('saveButton').getAttribute("href") + '.json';
  const csrfToken = document.querySelector("meta[name=csrf-token]").content
  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken
  let label = document.getElementById('node-label').value
  axios.post(url, {
                    label: label,
                  },
                  {
                    headers: {
                      'Content-Type': 'application/json',
                  }
        })
        .then(function (response) {
          if(response.status == 200){
            data.id = response.data.id
            data.label = document.getElementById('node-label').value;
            clearPopUp();
            callback(data);
          }
        })
        .catch(function (error) {
          alert("Error creating node")
          console.log(error)
        });
}


async function getCurrentNetwork() {
  const url = document.getElementById("currentPath").getAttribute("href") + '.json';
  var nodes = []
  var edges = []
  var data = {}

  //TODO ADD A CATCH
  let response = await axios.get(url, {})

  //TODO CREATE DATA OBJECT
  console.log(response)

}


function example(data){
  console.log(data)
}







// axios.get(url, {
//                   },
//                   {
//                     headers: {
//                       'Content-Type': 'application/json',
//                   }
//         })
//         .then(function (response) {
//           if(response.status == 200){
//             //TODO RETURN LIKE AN ARRAY OF IOBJECTS
//           nodes = response.data.nodes.map( (node) => { return {id: node.id, label: node.label }})
//           edges = response.data.edges.map( (edge) => { return {from: edge.node_from_id, to: edge.node_to_id }})

//           let data  = {
//               nodes: nodes,
//               edges: edges
//             }

//           example(data)

//           var nodes = new vis.DataSet([])
//           var edges = new vis.DataSet([])
//           var network = null;

//           const container = document.getElementById('vis-container');
//           const options = {
//             manipulation: {
//               enabled: true,
//               deleteEdge: true,
//               addNode: function (data, callback) {
//                 document.getElementById('operation').innerHTML = "Add Node";
//                 document.getElementById('saveButton').onclick = saveData.bind(this, data, callback);
//                 document.getElementById('cancelButton').onclick = clearPopUp.bind();
//                 document.getElementById('network-popUp').style.display = 'block';
//               },
//               editNode: function (data, callback) {
//                 document.getElementById('operation').innerHTML = "Edit Node";
//                 document.getElementById('node-id').value = data.id;
//                 document.getElementById('node-label').value = data.label;
//                 document.getElementById('saveButton').onclick = saveData.bind(this, data, callback);
//                 document.getElementById('cancelButton').onclick = cancelEdit.bind(this,callback);
//                 document.getElementById('network-popUp').style.display = 'block';
//               },
//               addEdge: function (data, callback) {
//                 if (data.from != data.to) {
//                   createEdge(data, callback );
//                   console.log("doing")
//                 }
//               },
//               deleteNode: function(toBeDeletedData, callback) {
//                 callback(toBeDeletedData);
//               },
//             }
//           };

//           network = new vis.Network(container, data, options);











//           }
//         })
//         .catch(function (error) {
//           alert("Error getting campain")
//           console.log(error)
//         });
