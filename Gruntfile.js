'use strict';
/* globals module */

module.exports = function(grunt) {

  grunt.initConfig({

    styleguidejs: { 
      task: {
        options: {

        },
        files: {
          'test/tmp/styleguide.html': ['test/css/all.css']
        }
      }
    }
  });

  grunt.loadTasks('tasks/');

  // Default task(s).
  grunt.registerTask('default', ['styleguidejs']);

};