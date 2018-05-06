# BitOp-lua

[![Build Status](https://travis-ci.org/AlberTajuelo/bitop-lua.svg)](https://travis-ci.org/AlberTajuelo/bitop-lua)
[![codecov](https://codecov.io/gh/AlberTajuelo/bitop-lua/branch/master/graph/badge.svg)](https://codecov.io/gh/AlberTajuelo/bitop-lua)
[![License](https://img.shields.io/badge/License-MIT-brightgreen.svg)](LICENSE)

## Contents

* [Overview](#overview)
* [Origin](#origin)
* [Requirements](#requirements)
* [Basic usage](#basic-usage)
* [Documentation](#documentation)
* [Development](#development)
* [References](#references)

## Overview

This package provides bitwise operations implemented entirely in Lua.

Includes Lua 5.2 'bit32' and (LuaJIT) LuaBitOp 'bit' compatibility interfaces.

This library implements bitwise operations entirely in Lua.
This module is typically intended if for some reasons you don't want to or cannot install a popular C based bit library like BitOp 'bit' [1] (which comes pre-installed with LuaJIT) or 'bit32' (which comes pre-installed with Lua 5.2) but want a similar interface.

This modules represents bit arrays as non-negative Lua numbers. [1] It can represent 32-bit bit arrays when Lua is compiled
with lua_Number as double-precision IEEE 754 floating point.

The module is nearly the most efficient it can be but may be a few times slower than the C based bit libraries and is orders or magnitude slower than LuaJIT bit operations, which compile to native code. Therefore, this library is inferior in performane to the other modules.

The `xor` function in this module is based partly on Roberto Ierusalimschy's post in http://lua-users.org/lists/lua-l/2002-09/msg00134.html .

The included BIT.bit32 and BIT.bit sublibraries aims to provide 100% compatibility with the Lua 5.2 "bit32" and (LuaJIT) LuaBitOp "bit" library.

This compatbility is at the cost of some efficiency since inputted numbers are normalized and more general forms (e.g. multi-argument bitwise operators) are supported.

## Origin

This repository is based on David Manura (@davidm) work: https://github.com/davidm/lua-bit-numberlua

## Requirements

None (other than Lua 5.1 or 5.2). Bitop-lua is not compatible with Lua 5.3 version (due [important define remove](https://www.freelists.org/post/luajit/Port-bitop-to-53,1)).

## Basic Usage

If using LuaRocks:
```
luarocks install bitop-lua
```

Otherwise, download <https://github.com/AlberTajuelo/bitop-lua/zipball/master>.

Alternately, if using GIT:

```
git clone git://github.com/AlberTajuelo/bitop-lua.git

cd bitop-lua 

luarocks make
```

And you can create a lua script file and play with Bitop.

```lua

local bit = require 'bit.numberlua'
print(bit.bor(0xff00ff00, 0x00ff00ff)) --> 0xffffffff

-- Interface providing strong Lua 5.2 'bit32' compatibility
local bit32 = require 'bit.numberlua'.bit32
assert(bit32.band(-1) == 0xffffffff)

-- Interface providing strong (LuaJIT) LuaBitOp 'bit' compatibility
local bit = require 'bit.numberlua'.bit
assert(bit.tobit(0xffffffff) == -1)
```


## Documentation



  BIT.tobit(x) --> z
  
    Similar to function in BitOp.
    
  BIT.tohex(x, n)
  
    Similar to function in BitOp.
  
  BIT.band(x, y) --> z
  
    Similar to function in Lua 5.2 and BitOp but requires two arguments.
  
  BIT.bor(x, y) --> z
  
    Similar to function in Lua 5.2 and BitOp but requires two arguments.

  BIT.bxor(x, y) --> z
  
    Similar to function in Lua 5.2 and BitOp but requires two arguments.
  
  BIT.bnot(x) --> z
  
    Similar to function in Lua 5.2 and BitOp.

  BIT.lshift(x, disp) --> z
  
    Similar to function in Lua 5.2 (warning: BitOp uses unsigned lower 5 bits of shift),
  
  BIT.rshift(x, disp) --> z
  
    Similar to function in Lua 5.2 (warning: BitOp uses unsigned lower 5 bits of shift),

  BIT.extract(x, field [, width]) --> z
  
    Similar to function in Lua 5.2.
  
  BIT.replace(x, v, field, width) --> z
  
    Similar to function in Lua 5.2.
  
  BIT.bswap(x) --> z
  
    Similar to function in Lua 5.2.

  BIT.rrotate(x, disp) --> z
  BIT.ror(x, disp) --> z
  
    Similar to function in Lua 5.2 and BitOp.

  BIT.lrotate(x, disp) --> z
  BIT.rol(x, disp) --> z

    Similar to function in Lua 5.2 and BitOp.
  
  BIT.arshift
  
    Similar to function in Lua 5.2 and BitOp.
    
  BIT.btest
  
    Similar to function in Lua 5.2 with requires two arguments.

  BIT.bit32
  
    This table contains functions that aim to provide 100% compatibility with the Lua 5.2 "bit32" library.
    
    bit32.arshift (x, disp) --> z
    bit32.band (...) --> z
    bit32.bnot (x) --> z
    bit32.bor (...) --> z
    bit32.btest (...) --> true | false
    bit32.bxor (...) --> z
    bit32.extract (x, field [, width]) --> z
    bit32.replace (x, v, field [, width]) --> z
    bit32.lrotate (x, disp) --> z
    bit32.lshift (x, disp) --> z
    bit32.rrotate (x, disp) --> z
    bit32.rshift (x, disp) --> z

  BIT.bit
  
This table contains functions that aim to provide 100% compatibility with the LuaBitOp "bit" library (from LuaJIT).
    
    bit.tobit(x) --> y
    bit.tohex(x [,n]) --> y
    bit.bnot(x) --> y
    bit.bor(x1 [,x2...]) --> y
    bit.band(x1 [,x2...]) --> y
    bit.bxor(x1 [,x2...]) --> y
    bit.lshift(x, n) --> y
    bit.rshift(x, n) --> y
    bit.arshift(x, n) --> y
    bit.rol(x, n) --> y
    bit.ror(x, n) --> y
    bit.bswap(x) --> y


## Development

Bitop is currently in development.

WARNING: Not all corner cases have been tested and documented.

Some attempt was made to make these similar to the Lua 5.2 [2] and LuaJit BitOp [3] libraries, but this is not fully tested and there are currently some differences. Addressing these differences may be improved in the future but it is not yet fully determined how to resolve these differences.

The BIT.bit32 library passes the Lua 5.2 test suite (bitwise.lua) http://www.lua.org/tests/5.2/ . The BIT.bit library passes the LuaBitOp test suite (bittest.lua). However, these have not been tested on platforms with Lua compiled with 32-bit integer numbers.

## References

[1] http://lua-users.org/wiki/FloatingPoint

[2] http://www.lua.org/manual/5.2/

[3] http://bitop.luajit.org/
