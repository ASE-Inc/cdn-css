module.exports = (grunt) ->

  'use strict'

  path = require 'path'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    clean:
      build: '_build'
      scss:
        src: ['**/*.scss']
        options:
          force: true

    env:
      options:{}
      dev:
        NODE_ENV: 'development'
      production:
        NODE_ENV : 'production'

    compass:
      dev:
        options:
          config: 'config.rb'
      build:
        options:
          config: 'config.rb'
          outputStyle: 'nested'
          environment: 'production'
      heroku:
        options:
          cssDir: '.'
          config: 'config.rb'
          outputStyle: 'nested'
          environment: 'production'

    recess:
      build:
        options:
          compile: true
          prefixWhitespace: false
          compress: true
        expand: true
        cwd: 'build'
        src: ['*.css', '!*.min.css']
        dest: 'build'
        ext: '.min.css'
      heroku:
        options:
          compile: true
          prefixWhitespace: false
          compress: true
        expand: true
        cwd: '.'
        src: ['*.css', '!*.min.css']
        dest: '.'
        ext: '.min.css'

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-env'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-recess'

  grunt.registerTask 'clean:all',         ['clean:build']
  grunt.registerTask 'heroku:production', ['env:production'
                                           'compass:heroku'
                                           'clean:scss'
                                           'recess:heroku']
  grunt.registerTask 'default',           ['env:dev'
                                           'clean:all'
                                           'compass:dev']
  grunt.registerTask 'build',             ['env:production'
                                           'clean:all'
                                           'compass:build'
                                           'recess:build']
  grunt.registerTask 'heroku',            ['heroku:production']
