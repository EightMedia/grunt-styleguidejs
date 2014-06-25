# Grunt plugin for [Styleguide.js](https://github.com/EightMedia/styleguide.js)

### How to use
Add this to your projects gruntfile.

```js
  styleguidejs: {
    myTask: {
      options: {
        // options are passed to Styleguide.js
      }
      files: {
        'styleguide/index.html': ['css/all.css']
      }
    }
  }  
```

For more info and available options see 
[https://github.com/EightMedia/styleguide.js/](https://github.com/EightMedia/styleguide.js/)
