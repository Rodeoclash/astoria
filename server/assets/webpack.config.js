const path = require("path");

module.exports = (env, options) => {
  const devMode = options.mode !== "production";

  return {
    devtool: devMode ? "eval-cheap-module-source-map" : undefined,
    entry: {
      dashboard: ["./src/dashboard.js"],
    },
    module: {
      rules: [
        {
          test: /\.(js|jsx)$/,
          exclude: /node_modules/,
          use: {
            loader: "babel-loader",
          },
        },
      ],
    },
    output: {
      filename: "[name].js",
      path: path.resolve(__dirname, "../priv/static/js"),
      publicPath: "/js/",
    },
    plugins: [],
    resolve: {
      modules: [path.resolve(__dirname, "src"), "node_modules"],
    },
  };
};
