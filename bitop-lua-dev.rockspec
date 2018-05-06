package = "bitop-lua"
version = "dev"
source = {
   url = "git+https://github.com/AlberTajuelo/bitop-lua.git"
}
description = {
   summary = "Bitwise operators in pure Lua using Lua numbers",
   detailed = "",
   homepage = "https://github.com/AlberTajuelo/bitop-lua.git",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1"
}
build = {
   type = "builtin",
   modules = {
      bitop = "src/bitop/number.lua"
   }
}