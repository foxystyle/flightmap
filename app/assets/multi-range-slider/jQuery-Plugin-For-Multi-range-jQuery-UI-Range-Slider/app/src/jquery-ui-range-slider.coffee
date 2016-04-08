###!
#
# Copyright Emilio Forrer
# Released under the MIT license.
###

#>>label: rangeSlider
#>>group: Widgets
#>>description: Displays a flexible slider with multiples ranges and accessibility via keyboard.


do ($) ->
  $.widget 'uiExtension.rangeSlider', $.ui.slider,

    _create: ->
      self = this
      self.options.values = []
      self.options.rangeValues = []
      self.options.overlap = true if !self.options.overlap?
      self.options.rangeBarColor = '#F5F5F5' if !self.options.rangeBarColor?
      $(self.options.ranges).each (k, v) ->
        v = self._parseRangeValues(v)
        v.endValue = v.startValue + 1 if v.startValue == v.endValue
        self.options.values.push v.startValue
        self.options.values.push v.endValue
        self.options.rangeValues.push v
        self.options.rangeValues.push v
        $(self.element).append '<div class="ui-slider-range ui-widget-header range-bg-' + v.id.toString() + '" style="left: ' + (100 * v.startValue / self.options.max).toString() + '%; width: ' + 100 * (v.endValue - v.startValue) / self.options.max + '%; background: none repeat scroll 0% 0% ' + v.color + ';" ><div class="range-label"></div></div>'
        return
      self._super()

    _parseRangeValues: (obj) ->
      parsed = $.extend(true, {
        id: (new Date).getTime()
        startValue: 0
        endValue: 1
        color: @options.rangeBarColor
      }, obj)
      parsed

    _createHandles: ->
      self = this
      self._super()
      @handles.each (index, handler) ->
        handler = $(handler)
        range = self.options.rangeValues[index]
        handler.addClass 'range-handler-' + range.id
        handler.data 'id', range.id
        handler.data 'period', range
        if self.options.values[index] == range.startValue
          handler.addClass 'left'
          handler.data 'value', range.startValue
        if self.options.values[index] == range.endValue
          handler.addClass 'right'
          handler.data 'value', range.endValue
        
      

    _checkLimit: (index, changeValue = false) ->
      self = this
      result = true
      handlers = self._getHandlers(index)
      rightLimit = handlers.rightHandler.position().left - handlers.rightHandler.outerWidth()
      closestLimit = 0
      leftLimit = handlers.leftHandler.position().left + handlers.leftHandler.outerWidth()
      
      if handlers.currentHandler.position().left > rightLimit and handlers.currentHandler.hasClass('left')
        if changeValue == true
          handlers.currentHandler.css 'left', rightLimit
        return false

      if handlers.currentHandler.position().left < leftLimit and handlers.currentHandler.hasClass('right')
        if changeValue == true
          handlers.currentHandler.css 'left', leftLimit
        return false

      if !self.options.overlap? || self.options.overlap == false
        if handlers.currentHandler.hasClass('right') and handlers.closestHandler? and handlers.closestHandler.length > 0
          closestLimit = handlers.closestHandler.position().left - handlers.closestHandler.outerWidth()
          if handlers.currentHandler.position().left > closestLimit
            if changeValue == true
              handlers.currentHandler.css 'left', closestLimit
            return false
        if handlers.currentHandler.hasClass('left') and handlers.closestHandler? and handlers.closestHandler.length > 0
          closestLimit = handlers.closestHandler.position().left + handlers.closestHandler.outerWidth()
          if handlers.currentHandler.position().left < closestLimit
            if changeValue == true
              handlers.currentHandler.css 'left', closestLimit
            return false

    _refreshInfoBars: ->
      self = this
      $(self.handles).each (k, v) ->
        self._renderInfoBar {}, k

    _refresh: ->
      @_super()
      @_refreshInfoBars()
      

    _rageUiHash: (event, index) ->
      uiHash = {}
      uiHash.handlers = @_getHandlers(index)
      uiHash.ranges = @.options.ranges
      range = $.grep @.options.ranges, (value)->
        return value.id.toString() == uiHash.handlers.currentHandler.data('id').toString()
      if range?
        range = range[0]
        range.startValue = uiHash.handlers.leftHandler.data('value')
        range.endValue = uiHash.handlers.rightHandler.data('value')
        uiHash.range = range
      uiHash

    _slide: (event, index, newVal) ->
      self = this
      allow = true
      handlers = self._getHandlers(index)
      handlers.currentHandler.data 'value', self.options.values[index]
      width = handlers.rightHandler.position().left - handlers.leftHandler.position().left
      handlers.rangeBar.css 'left', handlers.leftHandler.css('left')
      handlers.rangeBar.css 'width', width.toString() + 'px'
      ui = self._rageUiHash(event, index)
      if self._checkLimit(index) == false
        allow = false
      if allow == false
        return false
      else
        allow = self._trigger('rangeSlide', event, ui)
      self._renderInfoBar event, index
      allow = @_super(event, index, newVal)
      allow

    _stop: (event, index) ->
      @_checkLimit index, true
      @_super event, index

    _renderInfoBar: (event, index) ->
      self = this
      text = ""
      ui = self._rageUiHash(event, index)
      ui.label = $('.range-label', ui.handlers.rangeBar)
      if $.isFunction(self.options.rangeLabel)
        self._trigger('rangeLabel', event, ui)
      else
        text = ui.handlers.leftHandler.data('value').toString() + ' -- ' + ui.handlers.rightHandler.data('value').toString() 
        ui.label.empty().append(text)

    _getHandlers: (index) ->
      handlers = {}
      self = this
      handlers.currentHandler = $(self.handles[index])
      handlerSelector = '.range-handler-' + handlers.currentHandler.data('id')
      handlers.leftHandler = $(handlerSelector + '.left:first', self.element)
      handlers.rightHandler = $(handlerSelector + '.right:first', self.element)
      handlers.rangeBar = $('.range-bg-' + handlers.currentHandler.data('id'), self.element)
      if handlers.currentHandler.hasClass('right')
        handlers.closestHandler = handlers.currentHandler.next('.left:first')
      if handlers.currentHandler.hasClass('left')
        handlers.closestHandler = handlers.currentHandler.prev('.right:first')
      handlers