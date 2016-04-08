var myarr;

myarr = [
  {
    id: 1,
    startValue: 200,
    endValue: 800,
    color: "rgb(27, 64, 194)",
    //startAt: "2015-03-22 00:00",
    //endAt: "2015-03-22 23:59"
  }
];

$(function() {
  var renderLabel;
  renderLabel = function(ui, customContent) {
    var content, endAt, range, startAt;
    if (customContent == null) {
      customContent = false;
    }
    var range = ui.range;
    var content = "" + (startAt) + " - " + (endAt);
    if (customContent) {
      //content = $("<div style='left: -40px;position: absolute;'>" + (startAt.format("YYYY-MM-DD h:mm")) + "</div><div style='right: -40px;position: absolute;'>" + (endAt.format("YYYY-MM-DD h:mm")) + "</div>");
    }
    return content;
  };
  $('#budget-range').rangeSlider({
    min: 0,
    max: 10000,
    ranges: myarr
  });
});


var myarr;

myarr = [
  {
    id: 1,
    startValue: 200,
    endValue: 800,
    color: "rgb(27, 64, 194)",
    //startAt: "2015-03-22 00:00",
    //endAt: "2015-03-22 23:59"
  }
];

$(function() {
  var renderLabel;
  renderLabel = function(ui, customContent) {
    var content, endAt, range, startAt;
    if (customContent == null) {
      customContent = false;
    }
    var range = ui.range;
    var content = "" + (startAt) + " - " + (endAt);
    if (customContent) {
      //content = $("<div style='left: -40px;position: absolute;'>" + (startAt.format("YYYY-MM-DD h:mm")) + "</div><div style='right: -40px;position: absolute;'>" + (endAt.format("YYYY-MM-DD h:mm")) + "</div>");
    }
    return content;
  };
  $('#duration-range').rangeSlider({
    min: 0,
    max: 10000,
    ranges: myarr
  });
});
