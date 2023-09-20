const esbuild = require("esbuild");

esbuild
  .build({
    entryPoints: ["src/index.js"],
    bundle: true,
    minify: true,
    outfile: "dist/bundle.js",
  })
  .catch(() => process.exit(1));
