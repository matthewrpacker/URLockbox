$(function () {
  var table = $("#linkTable")[0]

  function evaluateStatus(status) {
    for (var i = 0, row; row = table.rows[i]; i++) {
      $(row).show()
      for (var j = 0, col; col = row.cells[j]; j++) {
        if(col.textContent == status) {
          $(row).hide()
        }
      }
    }
  }

  $("button.filter-read").on("click", function (event) {
    event.preventDefault()
    evaluateStatus('unread')
  })

  $("button.filter-unread").on("click", function (event) {
    event.preventDefault()
    evaluateStatus('read')
  })
})
