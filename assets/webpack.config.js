const path = require("path");
const UglifyJsPlugin = require("uglifyjs-webpack-plugin");

module.exports = {
  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node-modules/],
        use: {
          loader: "elm-webpack-loader",
          options: {
            maxInstances: 1
          }
        }
      }
    ]
  },
  plugins: [new UglifyJsPlugin()],
  entry: "./src/index.js",
  output: {
    filename: "bundle.js",
    path: path.resolve(__dirname, "../priv/static/js")
  }
};
