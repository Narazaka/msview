// Generated by CoffeeScript 1.10.0
(function() {
  window.onload = function() {
    var main_video, sub_video;
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
    main_video = document.getElementById('main');
    sub_video = document.getElementById('sub');
    return navigator.getUserMedia({
      video: true
    }, function(stream) {
      console.log(stream);
      main_video.src = window.URL.createObjectURL(stream);
      main_video.play();
      sub_video.src = main_video.src;
      return sub_video.play();
    }, function(error) {
      alert(error);
      return console.error(error);
    });
  };

}).call(this);
