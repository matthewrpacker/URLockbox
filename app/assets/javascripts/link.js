$(function () {
  $("button.toggle").on("click", function (event) {
    event.preventDefault();
    var row = $(this).closest("tr")
    var linkId = row.data("link-id")

    function toggleLink(row) {
      row.toggleClass("read unread")

      var newType = row.hasClass("read") ? "read" : "unread"
      var oldType = row.hasClass("read") ? "unread" : "read"

      var statusCells = row.children("td:nth-of-type(3)")
      statusCells.text(newType)

      var buttons = row.find("td > button")
      buttons.text("Mark as " + $.camelCase(oldType))
    }

    $.ajax({
      url: "/api/v1/links/" + linkId,
      method: "PATCH",
      success: toggleLink(row),
      error: function (error) {
        alert("Status update failed.")
      }
    })
  })

  $("#typed").keyup(function () {
    var data = this.value.toUpperCase().split(" ")
    var allRows = $("#searchBody").find("tr")

    if (this.value == "") {
      allRows.show()
      return;
    }
    allRows.hide()

    allRows.filter(function (index, value) {
      var tr = $(this)

      for (var i = 0; i < data.length; ++i) {
        if (tr.text().toUpperCase().indexOf(data[i]) > -1) {
          return true
        }
      }
      return false
    }).show()
  })
})
