$(document).ready(function(){
  $('#navbar-scrollspy a').on('click', function(event) {
    if (this.hash !== ""){
      event.preventDefault();
      var sentence = $(this).attr('href');
      // this line is the same as the above one -> var hash = this.hash;
      var last_one = $(sentence).offset().top +
        $('#onboarding-scrollspied').scrollTop() - 150;
      $('#onboarding-scrollspied').animate({
        scrollTop: last_one
      }, 600);
    }
    window.location.hash = sentence;
  });
});
