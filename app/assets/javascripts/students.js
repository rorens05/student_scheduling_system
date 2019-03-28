$(document).ready(function(){
    $("#school_year_select").change(function(){ 
        var year = $(this).children("option:selected").val();
        location.href = "/students?school_year=" + year;
    });
});