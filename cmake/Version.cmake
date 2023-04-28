function(write_version)
  message(STATUS "TL2cgen VERSION: ${PROJECT_VERSION}")
  configure_file(
      ${PROJECT_SOURCE_DIR}/cmake/Python_version.in
      ${PROJECT_SOURCE_DIR}/python/tl2cgen/VERSION @ONLY)
  configure_file(
      ${PROJECT_SOURCE_DIR}/cmake/version.h.in
      include/tl2cgen/version.h)
endfunction(write_version)
