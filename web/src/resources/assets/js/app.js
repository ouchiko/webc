window.$ = require("jquery");
window.Vue = require("vue");
window.dataset = require("./datasources/dataset.js");

$(document).ready(function() {

    var result = [
        {'firstname':'james', 'lastname':'holden'},
        {'firstname':'john', 'lastname':'johnson'}
    ];

    console.log("==");
    console.dir(dataset.data);
    console.log(dataset.data.logosource);
    console.log("==");

    new Vue({
        el : "#app",
        data : {
            year : 2017,
            items : result,
            props : dataset
        }
    });

});
