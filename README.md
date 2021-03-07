## Table of content
- [Compiling a Module](#compiling-a-module)
  * [Compile and create class file in out folder](#compile-and-create-class-file-in-out-folder)
  * [Compile and create class file in out folder](#compile-and-create-class-file-in-out-folder-1)
  * [Run the class file from out folder](#run-the-class-file-from-out-folder)
    + [ouput](#ouput)
- [Using jdeps to List the Dependent Modules](#using-jdeps-to-list-the-dependent-modules)
    + [output](#output)
- [Creating a Custom JRE with jlink](#creating-a-custom-jre-with-jlink)
- [Run code with custom JRE](#run-code-with-custom-jre)
- [Creating Custom JRE with Launcher Scripts](#creating-custom-jre-with-launcher-scripts)

## Compiling a Module
### Compile and create class file in out folder
```bash
javac -d <output location> module-info.java

//example
javac -d out module-info.java
```

### Compile and create class file in out folder
```bash
javac -d <output location> --module-path <module-info.class location> <java file location>

//example
javac -d out --module-path out github\hmasum18\jlinkTest\HelloWorld.java
```

### Run the class file from out folder
```bash
java --module-path <module-info.class location> --module <module name>/<file name with full package name>

//example
java --module-path out --module helloWorld/github.hmasum18.jlinkTest.HelloWorld
```
#### ouput
```
Mar 07, 2021 6:34:41 PM github.hmasum18.jlinkTest.HelloWorld main
INFO: hello world from masum
```

## Using jdeps to List the Dependent Modules
```bash
jdeps --module-path <all the module path separated by semi colon(;)> -s --module <module names separated by comma>

//example
jdeps --module-path out -s --module helloWorld
```
#### output
```
helloWorld -> java.base
helloWorld -> java.logging
```

or 
```bash
jdeps --list-deps --module-path <all the module path separated by semi colon(;)> -add-module <module names separated by comma>

//example
jdeps --list-deps  --module-path out --add-modules helloWorld

//example with javafx
jdeps --list-deps  --module-path "lib\javafx-sdk-11.0.2\lib";"lib\gson-2.8.6.jar";"lib\jfoenix-9.0.10.jar";"out\production\CarShowRoomFrontend" --add-modules fontend
```


## Creating a Custom JRE with jlink
```bash
jdeps --module-path <all the module path separated by semi colon(;)> --add-modules <module names> --output <custom jre output location>

//example
jlink --module-path "%JAVA_HOME%\jmods";out --add-modules helloWorld --output customjrefolder
```

## Run code with custom JRE

```bash
"<custom jre bin file location>\java" --module-path <module-info.class file location> -m <module name/java file location with package name>

//example
"customjrefolder\bin\java" --module-path out -m helloWorld/github.hmasum18.jlinkTest.HelloWorld
```

## Creating Custom JRE with Launcher Scripts
```bash
jlink --launcher helloWorldLauncher=helloWorld/github.hmasum18.jlinkTest/HelloWorld --module-path "%JAVA_HOME%\jmods";out --add-modules helloWorld --output customJreLauncherFolder
```