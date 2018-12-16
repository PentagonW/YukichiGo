process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

const UglifyJsPlugin = require('uglifyjs-webpack-plugin')
environment.plugins.append('UglifyJs', new UglifyJsPlugin())
module.exports = environment.toWebpackConfig()
