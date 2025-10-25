@echo off
REM ADR Toolkit Quick Commands for VS Code Co-Pilot Chat
REM Usage: adr [command] [file]

if "%1"=="convert" goto convert
if "%1"=="generate" goto generate
if "%1"=="help" goto help

echo ADR Toolkit Quick Commands
echo Usage: adr [command] [options]
echo.
echo Commands:
echo   convert [file.md]    Convert markdown to Accenture DOCX
echo   generate [title]     Generate new ADR
echo   help                 Show this help
goto end

:convert
if "%2"=="" (
    echo Error: Please specify a markdown file to convert
    echo Example: adr convert "Analysis\MyDocument.md"
    goto end
)
powershell -ExecutionPolicy Bypass -File ".adr-toolkit\Convert-ToAccentureDocx.ps1" -InputFile "%2" -OpenAfterConversion
goto end

:generate
if "%2"=="" (
    echo Error: Please specify an ADR title
    echo Example: adr generate "My ADR Title"
    goto end
)
powershell -ExecutionPolicy Bypass -File ".adr-toolkit\Generate-Partner-ADR.ps1" -Partner Accenture -Client Ecolab -Type adf -Title "%2" -GenerateAllFormats -Status proposed
goto end

:help
echo ADR Toolkit Quick Commands
echo ==========================
echo.
echo Convert current file to Accenture DOCX:
echo   adr convert "path\to\file.md"
echo.
echo Generate new ADR:
echo   adr generate "ADR Title"
echo.
echo Available in VS Code:
echo   - Ctrl+Shift+P + "Tasks: Run Task" + "Convert to Accenture DOCX"
echo   - Ctrl+Shift+P + "Tasks: Run Task" + "Generate ADR"
echo   - Ctrl+Shift+P + "Tasks: Run Task" + "Update ADR DOCX"
echo.
echo For Co-Pilot Chat commands:
echo   "Convert this markdown file to Accenture DOCX"
echo   "Generate a new ADR for [topic]"
echo   "Update the ADR with latest content"
goto end

:end