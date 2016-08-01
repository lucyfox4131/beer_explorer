$(document).ready(function(){
  console.log("Hello");

    function addBeer(beer){
      console.log(beer);
      $(".beers").append(
        "<div class='col-md-4'><a href='/beers/"+ beer.data[0].id + "'>" + beer.data[0].name + "</a></div>"
      )
    };

    $("#search-by-name").on('click', function(){
      var beerName = $("#beer-name").val()
      console.log(beerName);

      $.ajax({
        url: "/service/beer_search",
        method: "GET",
        dataType: "JSON",
        data: {name: beerName},
        success: addBeer
      });
    });
});
