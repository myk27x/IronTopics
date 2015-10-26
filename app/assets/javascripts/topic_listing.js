$(document).ready(function()
{
  $("#topics").on("click", ".topic_listing :not(a)", function()
  {
    var id = $(this).parent(".topic_listing").data('topic-id');
    console.log("this ID is" + id)

    $(".modal-content").html("");

    $.ajax('/topics/' + id, {
      method: 'GET',
    })
  });
});
