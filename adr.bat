@echo off
REM ADR Toolkit Quick Commands
REM Usage: adr [command] [file]

if "%1"=="convert" goto convert
if "%1"=="generate" goto generate
if "%1"=="help" goto help

echo ADR Toolkit Quick Commands
echo Usage: adr [command] [options]
echo.
echo Commands:
echo   convert [file.md]    Convert markdown to DOCX
echo   generate [title]     Generate new ADR
echo   help                 Show this help
goto end

:convert
if "%2"=="" (
    echo Error: Please specify a markdown file to convert
    goto end
)
powershell -ExecutionPolicy Bypass -File ".adr-toolkit\Convert-ToAccentureDocx.ps1" -InputFile "%2" -OpenAfterConversion
goto end

:generate
if "%2"=="" (
    echo Error: Please specify an ADR title
    goto end
)
powershell -ExecutionPolicy Bypass -File ".adr-toolkit\Generate-Partner-ADR.ps1" -Partner Accenture -Client Generic -Type adf -Title "%2" -GenerateAllFormats -Status proposed
goto end

:help
echo ADR Toolkit Quick Commands
echo ==========================
echo.
echo Convert current file to DOCX:
echo   adr convert "path\to\file.md"
echo.
echo Generate new ADR:
echo   adr generate "ADR Title"
echo.
echo Available in VS Code:
echo   - Ctrl+Shift+P + "Tasks: Run Task" + "Convert to DOCX"
echo   - Ctrl+Shift+P + "Tasks: Run Task" + "Generate ADR"
goto end

:end
