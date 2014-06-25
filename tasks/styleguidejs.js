var StyleGuide = require('styleguidejs');

module.exports = function (grunt) {
    grunt.registerMultiTask('styleguidejs', 'Generate nice styleguide', function () {
        var task = this;
        task.files.forEach(function (f) {
            var sg = new StyleGuide();
            f.src.forEach(function (path) {
                if (grunt.file.exists(path) && grunt.file.isFile(path)) {
                    sg.addFile(path)
                }
            });
            sg.render(task.options({
                outputFile: f.dest
            }));
        });
    });
};
