const path = require("path");

module.exports = {
  entryPoints: ["app/assets/stylesheets/application.tailwind.css"], // Tailwind CSSの入力ファイル
  bundle: true,
  outfile: "public/assets/application.tailwind.css", // 出力ファイルのパス
  loader: { ".css": "css" },
  plugins: [
    require("esbuild-plugin-postcss2")({
      plugins: [
        require("tailwindcss")("./tailwind.config.js"), // Tailwind CSSの設定ファイルのパス
        require("autoprefixer"),
      ],
    }),
  ],
};
