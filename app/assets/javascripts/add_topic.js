$(document).ready(function()
{
  $(".add_link").on("click", function()
  {
    $(".modal-content").html("");

    $.ajax('/topics/new',
    {
      method: 'GET',
    })

  });
});
