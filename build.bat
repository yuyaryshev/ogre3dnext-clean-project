@echo off
REM build.bat
REM ---------------------------------
setlocal enabledelayedexpansion
set ERRORLEVEL=0

call "%~dp0env-config.bat"

REM Check required environment variables
if not defined OGRE3D_PROJECT_PATH (
    echo [ERROR] OGRE3D_PROJECT_PATH not set.
    exit /b 1
)

if not defined BUILD_DIR (
    echo [ERROR] BUILD_DIR not set.
    exit /b 1
)

if exist "%BUILD_DIR%" (
    rmdir /s /q "%BUILD_DIR%"
)

REM Create build directory if it doesn't exist
if not exist "%BUILD_DIR%" (
    mkdir "%BUILD_DIR%"
)

REM Go to build directory
cd /d "%BUILD_DIR%"

REM Run CMake configuration
cmake ^
  -DCMAKE_BUILD_TYPE=Release ^
  "%OGRE3D_PROJECT_PATH%"
  
  
REM Delete previous CMake cache if it exists

REM Build the project
cmake --build . --config Release

echo [INFO] Build complete.
