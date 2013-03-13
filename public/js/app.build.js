// Run this build script to compile all js into a single app.js file.
// run using r.js -o public/js/app.build.js
// uses http://requirejs.org/docs/optimization.html
({
    appDir: "../",
    baseUrl: "js",
    dir: "../build", // Define your build target here
    mainConfigFile: 'app.js',
    modules: [
        {
            name: "app",
            exclude: ['libs/require']
        }
    ],
    uglify: {
        unsafe: true,
        beautify: false,
    },
    optimizeCss: 'standard',
    removeCombined: true,
    preserveLicenseComments: false
})
