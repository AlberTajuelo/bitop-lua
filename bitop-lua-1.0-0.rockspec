package = "bitop-lua"
version = "1.0-0"
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
  "lua >= 5.1, < 5.3"
}
build = {
  type = "builtin",
  modules = {
    [ "bitop.funcs" ] = "src/bitop/funcs.lua"
  }
}