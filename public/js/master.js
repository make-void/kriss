var Box, anim_boxes, anim_name, animate_boxes, animate_name, boxes, delay_boxes, delay_name, included, one_angle, opacity_max, toRad,
  _this = this;

delay_name = 1500;

delay_boxes = 3000;

anim_name = 1000;

anim_boxes = 1000;

delay_name = 500;

delay_boxes = 2000;

anim_name = 1000;

anim_boxes = 1000;

animate_name = function() {
  return $("#line").animate({
    width: "420px"
  }, anim_name, function() {
    return $("#boxes").show();
  });
};

included = function(x, y, box) {
  return (x >= box.x && x + box.size <= box.x) && (y >= box.y && y + box.size <= box.y);
};

toRad = function(deg) {
  return deg * Math.PI / 180;
};

boxes = [];

opacity_max = 0.6;

one_angle = function(idx) {
  return (6 / $("#boxes div").size() + 0) * idx;
};

Box = (function() {
  Box.prototype.size = 130;

  function Box(elem, idx) {
    var variation_x, variation_y;
    variation_x = 920;
    variation_y = 500;
    this.angle = Math.random() * 360;
    this.radius = Math.random() * 350 + 50;
    this.x = Math.sin(this.angle) * this.radius;
    this.y = -Math.cos(this.angle) * this.radius;
    this.elem = elem;
    this.idx = idx;
    this.width = 100;
    this.height = 100;
    if (this.idx === 0) {
      this.width = 60;
    }
  }

  Box.prototype.animate = function() {
    var rotX, rotY;
    $(this.elem).css({
      zIndex: this.idx + 2
    });
    rotX = Math.cos(this.angle) * 45;
    rotY = Math.sin(this.angle) * 45;
    $(this.elem).css("-webkit-transition", "-webkit-transform 1s");
    $(this.elem).css("-webkit-transition-timing-function", "ease-in-out");
    $(this.elem).css("-webkit-transition-delay", "1s");
    return $(this.elem).animate({
      opacity: opacity_max,
      left: this.x,
      top: this.y,
      width: this.width + "px",
      height: this.height + "px"
    }, anim_boxes);
  };

  return Box;

})();

animate_boxes = function() {
  return $.each($("#boxes div"), function(idx, elem) {
    var box;
    box = new Box(elem, idx);
    return box.animate();
  });
};

$(function() {
  var options, z_index;
  setTimeout(animate_name, delay_name);
  setTimeout(animate_boxes, delay_boxes);
  $("#boxes div").bind('click', function() {
    return document.location.href = $(this).attr("data-href");
  });
  z_index = 2;
  $("#boxes div").hover(function() {
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
  options = {
    showEffect: 'show',
    hideEffect: 'fadeout',
    fadeoutSpeed: 'slow',
    zoomWidth: 1000,
    zoomHeight: 400,
    position: 'top',
    title: false
  };
  return $(".jqzoom").jqzoom(options);
});
