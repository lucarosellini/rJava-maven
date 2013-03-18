rJava-maven
===========

Build script and pom files for creating maven bundles of the
[JRI](http://www.rforge.net/JRI/index.html) artifact from
[rJava](http://www.rforge.net/rJava/index.html) and the [REngine and
JRIEngine](http://rforge.net/org/doc/org/rosuda/REngine/package-summary.html)
artifacts from [Rserve](http://www.rforge.net/Rserve/index.html).

**Note**: Even though the documentation for REngine and JRIEngine are combined, they are released as two different artifacts.

##Basics
The ant script `build.xml` contains all the targets necessary.
* `{JRI|REngine|JRIEngine}` creates compiled, source, and javadoc jars for the JRI, REngine or JRIEngine packages.
* `bundles` creates, gpg signs, and bundles the compiled, source, and javadoc jars required by maven central

Also included are maven `POM` files, which can also be used to install these
jars locally, if the versions in maven central are ever out of date.

In order to work, place the source code for 
* `Rserve` into the directory "Rserve"(ie `tar -xzf Rserve_1.7-0.tar.gz` at the root)
* `rJava` into the directory "rJava"(ie `tar -xzf rJava_0.9-4.tar.gz` at the root)
* `JRI` into the directory "Rserve/clients/" where `Rserve` expects it to be.
  You can also copy or link the `rJava/jri` directory, which contains the `JRI`
  files.

## Updating
All that should be necessary for updating this for a new version of either
`Rserve` or `rJava` should be updating the verion information in `build.xml`
and the `.pom` files (and their names).


## Details
The ant build script simply calls `make` in various directories in rJava and
Rserve and then copies and renames the resources.  It also forces `javadoc` to
build documentation for the package `org.rosuda.REngine.JRI` which contains
only the class `JRIEngine` so that maven won't complain about uploading the
bundle.

