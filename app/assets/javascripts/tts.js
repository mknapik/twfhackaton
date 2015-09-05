(function ( $ ) {
    if ('speechSynthesis' in window) {
        $.fn.speak = function() {
            //var msg = new SpeechSynthesisUtterance();
            //var voices = window.speechSynthesis.getVoices();
            //var pl_PL = voices.filter(function(voice) { return voice.lang == 'pl-PL'; })[0];
            //msg.text = this.text();
            //msg.lang = 'pl-PL';
            //msg.voice = pl_PL;
            //speechSynthesis.speak(msg);
            responsiveVoice.speak(this.text(), "Polish Female");
            return this;
        };
    }
}( jQuery ));

