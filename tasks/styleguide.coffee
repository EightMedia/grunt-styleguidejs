'use strict';

module.exports = (grunt) ->

  StyleGuide = require('styleguidejs')


  # ---
  # grunt task

  grunt.registerMultiTask 'styleguide', 'Generate nice styleguide', ->
    options = @options {
      title: 'Styleguide'
      includejs: []
    }

    # Iterate over all specified file groups.
    @files.forEach (f) ->

      # Concat specified files.
      src = f.src
        .filter (filepath) -> 
          return grunt.file.exists(filepath) or grunt.file.isFile(filepath)

        .forEach (filepath) ->

          # create styleguide
          s = new StyleGuide(options.title)

          # parse css file
          s.parseFile(filepath)

          # include js
          for jsfile in options.includejs
            if grunt.file.exists(jsfile)
              s.includeJS(jsfile)


          # create file for first time
          if not grunt.file.exists(f.dest)
            grunt.file.write(f.dest)

          # render file
          s.renderToFile(f.dest)
          