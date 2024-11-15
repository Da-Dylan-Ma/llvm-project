get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)
set(LIBS
        ${dialect_libs}
        ${conversion_libs}
        MLIRArithDialect
        MLIROptLib
        MLIRLinearSolver
        )
add_llvm_executable(linearsolver-opt linearsolver-opt.cpp)

llvm_update_compile_flags(linearsolver-opt)
target_link_libraries(linearsolver-opt PRIVATE ${LIBS})

mlir_check_all_link_libraries(linearsolver-opt)
