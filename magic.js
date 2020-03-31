// 1. first go to the voting page
// 2. Open your browser console
// 3. write "var emails = " and pase your formated email that you will get from Sumon
// the code will be like var emails = ['email1', 'email2']
// 4. Copy and Past the below code on your console and press enter button
// 

var i = 0;
var sleep_time = 40000; // in milisecond that means 40 seconds
(function loop() {
    $('.btn.btn-orange.m-1[data-company="65586"]').click();
    $('#vote-form-email').val(emails[i]);
    $('.btn.btn-orange[type="submit"').click();
    console.log('current email number is ' + i);
    if (++i < emails.length) {
        setTimeout(loop, sleep_time);
    }
})();