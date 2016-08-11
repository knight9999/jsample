var gulp = require('gulp');
var del = require('del');
var coffee = require('gulp-coffee');
var merge = require('merge-stream');

gulp.task('clean',function() {
  del.sync( [ 'webroot/js/**' , '!webroot/js' , '!webroot/js/.gitkeep'] );
});

gulp.task('copy',function() {
  var jasmine = gulp.src(['node_modules/jasmine-ajax/**',
                    'node_modules/jasmine-core/**',
                    'node_modules/jasmine-jquery/**']
                    , {base: "node_modules"}).pipe( gulp.dest("webroot/js") );
  var fixtures = gulp.src(['src/fixtures/**'],{base:"src"}).pipe( gulp.dest("webroot/js/test") );
  return merge(jasmine,fixtures);
});

gulp.task('compile',function() {
  return gulp.src(['src/coffee/**/*.coffee'])
          .pipe(coffee())
          .pipe(gulp.dest('webroot/js/'));

});
