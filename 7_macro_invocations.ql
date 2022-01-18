import cpp
 from MacroInvocation macInvo
 where macInvo.getMacro().getName().regexpMatch("ntoh.*")
 select macInvo