Heroku buildpack: Grunt and Maven
=========================

This is a [Heroku buildpack](http://devcenter.heroku.com/articles/buildpack) for apps with a Grunt build process for the frontend and a Maven build process for the backend..

It uses Maven 3.0.3 to build your application and OpenJDK 1.6.0_20 to run it.

Usage
-----

Example usage:

    $ ls
    Gruntfile.js Procfile  pom.xml  src

    $ heroku create --stack cedar --buildpack https://github.com/whyjustin/heroku-buildpack-grunt-maven

    $ git push heroku master

The buildpack will detect your app as Grunt Maven if it has the file `pom.xml` and `Gruntfile.js` in the root.  It will first use the Node Package Manager to download any dependencies required by Grunt, then use Grunt to execute the build defined by your Gruntfile.js and finally use Maven to execute the build defined by your pom.xml and download your dependencies. The .m2 folder (local maven repository) will be cached between builds for faster dependency resolution. However neither the mvn executable or the .m2 folder will be available in your slug at runtime.

Choose a JDK
--------------
Create a `system.properties` file in the root of your project directory and set `java.runtime.version=1.7`.

Example:

    $ ls
    Procfile pom.xml src
    
    $ echo "java.runtime.version=1.7" > system.properties
    
    $ git add system.properties && git commit -m "Java 7"
    
    $ git push heroku master
    ...
    -----> Heroku receiving push
    -----> Fetching custom language pack... done
    -----> Java app detected
    -----> Installing OpenJDK 1.7... done
    ...

License
-------

Licensed under the MIT License. See LICENSE file.
