/*global module:false*/
module.exports = function(grunt) {
  //require(process.env['LINEMAN_MAIN']).config.grunt.run(grunt);

  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-coffee');

  grunt.initConfig({
    connect: {
      server: {
        options: {
          port: 9000,
          host: '0.0.0.0',
          keepalive: true
        }
      }
    }, /* connect */
    coffee: {
      compile: {
        files: {
          'js/app.js': ['app/coffee/{,*/}*.coffee']
        }
      }
    } /* coffee */
  });

  grunt.registerTask('server', 'Does all the grunt work', function () {
    grunt.task.run([
      'coffee',
      'connect:server'
    ]);
  });

  grunt.registerTask('default', ['server']);
};
