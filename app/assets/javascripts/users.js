$(document).on('page:update', function(event) {
  var $btn = $( '.btn-1' );
  var $btnFront = $btn.find( 'a' ),
    $btnYes = $btn.find( '.btn-back .yes' ),
    $btnNo = $btn.find( '.btn-back .no' );
var linkEvent;
$btnFront.on( 'click', '.btn-front', function( event ) {
  var mx = event.clientX - $btn.offsetLeft,
      my = event.clientY - $btn.offsetTop;

  var w = $btn.offsetWidth,
      h = $btn.offsetHeight;
  
  var directions = [
    { id: 'top', x: w/2, y: 0 },
    { id: 'right', x: w, y: h/2 },
    { id: 'bottom', x: w/2, y: h },
    { id: 'left', x: 0, y: h/2 }
  ];
  
  directions.sort( function( a, b ) {
    return distance( mx, my, a.x, a.y ) - distance( mx, my, b.x, b.y );
  } );
  
  $(this).closest('.btn-1').attr( 'data-direction', directions.shift().id );
  $(this).closest('.btn-1').addClass( 'is-open' );
  linkEvent = event;
  event.preventDefault();
  event.stopImmediatePropagation();
} );

$btnYes.on( 'click', function( event ) {  
  $btn.removeClass( 'is-open' );
  $link = $(linkEvent.currentTarget).closest('a');
  $.ajax({
   method: "PUT",
    url: $link.attr('href') + '.js',
  });ˇ
} );


$btnNo.on( 'click', function( event ) {
  $btn.removeClass( 'is-open' );
} );

function distance( x1, y1, x2, y2 ) {
  var dx = x1-x2;
  var dy = y1-y2;
  return Math.sqrt( dx*dx + dy*dy );
}
});
