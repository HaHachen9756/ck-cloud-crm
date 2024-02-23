@echo off

rem 清理本地仓库.
echo [INFO] Clean up locally maven repository.
set REPOSITORY_PATH=%MAVEN_HOME%
for /f "delims=" %%i in ('dir /b /s "%REPOSITORY_PATH%\*lastUpdated*" ') do (
	echo %%i
	del /s /q "%%i"
)
echo [INFO] Cleaned up.

echo.
echo.

rem 安装项目到仓库.
cd %~dp0
set PROJECT_MODEL_DEPENDENCIES=ck-cloud-crm-dependencies
set PROJECT_MODEL_PARENT=ck-cloud-crm-parent
set PROJECT_MODEL_PARENT=ck-cloud-crm-common
set PROJECT_MODEL_CONFIG=ck-cloud-crm-config
set PROJECT_MODEL_PROVIDER=ck-cloud-crm-provider
set PROJECT_MODEL_CONSUMER=ck-cloud-crm-consumer

echo.
call :showDependencies
echo.

echo [INFO] Installing the %PROJECT_MODEL_DEPENDENCIES% to local maven repository.
rem 使用 call 命令才会继续执行脚本，否则 mvn 命令会调用 exit 终止脚本的继续执行.
call mvn clean install -f ../%PROJECT_MODEL_DEPENDENCIES%
echo [INFO] The %PROJECT_MODEL_DEPENDENCIES% has been installed.

echo.
call :showParent
echo.

echo [INFO] Installing the %PROJECT_MODEL_PARENT% to local maven repository.
call mvn clean install -f ../%PROJECT_MODEL_PARENT%
echo [INFO] The %PROJECT_MODEL_PARENT% has been installed.

echo.
call :showCommon
echo.

echo [INFO] Installing the %PROJECT_MODEL_COMMON% to local maven repository.
call mvn clean install -f ../%PROJECT_MODEL_COMMON%
echo [INFO] The %PROJECT_MODEL_COMMON% has been installed.

echo.
call :showConfig
echo.

echo [INFO] Installing the %PROJECT_MODEL_CONFIG% to local maven repository.
call mvn clean install -f ../%PROJECT_MODEL_CONFIG%
echo [INFO] The %PROJECT_MODEL_CONFIG% has been installed.

echo.
call :showDomain
echo.

echo [INFO] Installing the %PROJECT_MODEL_DOMAIN% to local maven repository.
call mvn clean install -f ../%PROJECT_MODEL_DOMAIN%
echo [INFO] The %PROJECT_MODEL_DOMAIN% has been installed.

echo.
call :showProvider
echo.

echo [INFO] Installing the %PROJECT_MODEL_PROVIDER% to local maven repository.
call mvn clean install -f ../%PROJECT_MODEL_PROVIDER%
echo [INFO] The %PROJECT_MODEL_PROVIDER% has been installed.

echo.
call :showConsumer
echo.

echo [INFO] Installing the %PROJECT_MODEL_CONSUMER% to local maven repository.
call mvn clean install -f ../%PROJECT_MODEL_CONSUMER%
echo [INFO] The %PROJECT_MODEL_CONSUMER% has been installed.

pause
exit



:showDependencies
if not exist .outDependenciesLogo (
echo X19fX19fIF9fICBfXyAgICAgICAgICAgICBfXyAgICAgICAgICAgICAgICAgX18gICAgICAgICAgIF9fICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfXyAgICAgICAgICAgICAgICAgICAgX18gICAgICAgICAgICAgIAp8ICAgICAgfCAgfC8gIHxfX19fXy4tLS0tLnwgIHwuLS0tLS0uLS0uLS0uLS18ICB8X19fX19fLi0tfCAgfC4tLS0tLS4tLS0tLS4tLS0tLS4tLS0tLS4tLXwgIHwuLS0tLS0uLS0tLS0uLS0tLS58X198Li0tLS0tLi0tLS0tLgp8ICAgLS0tfCAgICAgPF9fX19fX3wgIF9ffHwgIHx8ICBfICB8ICB8ICB8ICBfICB8X19fX19ffCAgXyAgfHwgIC1fX3wgIF8gIHwgIC1fX3wgICAgIHwgIF8gIHx8ICAtX198ICAgICB8ICBfX3x8ICB8fCAgLV9ffF9fIC0tfAp8X19fX19ffF9ffFxfX3wgICAgIHxfX19ffHxfX3x8X19fX198X19fX198X19fX198ICAgICAgfF9fX19ffHxfX19fX3wgICBfX3xfX19fX3xfX3xfX3xfX19fX3x8X19fX198X198X198X19fX3x8X198fF9fX19ffF9fX19ffAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHxfX3wgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA===>.logo
certutil -decode .logo .outDependenciesLogo>nul
del .logo
)
type .outDependenciesLogo
goto :eof

:showParent
if not exist .outParentLogo (
echo X19fX19fIF9fICBfXyAgICAgICAgICAgICBfXyAgICAgICAgICAgICAgICAgX18gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fICAgCnwgICAgICB8ICB8LyAgfF9fX19fLi0tLS0ufCAgfC4tLS0tLS4tLS4tLS4tLXwgIHxfX19fX18uLS0tLS0uLS0tLi0uLS0tLS4tLS0tLS4tLS0tLS58ICB8XyAKfCAgIC0tLXwgICAgIDxfX19fX198ICBfX3x8ICB8fCAgXyAgfCAgfCAgfCAgXyAgfF9fX19fX3wgIF8gIHwgIF8gIHwgICBffCAgLV9ffCAgICAgfHwgICBffAp8X19fX19ffF9ffFxfX3wgICAgIHxfX19ffHxfX3x8X19fX198X19fX198X19fX198ICAgICAgfCAgIF9ffF9fXy5ffF9ffCB8X19fX198X198X198fF9fX198CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8X198ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8X198ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA==>.logo
certutil -decode .logo .outParentLogo>nul
del .logo
)
type .outParentLogo
goto :eof

:showCommon
if not exist .outCommonLogo (
echo X19fX19fIF9fICBfXyAgICAgICAgICAgICBfXyAgICAgICAgICAgICAgICAgX18gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCnwgICAgICB8ICB8LyAgfF9fX19fLi0tLS0ufCAgfC4tLS0tLS4tLS4tLS4tLXwgIHxfX19fX18uLS0tLS4tLS0tLS4tLS0tLS0tLS4tLS0tLS0tLS4tLS0tLS4tLS0tLS4KfCAgIC0tLXwgICAgIDxfX19fX198ICBfX3x8ICB8fCAgXyAgfCAgfCAgfCAgXyAgfF9fX19fX3wgIF9ffCAgXyAgfCAgICAgICAgfCAgICAgICAgfCAgXyAgfCAgICAgfAp8X19fX19ffF9ffFxfX3wgICAgIHxfX19ffHxfX3x8X19fX198X19fX198X19fX198ICAgICAgfF9fX198X19fX198X198X198X198X198X198X198X19fX198X198X198CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA===>.logo
certutil -decode .logo .outCommonLogo>nul
del .logo
)
type .outCommonLogo
goto :eof

:showConfig
if not exist .outConfigLogo (
echo IF9fX19fXyBfXyAgX18gICAgICAgICAgICAgX18gICAgICAgICAgICAgICAgIF9fICAgICAgICAgICAgICAgICAgICAgICAgICBfX18gX18gICAgICAgIAp8ICAgICAgfCAgfC8gIHxfX19fXy4tLS0tLnwgIHwuLS0tLS0uLS0uLS0uLS18ICB8X19fX19fLi0tLS0uLS0tLS0uLS0tLS0uJyAgX3xfX3wuLS0tLS0uCnwgICAtLS18ICAgICA8X19fX19ffCAgX198fCAgfHwgIF8gIHwgIHwgIHwgIF8gIHxfX19fX198ICBfX3wgIF8gIHwgICAgIHwgICBffCAgfHwgIF8gIHwKfF9fX19fX3xfX3xcX198ICAgICB8X19fX3x8X198fF9fX19ffF9fX19ffF9fX19ffCAgICAgIHxfX19ffF9fX19ffF9ffF9ffF9ffCB8X198fF9fXyAgfAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8X19fX198=>.logo
certutil -decode .logo .outConfigLogo>nul
del .logo
)
type .outConfigLogo
goto :eof

:showDomain
if not exist .outDomainLogo (
echo IF9fX19fXyBfXyAgX18gICAgICAgICAgICAgX18gICAgICAgICAgICAgICAgIF9fICAgICAgICAgICBfXyAgICAgICAgICAgICAgICAgICAgICAgIF9fICAgICAgICAKfCAgICAgIHwgIHwvICB8X19fX18uLS0tLS58ICB8Li0tLS0tLi0tLi0tLi0tfCAgfF9fX19fXy4tLXwgIHwuLS0tLS0uLS0tLS0tLS0uLS0tLi0ufF9ffC4tLS0tLS4KfCAgIC0tLXwgICAgIDxfX19fX198ICBfX3x8ICB8fCAgXyAgfCAgfCAgfCAgXyAgfF9fX19fX3wgIF8gIHx8ICBfICB8ICAgICAgICB8ICBfICB8fCAgfHwgICAgIHwKfF9fX19fX3xfX3xcX198ICAgICB8X19fX3x8X198fF9fX19ffF9fX19ffF9fX19ffCAgICAgIHxfX19fX3x8X19fX198X198X198X198X19fLl98fF9ffHxfX3xfX3wKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA==>.logo
certutil -decode .logo .outDomainLogo>nul
del .logo
)
type .outDomainLogo
goto :eof

:showProvider
if not exist .outProviderLogo (
echo ICAgICAgX18gICAgICAgICAgICAgICAgIF9fICAgICAgICAgICAgICAgICBfXyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX18gICAgIF9fICAgICAgICAgICAgIAouLS0tLS58ICB8LS0uX19fX19fLi0tLS0ufCAgfC4tLS0tLS4tLS4tLS4tLXwgIHxfX19fX18uLS0tLS0uLS0tLS4tLS0tLS4tLS4tLS58X198Li0tfCAgfC4tLS0tLS4tLS0tLgp8ICBfX3x8ICAgIDx8X19fX19ffCAgX198fCAgfHwgIF8gIHwgIHwgIHwgIF8gIHxfX19fX198ICBfICB8ICAgX3wgIF8gIHwgIHwgIHx8ICB8fCAgXyAgfHwgIC1fX3wgICBffAp8X19fX3x8X198X198ICAgICAgfF9fX198fF9ffHxfX19fX3xfX19fX3xfX19fX3wgICAgICB8ICAgX198X198IHxfX19fX3xcX19fLyB8X198fF9fX19ffHxfX19fX3xfX3wgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8X198ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA==>.logo
certutil -decode .logo .outProviderLogo>nul
del .logo
)
type .outProviderLogo
goto :eof

:showConsumer
if not exist .outConsumerLogo (
echo ICAgICAgX18gICAgICAgICAgICAgICAgIF9fICAgICAgICAgICAgICAgICBfXyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAouLS0tLS58ICB8LS0uX19fX19fLi0tLS0ufCAgfC4tLS0tLS4tLS4tLS4tLXwgIHxfX19fX18uLS0tLS4tLS0tLS4tLS0tLS4tLS0tLS4tLS4tLS4tLS0tLS0tLS4tLS0tLS4tLS0tLgp8ICBfX3x8ICAgIDx8X19fX19ffCAgX198fCAgfHwgIF8gIHwgIHwgIHwgIF8gIHxfX19fX198ICBfX3wgIF8gIHwgICAgIHxfXyAtLXwgIHwgIHwgICAgICAgIHwgIC1fX3wgICBffAp8X19fX3x8X198X198ICAgICAgfF9fX198fF9ffHxfX19fX3xfX19fX3xfX19fX3wgICAgICB8X19fX3xfX19fX3xfX3xfX3xfX19fX3xfX19fX3xfX3xfX3xfX3xfX19fX3xfX3wgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA=>.logo
certutil -decode .logo .outConsumerLogo>nul
del .logo
)
type .outConsumerLogo
goto :eof