// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
    $('#classification-funds')
        .addClass("display cell-border compact")
        .dataTable(
            {
                //"paging": false,
                "columns": [
                    { className: "dt-center" },
                    { className: "dt-center" },
                    { className: "dt-center" },
                    { className: "dt-center" },
                    { className: "dt-center" },
                    { className: "dt-center" },
                    { className: "dt-center" },
                    { className: "dt-center" },
                    { className: "dt-center" },
                    { className: "dt-center" },
                    { className: "dt-center" },
                    { className: "dt-center" },
                    { className: "dt-center" }
                ],
                "pageLength": 25
            }
    );
} );