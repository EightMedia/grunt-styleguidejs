
module.exports = (grunt) ->

  grunt.loadNpmTasks('grunt-contrib-nodeunit')
  grunt.loadNpmTasks('grunt-contrib-clean')

  grunt.loadTasks('tasks/')

  grunt.registerTask('default', ['clean','styleguidejs'])
  grunt.registerTask('test', ['clean','styleguidejs','nodeunit'])


  grunt.initConfig

    # ---
    # styleguide
    styleguidejs:

      # default
      default:
        files: {
          'tmp/default_options.html': ['test/fixtures/all.css']
        }

      # custom options
      custom_options:
        options: {
          title: 'Custom Styleguide'
          includejs: ['test/fixtures/includejs/test1.js','test/fixtures/includejs/test2.js']
        }
        files: {
          'tmp/custom_options.html': ['test/fixtures/all.css']
        }


      # custom css
      custom_css:
        options: {
          title: 'Custom Styleguide'
          customCSS: 'test/fixtures/custom-css/style.css'
          appendCustomCSS: ['test/fixtures/custom-css/append-style.css']
        }
        files: {
          'tmp/custom_css.html': ['test/fixtures/all.css']
        }


    # ---
    # clean up folders
    clean:
      tests: ['test/tmp']
    

    # ---
    # run tests
    nodeunit:
      styleguidejs: ['test/styleguide_test.js'],

  