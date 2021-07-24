copy pom.xml pom-prod.xml

@echo off 
setlocal enableextensions disabledelayedexpansion

set "search=DEV"
set "replace=${env.VERSION}"

set "textFile=pom-prod.xml"

for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
    set "line=%%i"
    setlocal enabledelayedexpansion
    >>"%textFile%" echo(!line:%search%=%replace%!
    endlocal
)

@echo on 
mvn clean test-compile resources:resources compile package install