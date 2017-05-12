$(function() {
  console.log("page load");
    $(".sidebar-toggle").click(function() {
      console.log("clicked editor");
      $(".sidebar").toggleClass( "sidebar-out", addOrRemove );
    });
});
