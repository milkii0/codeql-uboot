/**
 * @kind path-problem
 */

import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

class NetworkByteSwap extends Expr {
    NetworkByteSwap() { 
        exists(MacroInvocation mi| mi.getMacro().getName().regexpMatch("ntoh(s|l|ll)") | mi.getExpr() = this)
     }
}

class Config extends TaintTracking::Configuration {
  Config() { this = "NetworkToMemFuncLength" }

  override predicate isSource(DataFlow::Node source) {
    // TODO
    /*获取与此节点对应的表达式（如果有）。
    此谓词仅在表示表达式求值值的节点上具有结果。
    对于从表达式中流出的数据，例如通过引用传递参数时，请使用asDefiningArgument而不是asExpr。*/
    source.asExpr() instanceof NetworkByteSwap
  }
  override predicate isSink(DataFlow::Node sink) {
    // TODO
    exists(FunctionCall fc | fc.getTarget().hasName("memcpy") | sink.asExpr() = fc.getArgument(2))
  }
}

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)
select sink, source, sink, "Network byte swap flows to memcpy"