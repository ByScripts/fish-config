function laravel_init
	laravel new "$argv"
	cd "$argv"
	mkdir -p assets/coffee assets/scss assets/img
	echo '{}' > package.json
	npm install --save-dev gulp gulp-ruby-sass gulp-autoprefixer gulp-coffee gulp-imagemin gulp-uglify gulp-notify gulp-livereload
	echo '{ "directory": "assets/vendor" }' > .bowerrc	
	echo "{
    \"name\": \"$argv\",
    \"authors\": [
        \"Thierry Goettelmann <thierry@byscripts.info>\"
    ],
    \"ignore\": [
	    \"**/.*\",
	    \"node_modules\",
	    \"bower_components\",
	    \"test\",
	    \"tests\"
	]
}" > bower.json
	bower install --save-dev bootstrap-sass-official angular
end
