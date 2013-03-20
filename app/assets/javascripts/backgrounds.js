$(function($) {
    return $("#deactivate").bind("ajax:success", function() {
        if ($("#deactivate").text() === "Active |") {
            return $("#deactivate").text("Deactive |");
        } else {
            return $("#deactivate").text("Active |");
        }
    });
});

$(function() {
    $("input[name='rdo_upload_type']").click(
        function(){
            if($(this).attr('id')=='rdo_upload_type_individual'){
            $('.upload_individual').show();
            $('.upload_zip').hide();
            }
            else
            {
                $('.upload_individual').hide();
                $('.upload_zip').show();

            }
        });
});