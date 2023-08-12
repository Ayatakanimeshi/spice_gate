import "@hotwired/turbo-rails";
import "./controllers";

document.addEventListener("turbo:load", function () {
  // ... 既存のコード ...

  if (document.getElementById("map")) {
    initMap();
  }
});

// ... 既存の関数 ...

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
      draggable: true, // マーカーをドラッグ可能にする
    });
    map.setCenter(pos);

    document.getElementById("shop_latitude").value = lat;
    document.getElementById("shop_longitude").value = lng;

    // マーカーがドラッグされた後の位置をhidden fieldsに反映する
    google.maps.event.addListener(marker, "dragend", function (evt) {
      document.getElementById("shop_latitude").value = evt.latLng.lat();
      document.getElementById("shop_longitude").value = evt.latLng.lng();
    });
  });

  // Update the user's location on the server
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

// ... 既存の関数 ...

let userId = document.querySelector("meta[name='current-user-id']")?.content;
