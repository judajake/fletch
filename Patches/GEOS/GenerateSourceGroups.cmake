macro(GenerateSourceGroups curdir)
  file(GLOB children RELATIVE ${PROJECT_SOURCE_DIR}/${curdir} ${PROJECT_SOURCE_DIR}/${curdir}/*)
  foreach(child ${children})
    if(IS_DIRECTORY ${PROJECT_SOURCE_DIR}/${curdir}/${child})
      GenerateSourceGroups(${curdir}/${child})
    else()
      string(REPLACE "/" "\\" groupname ${curdir})
      # I would like to call the src root folder in a different name, only in visual studio (not mandatory requirement)
      string(REPLACE "src" "Source Files" groupname ${groupname})
      source_group(${groupname} FILES ${PROJECT_SOURCE_DIR}/${curdir}/${child})
    endif()
  endforeach()
endmacro()
