import "@hotwired/turbo-rails";
import "./controllers";

document.addEventListener("turbo:load", function () {
  // ハンバーガーメニューのトグル機能
  const menuToggle = document.getElementById("menu-toggle");
  const closeMenu = document.getElementById("close-menu");
  const mobileMenu = document.getElementById("mobile-menu");

  if (menuToggle && mobileMenu) {
    menuToggle.addEventListener("click", function () {
      mobileMenu.style.transform = "translateX(0%)";
      // アイコンの切り替え
      const icon = menuToggle.querySelector("i");
      if (icon.classList.contains("fa-bars")) {
        icon.classList.remove("fa-bars");
        icon.classList.add("fa-times");
      } else {
        icon.classList.remove("fa-times");
        icon.classList.add("fa-bars");
      }
    });
  }

  if (closeMenu && mobileMenu) {
    closeMenu.addEventListener("click", function () {
      mobileMenu.style.transform = "translateX(100%)";
      // アイコンの切り替え
      const icon = menuToggle.querySelector("i");
      if (icon.classList.contains("fa-times")) {
        icon.classList.remove("fa-times");
        icon.classList.add("fa-bars");
      }
    });
  }

  // 検索フォームのスライドイン、スライドアウト
  const searchToggle = document.getElementById("search-toggle");
  const closeSearch = document.getElementById("close-search");
  const mobileSearch = document.getElementById("mobile-search");

  if (searchToggle && mobileSearch) {
    searchToggle.addEventListener("click", function () {
      mobileSearch.classList.add("is-active");
      mobileSearch.style.opacity = "1";
    });
  }

  if (closeSearch && mobileSearch) {
    closeSearch.addEventListener("click", function () {
      mobileSearch.classList.remove("is-active");
      mobileSearch.style.opacity = "0";
    });
  }

  if (document.getElementById("map")) {
    initMap();
  }

  // 画像プレビュー機能
  const imageElements = [
    { inputId: "profileImage", previewId: "profileImagePreview" },
    { inputId: "curryImage", previewId: "curryImagePreview" },
    { inputId: "shopImage", previewId: "shopImagePreview" },
  ];

  imageElements.forEach(({ inputId, previewId }) => {
    const inputElement = document.getElementById(inputId);
    const previewElement = document.getElementById(previewId);
    if (inputElement && previewElement) {
      inputElement.addEventListener("change", function () {
        previewImage(inputElement, previewElement);
      });
    }
  });
});

function initMap() {
  const center = { lat: 35.6895, lng: 139.6917 };

  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 13,
    center: center,
  });

  let marker;

  navigator.geolocation.getCurrentPosition(function (position) {
    const lat = position.coords.latitude;
    const lng = position.coords.longitude;
    const pos = { lat: lat, lng: lng };

    marker = new google.maps.Marker({
      position: pos,
      map: map,
      draggable: true,
    });
    map.setCenter(pos);

    document.getElementById("shop_latitude").value = lat;
    document.getElementById("shop_longitude").value = lng;

    google.maps.event.addListener(marker, "dragend", function (evt) {
      document.getElementById("shop_latitude").value = evt.latLng.lat();
      document.getElementById("shop_longitude").value = evt.latLng.lng();
    });
  });

  if (userId) {
    fetch(`/users/${userId}/update_location`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": getMetaContent("csrf-token"),
      },
      body: JSON.stringify({
        latitude: document.getElementById("shop_latitude").value,
        longitude: document.getElementById("shop_longitude").value,
      }),
    });
  }
}

let userId = document.querySelector("meta[name='current-user-id']")?.content;

function previewImage(input, imagePreview) {
  const file = input.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = function (e) {
      const img = document.createElement("img");
      img.src = e.target.result;
      img.classList.add("preview-image");
      // Remove any existing images
      while (imagePreview.firstChild) {
        imagePreview.removeChild(imagePreview.firstChild);
      }
      imagePreview.appendChild(img);
    };
    reader.readAsDataURL(file);
  } else {
    // 画像が選択されていない場合、プレビューをクリア
    while (imagePreview.firstChild) {
      imagePreview.removeChild(imagePreview.firstChild);
    }
  }
}
