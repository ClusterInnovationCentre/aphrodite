#!/usr/bin/env coffee
# aphrodite

module.exports = config:
  paths:
    watched: ['aphrodite']

  plugins:
    autoReload:
      enabled: yes
    coffeelint:
      pattern: /^aphrodite\/.*\.(coffee)$/
      useCoffeelintJson: yes
    jaded:
      staticPatterns: /^aphrodite\/markup\/(.*)\.jade$/
    postcss:
      processors: [
        require('autoprefixer')(['last 8 versions'])
      ]
    stylus:
      plugins: [
        'jeet'
        'bootstrap-styl'
      ]

  npm:
    enabled: yes
    styles:
      'normalize.css': [
        'normalize.css'
      ]

  modules:
    nameCleaner: (path) ->
      path
        .replace /^aphrodite\//, ''
        .replace /\.coffee/, ''

  files:
    javascripts:
      joinTo:
        'js/libraries.js': /^(?!aphrodite\/)/
        'js/app.js': /^aphrodite\//
    stylesheets:
      joinTo:
        'css/libraries.css': /^(?!aphrodite\/)/
        'css/app.css': /^aphrodite\//
