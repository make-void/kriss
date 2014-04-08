# timings
delay_name = 1500
delay_boxes = 3000
anim_name = 1000
anim_boxes = 1000
#
delay_name = 500
delay_boxes = 2000
anim_name = 1000
anim_boxes = 1000


animate_name = ->
  $("#line").animate({
    width: "420px" # 390 on webkit?
  }, anim_name, ->
    $("#boxes").show();
  )

included = (x, y, box) =>
  #console.log "x: "+x+", y:"+y+", box: { x:"+box.x+", y:"+box.y+", size: "+box.size+"}"
  (x >= box.x && x+box.size <= box.x) && (y >= box.y && y+box.size <= box.y)

toRad = (deg) ->
  deg * Math.PI/180

#boxes = [{x: -200, y:-100, size: 300}]
boxes = []
opacity_max = 0.6

# insert_randoms = (num) ->
#   rand = Math.random()
#   randoms.each do
#     if rand >
#   insert_randoms num
#
# randoms = []
# insert_randoms("#boxes div").size());

boxes = []

one_angle = (idx) ->
  (6/$("#boxes div").size()+0) * (idx)#*randoms[idx]
  #(1/2)*idx

class Box
  size: 130 # px
  constructor: (elem, idx) ->
    variation_x = 920
    variation_y = 500
    
    #@angle = Math.random()*360
    #@radius = Math.random()*350+50
    @angle = idx * Math.PI / 6.0
    @radius = 320
    #@radius = Math.random()*350+50
    
    @x = Math.sin(@angle)*@radius* 1.3  - 63 
    @y = -Math.cos(@angle)*@radius* 0.8 - 46
    #console.log "angle: "+@angle+" x:"+@x+" y:"+@y
    @elem = elem
    @idx = idx
    @width = 200
    @height = 133
    #@width = 60 if @idx == 0 # Me box is thinner
    
    #boxes << { x: @x, y: @y }
    
  animate: ->
    $(@elem).css({ zIndex: @idx+2 })

    rotX = Math.cos(@angle)*45
    rotY = Math.sin(@angle)*45
    #rotX = -45
    #deg = if @angle > 180 then @angle/2 else @angle
    #randY = if deg <= 90 then -deg/2 else deg*2-45
    #console.log "angle: "+@angle+" rotX:"+rotX+" rotY:"+rotY
    #$(@elem).css "-webkit-transform", "rotateX(#{rotX}deg) rotateY(#{rotY}deg)"
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


$(->
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

  # $("img.large").click(->
  #   #console.log($(this).attr('src'))
  #   location.href = "/zoom"+$(this).attr('src')
  # )

  options =
    showEffect:'show',
    hideEffect:'fadeout',
    fadeoutSpeed: 'slow',
    zoomWidth: 1000,
    zoomHeight: 400,
    position : 'top',
    title :false
  $(".jqzoom").jqzoom(options);
);
