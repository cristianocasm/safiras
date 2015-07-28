# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require turbolinks
#= require js/jquery.min
#= require js/jquery-migrate-1.2.1.min
#= require js/jquery-ui
#= require js/bootstrap
#= require js/jquery.parallax
#= require js/modernizr-2.6.2.min
#= require js/revolution-slider/js/jquery.themepunch.tools.min
#= require js/revolution-slider/js/jquery.themepunch.revolution
#= require js/jquery.nivo.slider.pack
#= require js/jquery.prettyPhoto
#= require js/superfish
#= require js/tweetMachine
#= require js/tytabs
#= require js/jquery.gmap.min
#= require js/jquery.sticky
#= require js/jflickrfeed
#= require js/custom
#= require jquery.mask
#= require_tree .

jQuery ->
  $('.telefone').mask('(00) 0000-00009')

  $('.main-header li a.anchor').click ->
    event.preventDefault();
    $($(this).attr('href'))[0].scrollIntoView();
    scrollBy(0, -170);

  $('#contact').submit ->
    request = $.post('/customers', $('#contact').serialize())

  $('#premium').click ->
    $('#customer_price').val('67')

  $('#restrito').click ->
    $('#customer_price').val('37')  

  $('#sem_preco').click ->
    $('#customer_price').val('00')

  window.video_percentage = 0
  track_video_events()

track_video_events = ->
  player = $('iframe')
  playerOrigin = '*'

  # Listen for messages from the player
  # Handle messages received from the player
  onMessageReceived = (event) ->
    # Handle messages from the vimeo player only
    if !/^https?:\/\/player.vimeo.com/.test(event.origin)
      return false
    if playerOrigin == '*'
      playerOrigin = event.origin
    data = JSON.parse(event.data)
    switch data.event
      when 'ready'
        onReady()
      when 'play'
        onPlay data.data
      when 'playProgress'
        onPlayProgress data.data
      when 'pause'
        onPause()
      when 'finish'
        onFinish()

  # Helper function for sending a message to the player
  post = (action, value) ->
    data = method: action
    if value
      data.value = value
    message = JSON.stringify(data)
    player[0].contentWindow.postMessage data, playerOrigin

  onReady = ->
    post 'addEventListener', 'pause'
    post 'addEventListener', 'finish'
    post 'addEventListener', 'playProgress'

  onPause = ->
    woopra.track('video_paused', { percentage: window.video_percentage }) if typeof woopra != 'undefined'

  onFinish = ->
    woopra.track('video_full_watched', { percentage: window.video_percentage }) if typeof woopra != 'undefined'

  onPlay = (data) ->
    woopra.track('video_started', { percentage: window.video_percentage }) if typeof woopra != 'undefined'

  onPlayProgress = (data) ->
    window.video_percentage = parseFloat(data.percent)

  if window.addEventListener
    window.addEventListener 'message', onMessageReceived, false
  else
    window.attachEvent 'onmessage', onMessageReceived, false