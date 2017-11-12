  var createClickedName = function(){
    var $detail_btn = $(this);
    var user_name = $detail_btn.parent().parent().find('.user_name').text();
    notifyToSlack(user_name);
  };

  var notifyToSlack = function(user_name){
    data_user_name = JSON.stringify({user_nassme: user_name});
    $.ajax({
      url: '/admin/slack/post',
      type: 'GET',
      dataType: 'json',
      data: {
        name: user_name
      },
    }).done(function(data){
    });
  };


  /********************************************************************************
                                            turbolinks対策
  ********************************************************************************/

  $(document).on("turbolinks:load", function() {});

  // ********************************************************************************/

$(function(){

  $(document).on('click', '.detail-btn', createClickedName)

});
