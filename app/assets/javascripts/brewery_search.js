$(document).ready(function(){
  console.log("Hello");

    function addBrewery(brewery){
      console.log(brewery);
      $(".breweries").append(
        "<div class='col-md-4'><a href='/breweries/"+ brewery.data[0].id + "'>" + brewery.data[0].name + "</a></div>"
      )
    };

    $("#brew-search-by-name").on('click', function(){
      var breweryName = $("#brewery-name").val()
      console.log(breweryName);

      $.ajax({
        url: "/service/brewery_search",
        method: "GET",
        dataType: "JSON",
        data: {name: breweryName},
        success: addBrewery
      });
    });
});
