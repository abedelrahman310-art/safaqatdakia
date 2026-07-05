@echo off
chcp 65001 >nul
echo ========================================================
echo جاري تجهيز وتصدير المشروع (صفقات ذكية) للرفع...
echo ========================================================

echo 1. تنظيف ملفات الكاش...
powershell -Command "Get-ChildItem -Path . -Include __pycache__ -Recurse -Force | Remove-Item -Force -Recurse"

echo 2. ضغط المشروع في ملف (mvp2026_safakat.zip)...
echo الرجاء الانتظار، قد تستغرق العملية بضع دقائق...

powershell -Command "$exclude = @('.venv', '.git', 'staticfiles'); Get-ChildItem -Path . -Exclude $exclude | Compress-Archive -DestinationPath mvp2026_safakat.zip -Force"

echo ========================================================
echo تم التصدير بنجاح! 
echo الملف الجاهز للرفع هو: mvp2026_safakat.zip
echo ========================================================
pause
