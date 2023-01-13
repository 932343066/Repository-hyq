$(function () {
    debugger;
    var songJson = tools.requestJsonRs("/SongSheetController");
    if (songJson.rtState) {
        var pro = $('#songSheet');
        var options = '';
        $(songJson.rtData).each(function () {
            if (this.name.indexOf("mp4") != -1) {
                options += '<option value="' + this.name + '" >'
                    + this.shortName + '</option>';
            }
        });
        pro.append(options);
    }

    $("#songSheet").change(function () {
        tihuan();
    })

    function tihuan() {
        debugger;
        var music = document.getElementById("music");
        var songSheet = $("#songSheet").val();
        music.src = 'MV/' + songSheet;
        music.alt = songSheet;
        music.play();
    }
});