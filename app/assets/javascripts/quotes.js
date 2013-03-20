$(function() {
        $("input[name='rdotype']").click(
            function(){
                if($(this).attr('id')=='rdotype_manual'){
                    $('#add_manual').show();
                    $('#quote_import').hide();
                }
                else
                {
                    $('#add_manual').hide();
                    $('#quote_import').show();
                }
            });
    });