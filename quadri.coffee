page = require('webpage').create()

injectjQuery = ->
  page.injectJs './jquery.js'
  
  page.evaluate ->
    jQuery.noConflict()

page.onLoadFinished = (status) ->
  if status == 'success'
    injectjQuery()

    page.evaluate ->
      # jQuery stuff

    window.setTimeout ->
      page.render("quadri.png")
      phantom.exit()
    , 15000
  else
    console.log('Connection failed.')
    phantom.exit()

page.onConsoleMessage = (msg) ->
  console.log msg

page.viewportSize =
  width: 1366
  height: 768
page.open('http://nuevaalianza.mx/')