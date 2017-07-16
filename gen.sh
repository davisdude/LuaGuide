#! /bin/sh
fmt -s -w 75 < LuaGuide.md > LuaGuideFormatted.md
pandoc -s --number-sections --toc -o LuaGuide.html LuaGuide.md
