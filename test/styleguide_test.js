'use strict';

var grunt = require('grunt');
var cheerio = require('cheerio');
var $;

exports.styleguide = {

  setUp: function(done) {
    done();
  },

  default_options: function(test) {
    test.expect(1);

    var actual = grunt.file.read('tmp/default_options.html');
    var expected = grunt.file.read('test/expected/default_options.html');

    $ = cheerio.load(expected);
    $('time').remove();
    expected = $.html();

    $ = cheerio.load(actual);
    $('time').remove();
    actual = $.html();

    test.equal(actual, expected, 'should describe what the default behavior is.');
    test.done();
  },
  
  custom_options: function(test) {
    test.expect(1);

    var actual = grunt.file.read('tmp/custom_options.html');
    var expected = grunt.file.read('test/expected/custom_options.html');

    $ = cheerio.load(expected);
    $('time').remove();
    expected = $.html();

    $ = cheerio.load(actual);
    $('time').remove();
    actual = $.html();
    
    test.equal(actual, expected, 'should describe what the custom option(s) behavior is.');
    test.done();
  }
};
