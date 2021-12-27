@echo off

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
@REM call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x64

set CPP_VERSION=c++17

set EXE_NAME=jle
set EXE_NAME_DEBUG=%EXE_NAME%
set EXE_NAME_RELEASE=%EXE_NAME%-RELEASE
@REM D:\Dev\vcpkg\packages\glad_x86-windows\lib\glad.lib 
@REM D:\Dev\vcpkg\packages\imgui_x86-windows\lib\imgui.lib
set LINK_LIBRARIES=Opengl32.lib D:\Dev\vcpkg\packages\glfw3_x86-windows\lib\glfw3dll.lib 

set SOURCE_PATH=../


@REM set SOURCE_FILES=%SOURCE_PATH%3rdparty\glad.c %SOURCE_PATH%3rdparty\gltext.c %SOURCE_PATH%3rdparty\imgui_impl_glfw.cpp %SOURCE_PATH%3rdparty\imgui_impl_opengl3.cpp %SOURCE_PATH%3rdparty\imgui*.cpp %SOURCE_PATH%3rdparty\stb_image.cpp %SOURCE_PATH%ConsoleEditorWindow.cpp %SOURCE_PATH%EditorBackgroundImage.cpp %SOURCE_PATH%EditorGameControllerWindow.cpp %SOURCE_PATH%EditorJsonToImgui.cpp %SOURCE_PATH%EditorSceneObjectsWindow.cpp %SOURCE_PATH%EditorWindowsPanel.cpp %SOURCE_PATH%EngineSettingsWindow.cpp %SOURCE_PATH%GameAssets.cpp %SOURCE_PATH%GameEditorWindow.cpp %SOURCE_PATH%Image.cpp %SOURCE_PATH%iTexture.cpp %SOURCE_PATH%jleComponent.cpp %SOURCE_PATH%jleCore.cpp %SOURCE_PATH%EngineStatus.cpp %SOURCE_PATH%jleEditor.cpp %SOURCE_PATH%jleGame.cpp %SOURCE_PATH%jleObject.cpp %SOURCE_PATH%jleScene.cpp %SOURCE_PATH%ProfilerWindow.cpp %SOURCE_PATH%TextRendering_OpenGL.cpp %SOURCE_PATH%TextureCreator_OpenGL.cpp %SOURCE_PATH%WindowInitializer_GLFW_OpenGL.cpp %SOURCE_PATH%WindowFactory_GLFW.cpp %SOURCE_PATH%GLState.cpp %SOURCE_PATH%jleGameEngine.cpp %SOURCE_PATH%KeyboardInputInternal.cpp %SOURCE_PATH%MouseInputInternal.cpp %SOURCE_PATH%FrameBuffer_OpenGL.cpp %SOURCE_PATH%FramebufferFullscreenRenderer_OpenGL.cpp %SOURCE_PATH%FullscreenRendering_OpenGL.cpp %SOURCE_PATH%QuadRendering_OpenGL.cpp %SOURCE_PATH%RenderingAPI_OpenGL.cpp %SOURCE_PATH%RenderingFactory_OpenGL.cpp %SOURCE_PATH%Shader_OpenGL.cpp %SOURCE_PATH%Texture.cpp %SOURCE_PATH%Viewport.cpp %SOURCE_PATH%Window_GLFW_OpenGL.cpp
@REM set OBJ_FILES=glad.obj gltext.obj imgui_impl_glfw.obj imgui_impl_opengl3.obj imgui*.obj stb_image.obj ConsoleEditorWindow.obj EditorBackgroundImage.obj EditorGameControllerWindow.obj EditorJsonToImgui.obj EditorSceneObjectsWindow.obj EditorWindowsPanel.obj EngineSettingsWindow.obj GameAssets.obj GameEditorWindow.obj Image.obj iTexture.obj jleComponent.obj jleCore.obj EngineStatus.obj jleEditor.obj jleGame.obj jleObject.obj jleScene.obj ProfilerWindow.obj TextRendering_OpenGL.obj TextureCreator_OpenGL.obj WindowInitializer_GLFW_OpenGL.obj WindowFactory_GLFW.obj GLState.obj jleGameEngine.obj KeyboardInputInternal.obj MouseInputInternal.obj FrameBuffer_OpenGL.obj FramebufferFullscreenRenderer_OpenGL.obj FullscreenRendering_OpenGL.obj QuadRendering_OpenGL.obj RenderingAPI_OpenGL.obj RenderingFactory_OpenGL.obj Shader_OpenGL.obj Texture.obj Viewport.obj Window_GLFW_OpenGL.obj

@REM imgui_impl_glfw.obj imgui_impl_opengl3.obj imgui*.obj
@REM %SOURCE_PATH%3rdparty\imgui_impl_glfw.cpp %SOURCE_PATH%3rdparty\imgui_impl_opengl3.cpp %SOURCE_PATH%3rdparty\imgui*.cpp

set SOURCE_FILES=%SOURCE_PATH%3rdparty\glad.c %SOURCE_PATH%3rdparty\imgui_impl_glfw.cpp %SOURCE_PATH%3rdparty\imgui_impl_opengl3.cpp %SOURCE_PATH%3rdparty\imgui*.cpp %SOURCE_PATH%FullscreenRendering_OpenGL.cpp %SOURCE_PATH%3rdparty\gltext.c %SOURCE_PATH%3rdparty\stb_image.cpp %SOURCE_PATH%bigcode.cpp
set OBJ_FILES= glad.obj imgui_impl_glfw.obj imgui_impl_opengl3.obj imgui*.obj FullscreenRendering_OpenGL.obj gltext.obj stb_image.obj bigcode.obj

set INCLUDE_DIRECTORIES=/I %SOURCE_PATH% /I ../include /I ../3rdparty /I D:\Dev\vcpkg\packages\glm_x86-windows\include /I D:\Dev\vcpkg\packages\imgui_x86-windows\include /I D:\Dev\vcpkg\packages\glfw3_x86-windows\include /I D:\Dev\vcpkg\packages\plog_x86-windows\include /I D:\Dev\vcpkg\packages\stb_x86-windows\include

set DEFINED_MACROS=-DIMGUI_IMPL_OPENGL_LOADER_GLAD
set DEFINED_MACROS_DEBUG=%DEFINED_MACROS% -DDEBUG
set DEFINED_MACROS_RELEASE=%DEFINED_MACROS% -DRELEASE

mkdir build
pushd build
cl /c %INCLUDE_DIRECTORIES% %DEFINED_MACROS_DEBUG% -Od -Zi -FC -EHsc -std:%CPP_VERSION% %SOURCE_FILES%
lib /OUT:%EXE_NAME%.lib %OBJ_FILES% %LINK_LIBRARIES%
popd