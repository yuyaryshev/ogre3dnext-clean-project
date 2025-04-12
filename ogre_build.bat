@echo off
REM ogre_build.bat file below:

@echo off
setlocal enabledelayedexpansion

REM Load environment config
call "%~dp0env-config.bat"

REM Construct the expected Ogre source directory path
set OGRE_SRC_DIR=%OGRE_SOURCES%
if not exist "%OGRE_SRC_DIR%" (
    echo Ogre source not found at %OGRE_SRC_DIR%
    git clone --branch v%OGRE_VERSION% --recursive https://github.com/OGRECave/ogre.git "%OGRE_SRC_DIR%"
) else (
    echo Ogre source already exists at %OGRE_SRC_DIR%
    echo Updating submodules...
    pushd "%OGRE_SRC_DIR%"
    git submodule update --init --recursive
    popd
)

set BUILD_TRIPLET=msvc%VSTOOLSET%_%OGRE_BUILD_MODE%
set FULL_BUILD_DIR=%OGRE_BUILDS%ogre-%OGRE_VERSION%_%BUILD_TRIPLET%

REM Handle --clean argument
if "%1"=="--clean" (
    echo Cleaning build directory: %FULL_BUILD_DIR%
    rmdir /S /Q "%FULL_BUILD_DIR%"
)

REM Create build directory if it doesn't exist
if not exist "%FULL_BUILD_DIR%" (
    mkdir "%FULL_BUILD_DIR%"
)

REM Change to build directory
cd /D "%FULL_BUILD_DIR%"

REM Run CMake configuration
cmake -G "Visual Studio 17 2022" ^
      -A x64 ^
      -T v%VSTOOLSET% ^
      -DCMAKE_BUILD_TYPE=%OGRE_BUILD_MODE% ^
      -DOGRE_BUILD_SAMPLES=OFF ^
      -DOGRE_BUILD_TESTS=OFF ^
      -DOGRE_INSTALL_SAMPLES=OFF ^
      -DOGRE_BUILD_DEPENDENCIES=ON ^
      -DOGRE_CONFIG_ENABLE_BULLET=ON ^
	  -DCMAKE_CXX_FLAGS="/wd4267 /wd4244 /wd4101 /EHsc" ^
      "%OGRE_SRC_DIR%"

if errorlevel 1 (
    echo CMake configuration failed.
    exit /b 1
)

REM Build the project
cmake --build . --config %OGRE_BUILD_MODE%

if errorlevel 1 (
    echo Build failed.
    exit /b 1
)

echo Build succeeded!
exit /b 0
