$(document).ready(function(){
      $('.user-notification').click(function(){
        var e = $('#activity');

        if ( e.hasClass('activity_open') ) {
              e.hide(10);
              e.removeClass('activity_open');
        } else {
          $.ajax({
            url: '/notification',
            type: 'get',
            dataType: 'html',
            success: function(d){
              e.html(d);
            },
            complete: function(){
              if ( e.hasClass('activity_open') == false ) {
                e.show(1);
                e.addClass('activity_open');
              }
            }
          });
        }
      });
    });