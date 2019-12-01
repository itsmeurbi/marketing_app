document.addEventListener('turbolinks:load', function() {
  let notifications = document.getElementsByClassName('notification')
  if (notifications.length > 0){
    setTimeout(function() {
      notifications[0].classList.add('is-hidden')
    }, 3000);
  }
});

