// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//= require foundation
$(document).foundation();

jQuery(document).ready(function() {

    var ctx = document.getElementById("lineChart").getContext("2d");
    var data = {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
            {
                label: "OPEN",
                fillColor:   "rgba(151,187,205,0.2)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor:  "rgba(151,187,205,1)",
                pointStrokeColor:   "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "#fff",
                data: gon.stats_open
            },
            {
                label: "IN PROGRESS",
                fillColor:   "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor:  "rgba(220,220,220,1)",
                pointStrokeColor:   "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "#fff",
                data: gon.stats_in_progress
            },
            {
                label: "RELSOLVED",
                fillColor:   "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor:  "rgba(220,220,220,1)",
                pointStrokeColor:   "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "#fff",
                data: gon.stats_resolved
            }
        ]
    }
    var myLineChart = new Chart(ctx).Line(data, {});

    var ctx = document.getElementById("pieChart").getContext("2d");
    var data = [
        {
            value: gon.stats_today[0],
            color:"#F7464A",
            highlight: "#FF5A5E",
            label: "OPEN"
        },
        {
            value: gon.stats_today[1],
            color: "#46BFBD",
            highlight: "#5AD3D1",
            label: "IN PROGRESS"
        },
        {
            value: gon.stats_today[2],
            color: "#FDB45C",
            highlight: "#FFC870",
            label: "RESOLVED"
        }
    ]
    var myPieChart = new Chart(ctx).Pie(data,{});
});
