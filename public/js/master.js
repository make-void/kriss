(function() {
  var Box, animate_boxes, animate_name, boxes, included, overlay_check;
  var __bind = function(func, context) {
    return function(){ return func.apply(context, arguments); };
  };
  animate_name = function() {
    return $("#line").animate({
      width: "422px"
    }, 1000, function() {
      return $("#boxes").show();
    });
  };
  included = __bind(function(x, y, box) {
    return ((x >= box.x) && (x + box.size <= box.x)) && ((y >= box.y) && (y + box.size <= box.y));
  }, this);
  boxes = [];
  Box = function() {
    var variation_x, variation_y;
    variation_x = 920;
    variation_y = 500;
    this.x = (Math.random() - 0.5) * variation_x;
    this.y = (Math.random() - 0.5) * variation_y;
    return this;
  };
  Box.prototype.size = 130;
  Box.prototype.overlaying = function() {
    var _ref, i;
    _ref = boxes.length;
    for (i = 0; (0 <= _ref ? i < _ref : i > _ref); (0 <= _ref ? i += 1 : i -= 1)) {
      console.log(boxes[i].x);
      if (included(this.x, this.y, boxes[i])) {
        return true;
      }
    }
    return false;
  };
  overlay_check = function(box) {
    console.log(box.overlaying());
    if (boxes.length !== 0 || box.overlaying()) {
      box = new Box();
      return overlay_check(box);
    } else {
      boxes = boxes + [box];
      return box;
    }
  };
  animate_boxes = function() {
    return $.each($("#boxes div"), function(idx, elem) {
      var box, height, width;
      box = new Box();
      console.log("over: " + box.overlaying());
      if (box.overlaying()) {
        box = new Box();
      }
      boxes = boxes + [box];
      console.log("over2: " + box.overlaying());
      width = 100;
      height = 100;
      if (idx === 0) {
        width = 60;
      }
      return $(elem).animate({
        opacity: 1,
        left: box.x,
        top: box.y,
        width: width + "px",
        height: height + "px"
      }, 1000);
    });
  };
  $(function() {
    setTimeout(animate_name, 1500);
    setTimeout(animate_boxes, 3000);
    return $("#boxes div").hover(function() {
      return $(this).animate({
        opacity: 0.7
      }, 300);
    }, function() {
      return $(this).animate({
        opacity: 1
      }, 300);
    });
  });
}).call(this);
