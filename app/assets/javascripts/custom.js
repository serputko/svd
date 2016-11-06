/**
 * Created by ALEXXX on 28.11.2014.
 */
$('#micropost_content').keyup(function () {
    var left = 140 - $(this).val().length;
    if (left < 0) {
        left = 0;
    }
    $('#counter').text('Characters left: ' + left);
});
