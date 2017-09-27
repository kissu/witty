// $(document).ready(function(){
//   // https://codepen.io/kissu/pen/dVMzvb
//   var $knowledge_container = $('.article-upvoted-cards-container').isotope({
//     itemSelector: '.filtered-item',
//     percentPosition: true,
//     resize: false
//   });
//   var $network_container = $('.contact-cards-container').isotope({
//     itemSelector: '.filtered-item',
//     percentPosition: true,
//     resize: false,
//     initLayout: true,
//     masonry: {
//       columnWidth: '.filtered-item'
//     }
//   });

//   var $checkboxes = $('.button-tags-container .checkbox input');
//   $checkboxes.change(function(){
//     var filters = [];
//     $checkboxes.filter(':checked').each(function(){
//       filters.push( this.value );
//     });

//     filters = filters.join(', ');
//     $knowledge_container.isotope({ filter: filters });
//     $network_container.isotope({ filter: filters });
//   });

//   $('#shuffle').click(function(){
//     $network_container.isotope('shuffle');
//   });
// })
