$(document).ready(function(){

    function addBrewery(brewery){
      console.log(brewery);
      $(".breweries").append(
        "<div class='col-md-4'>" + brewery.name + "</div>"
      )
    };

    function listBreweries(breweries){
      if (breweries){
        $(".breweries").html("")
        $(breweries).each(function(index, brewery){
          addBrewery(brewery)
        })
      } else {
        $(".breweries").html("").append("We do not currently have breweries associated with that zip code.")
      }
    };

    $("#brew-search-by-zip").on('click', function(){
      var breweryZip = $("#brewery-zip").val()

      $.ajax({
        url: "/service/brewery_search",
        method: "GET",
        dataType: "JSON",
        data: {zip: breweryZip},
        success: listBreweries
      });
    });
});
