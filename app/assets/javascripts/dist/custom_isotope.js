$(document).ready(function(){
  // https://codepen.io/kissu/pen/dVMzvb
  var $container = $('.filtr-contact-container').isotope({
    itemSelector: '.filtr-item'
  });

  var $checkboxes = $('.button-tags-container input');
  $checkboxes.change(function(){
    var filters = [];
    // get checked checkboxes values
    $checkboxes.filter(':checked').each(function(){
      filters.push( this.value );
    });
    // ['.red', '.blue'] -> '.red, .blue'
    filters = filters.join(', ');
    $container.isotope({ filter: button-tags-container });
  });
})
