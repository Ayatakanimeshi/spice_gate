import "@hotwired/turbo-rails";
import "./controllers";

// 関数の定義
function getMetaContent(name) {
  const element = document.querySelector(`meta[name="${name}"]`);
  return element ? element.content : null;
}

function previewImage(input, imagePreview) {
  const file = input.files[0];
  if (file) {
    const reader = new FileReader();
    reader.onload = function (e) {
      const img = document.createElement("img");
      img.src = e.target.result;
      img.classList.add("preview-image");
      while (imagePreview.firstChild) {
        imagePreview.removeChild(imagePreview.firstChild);
      }
      imagePreview.appendChild(img);
    };
    reader.readAsDataURL(file);
  } else {
    while (imagePreview.firstChild) {
      imagePreview.removeChild(imagePreview.firstChild);
    }
  }
}

// ページが読み込まれたときのイベントリスナー
document.addEventListener("turbo:load", function () {
  // ハンバーガーメニューのトグル機能
  const menuToggle = document.getElementById("menu-toggle");
  const closeMenu = document.getElementById("close-menu");
  const mobileMenu = document.getElementById("mobile-menu");
  if (menuToggle && mobileMenu) {
    menuToggle.addEventListener("click", function () {
      mobileMenu.style.transform = "translateX(0%)";
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
  // 現在地取得ボタンのクリックイベント
  const getCurrentLocationBtn = document.getElementById("getCurrentLocation");
  if (getCurrentLocationBtn) {
    getCurrentLocationBtn.addEventListener("click", function () {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
          function (position) {
            document.getElementById("shop_latitude").value =
              position.coords.latitude;
            document.getElementById("shop_longitude").value =
              position.coords.longitude;
            alert("現在地を取得しました！");
          },
          function (error) {
            alert("位置情報の取得に失敗しました。");
          }
        );
      } else {
        alert("このブラウザはGeolocationをサポートしていません。");
      }
    });
  }
  // Google Maps APIが完全に読み込まれた後に実行されるコード
  if (document.getElementById("map")) {
    initMap();
  }
});

// 住所から緯度と経度を取得する関数
function geocodeAddress(geocoder, address) {
  geocoder.geocode({ address: address }, function (results, status) {
    if (status === "OK") {
      const latitude = results[0].geometry.location.lat();
      const longitude = results[0].geometry.location.lng();
      document.getElementById("shop_latitude").value = latitude;
      document.getElementById("shop_longitude").value = longitude;
    } else {
      alert("ジオコードが成功しませんでした: " + status);
    }
  });
}

// フォームの送信イベントリスナー
document.getElementById("yourForm").addEventListener("submit", function (e) {
  e.preventDefault(); // フォームの送信を一時停止
  const address = document.getElementById("shop_address").value;
  const geocoder = new google.maps.Geocoder();
  geocodeAddress(geocoder, address);
  e.target.submit(); // フォームの送信を再開
});
