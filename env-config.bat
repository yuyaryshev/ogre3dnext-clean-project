@echo off
REM env-config.bat file below. All paths should be here:
REM --------- Following are used by game project ---------------------
set PROJECT_NAME=ogre3dnext-clean-project
set OGRE3D_PROJECT_PATH=D:\b\Mine\git_gamedev\%PROJECT_NAME%
set OGRE_CONFIG_DIR=%OGRE3D_PROJECT_PATH%\cfg
set OGRE_DIR=D:\ogre3d_builds\Ogre\ogre-next\build
set BUILD_DIR=D:\temp\cpp_build_dir\%PROJECT_NAME%
set PATH=%OGRE_DIR%\bin;%OGRE_DIR%\bin\Release;%PATH%


