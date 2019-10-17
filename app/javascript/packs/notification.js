document.addEventListener("DOMContentLoaded", function() {
  var notification = document.getElementsByClassName('notification')
  if (notification.lentgh > 0){
    setTimeout(function() {
      notificarion[0].classList.add('is-hidden')
    }, 5000);
  }
});

