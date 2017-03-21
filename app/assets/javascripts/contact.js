$(document).on('turbolinks:load', function(){

  function append(data){
    var header = $(".contact-intro-header");
    var html = `<div class="container">
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="intro-message">
                        <h3>お問い合わせありがとうございます。</h3>
                        <h3>2,3日以内に担当者から返信を差し上げます。</h3>
                      </div>
                    </div>
                  </div>
                </div>`;
    $(".chat-group-form").remove();
    header.append(html);
  }


  function sendAjax(name, email, university, grade, text){
    console.log(name);
    $.ajax({
      url: "/contacts",
      type: "POST",
      dataType: "json",
      data: {name: name, email: email, university: university, grade: grade, text: text},
    })
    .done(function(data){ //dataの中にはjson形式で送られてきたデータが格納されている！
      // alert("送信しました。");
      append(data);
    })
    .fail(function(data){
      console.log("再入力してください。");
    });
  }


  $(".contact-form__action-btn").on('click', function(e){
    e.preventDefault();
    var name = $("#contact-form_name").val();
    var email = $("#contact-form_email").val();
    var university = $("#contact-form_university").val();
    var grade = $("#contact-form_grade").val();
    var text = $("#contact-form_text").val();
    if (name.length == 0 || email.length == 0 || text.length == 0){
      alert("必須項目は漏れなくお願いします。");
    }else{
      sendAjax(name, email, university, grade, text);
      return false;
    }
  });
})


