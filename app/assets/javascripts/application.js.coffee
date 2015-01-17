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
#= require js/jquery.wait
#= require js/modernizr-2.6.2.min
#= require js/modernizr.custom
#= require js/revolution-slider/js/jquery.themepunch.tools.min
#= require js/revolution-slider/js/jquery.themepunch.revolution.min
#= require js/jquery.nivo.slider.pack
#= require js/jquery.prettyPhoto
#= require js/superfish
#= require js/tweetMachine
#= require js/tytabs
#= require js/jquery.gmap.min
#= require js/circularnav
#= require js/jquery.sticky
#= require js/jflickrfeed
#= require js/imagesloaded.pkgd.min
#= require js/waypoints.min
#= require js/custom
#= require jquery.mask
#= require_tree .

jQuery ->
  $('.telefone').mask('(00) 0000-00009')

  $('.main-header li a').click ->
    event.preventDefault();
    $($(this).attr('href'))[0].scrollIntoView();
    scrollBy(0, -200);