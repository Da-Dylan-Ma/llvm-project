//===- LinearSolverPasses.cpp - LinearSolver passes -----------------*- C++ -*-===//
//
// This file is licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/IR/PatternMatch.h"
#include "mlir/Rewrite/FrozenRewritePatternSet.h"
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"

#include "LinearSolver/LinearSolverPasses.h"

namespace mlir::linearsolver {
#define GEN_PASS_DEF_LINEARSOLVERSWITCHBARFOO
#include "LinearSolver/LinearSolverPasses.h.inc"

namespace {
class LinearSolverSwitchBarFooRewriter : public OpRewritePattern<func::FuncOp> {
public:
  using OpRewritePattern<func::FuncOp>::OpRewritePattern;
  LogicalResult matchAndRewrite(func::FuncOp op,
                                PatternRewriter &rewriter) const final {
    if (op.getSymName() == "bar") {
      rewriter.modifyOpInPlace(op, [&op]() { op.setSymName("foo"); });
      return success();
    }
    return failure();
  }
};

class LinearSolverSwitchBarFoo
    : public impl::LinearSolverSwitchBarFooBase<LinearSolverSwitchBarFoo> {
public:
  using impl::LinearSolverSwitchBarFooBase<
      LinearSolverSwitchBarFoo>::LinearSolverSwitchBarFooBase;
  void runOnOperation() final {
    RewritePatternSet patterns(&getContext());
    patterns.add<LinearSolverSwitchBarFooRewriter>(&getContext());
    FrozenRewritePatternSet patternSet(std::move(patterns));
    if (failed(applyPatternsAndFoldGreedily(getOperation(), patternSet)))
      signalPassFailure();
  }
};
} // namespace
} // namespace mlir::linearsolver
