import cpp
from FunctionCall functioncall
where functioncall.getTarget().hasName("memcpy")
select functioncall