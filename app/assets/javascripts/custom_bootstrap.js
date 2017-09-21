$(document).ready(function(){
  $('a[href*="text"]').last().click(function(){
    $('.understood-button-block .btn').removeClass('hidden');
  });
});
