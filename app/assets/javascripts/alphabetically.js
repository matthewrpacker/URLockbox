$(function () {
  $("button.sort-alpha").on("click", function (event) {
    event.preventDefault()

    var tableBody = $('#searchBody')
    var listitems = tableBody.children('tr').get()

    listitems.sort(function(a, b) {
      var firstRow = $(a).text().toUpperCase()
      var secondRow = $(b).text().toUpperCase()

      return (firstRow < secondRow) ? -1 : (firstRow > secondRow) ? 1 : 0
    })
    $.each(listitems, function(index, currentRow) { tableBody.append(currentRow) })
  })
})
