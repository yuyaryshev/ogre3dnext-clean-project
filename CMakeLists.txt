# CMakeLists.txt file below:
cmake_minimum_required(VERSION 3.15)
project(Ogre3dCleanProject)

set(CMAKE_CXX_STANDARD 17)
 
find_package(OGRE REQUIRED COMPONENTS Bites CONFIG)

add_executable(Ogre3dCleanProject src/main.cpp)

target_link_libraries(Ogre3dCleanProject PRIVATE OgreBites)
target_include_directories(Ogre3dCleanProject PRIVATE ${OGRE_INCLUDE_DIRS})

# Optional: Set up runtime environment inside Visual Studio
if (MSVC)
    # Pull OGRE_DIR from environment
    if (DEFINED ENV{OGRE_DIR})
        # Infer bin directory (you can customize this logic)
        set(OGRE_BIN_DIR "$ENV{OGRE_DIR}/../bin;${OGRE_BIN_DIR}/Release")
        
        # Prepare the env PATH
        set(VS_ENV_PATH "PATH=$ENV{PATH};${OGRE_BIN_DIR}")

        # Set debugger environment for Visual Studio
        set_target_properties(Ogre3dCleanProject PROPERTIES
            VS_DEBUGGER_ENVIRONMENT "${VS_ENV_PATH}"
            VS_DEBUGGER_WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
        )
		
		if (NOT CMAKE_GENERATOR_TOOLSET)
			set(CMAKE_GENERATOR_TOOLSET "v142" CACHE STRING "Platform toolset")
		endif()
    endif()
endif()

