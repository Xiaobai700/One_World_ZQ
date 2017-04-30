/**
 *
 * Created by hasee on 2017/4/13.
 */
function toast(msg,title) {
    var i = -1;
    var toastCount = 0;
    var $toastlast;
    var shortCutFunction ="success";
    var msg = msg;
    var title =title;
    var toastIndex = toastCount++;
    toastr.options = {
        closeButton: true,
        debug: false,
        progressBar:true,
        positionClass:"toast-top-right",
        onclick: null,
        showDuration: "200",
        hideDuration: "400",
        timeOut: "8000",
        extendedTimeOut: "400",
        showEasing: "swing",
        hideEasing: "linear",
        showMethod: "fadeIn",
        hideMethod: "fadeOut",
        shortCutFunction :"info",
        toastIndex : toastCount++
    };
    $("#toastrOptions").text("Command: toastr[" + shortCutFunction + ']("' + msg + (title ? '", "' + title: "") + '")\n\ntoastr.options = ' + JSON.stringify(toastr.options, null, 2));
    var $toast = toastr[shortCutFunction](msg, title);
    $toastlast = $toast;
};