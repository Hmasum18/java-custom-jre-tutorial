echo %CD%
jlink --module-path "%JAVA_HOME%\jmods";out --add-modules helloWorld --output customjrefolder