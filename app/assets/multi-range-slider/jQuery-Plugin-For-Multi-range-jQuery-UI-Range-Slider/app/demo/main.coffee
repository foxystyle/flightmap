myarr = [
  {
    id: 1
    startValue: 480
    endValue: 720
    color: "#CF1920"
    startAt: "2015-03-22 00:00"
    endAt: "2015-03-22 23:59"
  }
  {
    id: 2
    startValue: 810
    endValue: 950
    startAt: "2015-03-22 00:00"
    endAt: "2015-03-22 23:59"
  }
]

$ ->
  renderLabel = (ui, customContent = false) ->
    range = ui.range
    startAt = moment(range.startAt, "YYYY-MM-DD h:mm").add(range.startValue, "minutes")
    endAt = moment(range.startAt, "YYYY-MM-DD h:mm").add(range.endValue, "minutes")
    content = "#{startAt.format("YYYY-MM-DD h:mm")} -- #{endAt.format("YYYY-MM-DD h:mm")}"
    content = $("<div style='left: -40px;position: absolute;'>#{startAt.format("YYYY-MM-DD h:mm")}</div><div style='right: -40px;position: absolute;'>#{endAt.format("YYYY-MM-DD h:mm")}</div>") if customContent
    return content

  $('#slider-range').rangeSlider
    min: 0
    max: 1440
    ranges: myarr

  $('#slider-range-timer').rangeSlider
    min: 0
    max: 1440
    ranges: myarr
    rangeSlide: (event, ui) ->
      $("#display-timer").empty().append(renderLabel(ui))

  $('#slider-range-custom-label').rangeSlider
    min: 0
    max: 1440
    ranges: myarr
    rangeLabel:(event, ui) ->
      ui.label.empty().append(renderLabel(ui, true))

    rangeSlide: (event, ui) ->
      $("#display-label-timer").empty().append(renderLabel(ui))
      

