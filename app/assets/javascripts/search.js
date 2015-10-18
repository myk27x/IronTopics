$(document).ready(function()
{
  $("#to_search").on("keyup", function()
  {
     var title    = $(this).val();

     $.ajax('/search', {
       method: 'GET',
       data: {
         title: title
       }
     })
  });
});
