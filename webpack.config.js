const path = require('path');
const webpack = require('webpack');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CopyPlugin = require('copy-webpack-plugin');

var entries = {
  // main: ['./resources/entries/admin.js'],
  'admin': ['./resources/entries/admin.js', ], 
  'admin.vendor': ['backbone', 'jquery', 'underscore', ],
  'admin.vendor.css': ['bootstrap/dist/css/bootstrap.min.css', ],
  //'login': ['./resources/entries/login.js', ], 
  //'error': ['./resources/entries/error.js', ], 
};

var plugins = [
  new webpack.ProvidePlugin({
    // import globally this libs
    '$': 'jquery',
    'Backbone': 'backbone',
    '_': 'underscore',
  }),
  new MiniCssExtractPlugin({
    // Options similar to the same options in webpackOptions.output
    // both options are optional
    filename: '[name].css',
    // chunkFilename: '[name].vendor.css',
  }),
  new CopyPlugin([
    // move ejs files to public
    { 
      from: 'resources/templates', 
      to: '../templates' 
    },
  ]),
];

var outputDevelopment = {
  path: path.resolve(__dirname, 'public/dist'),
  filename: '[name].js',
  //chunkFilename: '[chunkhash].js',
};

var outputProduction = {
  path: path.resolve(__dirname, 'public/dist'),
  filename: '[name].min.js',
  //chunkFilename: '[chunkhash].min.js',
};

var rules = [
  {
    test: /\.css$/,
    use: [
      {
        loader: MiniCssExtractPlugin.loader,
        options: {
          // you can specify a publicPath here
          // by default it use publicPath in webpackOptions.output
          publicPath: '../'
        }
      },
      'css-loader'
    ]
  },
];

var optimization = {
  splitChunks: {
    cacheGroups: {      
      /* 
      vendor: {
        test: /node_modules/,
        name: 'vendors',
        chunks: 'all', 
        enforce: true,
      },
      */
      adminVendor: {
        test: 'admin.vendor',
        name: 'admin.vendor',
        chunks: 'all', 
        enforce: true,
      },
      adminVendorCSS: {
        test: 'admin.vendor.css',
        name: 'admin.vendor.css',
        chunks: 'all', 
        enforce: true,
      },
      loginVendor: {
        test: 'login',
        name: 'login.vendor',
        chunks: 'all', 
        enforce: true,
      },
      errorVendor: {
        test: 'error',
        name: 'error.vendor',
        chunks: 'all', 
        enforce: true,
      },
      /*
      error_vendor: {
        test: 'error',
        name: 'error.vendor',
        chunks: 'all', 
        enforce: true,
      },
      */
    }
  }
};

var devServer = {
  host: '0.0.0.0',
  port: 8090,
  contentBase: [
    path.join(__dirname, 'public'),
  ],
  publicPath: path.join(__dirname, 'resources'),
  writeToDisk: true,
  compress: true,
  watchContentBase: true,
  hot: true,
  inline:true,
  allowedHosts: [
    'host.com',
    '*',
  ],
  headers: {
    'Server': 'Ubuntu',
  },
};

var config = {
  entry: entries,
  plugins: plugins,
  optimization: optimization,
  module: {
    rules: rules,
  },
  devServer: devServer,
};

module.exports = (env, argv) => {
  if (argv.mode === 'development') {
    config.output = outputDevelopment;
    config.watch = true;
  }
  if (argv.mode === 'production') {
    config.output = outputProduction;
    config.watch = false;
    config.devServer = {};
  }
  return config;
};