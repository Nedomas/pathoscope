$(document).ready(function(){
  var scene = $('#scene');

  if (scene.html()) {
    scene.parallax();
  }

  // var jwindow = $(window);
  // var window_height = jwindow.height();
  // var max_height = $(document).height();
  // var bottom = max_height - window_height - 100;
  // var middle = bottom / 2;

  // jwindow.scroll(function(){
  //   var current = jwindow.scrollTop();

  //   if (current < middle) {
  //     $('body').css('background-color', '#72A470');
  //     // $('body').removeClass('bg-middle bg-bottom');
  //     // $('body').addClass('bg-top');
  //   } else if (current >= middle && current < bottom) {
  //     $('body').css('background-color', 'hsla(27, 25%, 54%, 1)');
  //     // $('body').removeClass('bg-top bg-bottom');
  //     // $('body').addClass('bg-middle');
  //   } else if (current = bottom) {
  //     $('body').css('background-color', 'hsla(0, 77%, 62%, 1)');
  //     // $('body').removeClass('bg-top bg-middle');
  //     // $('body').addClass('bg-bottom');
  //   } else {
  //     $('body').css('background-color', '#72A470');
  //     // $('body').removeClass('bg-middle bg-bottom');
  //     // $('body').addClass('bg-top');
  //   }
  // });

});
