@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  skeleton startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and SKELETON_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\skeleton.jar;%APP_HOME%\lib\guava-22.0.jar;%APP_HOME%\lib\dropwizard-core-1.2.0-rc2.jar;%APP_HOME%\lib\dropwizard-db-1.2.0-rc2.jar;%APP_HOME%\lib\jooq-3.9.5.jar;%APP_HOME%\lib\h2-1.4.196.jar;%APP_HOME%\lib\error_prone_annotations-2.0.18.jar;%APP_HOME%\lib\j2objc-annotations-1.1.jar;%APP_HOME%\lib\animal-sniffer-annotations-1.14.jar;%APP_HOME%\lib\dropwizard-util-1.2.0-rc2.jar;%APP_HOME%\lib\dropwizard-jackson-1.2.0-rc2.jar;%APP_HOME%\lib\dropwizard-validation-1.2.0-rc2.jar;%APP_HOME%\lib\dropwizard-configuration-1.2.0-rc2.jar;%APP_HOME%\lib\dropwizard-logging-1.2.0-rc2.jar;%APP_HOME%\lib\dropwizard-metrics-1.2.0-rc2.jar;%APP_HOME%\lib\dropwizard-jersey-1.2.0-rc2.jar;%APP_HOME%\lib\dropwizard-servlets-1.2.0-rc2.jar;%APP_HOME%\lib\dropwizard-jetty-1.2.0-rc2.jar;%APP_HOME%\lib\dropwizard-lifecycle-1.2.0-rc2.jar;%APP_HOME%\lib\metrics-core-3.2.3.jar;%APP_HOME%\lib\metrics-jvm-3.2.3.jar;%APP_HOME%\lib\metrics-servlets-3.2.3.jar;%APP_HOME%\lib\metrics-healthchecks-3.2.3.jar;%APP_HOME%\lib\dropwizard-request-logging-1.2.0-rc2.jar;%APP_HOME%\lib\argparse4j-0.7.0.jar;%APP_HOME%\lib\jetty-setuid-java-1.0.3.jar;%APP_HOME%\lib\tomcat-jdbc-8.5.15.jar;%APP_HOME%\lib\jackson-annotations-2.9.0.jar;%APP_HOME%\lib\joda-time-2.9.9.jar;%APP_HOME%\lib\jackson-core-2.9.0.jar;%APP_HOME%\lib\jackson-databind-2.9.0.jar;%APP_HOME%\lib\jackson-datatype-guava-2.9.0.jar;%APP_HOME%\lib\jackson-datatype-jsr310-2.9.0.jar;%APP_HOME%\lib\jackson-datatype-jdk8-2.9.0.jar;%APP_HOME%\lib\jackson-module-parameter-names-2.9.0.jar;%APP_HOME%\lib\jackson-module-afterburner-2.9.0.jar;%APP_HOME%\lib\jackson-datatype-joda-2.9.0.jar;%APP_HOME%\lib\slf4j-api-1.7.25.jar;%APP_HOME%\lib\hibernate-validator-5.4.1.Final.jar;%APP_HOME%\lib\javax.el-3.0.0.jar;%APP_HOME%\lib\jackson-dataformat-yaml-2.9.0.jar;%APP_HOME%\lib\commons-lang3-3.5.jar;%APP_HOME%\lib\metrics-logback-3.2.3.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.25.jar;%APP_HOME%\lib\logback-core-1.2.3.jar;%APP_HOME%\lib\logback-classic-1.2.3.jar;%APP_HOME%\lib\log4j-over-slf4j-1.7.25.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.25.jar;%APP_HOME%\lib\jetty-util-9.4.6.v20170531.jar;%APP_HOME%\lib\jersey-server-2.25.1.jar;%APP_HOME%\lib\jersey-metainf-services-2.25.1.jar;%APP_HOME%\lib\jersey-bean-validation-2.25.1.jar;%APP_HOME%\lib\metrics-jersey2-3.2.3.jar;%APP_HOME%\lib\jackson-jaxrs-json-provider-2.9.0.jar;%APP_HOME%\lib\jersey-container-servlet-2.25.1.jar;%APP_HOME%\lib\jetty-server-9.4.6.v20170531.jar;%APP_HOME%\lib\jetty-webapp-9.4.6.v20170531.jar;%APP_HOME%\lib\jetty-continuation-9.4.6.v20170531.jar;%APP_HOME%\lib\metrics-annotation-3.2.3.jar;%APP_HOME%\lib\metrics-jetty9-3.2.3.jar;%APP_HOME%\lib\jetty-servlet-9.4.6.v20170531.jar;%APP_HOME%\lib\jetty-servlets-9.4.6.v20170531.jar;%APP_HOME%\lib\jetty-http-9.4.6.v20170531.jar;%APP_HOME%\lib\metrics-json-3.2.3.jar;%APP_HOME%\lib\profiler-1.0.2.jar;%APP_HOME%\lib\logback-access-1.2.3.jar;%APP_HOME%\lib\tomcat-juli-8.5.15.jar;%APP_HOME%\lib\validation-api-1.1.0.Final.jar;%APP_HOME%\lib\jboss-logging-3.3.0.Final.jar;%APP_HOME%\lib\classmate-1.3.1.jar;%APP_HOME%\lib\snakeyaml-1.17.jar;%APP_HOME%\lib\jersey-common-2.25.1.jar;%APP_HOME%\lib\jersey-client-2.25.1.jar;%APP_HOME%\lib\javax.ws.rs-api-2.0.1.jar;%APP_HOME%\lib\jersey-media-jaxb-2.25.1.jar;%APP_HOME%\lib\javax.annotation-api-1.2.jar;%APP_HOME%\lib\hk2-api-2.5.0-b32.jar;%APP_HOME%\lib\javax.inject-2.5.0-b32.jar;%APP_HOME%\lib\hk2-locator-2.5.0-b32.jar;%APP_HOME%\lib\jackson-jaxrs-base-2.9.0.jar;%APP_HOME%\lib\jackson-module-jaxb-annotations-2.9.0.jar;%APP_HOME%\lib\jersey-container-servlet-core-2.25.1.jar;%APP_HOME%\lib\javax.servlet-api-3.1.0.jar;%APP_HOME%\lib\jetty-io-9.4.6.v20170531.jar;%APP_HOME%\lib\jetty-xml-9.4.6.v20170531.jar;%APP_HOME%\lib\jetty-security-9.4.6.v20170531.jar;%APP_HOME%\lib\jersey-guava-2.25.1.jar;%APP_HOME%\lib\osgi-resource-locator-1.0.1.jar;%APP_HOME%\lib\hk2-utils-2.5.0-b32.jar;%APP_HOME%\lib\aopalliance-repackaged-2.5.0-b32.jar;%APP_HOME%\lib\javassist-3.20.0-GA.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\jsr305-3.0.2.jar

@rem Execute skeleton
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %SKELETON_OPTS%  -classpath "%CLASSPATH%" SimpleApplication %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable SKELETON_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%SKELETON_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
