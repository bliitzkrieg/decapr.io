$ ->
  $('.navbar').affix offset:
    top: ->
      @bottom = $('.hero').outerHeight(true)

  $('.typer').typed
    strings: [
      'a javascript wizard'
      'a front-end developer'
      'Luca.'
    ]
    typeSpeed: 0
    cursorChar: '_'
    backDelay: 200
    backSpeed: 10
    callback: ->
      setTimeout (->
        $('.sub-title').addClass 'active'
        return
      ), 100
      return
  return