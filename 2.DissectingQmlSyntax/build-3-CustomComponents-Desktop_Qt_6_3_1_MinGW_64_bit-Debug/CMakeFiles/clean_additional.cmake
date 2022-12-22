# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\app3-CustomComponents_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\app3-CustomComponents_autogen.dir\\ParseCache.txt"
  "app3-CustomComponents_autogen"
  )
endif()
