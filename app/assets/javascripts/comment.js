$(function() {
  $('.top').on('click', function(e) {
    // e.preventDefault();
    var comment = $('#comment_text').val();
    console.log(comment);

    $.ajax({
      type: 'POST',
      url: '/comments/',
      data: {
        comment: {
          content: comment
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = $('<div class="comment">').append(data.content);
      $('.flex-box').append(html);
      $('.comment_text').val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});