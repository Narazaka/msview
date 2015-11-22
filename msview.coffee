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
  scale?.oninput = ->
    main_video.style.transform = 'scale(' + scale.value + ')'

  contrast = document.getElementById('contrast')
  contrast?.oninput = ->
    main_video.style.webkitFilter =
      main_video.style.webkitFilter.replace /contrast\([-0-9.]*\)/, "contrast(#{contrast.value})"

  brightness = document.getElementById('brightness')
  brightness?.oninput = ->
    main_video.style.webkitFilter =
      main_video.style.webkitFilter.replace /brightness\([-0-9.]*\)/, "brightness(#{brightness.value})"
