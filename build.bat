@echo off

pushd engine
call build.bat
popd

pushd Pong2
call build.bat
Pong2.exe
popd


