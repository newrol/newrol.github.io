#global module:false

"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-exec"

  grunt.initConfig

    copy:
      #Javascript front end sub-dependencies
      jquery:
        files: [{
          expand: true
          cwd: "bower_components/jquery/dist/"
          src: "jquery.min.js"
          dest: "public/script/"
        }]
      
      #Image Gallery depedencies  
      lightbox2:
        files: [{
          expand: true
          cwd: "bower_components/lightbox2/dist/js/"
          src: "lightbox.min.js"
          dest: "public/script"
        },
        {
          expand: true
          cwd: "bower_components/lightbox2/dist/css/"
          src: "lightbox.min.css"
          dest: "public/css"
        },
        {
          expand: true
          cwd: "bower_components/lightbox2/dist/images/"
          src: "*"
          dest: "public/images"
        }]        
      
      #material-design-lite web components dependecies   
      materialDesignLite:
        files: [{
          expand: true
          cwd: "bower_components/material-design-lite/"
          src: "material.min.js"
          dest: "public/script"
        },
        {
          expand: true
          cwd: "bower_components/material-design-lite/"
          src: "material.min.css"
          dest: "public/css"
        }]

      #font-awesome icons package dependencies
      fontAwesome:
        files: [{
          expand: true
          cwd: "bower_components/font-awesome/css/"
          src: "font-awesome.min.css"
          dest: "public/css"
        },
        {
          expand: true
          cwd: "bower_components/font-awesome/"
          src: "fonts/*"
          dest: "public/"

        }]

      #sly show card list depedencies
      sly:
        files: [{
          expand: true
          cwd: "bower_components/sly/dist/"
          src: "sly.min.js"
          dest: "public/script"
        },
        {
          expand: true
          cwd: "bower_components/font-awesome/"
          src: "fonts/*"
          dest: "public/"

        }]
        

    exec:
      jekyll:
        cmd: "jekyll build --trace"

    # grunt-contrib-watch file task
    watch:
      options:
        livereload: true
      source:
        files: [
          "_includes/**/*"
          "_layouts/**/*"
          "_itCollection"
          "_notesCollection"
          "_writingCollection"
          "_data"
          "public"
          "_config.yml"
          "*.html"
          "*.md"
        ]
        tasks: [
          "exec:jekyll"
        ]

    connect:
      server: 
        options:
          port: 4000
          base: '_site'
          livereload: true

  grunt.registerTask "build", [
    "copy"
    "exec:jekyll"
  ]

  grunt.registerTask "serve", [
    "build"
    "connect:server"
    "watch"
  ]

  grunt.registerTask "default", [
    "serve"
  ]