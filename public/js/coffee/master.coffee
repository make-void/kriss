
animate_name = () -> 
  $("#line").animate({
    width: "422px"
  }, 1000, ->
    $("#boxes").show();
  )




included = (x, y, box) =>
  #console.log "x: "+x+", y:"+y+", box: { x:"+box.x+", y:"+box.y+", size: "+box.size+"}"
  (x >= box.x && x+box.size <= box.x) && (y >= box.y && y+box.size <= box.y)
  
#boxes = [{x: -200, y:-100, size: 300}]
boxes = []

class Box
  size: 130 # px
  constructor: () ->  
    variation_x = 920
    variation_y = 500
    @x = (Math.random()-0.5)*variation_x
    @y = (Math.random()-0.5)*variation_y
  overlaying: () ->
    #console.log boxes
    for i in [0...boxes.length] 
      console.log boxes[i].x
      return true if included(@x, @y, boxes[i])
    return false


overlay_check = (box) ->
  console.log box.overlaying()
  if boxes.length != 0 || box.overlaying()
    box = new Box
    overlay_check(box)
  else
    boxes = boxes + [box]
    box

animate_boxes = () -> 
  $.each($("#boxes div"), (idx, elem) ->
    box = new Box
    #boxes = boxes + [box]
    console.log "over: " + box.overlaying()
    box = new Box if box.overlaying()
    boxes = boxes + [box]
    #box = overlay_check(box)
    console.log "over2: " + box.overlaying()
    #
      
    #console.log "reallocating box"
    
    width = 100
    height = 100
    width = 60 if idx == 0 
    
    $(elem).animate({
      opacity: 1,
      left: box.x,
      top: box.y,
      width: width+"px",
      height: height+"px"
    }, 1000)
  )



  
$(() ->
  setTimeout(animate_name, 1500)
  setTimeout(animate_boxes, 3000)
  
  $("#boxes div").hover(
    () ->
      $(this).animate({
        opacity: 0.7
      }, 300)
    () ->
      $(this).animate({
        opacity: 1
      }, 300);
  )
);
