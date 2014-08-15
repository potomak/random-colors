$(function() {
  var start = $('#start');

  var complement = function(colorHexString) {
    var color = $.Color(colorHexString);
    return color.hue((color.hue() + 180) % 360).toHexString();
  };

  var changeColor = function() {
    $.get('/color', function(color) {
      $('body').animate({ backgroundColor: color.to_hex, color: complement(color.to_hex) }, 1000);
      $('#background-color').html(color.to_hex);
    });
  };

  var startCallback = function() {
    changeColor();
    var changeColorRef = setInterval(changeColor, 3000);
    start.html('Stop').one('click', function() {
      clearTimeout(changeColorRef);
      start.html('Start').one('click', startCallback);
    })
  };

  start.one('click', startCallback);
});
