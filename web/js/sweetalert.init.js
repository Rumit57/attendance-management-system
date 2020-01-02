
document.querySelector(".sweet-prompt").onclick=function(){swal({
  title: "Ajax request example",
  text: "Submit to run ajax request",
  type: "input",
  showCancelButton: true,
  closeOnConfirm: false,
  showLoaderOnConfirm: true
}, function () {
  setTimeout(function () {
    swal("Ajax request finished!");
  }, 2000);
})};

