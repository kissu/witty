$(document).ready(function() {
  $('#edit').click(function(event) {
    event.preventDefault();
    $('.summernote').summernote({focus: true});
  });

  $('#ok').click(function(event) {
    event.preventDefault();
    var markup = $('.summernote').summernote('code');
    $('#onboarding_page').val(markup);
    $('.summernote').summernote('destroy');
    $('#save').click();
  });

  $('.summernote-mail').summernote({
    toolbar: [
    // [groupName, [list of button]]
      ['style', ['bold', 'italic', 'underline', 'clear']],
      ['font', ['strikethrough', 'superscript', 'subscript']],
      ['fontsize', ['fontsize']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['height', ['height']]
    ]
  });
});
