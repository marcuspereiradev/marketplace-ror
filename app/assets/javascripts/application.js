// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

window.addEventListener("load", function () {
  var mybutton = document.getElementById("myBtn");

  // When the user scrolls down 20px from the top of the document, show the button
  window.onscroll = function () {
    scrollFunction();
  };

  function scrollFunction() {
    if (
      document.body.scrollTop > 300 ||
      document.documentElement.scrollTop > 300
    ) {
      mybutton.style.display = "block";
    } else {
      mybutton.style.display = "none";
    }
  }

  mybutton.addEventListener("click", topFunction, false);

  // When the user clicks on the button, scroll to the top of the document
  function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
  }
});

// document.addEventListener("DOMContentLoaded", () => {
//   const list = document.getElementById("products-order-select");

//   list.addEventListener("change", getSelectValue, false);

//   function getSelectValue(event) {
//     console.log(list.value);
//     const url = new URL(document.URL);
//     const params = { option_selected: list.value };

//     url.search = new URLSearchParams(params).toString();

//     fetch(url)
//       .then((response) => response.text())
//       .then((html) => (document.body.innerHTML = html))
//       .catch((err) => console.error(err));
//   }
// });

document.addEventListener(
  "DOMContentLoaded",
  () => {

    const selectBox = document.getElementById("products-order-select");

    selectBox.addEventListener("change", setOptionToSessionStorage, false);

    function setOptionToSessionStorage() {
      sessionStorage.setItem("products-order-select:option", this.value);
    }

    const optionSelected = sessionStorage.getItem("products-order-select:option");

    if (!!optionSelected) selectBox.value = optionSelected;

    sessionStorage.removeItem("products-order-select:option");
  },
  false
);
