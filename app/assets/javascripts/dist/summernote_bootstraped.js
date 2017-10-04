$(document).ready(function() {
  $('#edit').click(function(event) {
    event.preventDefault();
    $('.summernote').summernote({focus: true});
  });

  $('#save').click(function(event) {
    event.preventDefault();
    var markup = $('.summernote').summernote('code');
    $('.summernote').summernote('destroy');
  });
});
