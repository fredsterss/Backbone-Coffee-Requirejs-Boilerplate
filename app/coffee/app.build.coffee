appDir: "../"
baseUrl: "js"
dir: "../build"
mainConfigFile: "app.js"
modules: [
  name: "app"
  exclude: ["libs/require"]
]
uglify:
  unsafe: true
  beautify: false

optimizeCss: "standard"
removeCombined: true
preserveLicenseComments: false