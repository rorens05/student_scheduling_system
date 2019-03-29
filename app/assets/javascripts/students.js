$(document).ready(function(){
    $("#school_year_select").change(function(){ 
        var year = $(this).children("option:selected").val();
        location.href = "/students?school_year=" + year;
    });

    $("#section_school_year").change(function(){ 
        var year = $(this).children("option:selected").val();
        location.href = "/sections?school_year=" + year;
    });
});
