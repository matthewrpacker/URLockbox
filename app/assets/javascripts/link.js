$(function(){
  $(".unread").on("click", ".change", function(event){
    event.preventDefault();

    link = $(this).closest('tr');
    var id = $(link).attr('data-target');
    var title = $(link).attr('data-title');
    var url = $(link).attr('data-url');
    var status = $(link).attr('data-status');
    var type = $(link).attr('data-type');
    var user = $(link).attr('data-user');

    function toggleLink (row) {
        $(row).hide()
        var html = "<tr class='read' data-target='" + id
        + "' data-type='" + type + "' data-title='" + title
        + "' data-url='" + url + "' data-status='" + status
        + "'><td><a href='" + url + "'>" + title
        + "</a></td><td><a href='" + url + "'>" + url
        + "</a></td><td>read</td><td><button type='button' name='button' class='change btn btn-primary btn-xs'>Mark as Unread</button></td><td><a class='btn btn-primary btn-xs' href='/users/"
        + user + "/links/" + id + "/edit'>Edit Link</a></td></tr>"
        $('tbody').append(html)
    }

    $.ajax({
      url: "/api/v1/links/" + id,
      method: "PUT",
      success: toggleLink(link),
      error: console.log("Status update failed")
    })
  })

  $(".read").on("click", ".change", function(event){
    event.preventDefault();

    link = $(this).closest('tr');
    var id = $(link).attr('data-target');
    var title = $(link).attr('data-title');
    var url = $(link).attr('data-url');
    var status = $(link).attr('data-status');
    var type = $(link).attr('data-type');
    var user = $(link).attr('data-user');

    function toggleLink (row) {
        $(row).hide()
        var html = "<tr class='unread' data-target='" + id
        + "' data-type='" + type + "' data-title='" + title
        + "' data-url='" + url + "' data-status='" + status
        + "'><td><a href='" + url + "'>" + title
        + "</a></td><td><a href='" + url + "'>" + url
        + "</a></td><td>unread</td><td><button type='button' name='button' class='change btn btn-primary btn-xs'>Mark as Read</button></td><td><a class='btn btn-primary btn-xs' href='/users/"
        + user + "/links/" + id + "/edit'>Edit Link</a></td></tr>"
        $('tbody').append(html)
    }

    $.ajax({
      url: "/api/v1/links/" + id,
      method: "PUT",
      success: toggleLink(link),
      error: console.log("Status update failed")
    })
  })
})
