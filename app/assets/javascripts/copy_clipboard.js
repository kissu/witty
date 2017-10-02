$(document).ready(function(){
  $('a.btn-share').click(function(event){
    event.preventDefault();
    link_to_copy = $(this).parent().children($('.clipboard-hidden')[0]).text();
    var $temp = $("<input>");
      $("body").append($temp);
      $temp.val(link_to_copy).select();
      document.execCommand("copy");
      $temp.remove();
  })
});

// this code is doing the following stuff:
// #3, deny the submit of the button to not follow the link clicked, just used to
//   make an action, here: click on the btn-share
// #4, as we are clicking on the button, we need to climb up a level ahead in the
//   DOM to be able to reach the hidden url of the link, this line is just a super
//   long selector to put the string of the url in the variable link_to_copy
// #5, we create an input field and store it in the var temp
// #6, we randomly append the latter var somewhere in the page, not a big deal since
//   it's only temporary
// #7, we add the string into the freshly created field (passed as the value),
//   we select that one (select methood is highlighting all the text w/ mouse)
// #8, we use the system command exec to copy the selected text (in the input)
// #9, we remove the temporary field created just for the copy
