import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    let author = document.getElementById("messageContainer").getAttribute("data-author")
    let messageItem =
    '<div class="columns">'+
      `<div class="column is-flex">`+
        `<div class="message ${author == data.author && "is-author"}">`+
        `<p>${data.content}</p>`+
        `<img src="${data.image}"></img>`
        '</div>'+
        '<div class="author">'+
        `<p>${data.author}</p>`+
        '</div>'+
      '</div>'+
    '</div>'
    document.getElementById("messageContainer").insertAdjacentHTML('beforeend', messageItem);
  }
});
