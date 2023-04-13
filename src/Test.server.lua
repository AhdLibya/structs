local Lists = require(script.Parent.struct).LinkedList

local List = Lists.new()

List:append({1 , 2 , 3, 4})
List:append({"hello!" , "hello@" , "hello#", "hello$"})
List:append({true , true , true, true})
List:append({false , false , false, false})


List:print()

List:prepend("yes")
