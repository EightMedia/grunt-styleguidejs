# Grunt plugin for [Styleguide.js](https://github.com/EightMedia/styleguide.js)

Generate a styleguide from your CSS, by adding [YAML](http://en.wikipedia.org/wiki/YAML) data in the comments. 
It generates a [self-contained html](test/index.html) file. Works great for component based CSS.



### How to use
Add this to your projects gruntfile.

```coffeescript

grunt.loadNpmTasks('grunt-styleguidejs')

grunt.initConfig
  styleguidejs:
    default:
      files: {
        'styleguide/index.html': ['css/all.css']
      }
```

or with custom options:
``` coffeescript
grunt.initConfig
  styleguidejs:
    custom_options:
      options: {
        title: 'Custom Styleguide'
        includejs: ['modernizr.js','jquery.js']
      }
      files: {
        'styleguide/index.html': ['css/all.css']
      }
```

then in `css/all.css`:

```html
body {
  font: 18px Verdana;
}

/***
  title: Test
  section: Forms
  description: This is a description, and can also contain **Markdown**
  example: |
    <div class="test">This is a test</div>
    <div class="test2">This is another test</div>
***/
.test,
.test2,
.test2[fancy=true] {
  background: blue;
  color: #fff;
}


/***
  title: Another test
  section: Forms - Common
  example: <input type="text" class="test">
***/
input.test {
  background: green;
}
```


For more info see [https://github.com/EightMedia/styleguide.js/](https://github.com/EightMedia/styleguide.js/)