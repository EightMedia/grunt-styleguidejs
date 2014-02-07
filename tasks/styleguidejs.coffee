'use strict';

module.exports = (grunt) ->

  StyleGuide = require('styleguidejs')


  # ---
  # grunt task

  grunt.registerMultiTask 'styleguidejs', 'Generate nice styleguide', ->
    options = @options {
      title: 'Styleguide'
      includejs: []
      customCSS: ''
      appendCustomCSS: []
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


          # custom css
          if options.customCSS
            s.customCSS(options.customCSS)

          # append custom css
          for append in options.appendCustomCSS
            if grunt.file.exists(append)
              s.appendCustomCSS(append)


          # create file for first time
          if not grunt.file.exists(f.dest)
            grunt.file.write(f.dest)

          # render file
          s.renderToFile(f.dest, options.templateFile)
          