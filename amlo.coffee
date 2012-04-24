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

    page.render("amlo.png")
    phantom.exit()
  else
    console.log('Connection failed.')
    phantom.exit()

page.onConsoleMessage = (msg) ->
  console.log msg

page.viewportSize =
  width: 1366
  height: 768
page.open('http://www.amlo.org.mx/')