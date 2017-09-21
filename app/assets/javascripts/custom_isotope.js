$(document).ready(function(){
  // https://codepen.io/kissu/pen/dVMzvb
  var $container = $('.contact-cards-container').isotope({
    itemSelector: '.filtr-item'
  });

  var $checkboxes = $('.button-tags-container .checkbox input');
  $checkboxes.change(function(){
    var filters = [];
    // get checked checkboxes values
    $checkboxes.filter(':checked').each(function(){
      filters.push( this.value );
    });
    // ['.red', '.blue'] -> '.red, .blue'
    filters = filters.join(', ');
    $container.isotope({ filter: filters });
  });

  $('#shuffle').click(function(){
    $container.isotope('shuffle');
  });
})
