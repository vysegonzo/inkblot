// Generated by CoffeeScript 1.8.0
(function() {
  (function($) {
    var inkblot_toggle_controls;
    inkblot_toggle_controls = function($settingId, $o) {
      return wp.customize($settingId, function($setting) {
        return $.each($o.controls, function($i, $controlId) {
          return wp.customize.control($controlId, function($control) {
            var $visibility;
            $visibility = function($to) {
              return $control.container.toggle($o.callback($to));
            };
            $visibility($setting.get());
            return $setting.bind($visibility);
          });
        });
      });
    };
    $.each({
      content: {
        controls: ['sidebar1_width'],
        callback: function($to) {
          return 'one-column' !== $to;
        }
      },
      page_background_image: {
        controls: ['page_background_repeat', 'page_background_position_x', 'page_background_attachment'],
        callback: function($to) {
          return !!$to;
        }
      },
      trim_background_image: {
        controls: ['trim_background_repeat', 'trim_background_position_x', 'trim_background_attachment'],
        callback: function($to) {
          return !!$to;
        }
      }
    }, function($settingId, $o) {
      return inkblot_toggle_controls($settingId, $o);
    });
    return $.each({
      content: {
        controls: ['sidebar2_width'],
        callback: function($to) {
          return -1 !== $to.indexOf('three');
        }
      }
    }, function($settingId, $o) {
      return inkblot_toggle_controls($settingId, $o);
    });
  })(jQuery);

}).call(this);
