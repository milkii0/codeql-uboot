import cpp
 /*from MacroInvocation macInvo
 where macInvo.getMacro().getName().regexpMatch("ntoh.*")
 select macInvo.getExpr()*/
 class OneTwoThree extends int {
    OneTwoThree() { // characteristic predicate
      this = 1 or this = 2 or 3=this
    }
  
    string getAString() { // member predicate
      result = "One, two or three: " + this.toString()
    }
  
    predicate isEven() { // member predicate
      this = 2
    }
  }
  
  from OneTwoThree ott
  select ott,ott.getAString()