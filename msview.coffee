window.onload = ->
  navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia

  video = document.getElementsByTagName('video')[0]

  navigator.getUserMedia {video: true}, (stream) ->
    console.log stream
    video.src = window.URL.createObjectURL(stream)
    video.play()
  , (error) ->
    alert error; console.error error
