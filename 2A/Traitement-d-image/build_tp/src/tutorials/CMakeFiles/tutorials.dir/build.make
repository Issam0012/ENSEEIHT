# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/issam/Annee_2/Images/tpTI-v2022.0.0-rc3

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/issam/Annee_2/Images/tpTI-v2022.0.0-rc3/build_tp

# Utility rule file for tutorials.

# Include any custom commands dependencies for this target.
include src/tutorials/CMakeFiles/tutorials.dir/compiler_depend.make

# Include the progress variables for this target.
include src/tutorials/CMakeFiles/tutorials.dir/progress.make

src/tutorials/CMakeFiles/tutorials: bin/load_modify_image
src/tutorials/CMakeFiles/tutorials: bin/display_image
src/tutorials/CMakeFiles/tutorials: bin/mat_the_basic_image_container

tutorials: src/tutorials/CMakeFiles/tutorials
tutorials: src/tutorials/CMakeFiles/tutorials.dir/build.make
.PHONY : tutorials

# Rule to build all files generated by this target.
src/tutorials/CMakeFiles/tutorials.dir/build: tutorials
.PHONY : src/tutorials/CMakeFiles/tutorials.dir/build

src/tutorials/CMakeFiles/tutorials.dir/clean:
	cd /home/issam/Annee_2/Images/tpTI-v2022.0.0-rc3/build_tp/src/tutorials && $(CMAKE_COMMAND) -P CMakeFiles/tutorials.dir/cmake_clean.cmake
.PHONY : src/tutorials/CMakeFiles/tutorials.dir/clean

src/tutorials/CMakeFiles/tutorials.dir/depend:
	cd /home/issam/Annee_2/Images/tpTI-v2022.0.0-rc3/build_tp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/issam/Annee_2/Images/tpTI-v2022.0.0-rc3 /home/issam/Annee_2/Images/tpTI-v2022.0.0-rc3/src/tutorials /home/issam/Annee_2/Images/tpTI-v2022.0.0-rc3/build_tp /home/issam/Annee_2/Images/tpTI-v2022.0.0-rc3/build_tp/src/tutorials /home/issam/Annee_2/Images/tpTI-v2022.0.0-rc3/build_tp/src/tutorials/CMakeFiles/tutorials.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/tutorials/CMakeFiles/tutorials.dir/depend
