$(function(){

  $(".unread").on("click", ".change", function(event){
    event.preventDefault();

    var link = $(this).closest('tr');
    var id = $(link).attr('data-target');

    $.ajax({
      url: "/api/v1/links/" + id,
      method: "PUT",
      error: console.log("Status update failed")
    })
  })

  $(".read").on("click", ".change", function(event){
    event.preventDefault();

    var link = $(this).closest('tr');
    var id = $(link).attr('data-target');

    $.ajax({
      url: "/api/v1/links/" + id,
      method: "PUT",
      error: console.log("Status update failed")
    })
  })
})
