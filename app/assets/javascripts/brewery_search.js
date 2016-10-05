$(document).ready(function(){
  searchFilter()
    function addBrewery(brewery){
      var message;
      if (brewery.data){
        message = "<div class='col-md-4'><a href='/breweries/"+ brewery.data[0].id + "'>" + brewery.data[0].name + "</a></div>"
      } else {
        message = "It looks like that search didn't find anything. You may have a spelling mistake, or we do not currently have a record of your search."
      }
      $(".breweries").html("").append(
        message
      )
    };

    $("#brew-search-by-name").on('click', function(){
      var breweryName = $("#brewery-name").val()

      $.ajax({
        url: "/service/brewery_search",
        method: "GET",
        dataType: "JSON",
        data: {name: breweryName},
        success: addBrewery,
      });
    });
});
