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
        customCSS: 'test/fixtures/custom-css/style.css'
        appendCustomCSS: ['test/fixtures/custom-css/append-style.css']
      }
      files: {
        'styleguide/index.html': ['css/all.css']
      }
```

then in `css/all.css`:

````css
body {
  font: 16px Verdana;
}

/***
  title: Square buttons
  section: Buttons
  description: Very pretty square buttons
  example:
    <a href="" class="btn btn-small">button</a>
    <a href="" class="btn btn-medium">button</a>
    <a href="" class="btn btn-large">button</a>
***/

.btn{
  display: inline-block;
  padding: .3em .6em;
  color: white;
  text-decoration: none;
  text-transform: uppercase;
  background-color: darkslateblue;
}
.btn:hover{
  background-color: #38306E;
}
.btn-small{
  font-size: .8em;
}
.btn-medium{
  font-size: 1em;
}
.btn-large{
  font-size: 1.3em;
}


/***
  title: Round buttons
  section: Buttons
  description: Very pretty rounded buttons
  example:
    <a href="" class="btn btn-small btn-round">button</a>
    <a href="" class="btn btn-medium btn-round">button</a>
    <a href="" class="btn btn-large btn-round">button</a>
***/

.btn-round{
  border-radius: 20px;
}


/***
  title: Links
  section: Buttons
  description: Very pretty rounded buttons
  example:
    <a href="" class="btn-link">button</a>
***/

.btn-link{
  background: none;
  color: darkslateblue;
}
.btn-link:hover{
  text-decoration: none;
}

/***
  title: Internal anchor
  section: References
  description: Reference to anchor in the same section
  example:
    - <ul>
    - &li | 
      <li>list item</li>
    - *li
    - *li
    - *li
    - *li
    - </ul>
***/

li{
  color: darkslateblue;
}
````


For more info see [https://github.com/EightMedia/styleguide.js/](https://github.com/EightMedia/styleguide.js/)