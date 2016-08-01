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

//   function addPost(post){
//     $("#latest-posts").append(
//       "<div class='post' id='post"+ post.id+"' contenteditable='true' data-post-id='" + post.id + "'>"+ post.description + "</div>" +
//       "<button class='edit-button btn btn-default' data-target='post" + post.id + "'>Update</button>"
//     )
//   };
//
//   function listPosts(posts){
//     $("#latest-posts").html("")
//     $(posts).each(function(index, post){
//       addPost(post)
//     })
//   };
//
//   function errorMessage(errorResponse){
//     console.log(errorResponse.responseText);
//   };
//
//   $.ajax({
//     url: "https://turing-birdie.herokuapp.com/api/v1/posts.json",
//     // url: "http://192.168.30.33:3000/api/v1/posts.json",
//     method: "GET",
//     dataType: "JSON",
//     success: listPosts,
//     error: errorMessage
//   });
//
//   $("#create-post").on('click', function(){
//     var postDescription = $("#post-description").val()
//     $.ajax({
//       url: "https://turing-birdie.herokuapp.com/api/v1/posts.json",
//       // url: "http://192.168.30.33:3000/api/v1/posts.json",
//       method: "POST",
//       dataType: "JSON",
//       data: {post: {description: postDescription}},
//       success: addPost
//     });
//   });
//
//
//   $("button[name=button-fetch]").on('click', function(){
//     $.ajax({
//       url: "https://turing-birdie.herokuapp.com/api/v1/posts.json",
//       // url: "http://192.168.30.33:3000/api/v1/posts.json",
//       method: "GET",
//       dataType: "JSON",
//       success: listPosts
//     });
//   });
//
//   $(body).on("click", ".edit-button", function(){
//     // $(".edit-button").on("click", function())
//     console.log("HELLLOOOOO");
//     var targetPostID = $(this).data("target");
//     var $targetPost = $("#" + targetPostID);
//     var postID = $targetPost.data('post-id');
//     var postDescription = $targetPost.val();
//
//     $.ajax({
//       url: "https://turing-birdie.herokuapp.com/api/v1/posts" + postID + ".json",
//       // url: "http://192.168.30.33:3000/api/v1/posts/" + postID + ".json",
//       method: "PATCH",
//       dataType: "JSON",
//       data: {post: {description: postDescription}},
//       success: listPosts
//     });
//   });
//
// });
//
//
// // make a requeset
// // VERB: (METHOD) --> GET REQUEST
// // URL: https://turing-birdie.herokuapp.com/api/v1/posts
// // STEP ONE: Make a REQUEST
// // STEP TWO: PROCESS REQUEST
//
// // often see success: function(data){} --> lazy way, commonly seen, name of the thing we are about to manipulate
// // handy table, js can automatically generate a table in the console for you
