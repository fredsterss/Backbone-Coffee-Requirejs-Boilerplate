({
    appDir: "../",
    baseUrl: "js",
    dir: "../build", // Define your build target here
    mainConfigFile: 'app.js',
    modules: [
        {
            name: "app",
            exclude: ['libs/require/require']
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
