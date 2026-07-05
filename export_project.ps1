Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "جاري تجهيز وتصدير المشروع (صفقات ذكية) للرفع..." -ForegroundColor Green
Write-Host "========================================================" -ForegroundColor Cyan

Write-Host "1. تنظيف ملفات الكاش..." -ForegroundColor Yellow
Get-ChildItem -Path . -Include __pycache__ -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue

Write-Host "2. ضغط المشروع في ملف (mvp2026_safakat.zip)..." -ForegroundColor Yellow
Write-Host "الرجاء الانتظار، قد تستغرق العملية بضع دقائق..." -ForegroundColor Gray

$exclude = @('.venv', '.git', 'staticfiles', 'mvp2026_safakat.zip', 'تصدير_المشروع.bat', 'export_project.ps1')
Get-ChildItem -Path . -Exclude $exclude | Compress-Archive -DestinationPath mvp2026_safakat.zip -Force

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "تم التصدير بنجاح!" -ForegroundColor Green
Write-Host "الملف الجاهز للرفع هو: mvp2026_safakat.zip" -ForegroundColor White
Write-Host "========================================================" -ForegroundColor Cyan
