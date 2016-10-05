$(document).ready(function(){

    function addBeer(beer){
      var message;
      if (beer.data){
        message = "<div class='col-md-4'><a href='/beers/"+ beer.data[0].id + "'>" + beer.data[0].name + "</a></div>"
      } else {
        message = "It looks like that search didn't find anything. You may have a spelling mistake, or we do not currently have a record of your search."
      }
      $(".beers").append( message )
    };

    $("#search-by-name").on('click', function(){
      var beerName = $("#beer-name").val()

      $.ajax({
        url: "/service/beer_search",
        method: "GET",
        dataType: "JSON",
        data: {name: beerName},
        success: addBeer
      });
    });
});
