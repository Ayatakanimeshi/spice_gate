document.addEventListener("DOMContentLoaded", function () {
  // 入力とプレビューエレメントのペアを定義
  const imageElements = [
    { inputId: "profileImage", previewId: "profileImagePreview" },
    { inputId: "curryImage", previewId: "curryImagePreview" },
    { inputId: "shopImage", previewId: "shopImagePreview" }, // こちらの行を追加
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
