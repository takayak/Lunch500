$(function() {
  var search_list = $(".main");

  function appendpost(post) {
    var html = `
    <% posts.each do |post|%>
                <div class="post hover hover4">
                  <img src="${post}">
                </div>
                <% end%>
                  `
    search_list.append(html);
  }




  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    console.log(input);
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts) {
      console.log(posts);
    // })
      $(".main").empty();
      if (posts.length !== 0) {
        posts.forEach(function(post){
          appendpost(post);
        });
      }
      else {
        appendErrMsgToHTML("一致するツイートがありません");
      }
    })
    .fail(function() {
      console.log('ユーザー検索に失敗しました');
      // alert('ユーザー検索に失敗しました');
    });
  });
});