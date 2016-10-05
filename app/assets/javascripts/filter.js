function searchFilter(){
  $("#search_filter").on('keyup', function(){
    var currentSearch = $(this).val().toLowerCase();

    $(".info-card").each(function(index, style){
      var name = $(this).find(".style-name").text().toLowerCase()
      if (name.indexOf(currentSearch) !== -1){
        $(style).parent("div").show();
       } else {
        $(style).parent("div").hide();
       }
    });
  });
}
