$(function() {
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
    })
    .fail(function() {
      console.log('ユーザー検索に失敗しました');
      // alert('ユーザー検索に失敗しました');
    });
  });
});