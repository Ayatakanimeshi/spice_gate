// Entry point for the build script in your package.json
document.addEventListener("DOMContentLoaded", function () {
  const profileImageInput = document.getElementById("profileImage");
  const imagePreview = document.getElementById("imagePreview");

  profileImageInput.addEventListener("change", function () {
    const file = profileImageInput.files[0];
    const reader = new FileReader();

    reader.onload = function (e) {
      const img = document.createElement("img");
      img.src = e.target.result;
      img.classList.add("preview-image");

      if (imagePreview.firstChild) {
        imagePreview.removeChild(imagePreview.firstChild);
      }

      imagePreview.appendChild(img);
    };

    reader.readAsDataURL(file);
  });
});
