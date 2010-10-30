(function() {
  var Box, animate_boxes, animate_name, boxes, included, opacity_max, overlay_check;
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
  opacity_max = 0.6;
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
      if (included(this.x, this.y, boxes[i])) {
        return true;
      }
    }
    return false;
  };
  overlay_check = function(box) {
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
      if (box.overlaying()) {
        box = new Box();
      }
      boxes = boxes + [box];
      width = 100;
      height = 100;
      if (idx === 0) {
        width = 60;
      }
      $(elem).css({
        zIndex: idx + 2
      });
      return $(elem).animate({
        opacity: opacity_max,
        left: box.x,
        top: box.y,
        width: width + "px",
        height: height + "px"
      }, 1000);
    });
  };
  $(function() {
    var z_index;
    setTimeout(animate_name, 1500);
    setTimeout(animate_boxes, 3000);
    $("#boxes div").bind('click', function() {
      return (document.location.href = $(this).attr("data-href"));
    });
    z_index = 2;
    return $("#boxes div").hover(function() {
      z_index = $(this).css("z-index");
      return $(this).animate({
        opacity: 1
      }, 300, function() {
        return $(this).css({
          zIndex: 10
        });
      });
    }, function() {
      return $(this).animate({
        opacity: opacity_max
      }, 300, function() {
        return $(this).css({
          zIndex: z_index
        });
      });
    });
  });
}).call(this);
