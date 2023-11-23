@echo off
setlocal enabledelayedexpansion

:: Desconectar unidades de red si están mapeadas
for %%x in (S: U: P:) do (
    net use %%x 2>nul | findstr /C:"The command completed successfully" >nul
    if not errorlevel 1 (
        echo Desconectando unidad %%x...
        net use %%x /delete
    ) else (
        echo La unidad %%x no está conectada.
    )
)


:: Carpeta donde se guardarán los perfiles exportados
set "profileFolder=C:\WifiProfiles"

:: Crear la carpeta si no existe
if not exist "%profileFolder%" mkdir "%profileFolder%"

:: Enumerar y procesar cada perfil de red conocido
for /f "tokens=*" %%a in ('netsh wlan show profiles ^| findstr /C:"All User Profile"') do (
    set "profileName=%%a"
    set "profileName=!profileName:*: =!"
    
    echo Exportando perfil: !profileName!
    netsh wlan export profile name="!profileName!" folder="%profileFolder%" key=clear

    echo Eliminando perfil: !profileName!
    netsh wlan delete profile name="!profileName!"
)

:: Flush DNS
echo Realizando Flush DNS
ipconfig /flushdns

echo Se agregaran de nuevo las redes
:: Agregar solo los perfiles específicos de nuevo desde los archivos XML
echo Agregando perfil desde: %profileFolder%\AT_Engine_Wireless_WIFI.xml
netsh wlan add profile filename="%profileFolder%\Wi-Fi-AT Engine - wireless WiFi.xml"

echo Agregando perfil desde: %profileFolder%\ATP_GUEST.xml
netsh wlan add profile filename="%profileFolder%\Wi-Fi-ATP Guest.xml"

netsh wlan connect name="ATP Guest"
echo Se conecto a ATP Guest

echo Favor de conectarse a una red y despues dar click a cualquier boton para continuar
pause

::Map the network drive using the "net use" command
set driveLetter=S:
set networkPath=\\192.168.1.60\SRV-ATEngine-02
net use %driveLetter% %networkPath% /user:ATENGINE\%username% password

set driveLetter=U:
set networkPath=\\192.168.1.60\Users\Usuarios\%USERNAME%
net use %driveLetter% %networkPath% /user:ATENGINE\%username% password

set driveLetter=P:
set networkPath=\\192.168.1.60\Public
net use %driveLetter% %networkPath% /user:ATENGINE\%username% password

endlocal