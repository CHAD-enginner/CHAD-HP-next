$(document).on('turbolinks:load', function(){
  $(function(){

    var actions_sub_html = `<div class='a'>
                              <li class="sub-list">
                               <a href="/actions/sports", class="sub-word">運動会</a>
                              </li>
                              <li class="sub-list">
                               <a href="/actions/educations", class="sub-word">教育</a>
                              </li>
                            </div>`;

    var members_sub_html = `<div class='a'>
                              <li class="sub-list">
                               <a href="/kisei/1/users", class="sub-word">一期生</a>
                              </li>
                              <li class="sub-list">
                               <a href="/kisei/2/users", class="sub-word">二期生</a>
                              </li>
                              <li class="sub-list">
                               <a href="/kisei/3/users", class="sub-word">三期生</a>
                              </li>
                            </div>`;

    $(".actions-bar").hover(function(){
      $(".actions-sub").append(actions_sub_html);
    },
    function(){
      $(".a").remove();
    });

    $(".members-bar").hover(function(){
      $(".members-sub").append(members_sub_html);
    },
    function(){
      $(".a").remove();
    });
  });
});
