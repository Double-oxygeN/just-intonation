path = require('path')
PugPlugin = require('pug-plugin')

nim_rule =
  test: /\.nim$/
  use: [{
    loader: 'nim-loader'
    options:
      flags: ['-d:debug']
  }]


pug_rule =
  test: /\.pug$/
  use: [{
    loader: PugPlugin.loader
    options:
      method: 'render'
  }]


sass_rule =
  test: /\.(c|s[ac])ss$/
  use: ['css-loader', 'postcss-loader', 'sass-loader']


module.exports =
  mode: 'development'

  entry:
    index: './src/index.pug'
  output:
    path: path.resolve(__dirname, 'dist')
    publicPath: '/'
    filename: '[name].bundle.js'
  devServer: {}

  module:
    rules: [
      nim_rule,
      pug_rule,
      sass_rule
    ]

  plugins: [
    new PugPlugin({
      modules: [
        PugPlugin.extractCss({
          filename: 'css/[name].css'
        })
      ]
    })
  ]
