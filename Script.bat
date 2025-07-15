@echo off

chcp 65001> nul
setlocal enabledelayedexpansion

:: ======================
:: CONFIGURAÇÃO DO SCRIPT
:: ======================

set "SOFTWARE_NAME=ID-1636 Simul8 2021 (64 bits)"

title %SOFTWARE_NAME%

:: ===========================================
:: --- 1. Configuração do Log Centralizado ---
:: ===========================================

:: Define o caminho para a pasta e o ficheiro de log.
set "LOG_DIR=C:\Logs"
set "LOG_FILE=%LOG_DIR%\deployments.log"

:: Cria o diretório de log se ele não existir.
if not exist "%LOG_DIR%" (
    echo Criando diretorio de log em %LOG_DIR%
    mkdir "%LOG_DIR%"
)

:: =========================
:: INSTALAÇÃO VIA COMANDLINE
:: =========================

call :WriteLog "--- Iniciando deploy de: %SOFTWARE_NAME% ---" "INFO"

call :WriteLog "Passo 1: Verificando se o disco S existe..." "WARN"

if exist S:\ (
    set "installDir=S:\Program Files\SIMUL8EDU"
    call :WriteLog "Disco S identificado." "WARN"
) else (
    set "installDir=C:\Program Files\SIMUL8EDU"
    call :WriteLog "Disco S não identificado." "WARN"
)

call :WriteLog "Passo 2: Instalando o software..."

\\Serivdor\Caminho\SETUPS8_EDU_UPGRADE.EXE /S DIR:"%installDir%" LIC:"XXXX-XXXX-XXXX"

call :WriteLog "Instalacao finalizada com sucesso."

call :WriteLog "--- Deploy de '%SOFTWARE_NAME%' finalizado. ---"

echo. >> "%LOG_FILE%" 

echo Processo finalizado. Verifique o log em %LOG_FILE%
goto :end


:: ===================================================================
:: Copie esta parte no fim dos seus scripts batch.
:: As sub-rotinas devem ser definidas após o uso. 
:: Sub rotirna --> É um pedaço de código que pode ser chamado várias vezes.
:: =================================================================== 

:WriteLog
    :: %1 é a Mensagem (primeiro argumento)
    :: %2 é o Nível (segundo argumento)

    :: Define o nível como "INFO" se nenhum for passado.
    set "LEVEL=%~2"
    if "%LEVEL%"=="" set "LEVEL=INFO"

    :: Formato DD/MM/AAAA e a hora é HH:MM:SS
    set "TIMESTAMP=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2% %TIME:~0,8%"

    :: Constrói a linha de log completa
    set "LOG_LINE=[%TIMESTAMP%] [%LEVEL%] - %~1"

    :: Escreve a mensagem no console
    echo %LOG_LINE%

    :: Adiciona a linha ao ficheiro de log centralizado (>>)
    echo %LOG_LINE%>>"%LOG_FILE%"

    :: Retorna para onde a sub-rotina foi chamada
    goto :eof


:end
endlocal

:: Desenvolvido por Erik Ribeiro © 2025