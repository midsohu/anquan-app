@echo off
chcp 65001 >nul
echo ==========================================================
echo   一键推送到 GitHub 并触发自动打包（Windows 用）
echo ==========================================================
echo.
echo 使用前请先在 GitHub 网页上创建一个空仓库（不要勾选 README），
echo 然后把下面的 YOUR_USERNAME 和 YOUR_REPO 改成你自己的。
echo.
set /p USERNAME=请输入你的 GitHub 用户名: 
set /p REPONAME=请输入仓库名（建议: anquan-app）: 

if "%USERNAME%"=="" goto :error
if "%REPONAME%"=="" goto :error

git init
git add .
git commit -m "初始提交：B类安全员题库安卓项目"
git branch -M main
git remote add origin https://github.com/%USERNAME%/%REPONAME%.git
git push -u origin main

echo.
echo 推送完成！请到 GitHub 仓库的 Actions 标签查看打包进度。
echo 跑完后点 Artifacts 下载 B类安全员题库-已签名.zip
goto :eof

:error
echo 用户名或仓库名不能为空，请重新运行。
pause
