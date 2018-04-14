# Homepage UI Animation

# timing configs
#
delay_name = 500
delay_boxes = 2000
anim_name = 1000
anim_boxes = 1000

# ---

animate_name = ->
  $("#line").animate({
    width: "420px"
  }, anim_name, ->
    $("#boxes").show()
  )

included = (x, y, box) =>
  (x >= box.x && x+box.size <= box.x) && (y >= box.y && y+box.size <= box.y)

toRad = (deg) ->
  deg * Math.PI/180

boxes = []
opacity_max = 0.6

boxes = []

one_angle = (idx) ->
  (6/$("#boxes div").size()+0) * (idx)

class Box
  size: 130 # px
  constructor: (elem, idx) ->
    variation_x = 920
    variation_y = 500

    @angle = idx * Math.PI / 6.0
    @radius = 320

    @x =  Math.sin(@angle) * @radius * 1.3 - 63
    @y = -Math.cos(@angle) * @radius * 0.8 - 46
    @elem = elem
    @idx = idx
    @width = 200
    @height = 133

  animate: ->
    $(@elem).css({ zIndex: @idx+2 })

    rotX = Math.cos(@angle) * 45
    rotY = Math.sin(@angle) * 45

    $(@elem).css "-webkit-transition", "-webkit-transform 1s"
    $(@elem).css "-webkit-transition-timing-function", "ease-in-out"
    $(@elem).css "-webkit-transition-delay", "1s"

    $(@elem).animate({
      opacity: opacity_max,
      left: @x,
      top: @y,
      width: @width+"px",
      height: @height+"px",
    }, anim_boxes)

animate_boxes = ->
  $.each($("#boxes div"), (idx, elem) ->
    box = new Box(elem, idx)
    box.animate()
  )

# ---

$(-> # domready

  setTimeout(animate_name, delay_name)
  setTimeout(animate_boxes, delay_boxes)

  $("#boxes div").bind('click', ->
    document.location.href = $(this).attr("data-href")
  )

  z_index = 2
  $("#boxes div").hover(
    ->
      z_index = $(this).css("z-index")
      $(this).animate({
        opacity: 1
      }, 300, ->
        $(this).css({ zIndex: 10 })
      )
    ->
      $(this).animate({
        opacity: opacity_max
      }, 300  , ->
        $(this).css({ zIndex: z_index })
      )
  )

  options =
    showEffect:'show',
    hideEffect:'fadeout',
    fadeoutSpeed: 'slow',
    zoomWidth: 1000,
    zoomHeight: 400,
    position : 'top',
    title :false
  $(".jqzoom").jqzoom(options)
)
