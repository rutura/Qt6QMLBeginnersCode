# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\app1-SyntaxOverview_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\app1-SyntaxOverview_autogen.dir\\ParseCache.txt"
  "app1-SyntaxOverview_autogen"
  )
endif()
