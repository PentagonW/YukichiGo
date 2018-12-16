$(document).ready(function () {
  $('#copy_btn').on('click', function () {
    var target = null;
    var p = null;
    window.getSelection().removeAllRanges();
    if (navigator.userAgent.match(/ipad|ipod|iphone/i)) {
      target = document.querySelector('#target_text');
      target.contentEditable = true;
      target.readOnly = false;
    } else {
      p = document.createElement('p');
      p.setAttribute('id', 'target')
      document.body.appendChild(p);
      p.innerHTML = $('#target_text').val();
      target = document.querySelector('#target');
    }
    var range = document.createRange();
    range.selectNode(target);
    window.getSelection().addRange(range);
    document.execCommand("copy");
    if (navigator.userAgent.match(/ipad|ipod|iphone/i)) {
      target.contentEditable = false;
      target.readOnly = true;
    } else {
      document.body.removeChild(p);
    }
    window.getSelection().removeAllRanges();
  });
});