fs = require 'fs'
path = require 'path'

cwd = process.cwd()
if process.platform == 'darwin' and cwd == '/'
  cwd = path.join app.getAppPath(), '../../../..'

config_path = path.join cwd, 'msview.json'

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
    save_config()

  contrast = document.getElementById('contrast')
  contrast?.oninput = ->
    main_video.style.webkitFilter =
      main_video.style.webkitFilter.replace /contrast\([-0-9.]*\)/, "contrast(#{contrast.value})"
    save_config()

  brightness = document.getElementById('brightness')
  brightness?.oninput = ->
    main_video.style.webkitFilter =
      main_video.style.webkitFilter.replace /brightness\([-0-9.]*\)/, "brightness(#{brightness.value})"
    save_config()

  dispatch_event = ->
    event = document.createEvent('HTMLEvents')
    event.initEvent('input', true, false)
    scale?.dispatchEvent(event)
    contrast?.dispatchEvent(event)
    brightness?.dispatchEvent(event)

  load_config = ->
    try
      config = JSON.parse fs.readFileSync config_path, encoding: 'utf8'
      scale?.value = config.scale
      contrast?.value = config.contrast
      brightness?.value = config.brightness
    catch
      undefined
  
  save_config = ->
    try
      config =
        scale: scale?.value
        contrast: contrast?.value
        brightness: brightness?.value
      fs.writeFileSync config_path, JSON.stringify config, null, '  '
    catch
      undefined

  load_config()
  dispatch_event()