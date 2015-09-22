window.onload = ->
  navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia

  main_video = document.getElementById('main')
  sub_video = document.getElementById('sub')

  navigator.getUserMedia {video: true}, (stream) ->
    console.log stream
    main_video.src = window.URL.createObjectURL(stream)
    main_video.play()
    sub_video.src = window.URL.createObjectURL(stream)
    sub_video.play()
  , (error) ->
    alert error; console.error error
