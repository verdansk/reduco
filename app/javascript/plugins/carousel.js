  import $ from 'jquery';

  // (function($) {
  const carousel = () => {
  $(".cata-sub-nav").on('scroll', function() {
      let val = $(this).scrollLeft();
      if($(this).scrollLeft() + $(this).innerWidth()>=$(this)[0].scrollWidth){
          $(".nav-next").hide();
        } else {
        $(".nav-next").show();
      }
      if(val == 0){
        $(".nav-prev").hide();
      } else {
        $(".nav-prev").show();
      }
    });
  // console.log( 'init-scroll: ' + $(".nav-next").scrollLeft() );
  $(".nav-next").on("click", function(){
    $(".cata-sub-nav").animate( { scrollLeft: '+=460' }, 200);
  });
  $(".nav-prev").on("click", function(){
    $(".cata-sub-nav").animate( { scrollLeft: '-=460' }, 200);
  });
}
// })(jQuery);

export { carousel };
