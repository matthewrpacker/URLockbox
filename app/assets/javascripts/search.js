$(function () {
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
