import "@hotwired/turbo-rails";
import "./controllers";

document.addEventListener("turbo:load", function () {
  // 入力とプレビューエレメントのペアを定義
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

  // Google Mapsを初期化
  initMap();
});

function previewImage(input, imagePreview) {
  const file = input.files[0];
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
}

// Google Mapsを初期化
function initMap() {
  // マップの中心位置を指定（初期値として東京都を設定）
  const center = { lat: 35.6895, lng: 139.6917 };

  // マップを作成
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 13, // ズームレベル
    center: center, // 中心位置
  });

  // 現在地を取得
  navigator.geolocation.getCurrentPosition(function (position) {
    // 緯度と経度を取得
    const lat = position.coords.latitude;
    const lng = position.coords.longitude;

    // マーカーの位置を指定
    const pos = { lat: lat, lng: lng };

    // マップにマーカーを追加
    const marker = new google.maps.Marker({
      position: pos,
      map: map,
    });

    // マップの中心位置を現在地に更新
    map.setCenter(pos);

    // hidden fields for latitude and longitude
    document.getElementById("shop_latitude").value = lat;
    document.getElementById("shop_longitude").value = lng;

    // Update the user's location on the server
    if (userId) {
      fetch(`/users/${userId}/update_location`, {
        method: "PATCH",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": getMetaContent("csrf-token"),
        },
        body: JSON.stringify({ latitude: lat, longitude: lng }),
      });
    }
  });
}

function getMetaContent(name) {
  const element = document.querySelector(`meta[name="${name}"]`);
  return element ? element.content : undefined;
}

// current user's id
let userId = document.querySelector("meta[name='current-user-id']")?.content;
