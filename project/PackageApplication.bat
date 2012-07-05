:: iPhone IPA generator
:: More information:
:: http://www.adobe.com/special/products/air/sdk/
::
:: FlashDevelop Project Template
:: http://blubl.geoathome.at (german)
::
:: Edited by James McNess to work with Air 2.7 
:: http://www.codeandvisual.com
::	
:: Edited by Emiliano Angelini to work with Air 3.0
:: http://www.emibap.com
cls
@echo off

:: Path to Flex SDK binaries
:: for instance: C:\Flex45_AIR3_SDK\bin\
set FLEX_SDK=C:\AIRFLEXSDK\bin\

:: Certificate files
set CERTIFICATE_FILE=certificates\iphone_dev.p12
set PROVISIONING_FILE=certificates\Vertikill.mobileprovision

:: Set your password here or leave blank if you want to input it every time because you trust no one ;)
set APP_PASSWORD=

:menu
echo iPhone IPA generator
echo.
echo. What kind of ipa do you wish to create?
echo.
echo.  [1]test (ipa-test)
echo.  [2]debug (ipa-debug)
echo.  [3]store (ipa-app-store)
echo.  [4]ad-hoc (ipa-ad-hoc)
echo.  [5]interpreter (ipa-test-interpreter)
echo.

:choice
set /P C=[Option]:
if "%C%"=="1" set IPATYPE=ipa-test
if "%C%"=="2" set IPATYPE=ipa-debug
if "%C%"=="3" set IPATYPE=ipa-app-store
if "%C%"=="4" set IPATYPE=ipa-ad-hoc
if "%C%"=="5" set IPATYPE=ipa-test-interpreter
echo. You have chosen '%IPATYPE%'.
echo. 
if "%APP_PASSWORD%"=="" (goto pass) else (goto ipa)

:pass
echo Before you enter your password, make sure no-one is looking!
set /p APP_PASSWORD=Enter Certificate Password:
cls
echo iPhone IPA generator
echo.
echo. Thanks, password input done.
echo.
goto ipa

:ipa
echo. IPA creation may take up to 3 minutes, please be patient
echo. --------------------------------------------------------
set SIGNING_OPTIONS= -target %IPATYPE% -keystore %CERTIFICATE_FILE% -storetype pkcs12 -storepass %APP_PASSWORD% -provisioning-profile %PROVISIONING_FILE%
call "%FLEX_SDK%adt.bat" -package %SIGNING_OPTIONS% iphone/Vertikill-%IPATYPE%.ipa application.xml bin/Vertikill.swf bin/icons Default.png
if errorlevel 1 goto failed
echo. --------------------------------------------------------
echo. SUCCESS: IPA created in (./iphone/Vertikill-%IPATYPE%.ipa)
echo.
goto end

:failed
echo. --------------------------------------------------------
echo. ERROR: IPA creation FAILED.
echo.
echo. Troubleshotting: did you configure the Flex SDK path in this Batch file?
echo.

:end
pause