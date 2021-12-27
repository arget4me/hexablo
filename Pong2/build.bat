@REM @echo off
setlocal EnableDelayedExpansion
@REM call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
@REM call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64

set CPP_VERSION=c++17

set EXE_NAME=Pong2
set EXE_NAME_DEBUG=%EXE_NAME%
set EXE_NAME_RELEASE=%EXE_NAME%-RELEASE

set LINK_LIBRARIES=../../engine/build/jle.lib

set SOURCE_PATH=../
@REM set SOURCE_FILES=%SOURCE_PATH%cSprite.cpp %SOURCE_PATH%cTransform.cpp %SOURCE_PATH%main.cpp %SOURCE_PATH%oPlayerRacket.cpp %SOURCE_PATH%oRacket.cpp %SOURCE_PATH%oStaticSprite.cpp %SOURCE_PATH%Pong2.cpp
set SOURCE_FILES=%SOURCE_PATH%bigcode.cpp
set INCLUDE_DIRECTORIES=/I %SOURCE_PATH% /I ../../engine /I ../../engine3rdparty /I D:\Dev\vcpkg\packages\glm_x86-windows\include /I D:\Dev\vcpkg\packages\imgui_x86-windows\include /I D:\Dev\vcpkg\packages\glfw3_x86-windows\include /I D:\Dev\vcpkg\packages\plog_x86-windows\include /I D:\Dev\vcpkg\packages\stb_x86-windows\include

set DEFINED_MACROS=
set DEFINED_MACROS_DEBUG=%DEFINED_MACROS% -DDEBUG
set DEFINED_MACROS_RELEASE=%DEFINED_MACROS% -DRELEASE

mkdir build
pushd build
cl /Fe:../%EXE_NAME_DEBUG%.exe %INCLUDE_DIRECTORIES% %DEFINED_MACROS_DEBUG% -Od -Zi -FC -EHsc -std:%CPP_VERSION% %SOURCE_FILES% -link %LINK_LIBRARIES%
popd
endlocal