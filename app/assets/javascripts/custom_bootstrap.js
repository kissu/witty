$(document).ready(function(){
  $('#myTabs a').click(function (e) {
    e.preventDefault()
    $(this).tab('show');
    // if (this) {
    //   console.log("hello");
    // }
  })

  // $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
  //   console.log(e);
  //   e.relatedTarget // previous active tab
  // })
});
