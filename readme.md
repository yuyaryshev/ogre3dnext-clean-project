

# Prerequesties

## Prerequesties - CMake

CMake installed into D:\AProgs\CMake\ (I used 4.0.1 version of CMake)



## Prerequesties - expected file tree

- ROOT
  
  - vcpkg
  
  - ogre3d-clean-project
    
    - CMakeLists.txt

# Setup

## CMakeLists.txt

- If vcpkg is somewhere other than expected file tree

- Replace the `CMAKE_TOOLCHAIN_FILE` path with the actual relative path if your `vcpkg` folder is outside the project root.
