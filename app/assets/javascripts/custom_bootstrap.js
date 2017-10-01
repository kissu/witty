$(document).ready(function(){
  $('a[href*="text"]').last().click(function(){
    $('.understood-button-block .btn').removeClass('hidden');
  });

  $('.button-tags-container a').click(function () {
    $('.button-tags-container a.active').toggleClass('active');
    $(this).addClass('active');
  });

  $('.alert').delay(3000).slideUp(500, function() {});

  $('.btn-share').click(function() { setTimeout(function() {
    $('.alert').delay(3000).slideUp(500, function() {});
  }, 100); });
});
