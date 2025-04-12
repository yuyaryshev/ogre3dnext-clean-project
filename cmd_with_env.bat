@echo off
REM cmd_with_env.bat
REM ---------------------------------
call "%~dp0env-config.bat"
cd /d "%OGRE3D_PROJECT%"
cmd


rem cd D:\temp\cpp_build_dir\ogre3d-clean-project\Release && Ogre3dCleanProject.exe