import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    let author = document.getElementById("messageContainer").getAttribute("data-author")
    let imageContainer = data.image ? `<img src="${data.image}">` : ""

    let messageItem =
    '<div class="columns">'+
      `<div class="column is-flex ${author == data.author && "is-author"}">`+
        `<div class="message">`+
          '<div class="author">'+
            `<p>${data.author}</p>`+
          '</div>'+
          `<p>${data.content}</p>`+
          imageContainer+
        '</div>'+
      '</div>'+
    '</div>'
    document.getElementById("messageContainer").insertAdjacentHTML('beforeend', messageItem);
    document.getElementById("messageContainer").scrollTop = 10000;
  }
});
