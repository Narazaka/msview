window.onload = ->
  navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia

  main_video = document.getElementById('main')

  navigator.getUserMedia {video: true}, (stream) ->
    console.log stream
    main_video.src = window.URL.createObjectURL(stream)
    main_video.play()
  , (error) ->
    alert error; console.error error

  scale = document.getElementById('scale')
  scale.oninput = ->
    main_video.style.transform = 'scale(' + scale.value + ')'
