_livereload_port = 35729
_base_directory = 'app'
_port = 9004
_browser = 'Chrome'
_hostname = '0.0.0.0'
_hostpath = "http://localhost"
_app = "app/"
_src = "src/"
_tmp = "tmp/"

lrSnippet = require 'connect-livereload'
	_port: _livereload_port
	mountFolder = (connect, dir) ->
		connect.static require('path').resolve(dir)

module.exports = (grunt) ->
	grunt.initConfig
		clean:
			build:
				src: [_app, _tmp]

		coffee:
			main:
				expand: true
				cwd: _src+'scripts'
				src: '**/*.coffee'
				dest: _tmp
				ext: '.js'

		concat:
			css:
				src: [_tmp+'**/*.js']
				dest: _tmp+'responsive.js'

		copy:
			bower:
				expand: true
				cwd: 'bower_components'
				src: ['**/*.*']
				dest: _app+'vendors/'
			index:
				expand: true
				cwd: _src
				src: ['index.html']
				dest: _app
			app:
				expand: true
				cwd: _tmp
				src: ['responsive.js']
				dest: _app+'scripts'

		watch:
			cshtml:
				files: _src+"**/*.html"
				tasks: ["copy:index"]
				options:
					spawn: false
					interupt: true
					livereload: 35729

			coffee:
				files: _src+"**/*.coffee"
				tasks: ["coffee","concat","copy:app"]
				options:
					spawn: false
					interupt: true
					livereload: 35729

			vendors:
				files: ["bower_components/**/*.*"]
				tasks: ["copy:vendors"]
				options:
					spawn: false
					interupt: true
					livereload: 35729

		connect:
			app:
				options: 
					port: _port
					hostname: _hostname
					base: _base_directory
				livereload:
					options:
						middleware: (connect) ->
							[lrSnippet, mountFolder(connect, './')]

		open:
			build:
				path: _hostpath+':'+_port
				app: _browser

	require('load-grunt-tasks')(grunt)

	grunt.event.on 'watch', (action, filepath) ->
		for i in [0..1000]
			console.log '\r\n'

	grunt.registerTask 'default', ['clean', 'coffee', 'concat', 'copy', 'open', 'connect', 'watch']