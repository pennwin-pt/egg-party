@echo off
chcp 65001 >nul
title 蛋仔宫殿大冒险 - 游戏服务器
cd /d %~dp0

echo ==========================================
echo    🏰 蛋仔宫殿大冒险 启动中...
echo ==========================================
echo.

:: 检测 Python（优先 python，其次 py 启动器）
set PY=
where python >nul 2>nul && set PY=python
if not defined PY (
  where py >nul 2>nul && set PY=py
)

if not defined PY (
  echo [错误] 没有检测到 Python！
  echo.
  echo 请先安装 Python：https://www.python.org/downloads/
  echo 安装时记得勾选 "Add Python to PATH"
  echo.
  pause
  exit /b
)

echo [OK] 检测到 Python，正在启动服务器...
echo.
echo 游戏地址：http://localhost:8000
echo 关闭本窗口即可停止游戏服务器
echo.

:: 延迟 1 秒后自动打开浏览器（在后台执行，不影响服务器启动）
start "" /b cmd /c "timeout /t 1 /nobreak >nul && start http://172.16.0.207:8000"

:: 启动 HTTP 服务器（端口 8000）
%PY% -m http.server 8000

pause
