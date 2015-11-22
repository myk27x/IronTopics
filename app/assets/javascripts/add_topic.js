$(document).ready(function()
{
  $("#add_topic").on("click", function()
  {
    $(".modal-content").html("");

    $.ajax('/topics/new',
    {
      method: 'GET',
    })

  });
});
