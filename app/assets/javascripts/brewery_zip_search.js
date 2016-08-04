$(document).ready(function(){
  console.log("Hello");

    function addBrewery(brewery){
      console.log(brewery);
      $(".breweries").append(
        "<div class='col-md-4'><a href='/breweries/"+ brewery.id + "'>" + brewery.name + "</a></div>"
      )
    };

    function listBreweries(breweries){
      $(".breweries").html("")
      console.log(breweries);
      $(breweries).each(function(index, brewery){
        addBrewery(brewery)
      })
    };

    $("#brew-search-by-zip").on('click', function(){
      var breweryZip = $("#brewery-zip").val()
      console.log(breweryZip);

      $.ajax({
        url: "/service/brewery_search",
        method: "GET",
        dataType: "JSON",
        data: {zip: breweryZip},
        success: listBreweries
      });
    });
});
