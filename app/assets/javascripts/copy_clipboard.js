$(document).ready(function(){
  $('a.btn-share').click(function(event){
    event.preventDefault();
    link_to_copy = $(this).parent().children($('.clipboard-hidden')[0]).text();
    var $temp = $("<input>");
      $("body").append($temp);
      $temp.val(link_to_copy).select();
      document.execCommand("copy");
      $temp.remove();
      // maybe need some comments since I'll forget it in a few weeks...
  })
});
