# RUN: %python %s | FileCheck %s

from mlir_linearsolver.ir import *
from mlir_linearsolver.dialects import builtin as builtin_d, linearsolver as linearsolver_d

with Context():
    linearsolver_d.register_dialect()
    module = Module.parse(
        """
    %0 = arith.constant 2 : i32
    %1 = linearsolver.foo %0 : i32
    """
    )
    # CHECK: %[[C:.*]] = arith.constant 2 : i32
    # CHECK: linearsolver.foo %[[C]] : i32
    print(str(module))
