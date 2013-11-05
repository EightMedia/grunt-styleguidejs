
module.exports = (grunt) ->

  grunt.loadNpmTasks('grunt-contrib-nodeunit')
  grunt.loadNpmTasks('grunt-contrib-clean')

  grunt.loadTasks('tasks/styleguide')

  grunt.registerTask('default', ['clean','styleguide'])
  grunt.registerTask('test', ['clean','styleguide','nodeunit'])


  grunt.initConfig

    # ---
    # styleguide
    styleguide:

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


    # ---
    # clean up folders
    clean:
      tests: ['test/tmp']
    

    # ---
    # run tests
    nodeunit:
      styleguide: ['test/styleguide_test.js'],

  