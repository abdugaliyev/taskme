$(document).ready(function(){
      $('.ecategory_child').click(function(){
        var e = $(this);
        var parent_id = e.attr('parent_id');
        if (e.prop('checked') == true) $('#ecategory_'+parent_id).prop('checked','true');
      });

    });