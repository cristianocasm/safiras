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
#= require froogaloop
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

  track_video_events()

track_video_events = ->
  iframe = $('#player1')[0]
  player = $f(iframe)
  # status = $('.status')
  # When the player is ready, add listeners for pause, finish, and playProgress

  onPause = (id) ->
    console.log('paused')
    # status.text 'paused'

  onFinish = (id) ->
    console.log('finished')
    # status.text 'finished'

  onPlayProgress = (data, id) ->
    console.log('played')
    # status.text data.seconds + 's played'

  player.addEvent 'ready', ->
    # status.text 'ready'
    player.addEvent 'pause', onPause
    player.addEvent 'finish', onFinish
    player.addEvent 'playProgress', onPlayProgress

  # Call the API when a button is pressed
  # $('button').bind 'click', ->
  #   player.api $(this).text().toLowerCase()