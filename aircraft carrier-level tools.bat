@echo off
chcp 936
cd /d "%~dp0"
:AIHGT_home
cd.>bin\AIHGT
set titles=Aircraft tool v5.5��20200208��
start /b "" cmd /v:on /c "@echo off&for /l %%a in () do (title %titles% by AIHGT Shady           current time ��%date% !time:~0,8! & ping /n 2 localhost>nul)"
call bin\patch.exe
if not exist "bin\AIHGTPATH" (
goto png
else
)
goto set
:png
echo. >bin\AIHGTPATH
attrib +r +h bin\AIHGTPATH
goto set
:set
setlocal enabledelayedexpansion
set adb=bin\adb.exe
set bootimg=bin\bootimg.exe
set busybox=bin\busybox.exe
set cecho=bin\cecho.exe
set dat2br=bin\dat2br.exe
set kernelImg=bin\kernelImg.exe
set raw2simg=bin\raw2simg.exe
set fastboot=bin\fastboot.exe
set file_contexts_tool=bin\file_contexts_tool.exe
set FileToOpen=bin\FileToOpen.exe
set img2dat=bin\img2dat.exe
set make_ext4fs=bin\make_ext4fs.exe
set sdat2img=bin\sdat2img.exe
set simg2img=bin\simg2img.exe
set simg2sdat=bin\simg2sdat.exe
set unpack-image=bin\unpack-image.exe
:home
cls
!cecho! {0A} ======================================================================================================================{\n}
echo  ::             %titles%Support Android 4.2-Android 10 decomposition \ packaging [only supports Qualcomm and MediaTek]             ::
echo  ::                                                                                                                  ::
echo  ::Please put boot\recovery.img\system.img\system.new.dat\system.new.dat.br in the current directory::
echo  ======================================================================================================================
!cecho!  {0A} Please select the option below:{0C}[Warning: The {0F}white{0C} option is the old plan packaging option!]{\n}
!cecho! {0E}                                                                                5.file_contexts.bin and file_contexts conversion{\n}
!cecho! {0E} {0E}01{0D}\{0F}1.{0E}Decompress boot.img                 {0E}03{0D}\{0F}3.{0E}�ֽ�recovery.img                       55.����system\vendor���νӽű�(symlink){\n}
!cecho! {0E} {0E}02{0D}\{0F}2.{0E}�ϳ�boot.img                 {0E}04{0D}\{0F}4.{0E}�ϳ�recovery.img                      555.�ȸ��׼A\B��������payload.bin���{\n}
!cecho! {0D}{\n}
echo   6.�ֽ���������img\dat\br�ȸ�ʽ                             14.system.imgת����system.new.dat\system.new.dat.br
echo   7.���طֽ���������img\win\raw\ext4����                     15.vendor.imgת����vendor.new.dat\vendor.new.dat.br
echo   8.�ֽ�system.new.dat.br                                    16.system.new.dat\system.new.dat.brת����system.img
echo   9.�ֽ�system.new.dat                                       17.vendor.new.dat\vendor.new.dat.brת����vendor.img
echo  10.�ֽ�system.img                                           18.sparse image(imgѹ����ʽ)ת����ext4 image(����img��ʽ)
echo  11.�ֽ�vendor.new.dat.br                                    19.ext4 image(����img��ʽ)ת����sparse image(imgѹ����ʽ)
echo  12.�ֽ�vendor.new.dat
echo  13.�ֽ�vendor.img 
!cecho! {0D}                                     {0A}21.systemĿ¼���system.new.dat.br        24.vendorĿ¼���vendor.new.dat.br{\n}
!cecho! {0B} 20.adb\fastboot����̨�͹���         {0A}22.systemĿ¼���system.new.dat           25.vendorĿ¼���vendor.new.dat{\n}
!cecho! {0B}                                     {0A}23.systemĿ¼���system.img               26.vendorĿ¼���vendor.img{\n}
!cecho! {0C}{\n}
echo  27.java8���ºͰ�װ                  32.odex\vdex�ϲ�(֧�ְ�׿5.0-��׿9.0)     37.boot\recovery�Զ�����ֲ\�Զ���ֲ
!cecho! {0C} 28.�ı��༭����װ                   33.mtk��ˢspFlash\��ͨ9008����(������)    {0A}38.��������\��ʽ����ʹ��{0C}{\n}
echo  29.��װ���Է����빤��Apkdb          34.���ļ��Ա���                         39\399.system��vendor\build.prop��Ϣ���
!cecho! {0C} 30.apk\zip��ˢ������                35.���Զ�ʱ�ػ�\����\����                 40.zip��ˢ��ǩ��{0E}\400.apk��װ��ǩ��{0C}{\n}
echo  31.������ʱ�ļ�������               36.�رպ�ĸ�������н������������վ     41.��麽ĸ���߸��ºͺ�ĸQQȺ΢�ž���
!cecho! {0F}{\n}
set /p web=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%web%"=="01" goto unpack_bootimg_new
if "%web%"=="1" goto unpack_bootimg
if "%web%"=="02" goto make_bootimg_new
if "%web%"=="2" goto make_bootimg
if "%web%"=="03" goto unpack_recovery_new
if "%web%"=="3" goto unpack_recovery
if "%web%"=="04" goto make_recovery_new
if "%web%"=="4" goto make_recovery
if "%web%"=="5" goto file_contextsbin_and_file_contexts_home
if "%web%"=="55" goto make_symlinks
if "%web%"=="555" goto unpack_payload
if "%web%"=="6" goto unpack_xxx.imgdatbr
if "%web%"=="7" goto img_mount
if "%web%"=="8" goto unpack_systembr
if "%web%"=="9" goto unpack_systemdat
if "%web%"=="10" goto unpack_systemimg
if "%web%"=="11" goto unpack_vendorbr
if "%web%"=="12" goto unpack_vendordat
if "%web%"=="13" goto unpack_vendorimg
if "%web%"=="14" goto systemimg_datbr
if "%web%"=="15" goto vendorimg_to_datbr
if "%web%"=="16" goto systemdatbr_to_img
if "%web%"=="17" goto vendordatbr_to_img
if "%web%"=="18" goto simg2img
if "%web%"=="19" goto img2simg
if "%web%"=="20" goto home_adb_fastboot
if "%web%"=="21" goto home_systembr
if "%web%"=="22" goto home_systemdat
if "%web%"=="23" goto home_systemimg
if "%web%"=="24" goto home_vendorbr
if "%web%"=="25" goto home_vendordat
if "%web%"=="26" goto home_vendorimg
if "%web%"=="27" goto install_java
if "%web%"=="28" goto install_notepad
if "%web%"=="29" goto install_Apkdb
if "%web%"=="30" call :encryption_zip e ����
if "%web%"=="300" call :encryption_zip r ����
if "%web%"=="31" goto Clear_home
if "%web%"=="32" goto odex_vdex_merge
if "%web%"=="33" goto Flash_Tool
if "%web%"=="34" goto open_Compare
if "%web%"=="35" goto pc_home
if "%web%"=="36" goto exit
if "%web%"=="37" goto home_auto_custom_recovery_kernel_porting
if "%web%"=="38" goto others_unpack_repack
if "%web%"=="39" goto rom_look_build_system
if "%web%"=="399" goto rom_look_build_vendor
if "%web%"=="40" call :sign_zipapk zip ��ˢ��
if "%web%"=="400" call :sign_zipapk apk apk
if "%web%"=="41" goto update_CarrierClassTools
goto home
:unpack_payload
if not exist "payload.bin" (
echo.
echo.
!cecho! {0E}      û�ҵ�payload.bin�ļ�����ȷ�Ϻ�ĸ����Ŀ¼���Ƿ����payload.bin�ļ���{0F}{\n}
echo.
echo.
echo.
pause
goto home
else
)
call bin\unpack-payload.bat
goto home
:make_symlinks
echo.
echo.
!cecho! {0B} ========================{\n}
!cecho! {0E}  1.system�����������ν�{\n}
!cecho! {0E}  2.vendor�����������ν�{\n}
!cecho! {0B} ========================{0F}{\n}
echo.
set /p websymlink=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%websymlink%"=="1" call :make_symlink system
if "%websymlink%"=="2" call :make_symlink vendor
goto make_symlinks
:make_symlink
del ����%1���ν�symlinks.txt >nul 2>nul
echo.
echo.
!cecho! {0E}    �����������ν�symlinks�ű������Ժ�...{\n}
echo.
	if not exist "����%1���ν�symlinks.txt" for /f "delims=" %%a in ('bin\findfile.exe /%1 -type l ^| !busybox! sed "s/AIHGT//"') do (
		for /f "delims=" %%b in ('!busybox! readlink %%a') do echo symlink("%%b", "%%a";;;| !busybox! sed "s/;;;/);/">>����%1���ν�symlinks.txt
	)
	for /f "delims=" %%a in ('echo "%cd%" ^| !busybox! cut -d":" -f1') do set drive_up=%%a
	for /f "delims=" %%a in ('echo "%cd%"^| !busybox! cut -d":" -f2') do set second=%%a
	set drive_low=!drive_up!
	for %%b in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do set drive_low=!drive_low:%%b=%%b!
	for /f "delims=" %%a in ('echo \cygdrive\!drive_low!!second!\%1^| !busybox! tr \\ /') do set rm1=%%a
	for /f "delims=" %%a in ('echo \cygdrive\!drive_up!!second!\%1^| !busybox! tr \\ /') do set rm2=%%a
	set rm1=!rm1:/=\/!
	set rm2=!rm2:/=\/!
	set rm1=!rm1:"=!
	set rm2=!rm2:"=!
	set symlink_test=0
echo.
echo.
!cecho! {0C}     ���ν�ʶ����ɣ��򿪣�����%1���ν�symlinks.txt���鿴. {0F}{\n}
echo.
echo.
pause
start ����%1���ν�symlinks.txt
goto home
:rawprogram_unsparse
echo.
!cecho! {0E}    ���ȫ����ͨ��ˢ���ֶξ�����ں�ĸ��ǰĿ¼��{\n}
echo.
!cecho! {0E}    ���ڵ���ѡ��rawprogram_unsparse.xml����xml��ͨ��ˢ�ı��ļ������½�λ�õ�ѡ���򿪡�ѡ��ɿ�ʼ�ϲ�...{\n}
!cecho! {0C}{\n}
echo     1.system
echo     2.userdata
echo     3.cache
echo     4.�Զ��������������
!cecho! {0F}{\n}
set /p weba= ��ѡ����Ҫ�ϲ��ľ��������:
if "%weba%"=="1" call :rawprogramimg system
if "%weba%"=="2" call :rawprogramimg userdata
if "%weba%"=="3" call :rawprogramimg cache
if "%weba%"=="4" goto rawprogramimg_custom
goto rawprogram_unsparse
:rawprogramimg
set rawprogram=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set rawprogram=" "%~dp0\*.xml"`) do %%a
bin\sparseimg2scatterwith.exe %rawprogram% %1
ren %1.raw %1.img >nul 2>nul
echo.
echo.
!cecho! {0C}      %1.img�ϲ���ɣ�{0F}{\n}
echo.
pause
goto home
:rawprogramimg_custom
echo.
echo.
echo.
!cecho! {0E}������������ƣ������������������˶�����Ű���Enter�س���ȷ�ϣ�{0F}{\n}
echo.
echo.
set /p partition=������Ҫ�ϲ��ķ������ƣ�Ӣ��Сд״̬���룩��
echo.
set rawprogramcustom=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set rawprogramcustom=" "%~dp0\*.xml"`) do %%a
bin\sparseimg2scatterwith.exe %rawprogramcustom% %partition%
ren %partition%.raw %partition%.img >nul 2>nul
echo.
echo.
!cecho! {0C}     %partition%�����ϲ���ɣ�{0F}{\n}
echo.
pause
goto home
:encryption_zip
echo.
!cecho! {0E}    ���ڵ���ѡ������������xxx.apk\xxx.zip��ˢ���ļ������½�λ�õ�ѡ���򿪡�ѡ��ɿ�ʼ%2...{0F}{\n}
echo.
set zipencryption=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set zipencryption=" "%~dp0\*.apk;*.zip"`) do %%a
bin\jre\bin\java -jar bin\ZipCenOp.jar %1 %zipencryption%
echo.
echo.
!cecho! {0C}      �ɹ�%2��{0F}{\n}
echo.
pause
goto home
:sign_zipapk
echo.
!cecho! {0E}    ���ڵ���ѡ������������xxx.%1��ʽ�Ŀ�ˢ���ļ������½�λ�õ�ѡ���򿪡�ѡ��ɿ�ʼǩ��...{0F}{\n}
echo.
set zipapk=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set zipapk=" "%~dp0\*.%1"`) do %%a
bin\jre\bin\java -jar bin\signapk.jar bin\testkey.x509.pem bin\testkey.pk8 %zipapk% %zipapk%_signed.%1
echo.
!cecho! {0C}      �ɹ�ǩ��%2��{0F}{\n}
echo.
pause
goto home
:others_unpack_repack
cls
!cecho! {0A} ==========================================================================={\n}"
echo.  
echo.                         ������ѡ����Ҫ�Ĺ��ܣ�
echo. 
echo  ===========================================================================
!cecho! {0E}{\n}
echo   1.��ͨ��ˢ���ֶξ���ϲ�
!cecho! {0D}{\n}
echo   2.qsb��ʽ���
!cecho! {0B}{\n}
echo   3.ozipת��zip��ʽ
!cecho! {0C}{\n}
echo   4.moto��system.img_sparsechunk�ֶθ�ʽ�ϲ�
!cecho! {0A}{\n}
echo   5.��Ϊupdate.app��ʽ���
!cecho! {0E}{\n}
echo   6.����LOGO��һ������
!cecho! {0D}{\n}
echo   7.�ֶ�dat�ϲ�\�ָ��
!cecho! {0B}{\n}
echo   8.�鿴�ں�kernel�汾��Ϣ
echo.
!cecho! {0C}  0.�ص�������ҳ{\n}
!cecho! {0F}{\n}
set /p webb=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webb%"=="1" goto rawprogram_unsparse
if "%webb%"=="2" goto qsb
if "%webb%"=="3" goto ozip2zip
if "%webb%"=="4" goto moto_sparsechunk
if "%webb%"=="5" goto unpack_app
if "%webb%"=="6" goto Logo_splash
if "%webb%"=="7" goto open_FileSplitter
if "%webb%"=="8" goto rootkernel
if "%webb%"=="0" goto home
goto others_unpack_repack
:unpack_app
rd /s /q huawei_app >nul 2>nul
md huawei_app
for /f "usebackq delims=" %%a in (`bin\FileToOpen.exe "set updateapp=" "%~dp0\*.app"`) do %%a
bin\unpackapp.exe -i %updateapp% -o huawei_app
!cecho! {0D} ��Ϊapp��ʽ�����ϣ�������ļ���huawei_appĿ¼����鿴��{0F}
echo.
pause
goto home
:qsb
set qsbunpack=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set qsbunpack=" "%~dp0\*.qsb"`) do %%a
!bootimg! --unpack-qsb %qsbunpack%
goto home
:moto_sparsechunk
del system.img >nul 2>nul
echo.
echo.
if not exist system.img_sparsechunk* (!cecho! {0E}����system.img_sparsechunk�ֶξ����Ƿ���ڣ�{0F} & echo. & echo. & pause & goto others_unpack_repack)
echo.
echo.
!cecho! {0D} ���ںϲ�����system.img �����ļ��У����Ժ�...{0F}
(for %%a in (system.img_sparsechunk*) do %wf%bin\sparse2img.exe %%a system.img ) 
echo.
echo.
if exist system.img (!cecho! {0E} �ϲ�system.img�ɹ���{0F} & echo. & echo. & pause & goto home)
:Logo_splash
echo.
echo.
echo.
!cecho! {0E}{\n}
echo   1.mtk������һ��logo.img/logo.bin�޸�
!cecho! {0D}{\n}
echo   2.��ͨ������һ��splash.img�޸�
echo.
!cecho! {0F}{\n}
set /p webb=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webb%"=="1" goto Logo
if "%webb%"=="2" goto splash
goto Logo_splash
:Logo
start bin\LogoBuilder1.6\LogoBuilder.exe
echo.
!cecho! {0D}  =================================================================================={\n}
!cecho! {0D}   �˹����ʺ�����logo.bin������һ���������з���һ���̶��Ĺ���Ŀ¼�������鿴���������logo����ͼƬ�������ļ���{\n}
!cecho! {0D}  =================================================================================={0F}{\n}
echo.
pause
goto home
:splash
attrib -r -h bin\pics >nul 2>nul
attrib -r -h bin\pics\logo.png >nul 2>nul
del splash_new.img >nul 2>nul
rd /s /q pics >nul 2>nul
md pics
copy bin\pics\logo.png pics\logo.png >nul 2>nul
if not exist "pics\logo.png" (
echo.
echo.
!cecho! {0E}      û�ҵ�picsĿ¼�ڵ�logo.png�ļ�����ȷ�Ϻ�ĸ���ߴ�Ŀ¼���Ƿ����logo.png�ļ���{0F}{\n}
echo.
echo.
echo.
pause
goto home
else
)
echo.
echo.
echo.
!cecho! {0E} Ĭ���޸�581x201�ߴ�ڵװ���Ӣ��GOOGLE��logo.png��������logo�ļ���Ϊsplash_new.img{0F}{\n}
echo.
!cecho! {0E} �����и����޸�����Ĳ������Լ�������Ļ�ֱ��ʳߴ�ͬ��logo.png���ǵ�picsĿ¼��logo.png{0F}{\n}
echo.
pause
bin\splash.exe pics\logo.png 
attrib +r +h bin\pics >nul 2>nul
rd /s /q pics >nul 2>nul
goto home
:open_FileSplitter
start bin\FileSplitter.exe
echo.
!cecho! {0D}  =================================================================================={\n}
!cecho! {0D}   �˹����ʺ�system.new.dat1   system.new.dat2   ...�ȵ���һ��ֶ�dat��ʽ�ָ�\�ϲ���{\n}
!cecho! {0D}  =================================================================================={0F}{\n}
echo.
pause
goto home
:ozip2zip
echo.
echo.
!cecho! {0A} ===================================================================================={\n}
!cecho! {0E}   ���ڵ�������ѡ��ozip��ʽ�ļ������½�λ�õ�ѡ���򿪡�ѡ��Զ�ozipת����zip��ʽ��{\n}
!cecho! {0A} ===================================================================================={0F}{\n}
set ozip=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set ozip=" "%~dp0\*.ozip"`) do %%a
bin\ozip2zip.exe %ozip%
echo.
!cecho! {0B}     ת����ϣ�{0F}{\n}
echo.
pause
goto home
:install_java
cls
!cecho! {0A}{\n}
echo  ******************************************************************************
echo.             ���ѣ�������java����Ҫ��������java��Ĭ�Ͼ���java������
echo.                   ����°�װjava8��Ϻ������������java��������!            
echo. 
echo. ******************************************************************************
!cecho! {0E}{\n}
echo   1.���²鿴java���°汾
!cecho! {0D}{\n}
echo   2.����java�������� (������Ϻ󽫻���֤���������Ƿ�������ȷ)
!cecho! {0B}{\n}
echo   0.�ص�������ҳ
!cecho! {0F}{\n}
echo.
set /p webaa=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webaa%"=="1" goto update_java8
if "%webaa%"=="2" goto java_adb_peizhi
if "%webaa%"=="3" goto install_Net_Framework_4.7
if "%webaa%"=="0" goto home
goto install_java
:java_adb_peizhi
attrib -r -h bin\AIHGTPATH >nul 2>nul
del bin\AIHGTPATH >nul 2>nul
call bin\patch.exe
echo.
echo.
!cecho! {0C}java version "1.8.0_231"{\n}
!cecho! {0C}Java(TM) SE Runtime Environment (build 1.8.0_231-b11){\n}
!cecho! {0C}Java HotSpot(TM) Client VM (build 25.231-b11, mixed mode){0F}{\n}
echo.
echo �����������У��java���������Ƿ������������������ʾ��ͬ��ʾjava��������������
echo.
pause
java -version
pause
goto home
:update_java8
start http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
goto home
:system_size_else
cls
if not exist bin\�Զ����ֽ��趨��ɾ1 goto custom_size1_img
if not exist bin\�Զ����ֽ��趨��ɾ2 goto custom_size2_img
if not exist bin\�Զ����ֽ��趨��ɾ3 goto custom_size3_img
if not exist bin\�Զ����ֽ��趨��ɾ4 goto custom_size4_img
if not exist bin\�Զ����ֽ��趨��ɾ5 goto custom_size5_img
if not exist bin\�Զ����ֽ��趨��ɾ6 goto custom_size6_img
if not exist bin\�Զ����С�趨��ɾ1 goto custom_size1_img
if not exist bin\�Զ����С�趨��ɾ2 goto custom_size2_img
if not exist bin\�Զ����С�趨��ɾ3 goto custom_size3_img
if not exist bin\�Զ����С�趨��ɾ4 goto custom_size4_img
if not exist bin\�Զ����С�趨��ɾ5 goto custom_size5_img
if not exist bin\�Զ����С�趨��ɾ6 goto custom_size6_img
for /f %%a in (bin\�Զ����ֽ��趨��ɾ1) do (set system_size1=%%a)
for /f %%a in (bin\�Զ����ֽ��趨��ɾ2) do (set system_size2=%%a)
for /f %%a in (bin\�Զ����ֽ��趨��ɾ3) do (set system_size3=%%a)
for /f %%a in (bin\�Զ����ֽ��趨��ɾ4) do (set system_size4=%%a)
for /f %%a in (bin\�Զ����ֽ��趨��ɾ5) do (set system_size5=%%a)
for /f %%a in (bin\�Զ����ֽ��趨��ɾ6) do (set system_size6=%%a)
for /f %%a in (bin\�Զ����С�趨��ɾ1) do (set system_sizeG1=%%a)
for /f %%a in (bin\�Զ����С�趨��ɾ2) do (set system_sizeG2=%%a)
for /f %%a in (bin\�Զ����С�趨��ɾ3) do (set system_sizeG3=%%a)
for /f %%a in (bin\�Զ����С�趨��ɾ4) do (set system_sizeG4=%%a)
for /f %%a in (bin\�Զ����С�趨��ɾ5) do (set system_sizeG5=%%a)
for /f %%a in (bin\�Զ����С�趨��ɾ6) do (set system_sizeG6=%%a)
rd /s /q "vendor\etc\device_features" >nul 2>nul
rd /s /q "system\app\miui" >nul 2>nul
rd /s /q "system\etc\device_features" >nul 2>nul
rd /s /q "system\priv-app\MiuiSystemUI" >nul 2>nul
rd /s /q "system\system\app\miui" >nul 2>nul
rd /s /q "system\system\etc\device_features" >nul 2>nul
rd /s /q "system\system\priv-app\MiuiSystemUI" >nul 2>nul
goto :eof
:system_size_set
attrib -r -h bin\�Զ����ֽ��趨��ɾ1 >nul 2>nul
attrib -r -h bin\�Զ����ֽ��趨��ɾ2 >nul 2>nul
attrib -r -h bin\�Զ����ֽ��趨��ɾ3 >nul 2>nul
attrib -r -h bin\�Զ����ֽ��趨��ɾ4 >nul 2>nul
attrib -r -h bin\�Զ����ֽ��趨��ɾ5 >nul 2>nul
attrib -r -h bin\�Զ����ֽ��趨��ɾ6 >nul 2>nul
attrib -r -h bin\�Զ����С�趨��ɾ1 >nul 2>nul
attrib -r -h bin\�Զ����С�趨��ɾ2 >nul 2>nul
attrib -r -h bin\�Զ����С�趨��ɾ3 >nul 2>nul
attrib -r -h bin\�Զ����С�趨��ɾ4 >nul 2>nul
attrib -r -h bin\�Զ����С�趨��ɾ5 >nul 2>nul
attrib -r -h bin\�Զ����С�趨��ɾ6 >nul 2>nul
del bin\�Զ����ֽ��趨��ɾ1
del bin\�Զ����ֽ��趨��ɾ2
del bin\�Զ����ֽ��趨��ɾ3
del bin\�Զ����ֽ��趨��ɾ4
del bin\�Զ����ֽ��趨��ɾ5
del bin\�Զ����ֽ��趨��ɾ6
del bin\�Զ����С�趨��ɾ1
del bin\�Զ����С�趨��ɾ2
del bin\�Զ����С�趨��ɾ3
del bin\�Զ����С�趨��ɾ4
del bin\�Զ����С�趨��ɾ5
del bin\�Զ����С�趨��ɾ6
goto :eof
:system_AIHGT_permissions_else
echo.
echo.
!cecho! {0C}  û�ҵ�system_AIHGT_permissions����ȷ�Ϻ�ĸĿ¼���Ƿ����system_AIHGT_permissions�ļ���{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:vendor_AIHGT_permissions_else
echo.
echo.
!cecho! {0C}  û�ҵ�vendor_AIHGT_permissions����ȷ�Ϻ�ĸĿ¼���Ƿ����vendor_AIHGT_permissions�ļ���{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:system_else
echo.
echo.
!cecho! {0C}  û�ҵ�system�ļ��У���ȷ�Ϻ�ĸĿ¼���Ƿ����system�ļ��е������ԡ�{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:vendor_else
echo.
echo.
!cecho! {0C}      û�ҵ�vendor�ļ��У���ȷ�Ϻ�ĸĿ¼���Ƿ����vendor�ļ��е������ԡ�{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:file_contexts_system_else
echo.
echo.
!cecho! {0C} ȱ��system_AIHGT_file_contexts����������޷�������һ��������{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:file_contexts_vendor_else
echo.
echo.
!cecho! {0C} ȱ��vendor_AIHGT_file_contexts����������޷�������һ��������{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:bootimg_else
echo.
echo.
!cecho! {0C}      ���麽ĸĿ¼���Ƿ����boot.img���޷�������һ��������{0F}{\n}
echo.
echo.
pause
goto eof
:system_build_else
echo.
echo.
!cecho! {0C}         systemĿ¼��û����build.prop��system������������!{0F}{\n}
echo.
echo.
pause
goto eof
:vendor_build_else
echo.
echo.
!cecho! {0C}         vendorĿ¼��û����build.prop��vendor������������!{0F}{\n}
echo.
echo.
pause
goto eof
:systemimg_else
echo.
echo.
!cecho! {0C}      û�ҵ�system.img����ȷ�Ϻ�ĸĿ¼���Ƿ����system.img��{0F}{\n}
echo.
echo.
pause
goto :eof
:vendorimg_else
echo.
echo.
!cecho! {0C}      û�ҵ�vendor.img����ȷ�Ϻ�ĸĿ¼���Ƿ����vendor.img��{0F}{\n}
echo.
echo.
pause
goto :eof
:custom_unpack
echo.
echo.
!cecho! {0B} ����ת�����,�ٶȿ���ȡ������ĵ�������,�����ĵȴ�...{0F}{\n}
echo.
echo.
goto :eof
:simg2img_systemimg_else
echo.
echo.
echo.����ת���ٷ�system.img���Ժ���鿴����ʾ�����ֽڴ�С
echo.
echo ��Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...
echo.
goto :eof
:simg2img_systemdat_else
echo.
echo.
echo.����ת���ٷ�system.new.dat��system.transfer.list
echo.�Ժ���鿴system.img.ext4���ļ������Լ��ɲ鿴�����ֽڴ�С
echo.
echo ��Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...
echo.
goto :eof
:simg2img_systembr_else
echo.
echo.
echo.����ת���ٷ�system.new.dat.br��system.transfer.list
echo.�Ժ���鿴system.img.ext4���ļ������Լ��ɲ鿴�����ֽڴ�С
echo.
echo ��Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...
echo.
goto :eof
:simg2img_vendorimg_else
echo.
echo.
echo.����ת���ٷ�vendor.img���Ժ���鿴����ʾ�����ֽڴ�С
echo.
echo ��Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...
echo.
goto :eof
:simg2img_vendordat_else
echo.
echo.
echo.����ת���ٷ�vendor.new.dat��vendor.transfer.list
echo.�Ժ���鿴vendor.img.ext4���ļ������Լ��ɲ鿴�����ֽڴ�С
echo.
echo ��Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...
echo.
goto :eof
:simg2img_vendorbr_else
echo.
echo.
echo.����ת���ٷ�vendor.new.dat.br��vendor.transfer.list
echo.�Ժ���鿴vendor.img.ext4���ļ������Լ��ɲ鿴�����ֽڴ�С
echo.
echo ��Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...
echo.
goto :eof
:systembr_make_else
echo.
echo.
echo �����ĵȴ������ڴ������system.new.dat.br��system.transfer.list  ...
echo.
echo ��Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...
echo.
goto :eof
:systemdat_make_else
echo.
echo.
echo �����ĵȴ������ڴ������system.new.dat��system.transfer.list  ...
echo.
echo ��Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...
echo.
goto :eof
:vendorbr_make_else
echo.
echo.
echo �����ĵȴ������ڴ������vendor.new.dat.br��vendor.transfer.list  ...
echo.
echo ��Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...
echo.
goto :eof
:vendordat_make_else
echo.
echo.
echo �����ĵȴ������ڴ������vendor.new.dat��vendor.transfer.list  ...
echo.
echo ��Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...
echo.
goto :eof
:systemimg_make_else
echo.
echo.
echo.
echo  ���ڴ������ext4����system.img������Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...
echo.
echo.
echo.
goto :eof
:vendorimg_make_else
echo.
echo.
echo.
echo  ���ڴ������ext4����vendor.img������Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...
echo.
echo.
echo.
goto :eof
:customimg_make_else
echo.
echo.
echo.
echo  ���ڴ������ext4����img������Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...
echo.
echo.
echo.
goto :eof
:systemdat_else
echo.
echo.
!cecho! {0C}      ���麽ĸĿ¼���Ƿ���ڹٷ�system.new.dat��system.transfer.list��{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:vendordat_else
echo.
echo.
!cecho! {0C}      ���麽ĸĿ¼���Ƿ���ڹٷ�vendor.new.dat��vendor.transfer.list��{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:systembr_else
echo.
echo.
!cecho! {0C}      ���麽ĸĿ¼���Ƿ���ڹٷ�system.new.dat.br��system.transfer.list��{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:vendorbr_else
echo.
echo.
!cecho! {0C}      ���麽ĸĿ¼���Ƿ���ڹٷ�vendor.new.dat.br��vendor.transfer.list��{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:looksize_system
echo.
echo.
set Dir=system
for /f "tokens=3* delims= " %%a in ('dir/a-d/s "%Dir%"^|findstr /c:"���ļ�"') do set looksize=%%~a
!cecho! {0E}  ��ǰ��ĸĿ¼��systemĿ¼�����ܴ�СΪ��{0C}%looksize:,=%{0E} �ֽ�{0F}{\n}
echo.
goto eof
:looksize_vendor
echo.
echo.
set Dir=vendor
for /f "tokens=3* delims= " %%a in ('dir/a-d/s "%Dir%"^|findstr /c:"���ļ�"') do set looksize=%%~a
!cecho! {0E}  ��ǰ��ĸĿ¼��vendorĿ¼�����ܴ�СΪ��{0C}%looksize:,=%{0E} �ֽ�{0F}{\n}
echo.
goto eof
:home_systemimg
ren system_AIHGT system >nul 2>nul
call :system_size_else
!cecho! {0A} ==============================================================================================={\n}
echo. 
echo    ʹ�����ʶ��systemΪ����Ŀ¼,ֱ�Ӵ�system�ļ��д����system.img 
echo. 
echo  ===============================================================================================
echo  ������Լ����͵Ĺٷ�system�����ֽڴ�Сѡ������ѡ��:
echo.
!cecho! {0E} 1.�����system.img��С(%system_size1% �ֽ�) %system_sizeG1% {0C}GB{\n}
!cecho! {0E} 2.�����system.img��С(%system_size2% �ֽ�) %system_sizeG2% {0C}GB{\n}
!cecho! {0E} 3.�����system.img��С(%system_size3% �ֽ�) %system_sizeG3% {0C}GB{\n}
echo.
!cecho! {0D} 4.�����system.img��С(%system_size4% �ֽ�) %system_sizeG4% {0C}GB{\n}
!cecho! {0D} 5.�����system.img��С(%system_size5% �ֽ�) %system_sizeG5% {0C}GB{\n}
!cecho! {0D} 6.�����system.img��С(%system_size6% �ֽ�) %system_sizeG6% {0C}GB{\n}
!cecho! {0B}{\n}
echo  7.ʹ�ú�ĸĿ¼��system_size.txt����Զ����������ֽڴ�С������Զ�����system.img��С
echo  8.�Զ���������������������Сext4���루������ʽ����img����
echo  9.�鿴�Լ����͹ٷ�system����������С�����Լ����͹ٷ�system.img����sparse image(imgѹ����ʽ)�����ļ����Ƶ�������Ŀ¼��
!cecho! {0C}{\n}
echo 10.���ݹٷ�system����������С�����������ROM��system�ļ�������system.img
echo    ǰ��:�����Լ����͹ٷ�system.img����sparse image(imgѹ����ʽ)�����ļ����Ƶ�������Ŀ¼��
echo.
!cecho! {0A}11.�����趨��ҳ��1-6ȫ��ѡ��������С{\n}
!cecho! {0A}12.�����趨��ҳ��1-6����ѡ��������С{\n}
!cecho! {0A} 0.�ص�������ҳ{\n}
!cecho! {0F}{\n}
echo.
echo.
set /p webc=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webc%"=="1" call :make_img %system_size1%
if "%webc%"=="2" call :make_img %system_size2%
if "%webc%"=="3" call :make_img %system_size3%
if "%webc%"=="4" call :make_img %system_size4%
if "%webc%"=="5" call :make_img %system_size5%
if "%webc%"=="6" call :make_img %system_size6%
if "%webc%"=="7" goto custom_system_img
if "%webc%"=="8" goto custom_arbitrarily_img
if "%webc%"=="9" goto look_systemimg_size
if "%webc%"=="10" goto looking_system_img_size_auto_make_new_img
if "%webc%"=="11" goto custom_settings_size_img
if "%webc%"=="12" goto custom_settings_size_img2
if "%webc%"=="0" goto home
goto home_systemimg
:custom_settings_size_img
call :system_size_set
goto home_systemimg
:custom_settings_size_img2
echo.
echo.
echo.
!cecho! {0B}====================================={\n}
!cecho! {0A}        1.ѡ��1��������С�趨{\n}
!cecho! {0A}        2.ѡ��2��������С�趨{\n}
echo.
!cecho! {0E}        3.ѡ��3��������С�趨{\n}
!cecho! {0E}        4.ѡ��4��������С�趨{\n}
echo.
!cecho! {0D}        5.ѡ��5��������С�趨{\n}
!cecho! {0D}        6.ѡ��6��������С�趨{\n}
!cecho! {0B}====================================={0F}{\n}"
echo.
set /p systemzize=-^-^> ��������Ҫ�����趨��ѡ��:
if "%systemzize%"=="1" goto custom_size_img1
if "%systemzize%"=="2" goto custom_size_img2
if "%systemzize%"=="3" goto custom_size_img3
if "%systemzize%"=="4" goto custom_size_img4
if "%systemzize%"=="5" goto custom_size_img5
if "%systemzize%"=="6" goto custom_size_img6
goto custom_settings_size_img2
:custom_size_img1
attrib -r -h bin\�Զ����С�趨��ɾ1 >nul 2>nul
del bin\�Զ����С�趨��ɾ1
goto custom_size1_img
:custom_size_img2
attrib -r -h bin\�Զ����С�趨��ɾ2 >nul 2>nul
del bin\�Զ����С�趨��ɾ2
goto custom_size2_img
:custom_size_img3
attrib -r -h bin\�Զ����С�趨��ɾ3 >nul 2>nul
del bin\�Զ����С�趨��ɾ3
goto custom_size3_img
:custom_size_img4
attrib -r -h bin\�Զ����С�趨��ɾ4 >nul 2>nul
del bin\�Զ����С�趨��ɾ4
goto custom_size4_img
:custom_size_img5
attrib -r -h bin\�Զ����С�趨��ɾ5 >nul 2>nul
del bin\�Զ����С�趨��ɾ5
goto custom_size5_img
:custom_size_img6
attrib -r -h bin\�Զ����С�趨��ɾ6 >nul 2>nul
del bin\�Զ����С�趨��ɾ6
goto custom_size6_img
:custom_sizesystem1_else
attrib -r -h bin\�Զ����ֽ��趨��ɾ1 >nul 2>nul
!cecho! {0C}������ѡ��1�����ֽڴ�С�������������֣����������趨:{\n}
set /p system_imgsize1=
echo %system_imgsize1%>bin\�Զ����ֽ��趨��ɾ1
powershell %system_imgsize1%d/1024/1024/1024>bin\�Զ����С�趨��ɾ1
attrib +r +h bin\�Զ����С�趨��ɾ1 >nul 2>nul
goto eof
:custom_sizesystem2_else
attrib -r -h bin\�Զ����ֽ��趨��ɾ2 >nul 2>nul
!cecho! {0C}������ѡ��2�����ֽڴ�С�������������֣����������趨:{\n}
set /p system_imgsize2=
echo %system_imgsize2%>bin\�Զ����ֽ��趨��ɾ2
powershell %system_imgsize2%d/1024/1024/1024>bin\�Զ����С�趨��ɾ2
attrib +r +h bin\�Զ����С�趨��ɾ2 >nul 2>nul
goto eof
:custom_sizesystem3_else
attrib -r -h bin\�Զ����ֽ��趨��ɾ3 >nul 2>nul
!cecho! {0C}������ѡ��3�����ֽڴ�С�������������֣����������趨:{\n}
set /p system_imgsize3=
echo %system_imgsize3%>bin\�Զ����ֽ��趨��ɾ3
powershell %system_imgsize3%d/1024/1024/1024>bin\�Զ����С�趨��ɾ3
attrib +r +h bin\�Զ����С�趨��ɾ3 >nul 2>nul
goto eof
:custom_sizesystem4_else
attrib -r -h bin\�Զ����ֽ��趨��ɾ4 >nul 2>nul
!cecho! {0C}������ѡ��4�����ֽڴ�С�������������֣����������趨:{\n}
set /p system_imgsize4=
echo %system_imgsize4%>bin\�Զ����ֽ��趨��ɾ4
powershell %system_imgsize4%d/1024/1024/1024>bin\�Զ����С�趨��ɾ4
attrib +r +h bin\�Զ����С�趨��ɾ4 >nul 2>nul
goto eof
:custom_sizesystem5_else
attrib -r -h bin\�Զ����ֽ��趨��ɾ5 >nul 2>nul
!cecho! {0C}������ѡ��5�����ֽڴ�С�������������֣����������趨:{\n}
set /p system_imgsize5=
echo %system_imgsize5%>bin\�Զ����ֽ��趨��ɾ5
powershell %system_imgsize5%d/1024/1024/1024>bin\�Զ����С�趨��ɾ5
attrib +r +h bin\�Զ����С�趨��ɾ5 >nul 2>nul
goto eof
:custom_sizesystem6_else
attrib -r -h bin\�Զ����ֽ��趨��ɾ6 >nul 2>nul
!cecho! {0C}������ѡ��6�����ֽڴ�С�������������֣����������趨:{\n}
set /p system_imgsize6=
echo %system_imgsize6%>bin\�Զ����ֽ��趨��ɾ6
powershell %system_imgsize6%d/1024/1024/1024>bin\�Զ����С�趨��ɾ6
attrib +r +h bin\�Զ����С�趨��ɾ6 >nul 2>nul
goto eof
:custom_size1_img
call :custom_sizesystem1_else
goto home_systemimg
:custom_size2_img
call :custom_sizesystem2_else
goto home_systemimg
:custom_size3_img
call :custom_sizesystem3_else
goto home_systemimg
:custom_size4_img
call :custom_sizesystem4_else
goto home_systemimg
:custom_size5_img
call :custom_sizesystem5_else
goto home_systemimg
:custom_size6_img
call :custom_sizesystem6_else
goto home_systemimg
:make_img
if not exist "system" (
call :system_else
goto home_systemimg
else
)
if not exist "system_AIHGT_permissions" (
call :system_AIHGT_permissions_else
goto home_systemimg
else
)
if not exist "system_AIHGT_file_contexts" (
call :file_contexts_system_else
goto home_systemimg
else
)
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %1 -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemimg & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemimg & else
)
goto home
:custom_arbitrarily_img
echo.
!cecho! {0E}    ���ڵ���ѡ����ʵ�_permissions�ļ����д����{0F}{\n}
echo.
set custom_permissions=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set custom_permissions=" "%~dp0\*_permissions"`) do %%a
echo.
!cecho! {0E}    ���ڵ���ѡ����ʵ�_file_contexts�ļ����д����{0F}{\n}
echo.
set custom_file_contexts=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set custom_file_contexts=" "%~dp0\*_file_contexts"`) do %%a
echo.
!cecho! {0E}ȷ��{0C}custom_AIHGT_permissions{0E}�ļ����ݶ�Ӧ��Ҫ����������ƣ������޷������{\n}
!cecho! {0E}������{0C}custom_AIHGT_permissions{0E}�ļ����611193563��ĸȺ��������{\n}
echo.
!cecho! {0E}��������ķ���������Ҫ{0C}file_contexts{0E}��Ӧ�ı������Ĵ���֧�֣������������������˶�����Ű���Enter�س���ȷ�ϣ�{0F}{\n}
echo.
echo.
set /p arbitrarily=������Ҫ����ķ������ƣ�Ӣ��Сд״̬���룩��
echo.
pause
!cecho! {0F}{\n}
if not exist "bin\�Զ����С������������ɾ" (
goto custom_arbitrarily_size_new
else
)
for /f %%a in (bin\�Զ����С������������ɾ) do (set arbitrarily_sizeo=%%a)
!cecho! {0F}     �ϴδ����������С�ֽ���:{0C}%arbitrarily_sizeo%{\n}
echo.
:custom_arbitrarily_img_begin
!cecho! {0B} ================================================{\n}
!cecho! {0E}  1.ʹ���ϴα����������С�ֽ�{0C}%arbitrarily_sizeo%{0E}���д��{\n}
!cecho! {0E}  2.�½�������С�ֽڴ��{\n}
!cecho! {0B} ================================================{0F}{\n}
echo.
set /p webfo=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webfo%"=="1" goto custom_arbitrarily_size
if "%webfo%"=="2" goto custom_arbitrarily_size_new
goto custom_arbitrarily_img_begin
:custom_arbitrarily_size
call :customimg_make_else
del %arbitrarily%.img 2>nul
!make_ext4fs! -S %custom_file_contexts% -X %custom_permissions% -l %arbitrarily_sizeo% -L %arbitrarily% -K vUA6spGTE7EuEd4H -a /%arbitrarily% %arbitrarily%.img %arbitrarily%
echo.
if not exist "%arbitrarily%.img" !cecho! {0C}      ��ĸĿ¼�ڲ����� %arbitrarily% ���Ŀ¼,�޷����д����{0F}{\n} & echo. & pause & goto home_systemimg & else
goto home
:custom_arbitrarily_size_new
attrib -r -h bin\�Զ����С������������ɾ >nul 2>nul
!cecho! �������Լ�����{0C}%arbitrarily%����{0F}�����ֽڴ�С:{\n}
set /p arbitrarily_sizeo=
echo %arbitrarily_sizeo%>bin\�Զ����С������������ɾ
attrib +r +h bin\�Զ����С������������ɾ >nul 2>nul
goto custom_arbitrarily_size
:custom_system_img
if not exist "system" (
call :system_else
goto home_systemimg
else
)
if not exist "system_AIHGT_permissions" (
call :system_AIHGT_permissions_else
goto home_systemimg
else
)
if not exist "system_AIHGT_file_contexts" (
call :file_contexts_system_else
goto home_systemimg
else
)
call :looksize_system
if not exist bin\�Զ����С���system������ɾ goto custom_size_img
for /f %%a in (bin\�Զ����С���system������ɾ) do (set system_size=%%a)
if not exist system_size.txt goto custom_size_img
for /f %%a in (system_size.txt) do (set system2size=%%a)
:build_api_system_custom_begin
!cecho! {0B} ==========================================================={\n}
!cecho! {0E}  1.ʹ�ú�ĸĿ¼��system_size.txt����{0C}%system2size%{0E}�ֽ��������{\n}
!cecho! {0E}  2.ʹ���ϴα����������С�ֽ�{0C}%system_size%{0E}���д��{\n}
!cecho! {0E}  3.�½�������С�ֽڴ��{\n}
!cecho! {0B} ==========================================================={0F}{\n}
echo.
set /p webh=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webh%"=="1" goto record_system_size
if "%webh%"=="2" goto custom_system_size_start
if "%webh%"=="3" goto custom_size_img
goto build_api_system_custom_begin
:custom_system_size_start
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %system_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemimg & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemimg & else
)
goto home
:custom_size_img
attrib -r -h bin\�Զ����С���system������ɾ >nul 2>nul
!cecho! �������Լ�����{0C}�ٷ�system����{0F}�����ֽڴ�С:{\n}
set /p system_size=
echo %system_size%>bin\�Զ����С���system������ɾ
attrib +r +h bin\�Զ����С���system������ɾ >nul 2>nul
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %system_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemimg & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemimg & else
)
goto home
:record_system_size
if not exist system_size.txt call :not_system_size
for /f %%a in (system_size.txt) do (set system_size=%%a)
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %system_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemimg & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemimg & else
)
goto home
:not_system_size
echo.
echo û�ҵ�system_size.txt
echo.
echo �����������ֽڴ��:
set /p system_size=
echo %system_size%>system_size.txt
goto eof
:not_vendor_size
echo.
echo û�ҵ�vendor_size.txt
echo.
echo �����������ֽڴ��:
set /p vendor_size=
echo %vendor_size%>vendor_size.txt
goto eof
:look_systemimg_else
echo.
echo.
!cecho! {0C}      û�ҵ��ٷ�system.img��sparse image(imgѹ����ʽ)������ȷ�Ϻ�ĸĿ¼���Ƿ���ڹٷ�system.img��{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:look_systemimg_size
if not exist "system.img" (
call :look_systemimg_else
goto home_systemimg
else
)
call :simg2img_systemimg_else
!simg2img! system.img system_ext4.img >nul 2>nul
echo.
for /f "delims=" %%i in ('dir /a-d /b system_ext4.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system_ext4.img) do (
if %%~za==0 del %~dp0\system_ext4.img
)
if not exist "%~dp0\system_ext4.img" goto looking_systemimg_size1
if exist "%~dp0\system_ext4.img" goto looking_systemimg_size2
:looking_systemimg_size1
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
!cecho! %%i:�ٷ�system�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
)
pause
del system_ext4.img 2>nul
goto home
:looking_systemimg_size2
for /f "delims=" %%i in ('dir /a-d /b system_ext4.img') do (
!cecho! %%i:�ٷ�system�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
)
pause
del system_ext4.img 2>nul
goto home
:looking_system_img_size_auto_make_new_img
if not exist "system.img" (
call :look_systemimg_else
goto home_systemimg
else
)
if not exist "system" (
call :system_else
goto home_systemimg
else
)
if not exist "system_AIHGT_permissions" (
call :system_AIHGT_permissions_else
goto home_systemimg
else
)
if not exist "system_AIHGT_file_contexts" (
call :file_contexts_system_else
goto home_systemimg
else
)
call :simg2img_systemimg_else
!simg2img! system.img system_ext4.img
echo.
for /f "delims=" %%i in ('dir /a-d /b system_ext4.img') do (
!cecho! %%i:�ٷ�system�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
set ext4imgsizea=%%~zi
)
echo.
for /r %~dp0 %%a in (system_ext4.img) do (
if %%~za==0 del %~dp0\system_ext4.img
)
if not exist "%~dp0\system_ext4.img" goto Return
if exist "%~dp0\system_ext4.img" goto Continue
:Return
del system_ext4.img 2>nul
echo.
echo.
!cecho! {0C}  ��⵽��ǰsystem.imgΪext4���룬��ȷ���Ƿ�Ϊ�ٷ�system.img������������������ٷ���С�����޷�ˢ��{0F}{\n}
pause
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
!cecho! %%i:�ٷ�system�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
set ext4imgsizea=%%~zi
)
goto Continue
:Continue
call :systemimg_make_else
del system_ext4.img 2>nul
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %ext4imgsizea% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemimg & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemimg & else
)
goto home
:home_systemdat
ren system_AIHGT system >nul 2>nul
call :system_size_else
!cecho! {0A} ====================================================================================================={\n}
echo.
echo.    ʹ�����ʶ��systemΪ����Ŀ¼,ֱ�Ӵ�system�ļ��д����system.new.dat��system.transfer.list
echo.
echo. =====================================================================================================
!cecho!  {0A} ������Լ����͵Ĺٷ�system�����ֽڴ�Сѡ������ѡ��:{\n}
!cecho! {0E}{\n}
!cecho! {0E}  1.�����system.new.dat��system.transfer.list��С (%system_size1% �ֽ�) %system_sizeG1% {0C}GB{\n}
!cecho! {0E}  2.�����system.new.dat��system.transfer.list��С (%system_size2% �ֽ�) %system_sizeG2% {0C}GB{\n}
!cecho! {0E}  3.�����system.new.dat��system.transfer.list��С (%system_size3% �ֽ�) %system_sizeG3% {0C}GB{\n}
!cecho! {0D}{\n}
!cecho! {0D}  4.�����system.new.dat��system.transfer.list��С (%system_size4% �ֽ�) %system_sizeG4% {0C}GB{\n}
!cecho! {0D}  5.�����system.new.dat��system.transfer.list��С (%system_size5% �ֽ�) %system_sizeG5% {0C}GB{\n}
!cecho! {0D}  6.�����system.new.dat��system.transfer.list��С (%system_size6% �ֽ�) %system_sizeG6% {0C}GB{\n}
!cecho! {0B} {\n}
echo   7.ʹ�ú�ĸĿ¼��system_size.txt����Զ����������ֽڴ�С������Զ�����system.new.dat��system.transfer.list��С
echo   8.�鿴�ٷ�system����������С����ȡ�ٷ�system.new.dat��system.transfer.list���Ƶ�������Ŀ¼��
!cecho! {0C}{\n}
!cecho! {0C}  9.���ݹٷ�system����������С�����������ROM��systemĿ¼����system.new.dat��system.transfer.list{\n}
!cecho! {0C}    ǰ��:����ȡ�ٷ�system.new.dat��system.transfer.list���Ƶ�������Ŀ¼��{\n}
!cecho! {0A}{\n}
echo  10.�����趨��ҳ��1-6ȫ��ѡ��������С
echo  11.�����趨��ҳ��1-6����ѡ��������С
echo   0.�ص�������ҳ
!cecho! {0F}{\n}
echo.
set /p webj=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webj%"=="1" call :make_dat %system_size1%
if "%webj%"=="2" call :make_dat %system_size2%
if "%webj%"=="3" call :make_dat %system_size3%
if "%webj%"=="4" call :make_dat %system_size4%
if "%webj%"=="5" call :make_dat %system_size5%
if "%webj%"=="6" call :make_dat %system_size6%
if "%webj%"=="7" goto custom_system_dat
if "%webj%"=="8" goto looking_systemdat_size
if "%webj%"=="9" goto looking_system_size_to_make_new_dat
if "%webj%"=="10" goto custom_settings_size_dat
if "%webj%"=="11" goto custom_settings_size_dat2
if "%webj%"=="0" goto home
goto home_systemdat
:custom_settings_size_dat
call :system_size_set
goto home_systemdat
:custom_settings_size_dat2
echo.
echo.
echo.
!cecho! {0B}====================================={\n}
!cecho! {0A}        1.ѡ��1��������С�趨{\n}
!cecho! {0A}        2.ѡ��2��������С�趨{\n}
echo.
!cecho! {0E}        3.ѡ��3��������С�趨{\n}
!cecho! {0E}        4.ѡ��4��������С�趨{\n}
echo.
!cecho! {0D}        5.ѡ��5��������С�趨{\n}
!cecho! {0D}        6.ѡ��6��������С�趨{\n}
!cecho! {0B}====================================={0F}{\n}"
echo.
set /p systemzize=-^-^> ��������Ҫ�����趨��ѡ��:
if "%systemzize%"=="1" goto custom_size_dat1
if "%systemzize%"=="2" goto custom_size_dat2
if "%systemzize%"=="3" goto custom_size_dat3
if "%systemzize%"=="4" goto custom_size_dat4
if "%systemzize%"=="5" goto custom_size_dat5
if "%systemzize%"=="6" goto custom_size_dat6
goto custom_settings_size_dat2
:custom_size_dat1
attrib -r -h bin\�Զ����С�趨��ɾ1 >nul 2>nul
del bin\�Զ����С�趨��ɾ1
goto custom_size1_dat
:custom_size_dat2
attrib -r -h bin\�Զ����С�趨��ɾ2 >nul 2>nul
del bin\�Զ����С�趨��ɾ2
goto custom_size2_dat
:custom_size_dat3
attrib -r -h bin\�Զ����С�趨��ɾ3 >nul 2>nul
del bin\�Զ����С�趨��ɾ3
goto custom_size3_dat
:custom_size_dat4
attrib -r -h bin\�Զ����С�趨��ɾ4 >nul 2>nul
del bin\�Զ����С�趨��ɾ4
goto custom_size4_dat
:custom_size_dat5
attrib -r -h bin\�Զ����С�趨��ɾ5 >nul 2>nul
del bin\�Զ����С�趨��ɾ5
goto custom_size5_dat
:custom_size_dat6
attrib -r -h bin\�Զ����С�趨��ɾ6 >nul 2>nul
del bin\�Զ����С�趨��ɾ6
goto custom_size6_dat
:custom_size1_dat
call :custom_sizesystem1_else
goto home_systemdat
:custom_size2_dat
call :custom_sizesystem2_else
goto home_systemdat
:custom_size3_dat
call :custom_sizesystem3_else
goto home_systemdat
:custom_size4_dat
call :custom_sizesystem4_else
goto home_systemdat
:custom_size5_dat
call :custom_sizesystem5_else
goto home_systemdat
:custom_size6_dat
call :custom_sizesystem6_else
goto home_systemdat
:make_dat
if not exist "system_AIHGT_permissions" (
call :system_AIHGT_permissions_else
goto home_systemdat
else
)
if not exist "system_AIHGT_file_contexts" (
call :file_contexts_system_else
goto home_systemdat
else
)
if not exist "system" (
call :system_else
goto home_systemdat
else
)
if not exist "system\system" (
goto :make_systemdat
else
)
if not exist "system\system\build.prop" (
call :system_build_else
else
)
FOR /f "tokens=1* delims==" %%a IN ('type "system\system\build.prop"') DO (
	if /I "%%~a"=="ro.build.version.sdk" (
		if not "%%~b"=="%api%" (
			set api=%%~b
			)
		)
	)
)
goto build_api_systemdat
:make_systemdat
if not exist "system\build.prop" (
call :system_build_else
goto home
else
)
FOR /f "tokens=1* delims==" %%a IN ('type "system\build.prop"') DO (
	if /I "%%~a"=="ro.build.version.sdk" (
		if not "%%~b"=="%api%" (
			set api=%%~b
			)
		)
	)
)
goto build_api_systemdat
:build_api_systemdat
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %1 -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemdat & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemdat & else
)
echo.
if not exist "system.img" (
call :systemimg_else
goto home_systemdat
else
)
call :systemdat_make_else
rd /s /q bin\cache >nul 2>nul
md bin\cache >nul 2>nul
echo ������ͣ��ת����... & !raw2simg! system.img bin\cache\system_simg.img >nul 2>nul
goto makedat_systemimg
:makedat_systemimg
if %api%==21 (call :makedat_systemimg_v1-4 1)
if %api%==22 (call :makedat_systemimg_v1-4 2)
if %api%==23 (call :makedat_systemimg_v1-4 3)
if %api% GEQ 24 (call :makedat_systemimg_v1-4 4)
:makedat_systemimg_v1-4
!simg2sdat! bin\cache\system_simg.img -v %1
goto home
:makedat_systemsimg
if %api%==21 (call :makedat_systemsimg_v1-4 1)
if %api%==22 (call :makedat_systemsimg_v1-4 2)
if %api%==23 (call :makedat_systemsimg_v1-4 3)
if %api% GEQ 24 (call :makedat_systemsimg_v1-4 4)
:makedat_systemsimg_v1-4
!simg2sdat! system.img -v %1
goto home
:custom_system_dat
if not exist "system_AIHGT_file_contexts" (
call :file_contexts_system_else
goto home_systemimg
else
)
if not exist "system_AIHGT_permissions" (
call :system_AIHGT_permissions_else
goto home_systemdat
else
)
if not exist "system" (
call :system_else
goto home_systemdat
else
)
if not exist "system\system" (
goto :custom_make_systemdat
else
)
echo.
if not exist "system\system\build.prop" (
call :system_build_else
else
)
FOR /f "tokens=1* delims==" %%a IN ('type "system\system\build.prop"') DO (
	if /I "%%~a"=="ro.build.version.sdk" (
		if not "%%~b"=="%api%" (
			set api=%%~b
			)
		)
	)
)
goto build_api_custom_systemdat
:custom_make_systemdat
if not exist "system\build.prop" (
call :system_build_else
goto home
else
)
FOR /f "tokens=1* delims==" %%a IN ('type "system\build.prop"') DO (
	if /I "%%~a"=="ro.build.version.sdk" (
		if not "%%~b"=="%api%" (
			set api=%%~b
			)
		)
	)
)
goto build_api_custom_systemdat
:build_api_custom_systemdat
call :looksize_system
if not exist bin\�Զ����С���system������ɾ goto custom_size_dat
for /f %%a in (bin\�Զ����С���system������ɾ) do (set dat_size=%%a)
if not exist system_size.txt goto custom_size_dat
for /f %%a in (system_size.txt) do (set dat2size=%%a)
:build_api_custom_system_make_dat_begin
!cecho! {0B} ==========================================================={\n}
!cecho! {0E}  1.ʹ�ú�ĸĿ¼��system_size.txt����{0C}%dat2size%{0E}�ֽ��������{\n}
!cecho! {0E}  2.ʹ���ϴα����������С�ֽ�{0C}%dat_size%{0E}���д��{\n}
!cecho! {0E}  3.�½�������С�ֽڴ��{\n}
!cecho! {0B} ==========================================================={0F}{\n}
echo.
set /p webm=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webm%"=="1" goto record_system_size_dat
if "%webm%"=="2" goto custom_dat_size_start
if "%webm%"=="3" goto custom_size_dat
goto build_api_custom_system_make_dat_begin
:custom_dat_size_start
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %dat_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemdat & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemdat & else
)
goto systemimg_to_dat
:custom_size_dat
attrib -r -h bin\�Զ����С���system������ɾ >nul 2>nul
!cecho! �������Լ�����{0C}�ٷ�system����{0F}�����ֽڴ�С:{\n}
set /p dat_size=
echo %dat_size%>bin\�Զ����С���system������ɾ
attrib +r +h bin\�Զ����С���system������ɾ >nul 2>nul
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %dat_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemdat & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemdat & else
)
goto systemimg_to_dat
:record_system_size_dat
if not exist system_size.txt call :not_system_size
for /f %%a in (system_size.txt) do (set system_size=%%a)
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %dat_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemdat & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemdat & else
)
goto systemimg_to_dat
:looking_systemdat_size
if not exist "system.new.dat""system.transfer.list" (
call :systemdat_else
goto home_systemdat
else
)
call :simg2img_systemimg_else
del system.img.ext4 2>nul
!sdat2img! system.transfer.list system.new.dat system.img.ext4
echo.
for /f "delims=" %%i in ('dir /a-d /b system.img.ext4') do (
!cecho! %%i:�ٷ�system�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
)
pause
del system.img.ext4 2>nul
goto home_systemdat
:looking_system_size_to_make_new_dat
if not exist "system_AIHGT_file_contexts" (
call :file_contexts_system_else
goto home_systemimg
else
)
if not exist "system_AIHGT_permissions" (
call :system_AIHGT_permissions_else
goto home_systemdat
else
)
if not exist "system.new.dat" (
call :systemdat_else
goto home_systemdat
else
)
if not exist "system.transfer.list" (
call :systemdat_else
goto home_systemdat
else
)
if not exist "system" (
call :system_else
goto home_systemdat
else
)
if not exist "system\system" (
goto :looking_make_systemdat
else
)
echo.
if not exist "system\system\build.prop" (
call :system_build_else
else
)
FOR /f "tokens=1* delims==" %%a IN ('type "system\system\build.prop"') DO (
	if /I "%%~a"=="ro.build.version.sdk" (
		if not "%%~b"=="%api%" (
			set api=%%~b
			)
		)
	)
)
goto build_looking_api_systemdat
:looking_make_systemdat
if not exist "system\build.prop" (
call :system_build_else
goto home
else
)
FOR /f "tokens=1* delims==" %%a IN ('type "system\build.prop"') DO (
	if /I "%%~a"=="ro.build.version.sdk" (
		if not "%%~b"=="%api%" (
			set api=%%~b
			)
		)
	)
)
goto build_looking_api_systemdat
:build_looking_api_systemdat
call :simg2img_systemimg_else
del system.img.ext4 2>nul
!sdat2img! system.transfer.list system.new.dat system.img.ext4
echo.
for /f "delims=" %%i in ('dir /a-d /b system.img.ext4') do (
!cecho! %%i:�ٷ�system�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
set ext4imgage2sizec=%%~zi
)
call :systemimg_make_else
del system.img.ext4 2>nul
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %ext4imgage2sizec% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemdat & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systemdat & else
)
goto systemimg_to_dat
:systemimg_to_dat
if not exist "system.img" (
call :systemimg_else
goto home
else
)
echo.
rd /s /q bin\cache >nul 2>nul
md bin\cache >nul 2>nul
del raw2simg.exe.stackdump >nul 2>nul
echo ������ͣ��ת����... & !raw2simg! system.img bin\cache\system_simg.img >nul 2>nul
if exist "raw2simg.exe.stackdump" (
echo.
del raw2simg.exe.stackdump >nul 2>nul
goto makedat_systemsimg
else
)
goto makedat_systemimg
goto home
:vendorimg_to_datbr
if not exist "vendor.img" (
call :vendorimg_else
goto home
else
)
echo.
call bin\makebr_vendor.bat
goto home
:home_systembr
ren system_AIHGT system >nul 2>nul
call :system_size_else
!cecho! {0A} ====================================================================================================={\n}
echo.
echo.    ʹ�����ʶ��systemΪ����Ŀ¼,ֱ�Ӵ�vendor�ļ��д����system.new.dat.br��system.transfer.list
echo.       
echo. =====================================================================================================
!cecho!  {0A} ������Լ����͵Ĺٷ�system�����ֽڴ�Сѡ������ѡ��:{\n}
!cecho! {0E}{\n}
!cecho! {0E}  1.�����system.new.dat.br��system.transfer.list��С (%system_size1% �ֽ�) %system_sizeG1% {0C}GB{\n}
!cecho! {0E}  2.�����system.new.dat.br��system.transfer.list��С (%system_size2% �ֽ�) %system_sizeG2% {0C}GB{\n}
!cecho! {0E}  3.�����system.new.dat.br��system.transfer.list��С (%system_size3% �ֽ�) %system_sizeG3% {0C}GB{\n}
!cecho! {0D}{\n}
!cecho! {0D}  4.�����system.new.dat.br��system.transfer.list��С (%system_size4% �ֽ�) %system_sizeG4% {0C}GB{\n}
!cecho! {0D}  5.�����system.new.dat.br��system.transfer.list��С (%system_size5% �ֽ�) %system_sizeG5% {0C}GB{\n}
!cecho! {0D}  6.�����system.new.dat.br��system.transfer.list��С (%system_size6% �ֽ�) %system_sizeG6% {0C}GB{\n}
!cecho! {0B}{\n}
echo   7.ʹ�ú�ĸĿ¼��system_size.txt����Զ����������ֽڴ�С������Զ�����system.new.dat.br��system.transfer.list
echo   8.�鿴�ٷ�system����������С����ȡ�ٷ�system.new.dat.br��system.transfer.list���Ƶ�������Ŀ¼��
!cecho! {0C}{\n}
echo   9.���ݹٷ�system����������С�����������ROM��systemĿ¼����system.new.dat.br��system.transfer.list
echo     ǰ��:����ȡ�ٷ�system.new.dat.br��system.transfer.list���Ƶ�������Ŀ¼��
!cecho! {0A}{\n}
echo  10.�����趨��ҳ��1-6ȫ��ѡ��������С
echo  11.�����趨��ҳ��1-6����ѡ��������С
echo   0.�ص�������ҳ
!cecho! {0F}{\n}
echo.
set /p webbr=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webbr%"=="1" call :make_br %system_size1%
if "%webbr%"=="2" call :make_br %system_size2%
if "%webbr%"=="3" call :make_br %system_size3%
if "%webbr%"=="4" call :make_br %system_size4%
if "%webbr%"=="5" call :make_br %system_size5%
if "%webbr%"=="6" call :make_br %system_size6%
if "%webbr%"=="7" goto custom_system_br
if "%webbr%"=="8" goto looking_systembr_size
if "%webbr%"=="9" goto looking_system_size_to_make_new_br
if "%webbr%"=="10" goto custom_settings_size_br
if "%webbr%"=="11" goto custom_settings_size_br2
if "%webbr%"=="0" goto home
goto home_systembr
:custom_settings_size_br
call :system_size_set
goto home_systemdat
:custom_settings_size_br2
echo.
echo.
echo.
!cecho! {0B}====================================={\n}
!cecho! {0A}        1.ѡ��1��������С�趨{\n}
!cecho! {0A}        2.ѡ��2��������С�趨{\n}
echo.
!cecho! {0E}        3.ѡ��3��������С�趨{\n}
!cecho! {0E}        4.ѡ��4��������С�趨{\n}
echo.
!cecho! {0D}        5.ѡ��5��������С�趨{\n}
!cecho! {0D}        6.ѡ��6��������С�趨{\n}
!cecho! {0B}====================================={0F}{\n}
echo.
set /p systembrzize=-^-^> ��������Ҫ�����趨��ѡ��:
if "%systembrzize%"=="1" goto custom_size_br1
if "%systembrzize%"=="2" goto custom_size_br2
if "%systembrzize%"=="3" goto custom_size_br3
if "%systembrzize%"=="4" goto custom_size_br4
if "%systembrzize%"=="5" goto custom_size_br5
if "%systembrzize%"=="6" goto custom_size_br6
goto custom_settings_size_dat2
:custom_size_br1
attrib -r -h bin\�Զ����С�趨��ɾ1 >nul 2>nul
del bin\�Զ����С�趨��ɾ1
goto custom_size1_br
:custom_size_br2
attrib -r -h bin\�Զ����С�趨��ɾ2 >nul 2>nul
del bin\�Զ����С�趨��ɾ2
goto custom_size2_br
:custom_size_br3
attrib -r -h bin\�Զ����С�趨��ɾ3 >nul 2>nul
del bin\�Զ����С�趨��ɾ3
goto custom_size3_br
:custom_size_br4
attrib -r -h bin\�Զ����С�趨��ɾ4 >nul 2>nul
del bin\�Զ����С�趨��ɾ4
goto custom_size4_br
:custom_size_br5
attrib -r -h bin\�Զ����С�趨��ɾ5 >nul 2>nul
del bin\�Զ����С�趨��ɾ5
goto custom_size5_br
:custom_size_br6
attrib -r -h bin\�Զ����С�趨��ɾ6 >nul 2>nul
del bin\�Զ����С�趨��ɾ6
goto custom_size6_br
:custom_size1_br
call :custom_sizesystem1_else
goto home_systembr
:custom_size2_br
call :custom_sizesystem2_else
goto home_systembr
:custom_size3_br
call :custom_sizesystem3_else
goto home_systembr
:custom_size4_br
call :custom_sizesystem4_else
goto home_systembr
:custom_size5_br
call :custom_sizesystem5_else
goto home_systembr
:custom_size6_br
call :custom_sizesystem6_else
goto home_systembr
:make_br
if not exist "system_AIHGT_file_contexts" (
call :file_contexts_system_else
goto home_systembr
else
)
if not exist "system_AIHGT_permissions" (
call :system_AIHGT_permissions_else
goto home_systembr
else
)
if not exist "system" (
call :system_else
goto home_systembr
else
)
if not exist "system\system" (
goto :make_systembr
else
)
echo.
if not exist "system\system\build.prop" (
call :system_build_else
else
)
FOR /f "tokens=1* delims==" %%a IN ('type "system\system\build.prop"') DO (
	if /I "%%~a"=="ro.build.version.sdk" (
		if not "%%~b"=="%api%" (
			set api=%%~b
			)
		)
	)
)
goto build_api_systembr
:make_systembr
if not exist "system\build.prop" (
call :system_build_else
goto home
else
)
FOR /f "tokens=1* delims==" %%a IN ('type "system\build.prop"') DO (
	if /I "%%~a"=="ro.build.version.sdk" (
		if not "%%~b"=="%api%" (
			set api=%%~b
			)
		)
	)
)
goto build_api_systembr
:build_api_systembr
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %1 -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systembr & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systembr & else
)
echo.
if not exist "system.img" (
call :systemimg_else
goto home_systembr
else
)
call :systemdat_make_else
rd /s /q bin\cache >nul 2>nul
md bin\cache >nul 2>nul
echo ������ͣ��ת����... & !raw2simg! system.img bin\cache\system_simg.img >nul 2>nul
goto makebr_systemimg
:custom_system_br
if not exist "system_AIHGT_file_contexts" (
call :file_contexts_system_else
goto home_systembr
else
)
if not exist "system_AIHGT_permissions" (
call :system_AIHGT_permissions_else
goto home_systembr
else
)
if not exist "system" (
call :system_else
goto home_systembr
else
)
if not exist "system\system" (
goto :custom_make_systembr
else
)
echo.
if not exist "system\system\build.prop" (
call :system_build_else
else
)
FOR /f "tokens=1* delims==" %%a IN ('type "system\system\build.prop"') DO (
	if /I "%%~a"=="ro.build.version.sdk" (
		if not "%%~b"=="%api%" (
			set api=%%~b
			)
		)
	)
)
goto build_api_custom_systembr
:custom_make_systembr
if not exist "system\build.prop" (
call :system_build_else
goto home
else
)
FOR /f "tokens=1* delims==" %%a IN ('type "system\build.prop"') DO (
	if /I "%%~a"=="ro.build.version.sdk" (
		if not "%%~b"=="%api%" (
			set api=%%~b
			)
		)
	)
)
goto build_api_custom_systembr
:build_api_custom_systembr
call :looksize_system
if not exist bin\�Զ����С���system������ɾ goto custom_size_br
for /f %%a in (bin\�Զ����С���system������ɾ) do (set br_size=%%a)
if not exist system_size.txt goto custom_size_br
for /f %%a in (system_size.txt) do (set br2size=%%a)
:build_api_custom_system_br_begin
!cecho! {0B} ==========================================================={\n}
!cecho! {0E}  1.ʹ�ú�ĸĿ¼��system_size.txt����{0C}%br2size%{0E}�ֽ��������{\n}
!cecho! {0E}  2.ʹ���ϴα����������С�ֽ�{0C}%br_size%{0E}���д��{\n}
!cecho! {0E}  3.�½�������С�ֽڴ��{\n}
!cecho! {0B} ==========================================================={0F}{\n}
echo.
set /p webmbr=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webmbr%"=="1" goto record_system_size_br
if "%webmbr%"=="2" goto custom_br_size_start
if "%webmbr%"=="3" goto custom_size_br
goto build_api_custom_system_br_begin
:custom_br_size_start
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %br_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systembr & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systembr & else
)
goto systemimg_to_datbr
:custom_size_br
attrib -r -h bin\�Զ����С���system������ɾ >nul 2>nul
!cecho! �������Լ�����{0C}�ٷ�system����{0F}�����ֽڴ�С:{\n}
set /p br_size=
echo %br_size%>bin\�Զ����С���system������ɾ
attrib +r +h bin\�Զ����С���system������ɾ >nul 2>nul
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %br_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systembr & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systembr & else
)
goto systemimg_to_datbr
:record_system_size_br
if not exist system_size.txt call :not_system_size
for /f %%a in (system_size.txt) do (set system_size=%%a)
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %br_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systembr & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systembr & else
)
goto systemimg_to_datbr
:looking_systembr_size
if not exist "system.new.dat.br" (
call :systemdat_else
goto home_systembr
else
)
if not exist "system.transfer.list" (
call :systemdat_else
goto home_systembr
else
)
call :simg2img_systemdat_else
del system.img.ext4 2>nul
del system.new.dat 2>nul
!dat2br! -d -o system.new.dat system.new.dat.br
!sdat2img! system.transfer.list system.new.dat system.img.ext4
echo.
for /f "delims=" %%i in ('dir /a-d /b system.img.ext4') do (
!cecho! %%i:�ٷ�system�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
)
pause
del system.img.ext4 2>nul
goto home_systembr
:looking_system_size_to_make_new_br
if not exist "system_AIHGT_file_contexts" (
call :file_contexts_system_else
goto home_systembr
else
)
if not exist "system_AIHGT_permissions" (
call :system_AIHGT_permissions_else
goto home_systembr
else
)
if not exist "system.new.dat.br" (
call :systembr_else
goto home_systembr
else
)
if not exist "system.transfer.list" (
call :systembr_else
goto home_systembr
else
)
if not exist "system" (
call :system_else
goto home_systembr
else
)
if not exist "system\system" (
goto :looking_make_systembr
else
)
echo.
if not exist "system\system\build.prop" (
call :system_build_else
else
)
FOR /f "tokens=1* delims==" %%a IN ('type "system\system\build.prop"') DO (
	if /I "%%~a"=="ro.build.version.sdk" (
		if not "%%~b"=="%api%" (
			set api=%%~b
			)
		)
	)
)
goto build_api_looking_systembr
:looking_make_systembr
if not exist "system\build.prop" (
call :system_build_else
goto home
else
)
FOR /f "tokens=1* delims==" %%a IN ('type "system\build.prop"') DO (
	if /I "%%~a"=="ro.build.version.sdk" (
		if not "%%~b"=="%api%" (
			set api=%%~b
			)
		)
	)
)
goto build_api_looking_systembr
:build_api_looking_systembr
call :simg2img_systembr_else
del system.img.ext4 2>nul
del system.new.dat 2>nul
!dat2br! -d -o system.new.dat system.new.dat.br
!sdat2img! system.transfer.list system.new.dat system.img.ext4
echo.
for /f "delims=" %%i in ('dir /a-d /b system.img.ext4') do (
!cecho! %%i:�ٷ�system�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
set ext4imgage2sizecbr=%%~zi
)
call :systemimg_make_else
del system.img.ext4 2>nul
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %ext4imgage2sizecbr% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systembr & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  ���������־���֣�����system_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_systembr & else
)
goto systemimg_to_datbr
:makebr_systemimg
del system.new.dat.br >nul 2>nul
if %api%==21 (call :makebr_systemimg_v1-4 1)
if %api%==22 (call :makebr_systemimg_v1-4 2)
if %api%==23 (call :makebr_systemimg_v1-4 3)
if %api% GEQ 24 (call :makebr_systemimg_v1-4 4)
:makebr_systemimg_v1-4
!simg2sdat! bin\cache\system_simg.img -v %1 & call bin\makebr_system.bat
goto home
:makebr_systemsimg
del system.new.dat.br >nul 2>nul
if %api%==21 (call :makebr_systemsimg_v1-4 1)
if %api%==22 (call :makebr_systemsimg_v1-4 2)
if %api%==23 (call :makebr_systemsimg_v1-4 3)
if %api% GEQ 24 (call :makebr_systemsimg_v1-4 4)
:makedat_systemsimg_v1-4
!simg2sdat! system.img -v %1 & call bin\makebr_system.bat
goto home
:systemimg_to_datbr
if not exist "system.img" (
call :systemimg_else
goto home
else
)
echo.
echo.
echo.
echo.
rd /s /q bin\cache >nul 2>nul
md bin\cache >nul 2>nul
del raw2simg.exe.stackdump >nul 2>nul
echo ������ͣ��ת����... & !raw2simg! system.img bin\cache\system_simg.img >nul 2>nul
if exist "raw2simg.exe.stackdump" (
echo.
del raw2simg.exe.stackdump >nul 2>nul
goto makebr_systemsimg
else
)
goto makebr_systemimg
goto home
:systemimg_datbr
if not exist "system.img" (
call :systemimg_else
goto home
else
)
echo.
echo.
echo.
bin\cecho {0C}��������������������{0C}{\n}
bin\cecho {0A}  1.��׿5.0{\n}
echo.
bin\cecho {0E}  2.��׿5.1{\n}
echo.
bin\cecho {0D}  3.��׿6.0{\n}
echo.
bin\cecho {0B}  4.��׿7.0-��׿9.0{\n}
bin\cecho {0C}��������������������{0F}{\n}
echo.
set /p versionss=-^-^> ��ѡ���Ӧ��׿�汾:
if "%versionss%"=="1" call :systemimg_to_datbr_version 1
if "%versionss%"=="2" call :systemimg_to_datbr_version 2
if "%versionss%"=="3" call :systemimg_to_datbr_version 3
if "%versionss%"=="4" call :systemimg_to_datbr_version 4
goto systemimg_to_datbr
:systemimg_to_datbr_version
echo.
rd /s /q bin\cache >nul 2>nul
md bin\cache >nul 2>nul
del raw2simg.exe.stackdump >nul 2>nul
echo ������ͣ��ת����... & !raw2simg! system.img bin\cache\system_simg.img >nul 2>nul
if exist "raw2simg.exe.stackdump" (
echo.
del raw2simg.exe.stackdump >nul 2>nul
!simg2sdat! system.img -v %1 & call bin\makebr_system.bat
goto home
else
)
!simg2sdat! bin\cache\system_simg.img -v %1 & call bin\makebr_system.bat
goto home
:home_vendorbr
ren vendorbr_AIHGT vendorbr >nul 2>nul
call :vendor_size_else
!cecho! {0A} ====================================================================================================={\n}
echo.
echo.    ʹ�����ʶ��vendorΪ����Ŀ¼,ֱ�Ӵ�vendor�ļ��д����vendor.new.dat.br��vendor.transfer.list
echo.
echo. =====================================================================================================
!cecho!  {0A} ������Լ����͵Ĺٷ�vendor�����ֽڴ�Сѡ������ѡ��:{\n}
echo.
!cecho! {0E} 1.�����vendor.new.dat.br��vendor.transfer.list��С (%vendor_size1% �ֽ�) %vendor_sizeG1% {0C}MB{\n}
!cecho! {0E} 2.�����vendor.new.dat.br��vendor.transfer.list��С (%vendor_size2% �ֽ�) %vendor_sizeG2% {0C}MB{\n}
!cecho! {0E} 3.�����vendor.new.dat.br��vendor.transfer.list��С (%vendor_size3% �ֽ�) %vendor_sizeG3% {0C}MB{\n}
!cecho! {0D}{\n}
echo  4.ʹ�ú�ĸĿ¼��system_size.txt����Զ����������ֽڴ�С������Զ�����vendor.new.dat.br��vendor.transfer.list
echo  5.�鿴�ٷ�vendor����������С����ȡ�ٷ�vendor.new.dat.br��vendor.transfer.list���Ƶ�������Ŀ¼��
!cecho! {0B}{\n}
echo  6.���ݹٷ�vendor����������С�����������ROM��vendorĿ¼����vendor.new.dat.br��vendor.transfer.list
echo    ǰ��:����ȡ�ٷ�vendor.new.dat.br��vendor.transfer.list���Ƶ�������Ŀ¼��
!cecho! {0C}{\n}
echo  7.�����趨��ҳ��1-3ȫ��ѡ��������С
echo  8.�����趨��ҳ��1-3����ѡ��������С
echo  0.�ص�������ҳ
!cecho! {0F}{\n}
echo.
set /p webvendorbr=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webvendorbr%"=="1" call :make_vendorbr %vendor_size1%
if "%webvendorbr%"=="2" call :make_vendorbr %vendor_size2%
if "%webvendorbr%"=="3" call :make_vendorbr %vendor_size3%
if "%webvendorbr%"=="4" goto custom_vendor_br
if "%webvendorbr%"=="5" goto looking_vendorbr_size
if "%webvendorbr%"=="6" goto looking_vendor_size_to_make_new_br
if "%webvendorbr%"=="7" goto vendor_custom_settings_size_br
if "%webvendorbr%"=="8" goto vendor_custom_settings_size_br2
if "%webvendorbr%"=="0" goto home
goto home_vendorbr
:vendor_custom_settings_size_br
call :vendor_size_set
goto home_vendorbr
:vendor_custom_settings_size_br2
call :vendor_size_set_custom
set /p vendorzizebr=-^-^> ��������Ҫ�����趨��ѡ��:
if "%vendorzizebr%"=="1" goto vendor_custom_size_br1
if "%vendorzizebr%"=="2" goto vendor_custom_size_br2
if "%vendorzizebr%"=="3" goto vendor_custom_size_br3
goto vendor_custom_settings_size_br2
:vendor_custom_size_br1
attrib -r -h bin\vendor�Զ����С�趨��ɾ1 >nul 2>nul
del bin\vendor�Զ����С�趨��ɾ1
goto vendor_custom_size1_br
:vendor_custom_size_br2
attrib -r -h bin\vendor�Զ����С�趨��ɾ2 >nul 2>nul
del bin\vendor�Զ����С�趨��ɾ2
goto vendor_custom_size2_br
:vendor_custom_size_br3
attrib -r -h bin\vendor�Զ����С�趨��ɾ3 >nul 2>nul
del bin\vendor�Զ����С�趨��ɾ3
goto vendor_custom_size3_br
:custom_sizevendor1_else
attrib -r -h bin\vendor�Զ����ֽ��趨��ɾ1 >nul 2>nul
!cecho! {0C}������ѡ��1�����ֽڴ�С�������������֣����������趨:{\n}
set /p vendor_imgsize1=
echo %vendor_imgsize1%>bin\vendor�Զ����ֽ��趨��ɾ1
powershell %vendor_imgsize1%d/1024/1024>bin\vendor�Զ����С�趨��ɾ1
attrib +r +h bin\vendor�Զ����С�趨��ɾ1 >nul 2>nul
goto eof
:custom_sizevendor2_else
attrib -r -h bin\vendor�Զ����ֽ��趨��ɾ2 >nul 2>nul
!cecho! {0C}������ѡ��2�����ֽڴ�С�������������֣����������趨:{\n}
set /p vendor_imgsize2=
echo %vendor_imgsize2%>bin\vendor�Զ����ֽ��趨��ɾ2
powershell %vendor_imgsize2%d/1024/1024>bin\vendor�Զ����С�趨��ɾ2
attrib +r +h bin\vendor�Զ����С�趨��ɾ2 >nul 2>nul
goto eof
:custom_sizevendor3_else
attrib -r -h bin\vendor�Զ����ֽ��趨��ɾ3 >nul 2>nul
!cecho! {0C}������ѡ��3�����ֽڴ�С�������������֣����������趨:{\n}
set /p vendor_imgsize3=
echo %vendor_imgsize3%>bin\vendor�Զ����ֽ��趨��ɾ3
powershell %vendor_imgsize3%d/1024/1024>bin\vendor�Զ����С�趨��ɾ3
attrib +r +h bin\vendor�Զ����С�趨��ɾ3 >nul 2>nul
goto eof
:vendor_custom_size1_br
call :custom_sizevendor1_else
goto home_vendorbr
:vendor_custom_size2_br
call :custom_sizevendor2_else
goto home_vendorbr
:vendor_custom_size3_br
call :custom_sizevendor3_else
goto home_vendorbr
:make_vendorbr
if not exist "vendor" (
call :vendor_else
goto home_vendorbr
else
)
if not exist "vendor_AIHGT_file_contexts" (
call :file_contexts_vendor_else
goto home_vendorbr
else
)
if not exist "vendor_AIHGT_permissions" (
call :vendor_AIHGT_permissions_else
goto home_vendorbr
else
)
echo.
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %1 -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorbr & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorbr & else
)
call :vendorbr_make_else
call bin\makebr_vendor.bat
goto home
:custom_vendor_br
if not exist "vendor" (
call :vendor_else
goto home_vendorbr
else
)
if not exist "vendor_AIHGT_permissions" (
call :vendor_AIHGT_permissions_else
goto home_vendorbr
else
)
if not exist "vendor_AIHGT_file_contexts" (
call :file_contexts_vendor_else
goto home_vendorbr
else
)
call :looksize_vendor
if not exist bin\�Զ����С���vendor������ɾ goto custom_size_vendorbr
for /f %%a in (bin\�Զ����С���vendor������ɾ) do (set vendoroobr_size=%%a)
if not exist vendor_size.txt goto custom_size_vendorbr
for /f %%a in (vendor_size.txt) do (set vendoroobr2size=%%a)
:custom_vendor_br_begin
!cecho! {0B} ==========================================================={\n}
!cecho! {0E}  1.ʹ�ú�ĸĿ¼��vendor_size.txt����{0C}%vendoroobr2size%{0E}�ֽ��������{\n}
!cecho! {0E}  1.ʹ���ϴα����������С�ֽ�{0C}%vendoroobr_size%{0E}���д��{\n}
!cecho! {0E}  2.�½�������С�ֽڴ��{\n}
!cecho! {0B} ==========================================================={0F}{\n}
echo.
set /p webmovendorbr=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webmovendorbr%"=="1" goto record_vendor_size_br
if "%webmovendorbr%"=="2" goto custom_vendorbr_size
if "%webmovendorbr%"=="3" goto custom_size_vendorbr
goto custom_vendor_br_begin
:custom_vendorbr_size
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendoroobr_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorbr & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorbr & else
)
goto vendorimg_to_br
:custom_size_vendorbr
attrib -r -h bin\�Զ����С���vendor������ɾ >nul 2>nul
!cecho! �������Լ�����{0C}�ٷ�vendor����{0F}�����ֽڴ�С:{\n}
set /p vendoroobr_size=
echo %vendoroobr_size%>bin\�Զ����С���vendor������ɾ
attrib +r +h bin\�Զ����С���vendor������ɾ >nul 2>nul
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendoroobr_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorbr & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorbr & else
)
goto vendorimg_to_br
:record_vendor_size_br
if not exist vendor_size.txt call :not_vendor_size
for /f %%a in (vendor_size.txt) do (set vendor_size=%%a)
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendor_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorbr & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorbr & else
)
goto vendorimg_to_br
:looking_vendorbr_size
if not exist "vendor.new.dat.br" (
call :vendorbr_else
goto home_vendorbr
else
)
if not exist "vendor.transfer.list" (
call :vendorbr_else
goto home_vendorbr
else
)
call :simg2img_vendorbr_else
del vendor.img.ext4 2>nul
del vendor.new.dat 2>nul
!dat2br! -d -o vendor.new.dat vendor.new.dat.br
!sdat2img! vendor.transfer.list vendor.new.dat vendor.img.ext4
echo.
for /f "delims=" %%i in ('dir /a-d /b vendor.img.ext4') do (
!cecho! %%i:�ٷ�vendor�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
)
pause
del vendor.img.ext4 2>nul
goto home_vendorbr
:looking_vendor_size_to_make_new_br
if not exist "vendor.new.dat.br" (
call :vendorbr_else
goto home_vendorbr
else
)
if not exist "vendor.transfer.list" (
call :vendorbr_else
goto home_vendorbr
else
)
if not exist "vendor" (
call :vendor_else
goto home_vendorbr
else
)
if not exist "vendor_AIHGT_permissions" (
call :vendor_AIHGT_permissions_else
goto home_vendorbr
else
)
if not exist "vendor_AIHGT_file_contexts" (
call :file_contexts_vendor_else
goto home_vendorbr
else
)
call :simg2img_vendorbr_else
del vendor.img.ext4 2>nul
del vendor.new.dat 2>nul
!dat2br! -d -o vendor.new.dat vendor.new.dat.br
!sdat2img! vendor.transfer.list vendor.new.dat vendor.img.ext4
echo.
for /f "delims=" %%i in ('dir /a-d /b vendor.img.ext4') do (
!cecho! %%i:�ٷ�vendor�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
set vendorext4imgage2sizecobr=%%~zi
)
call :vendorimg_make_else
del vendor.img.ext4 2>nul
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendorext4imgage2sizecobr% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorbr & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorbr & else
)
goto vendorimg_to_br
:vendorimg_to_br
if not exist "vendor.img" (
call :vendorimg_else
goto home_vendorbr
else
)
echo.
call bin\makebr_vendor.bat
goto home
:home_vendordat
ren vendorbr_AIHGT vendorbr >nul 2>nul
call :vendor_size_else
!cecho! {0A} ====================================================================================================={\n}
echo.
echo.    ʹ�����ʶ��vendorΪ����Ŀ¼,ֱ�Ӵ�vendor�ļ��д����vendor.new.dat��vendor.transfer.list
echo.
echo. =====================================================================================================
!cecho!  {0A} ������Լ����͵Ĺٷ�vendor�����ֽڴ�Сѡ������ѡ��:{\n}
echo.
!cecho! {0E} 1.�����vendor.new.dat��vendor.transfer.list��С (%vendor_size1% �ֽ�) %vendor_sizeG1% {0C}MB{\n}
!cecho! {0E} 2.�����vendor.new.dat��vendor.transfer.list��С (%vendor_size2% �ֽ�) %vendor_sizeG2% {0C}MB{\n}
!cecho! {0E} 3.�����vendor.new.dat��vendor.transfer.list��С (%vendor_size3% �ֽ�) %vendor_sizeG3% {0C}MB{\n}
!cecho! {0D}{\n}
echo  4.ʹ�ú�ĸĿ¼��system_size.txt����Զ����������ֽڴ�С������Զ�����vendor.new.dat��vendor.transfer.list
echo  5.�鿴�ٷ�vendor����������С����ȡ�ٷ�vendor.new.dat��vendor.transfer.list���Ƶ�������Ŀ¼��
!cecho! {0B}{\n}
echo  6.���ݹٷ�vendor����������С�����������ROM��vendorĿ¼����vendor.new.dat��vendor.transfer.list
echo    ǰ��:����ȡ�ٷ�vendor.new.dat��vendor.transfer.list���Ƶ�������Ŀ¼��
!cecho! {0C}{\n}
echo  7.�����趨��ҳ��1-3ȫ��ѡ��������С
echo  8.�����趨��ҳ��1-3����ѡ��������С
echo  0.�ص�������ҳ
!cecho! {0F}{\n}
echo.
set /p webvendor=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webvendor%"=="1" call :make_vendordat %vendor_size1%
if "%webvendor%"=="2" call :make_vendordat %vendor_size2%
if "%webvendor%"=="3" call :make_vendordat %vendor_size3%
if "%webvendor%"=="4" goto custom_vendor_dat
if "%webvendor%"=="5" goto looking_vendordat_size
if "%webvendor%"=="6" goto looking_vendor_size_to_make_new_dat
if "%webvendor%"=="7" goto vendor_custom_settings_size_dat
if "%webvendor%"=="8" goto vendor_custom_settings_size_dat2
if "%webvendor%"=="0" goto home
goto home_vendordat
:vendor_custom_settings_size_dat
call :vendor_size_set
goto home_vendordat
:vendor_custom_settings_size_dat2
call :vendor_size_set_custom
set /p vendorzize=-^-^> ��������Ҫ�����趨��ѡ��:
if "%vendorzize%"=="1" goto vendor_custom_size_dat1
if "%vendorzize%"=="2" goto vendor_custom_size_dat2
if "%vendorzize%"=="3" goto vendor_custom_size_dat3
goto vendor_custom_settings_size_dat2
:vendor_custom_size_dat1
attrib -r -h bin\vendor�Զ����С�趨��ɾ1 >nul 2>nul
del bin\vendor�Զ����С�趨��ɾ1
goto vendor_custom_size1_dat
:vendor_custom_size_dat2
attrib -r -h bin\vendor�Զ����С�趨��ɾ2 >nul 2>nul
del bin\vendor�Զ����С�趨��ɾ2
goto vendor_custom_size2_dat
:vendor_custom_size_dat3
attrib -r -h bin\vendor�Զ����С�趨��ɾ3 >nul 2>nul
del bin\vendor�Զ����С�趨��ɾ3
goto vendor_custom_size3_dat
:vendor_custom_size1_dat
call :custom_sizevendor1_else
goto home_vendordat
:vendor_custom_size2_dat
call :custom_sizevendor2_else
goto home_vendordat
:vendor_custom_size3_dat
call :custom_sizevendor3_else
goto home_vendordat
:make_vendordat
if not exist "vendor" (
call :vendor_else
goto home_vendordat
else
)
if not exist "vendor_AIHGT_permissions" (
call :vendor_AIHGT_permissions_else
goto home_vendordat
else
)
if not exist "vendor_AIHGT_file_contexts" (
call :file_contexts_vendor_else
goto home_vendordat
else
)
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %1 -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendordat & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendordat & else
)
call :vendordat_make_else
call bin\makedat_vendor.bat
goto home
:custom_vendor_dat
if not exist "vendor" (
call :vendor_else
goto home_vendordat
else
)
if not exist "vendor_AIHGT_permissions" (
call :vendor_AIHGT_permissions_else
goto home_vendordat
else
)
if not exist "vendor_AIHGT_file_contexts" (
call :file_contexts_vendor_else
goto home_vendordat
else
)
call :looksize_vendor
if not exist bin\�Զ����С���vendor������ɾ goto custom_size_vendordat
for /f %%a in (bin\�Զ����С���vendor������ɾ) do (set vendoroodat_size=%%a)
if not exist vendor_size.txt goto custom_size_vendordat
for /f %%a in (vendor_size.txt) do (set vendoroodat2size=%%a)
:custom_vendor_dat_begin
!cecho! {0B} ==========================================================={\n}
!cecho! {0E}  1.ʹ�ú�ĸĿ¼��vendor_size.txt����{0C}%vendoroodat2size%{0E}�ֽ��������{\n}
!cecho! {0E}  2.ʹ���ϴα����������С�ֽ�{0C}%vendoroodat_size%{0E}���д��{\n}
!cecho! {0E}  3.�½�������С�ֽڴ��{\n}
!cecho! {0B} ==========================================================={0F}{\n}
echo.
set /p webmovendor=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webmovendor%"=="1" goto record_vendor_size_dat
if "%webmovendor%"=="2" goto custom_vendordat_size
if "%webmovendor%"=="3" goto custom_size_vendordat
goto custom_vendor_dat_begin
:custom_vendordat_size
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendoroodat_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendordat & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendordat & else
)
goto vendorimg_to_dat
:custom_size_vendordat
attrib -r -h bin\�Զ����С���vendor������ɾ >nul 2>nul
!cecho! �������Լ�����{0C}�ٷ�vendor����{0F}�����ֽڴ�С:{\n}
set /p vendoroodat_size=
echo %vendoroodat_size%>bin\�Զ����С���vendor������ɾ
attrib +r +h bin\�Զ����С���vendor������ɾ >nul 2>nul
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendoroodat_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendordat & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendordat & else
)
goto vendorimg_to_dat
:record_vendor_size_dat
if not exist vendor_size.txt call :not_vendor_size
for /f %%a in (vendor_size.txt) do (set vendor_size=%%a)
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendor_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendordat & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendordat & else
)
goto vendorimg_to_dat
:looking_vendordat_size
if not exist "vendor.new.dat""vendor.transfer.list" (
call :vendordat_else
goto home_vendordat
else
)
call :simg2img_vendordat_else
del vendor.img.ext4 2>nul
!sdat2img! vendor.transfer.list vendor.new.dat vendor.img.ext4
echo.
for /f "delims=" %%i in ('dir /a-d /b vendor.img.ext4') do (
!cecho! %%i:�ٷ�vendor�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
)
pause
del vendor.img.ext4 2>nul
goto home_vendordat
:looking_vendor_size_to_make_new_dat
if not exist "vendor.new.dat" (
call :vendordat_else
goto home_vendordat
else
)
if not exist "vendor.transfer.list" (
call :vendordat_else
goto home_vendordat
else
)
if not exist "vendor" (
call :vendor_else
goto home_vendordat
else
)
if not exist "vendor_AIHGT_permissions" (
call :vendor_AIHGT_permissions_else
goto home_vendordat
else
)
if not exist "vendor_AIHGT_file_contexts" (
call :file_contexts_vendor_else
goto home_vendordat
else
)
call :simg2img_vendordat_else
del vendor.img.ext4 2>nul
!sdat2img! vendor.transfer.list vendor.new.dat vendor.img.ext4
echo.
for /f "delims=" %%i in ('dir /a-d /b vendor.img.ext4') do (
!cecho! %%i:�ٷ�vendor�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
set vendorext4imgage2sizeco=%%~zi
)
call :vendorimg_make_else
del vendor.img.ext4 2>nul
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendorext4imgage2sizeco% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendordat & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendordat & else
)
goto vendorimg_to_dat
:vendorimg_to_dat
if not exist "vendor.img" (
call :vendorimg_else
goto home_vendordat
else
)
echo.
call bin\makedat_vendor.bat
goto home
:vendor_size_else
cls
if not exist bin\vendor�Զ����ֽ��趨��ɾ1 goto vendor_custom_size1_img
if not exist bin\vendor�Զ����ֽ��趨��ɾ2 goto vendor_custom_size2_img
if not exist bin\vendor�Զ����ֽ��趨��ɾ3 goto vendor_custom_size3_img
if not exist bin\vendor�Զ����С�趨��ɾ1 goto vendor_custom_size1_img
if not exist bin\vendor�Զ����С�趨��ɾ2 goto vendor_custom_size2_img
if not exist bin\vendor�Զ����С�趨��ɾ3 goto vendor_custom_size3_img
for /f %%a in (bin\vendor�Զ����ֽ��趨��ɾ1) do (set vendor_size1=%%a)
for /f %%a in (bin\vendor�Զ����ֽ��趨��ɾ2) do (set vendor_size2=%%a)
for /f %%a in (bin\vendor�Զ����ֽ��趨��ɾ3) do (set vendor_size3=%%a)
for /f %%a in (bin\vendor�Զ����С�趨��ɾ1) do (set vendor_sizeG1=%%a)
for /f %%a in (bin\vendor�Զ����С�趨��ɾ2) do (set vendor_sizeG2=%%a)
for /f %%a in (bin\vendor�Զ����С�趨��ɾ3) do (set vendor_sizeG3=%%a)
rd /s /q "vendor\etc\device_features" >nul 2>nul
rd /s /q "system\app\miui" >nul 2>nul
rd /s /q "system\etc\device_features" >nul 2>nul
rd /s /q "system\priv-app\MiuiSystemUI" >nul 2>nul
rd /s /q "system\system\app\miui" >nul 2>nul
rd /s /q "system\system\etc\device_features" >nul 2>nul
rd /s /q "system\system\priv-app\MiuiSystemUI" >nul 2>nul
goto :eof
:vendor_size_set
attrib -r -h bin\vendor�Զ����ֽ��趨��ɾ1 >nul 2>nul
attrib -r -h bin\vendor�Զ����ֽ��趨��ɾ2 >nul 2>nul
attrib -r -h bin\vendor�Զ����ֽ��趨��ɾ3 >nul 2>nul
attrib -r -h bin\vendor�Զ����С�趨��ɾ1 >nul 2>nul
attrib -r -h bin\vendor�Զ����С�趨��ɾ2 >nul 2>nul
attrib -r -h bin\vendor�Զ����С�趨��ɾ3 >nul 2>nul
del bin\vendor�Զ����ֽ��趨��ɾ1
del bin\vendor�Զ����ֽ��趨��ɾ2
del bin\vendor�Զ����ֽ��趨��ɾ3
del bin\vendor�Զ����С�趨��ɾ1
del bin\vendor�Զ����С�趨��ɾ2
del bin\vendor�Զ����С�趨��ɾ3
goto :eof
:vendor_size_set_custom
echo.
echo.
echo.
!cecho! {0B}====================================={\n}
!cecho! {0A}        1.ѡ��1��������С�趨{\n}
echo.
!cecho! {0E}        2.ѡ��2��������С�趨{\n}
echo.
!cecho! {0D}        3.ѡ��3��������С�趨{\n}
!cecho! {0B}====================================={0F}{\n}
echo.
goto :eof
:home_vendorimg
ren vendorbr_AIHGT vendorbr >nul 2>nul
call :vendor_size_else
!cecho! {0A} ====================================================================================================={\n}
echo.
echo.    ʹ�����ʶ��vendorΪ����Ŀ¼,ֱ�Ӵ�vendor�ļ��д����vendor.img
echo.
echo. =====================================================================================================
!cecho!  {0A} ������Լ����͵Ĺٷ�vendor�����ֽڴ�Сѡ������ѡ��:{\n}
echo.
!cecho! {0E} 1.�����vendor.img��С (%vendor_size1% �ֽ�) %vendor_sizeG1% {0C}MB{\n}
!cecho! {0E} 2.�����vendor.img��С (%vendor_size2% �ֽ�) %vendor_sizeG2% {0C}MB{\n}
!cecho! {0E} 3.�����vendor.img��С (%vendor_size3% �ֽ�) %vendor_sizeG3% {0C}MB{\n}
!cecho! {0D}{\n}
echo  4.ʹ�ú�ĸĿ¼��system_size.txt����Զ����������ֽڴ�С������Զ�����vendor.img�ֽ�������С
echo  5.�鿴�ٷ�vendor����������С����ȡ�ٷ�vendor.img���Ƶ�������Ŀ¼��
!cecho! {0B}{\n}
echo  6.���ݹٷ�vendor����������С�����������ROM��vendorĿ¼����vendor.img
echo    ǰ��:����ȡ�ٷ�vendor.img���Ƶ�������Ŀ¼��
!cecho! {0C}{\n}
echo  7.�����趨��ҳ��1-3ȫ��ѡ��������С
echo  8.�����趨��ҳ��1-3����ѡ��������С
echo  0.�ص�������ҳ
!cecho! {0F}{\n}
echo.
set /p webvendorimg=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webvendorimg%"=="1" call :make_vendorimg %vendor_size1%
if "%webvendorimg%"=="2" call :make_vendorimg %vendor_size2%
if "%webvendorimg%"=="3" call :make_vendorimg %vendor_size3%
if "%webvendorimg%"=="4" goto custom_vendor_img
if "%webvendorimg%"=="5" goto looking_vendorimg_size
if "%webvendorimg%"=="6" goto looking_vendorimg_size_make_new_img
if "%webvendorimg%"=="7" goto vendor_custom_settings_size_img
if "%webvendorimg%"=="8" goto vendor_custom_settings_size_img2
if "%webvendorimg%"=="0" goto home
goto home_vendorimg
:vendor_custom_settings_size_img
call :vendor_size_set
goto home_vendorimg
:vendor_custom_settings_size_img2
call :vendor_size_set_custom
set /p vendorzizeimg=-^-^> ��������Ҫ�����趨��ѡ��:
if "%vendorzizeimg%"=="1" goto vendor_custom_size_img1
if "%vendorzizeimg%"=="2" goto vendor_custom_size_img2
if "%vendorzizeimg%"=="3" goto vendor_custom_size_img3
goto vendor_custom_settings_size_img2
:vendor_custom_size_img1
attrib -r -h bin\vendor�Զ����С�趨��ɾ1 >nul 2>nul
del bin\vendor�Զ����С�趨��ɾ1
goto vendor_custom_size1_img
:vendor_custom_size_img2
attrib -r -h bin\vendor�Զ����С�趨��ɾ2 >nul 2>nul
del bin\vendor�Զ����С�趨��ɾ2
goto vendor_custom_size2_img
:vendor_custom_size_img3
attrib -r -h bin\vendor�Զ����С�趨��ɾ3 >nul 2>nul
del bin\vendor�Զ����С�趨��ɾ3
goto vendor_custom_size3_img
:vendor_custom_size1_img
call :custom_sizevendor1_else
goto home_vendorimg
:vendor_custom_size2_img
call :custom_sizevendor2_else
goto home_vendorimg
:vendor_custom_size3_img
call :custom_sizevendor3_else
goto home_vendorimg
:make_vendorimg
if not exist "vendor" (
call :vendor_else
goto home_vendorimg
else
)
if not exist "vendor_AIHGT_permissions" (
call :vendor_AIHGT_permissions_else
goto home_vendorimg
else
)
if not exist "vendor_AIHGT_file_contexts" (
call :file_contexts_vendor_else
goto home_vendorimg
else
)
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %1 -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorimg & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorimg & else
)
goto home
:custom_vendor_img
if not exist "vendor" (
call :vendor_else
goto home_vendorimg
else
)
if not exist "vendor_AIHGT_permissions" (
call :vendor_AIHGT_permissions_else
goto home_vendorimg
else
)
if not exist "vendor_AIHGT_file_contexts" (
call :file_contexts_vendor_else
goto home_vendorimg
else
)
call :looksize_vendor
if not exist bin\�Զ����С���vendor������ɾ goto custom_size_vendorimg
for /f %%a in (bin\�Զ����С���vendor������ɾ) do (set vendorooimg_size=%%a)
if not exist vendor_size.txt goto custom_size_vendorimg
for /f %%a in (vendor_size.txt) do (set vendorooimg2size=%%a)
:custom_vendor_img_begin
!cecho! {0B} ==========================================================={\n}
!cecho! {0E}  1.ʹ�ú�ĸĿ¼��vendor_size.txt����{0C}%vendorooimg_size%{0E}�ֽ��������{\n}
!cecho! {0E}  2.ʹ���ϴα����������С�ֽ�{0C}%vendorooimg_size%{0E}���д��{\n}
!cecho! {0E}  3.�½�������С�ֽڴ��{\n}
!cecho! {0B} ==========================================================={0F}{\n}
echo.
set /p webmovendorimg=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webmovendorimg%"=="1" goto make_img_vendor_size
if "%webmovendorimg%"=="2" goto custom_vendorimg_size
if "%webmovendorimg%"=="3" goto custom_size_vendorimg
goto custom_vendor_img_begin
:custom_vendorimg_size
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendorooimg_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorimg & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorimg & else
)
goto home
:custom_size_vendorimg
attrib -r -h bin\�Զ����С���vendor������ɾ >nul 2>nul
!cecho! �������Լ�����{0C}�ٷ�vendor����{0F}�����ֽڴ�С:{\n}
set /p vendorooimg_size=
echo %vendorooimg_size%>bin\�Զ����С���vendor������ɾ
attrib +r +h bin\�Զ����С���vendor������ɾ >nul 2>nul
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendorooimg_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorimg & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorimg & else
)
goto home
:make_img_vendor_size
if not exist vendor_size.txt call :not_vendor_size
for /f %%a in (vendor_size.txt) do (set vendor-size=%%a)
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendor-size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorimg & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorimg & else
)
goto home
:looking_vendorimg_size
if not exist "vendor.img" (
call :look_vendorimg_else
goto home_vendorimg
else
)
call :simg2img_vendorimg_else
!simg2img! vendor.img vendor_ext4.img >nul 2>nul
echo.
for /f "delims=" %%i in ('dir /a-d /b vendor_ext4.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor_ext4.img) do (
if %%~za==0 del %~dp0\vendor_ext4.img
)
if not exist "%~dp0\vendor_ext4.img" goto looking_vendorimg_size1
if exist "%~dp0\vendor_ext4.img" goto looking_vendorimg_size2
:looking_vendorimg_size1
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
!cecho! %%i:�ٷ�vendor�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
)
pause
del vendor_ext4.img 2>nul
goto home
:looking_vendorimg_size2
for /f "delims=" %%i in ('dir /a-d /b vendor_ext4.img') do (
!cecho! %%i:�ٷ�vendor�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
)
pause
del vendor_ext4.img 2>nul
goto home
:looking_vendorimg_size_make_new_img
if not exist "vendor.img" (
call :vendorimg_else
goto home_vendorimg
else
)
echo.
if not exist "vendor" (
call :vendor_else
goto home_vendorimg
else
)
if not exist "vendor_AIHGT_permissions" (
call :vendor_AIHGT_permissions_else
goto home_vendorimg
else
)
if not exist "vendor_AIHGT_file_contexts" (
call :file_contexts_vendor_else
goto home_vendorimg
else
)
call :simg2img_vendorimg_else
!simg2img! vendor.img vendor_ext4.img
echo.
for /f "delims=" %%i in ('dir /a-d /b vendor_ext4.img') do (
!cecho! %%i:�ٷ�vendor�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
set ext4imgsizeaovendor=%%~zi
)
echo.
for /r %~dp0 %%a in (vendor_ext4.img) do (
if %%~za==0 del %~dp0\vendor_ext4.img
)
if not exist "%~dp0\vendor_ext4.img" goto Return_vendor
if exist "%~dp0\vendor_ext4.img" goto Continue_vendor
:Return_vendor
del vendor_ext4.img 2>nul
echo.
echo.
!cecho! {0C}  ��⵽��ǰvendor.imgΪext4���룬��ȷ���Ƿ�Ϊ�ٷ�vendor.img������������������ٷ���С�����޷�ˢ��{0F}{\n}
pause
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
!cecho! %%i:�ٷ�vendor�����ֽ�������С={0C}%%~zi{0F}�ֽ�.{\n}
set ext4imgsizeaovendor=%%~zi
)
goto Continue_vendor
:Continue_vendor
call :vendorimg_make_else
del vendor_ext4.img 2>nul
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %ext4imgsizeaovendor% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorimg & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  ���������־���֣�����vendor_AIHGT_file_permissions�����ͻ  ��{0F}{\n} & echo. & pause & goto home_vendorimg & else
)
goto home
:Clear_home
cls
!cecho! {0A} =================================================================={\n}
echo                         ��ѡ������һ������ʽ
echo  ==================================================================
echo.
echo   1.������ʱ�ں�\rec�����ļ�
!cecho! {0D}{\n}
echo   2.�������е��ļ����ļ���(���ã�ֻ�����Խ��������)
!cecho! {0A}{\n}
echo   0.�ص�������ҳ
!cecho! {0F}{\n}
echo.
set /p webs=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webs%"=="1" goto Clear_boot_recovery
if "%webs%"=="2" goto Clear_all
if "%webs%"=="0" goto home
goto Clear_home
:Clear_boot_recovery
del bootinfo.txt 2>nul
del cpiolist.txt 2>nul
del dt_image 2>nul
del kernel 2>nul
del kernel.gz 2>nul
del boot.img.tmp 2>nul
del ramdisk 2>nul
del ramdisk.gz 2>nul
del file_contexts 2>nul
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
rd /s /q AIHGTkernel 2>nul
rd /s /q �ٷ��ں� 2>nul
rd /s /q Ҫ��ֲ�ں� 2>nul
rd /s /q �ɹ���ֲ���ں� 2>nul
rd /s /q �ٷ�recovery 2>nul
rd /s /q Ҫ��ֲrecovery 2>nul
rd /s /q �ɹ���ֲrecovery 2>nul
rd /s /q ramdisk 2>nul
rd /s /q split_img 2>nul
goto home
:Clear_all
del/a-r /s /q %~dp0*.*
for /f "tokens=*" %%i in ('dir/s/b/ad^|sort /r') do rd "%%i"
goto home
:file_contextsbin_and_file_contexts_home
cls
!cecho! {0E}{\n}
echo   1.file_contexts.bin�Ͱ�׿8.0-��׿9.0����ת������file_contexts
!cecho! {0B}{\n}
echo   2.file_contextsת��Ϊfile_contexts.bin
!cecho! {0C}{\n}
echo   0.���ع�����ҳ
!cecho! {0F}{\n}
set /p webt=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webt%"=="1" goto file_contextsbin_to_file_contexts
if "%webt%"=="2" goto file_contexts_to_file_contextsbin
if "%webt%"=="0" goto home
goto file_contextsbin_and_file_contexts_home
:file_contextsbin_to_file_contexts
del /f /s /q file_contexts >nul 2>nul
echo.
echo.
!cecho! {0B} ============================================={\n}
!cecho! {0E}  1.��׿7.0 - ��׿7.1.2ת��file_contexts.bin{\n}
!cecho! {0E}  2.��׿8.0 - ��׿9.0����file_contexts{\n}
!cecho! {0B} ============================================={0F}{\n}
echo.
set /p webu=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webu%"=="1" goto file_contextsbin_txt
if "%webu%"=="2" goto file_contextsbin_oreo
goto file_contextsbin_to_file_contexts
:file_contextsbin_txt
echo.
if not exist "file_contexts.bin" (
echo.
echo.
!cecho! {0C}    û�ҵ�file_contexts.bin�ļ������file_contexts.bin�ŵ�������Ŀ¼��!{0F}{\n}
echo.
echo.
pause
goto home
else
)
!file_contexts_tool! file_contexts.bin -o file_contexts -e >nul 2>nul
del system_AIHGT_file_contexts >nul 2>nul
del vendor_AIHGT_file_contexts >nul 2>nul
ren file_contexts system_AIHGT_file_contexts >nul 2>nul
copy system_AIHGT_file_contexts vendor_AIHGT_file_contexts >nul 2>nul
goto home
:file_contextsbin_oreo
if not exist "boot.img" (
call :bootimg_else
goto file_contextsbin_and_file_contexts_home
else
)
if not exist "system" (
call :system_else
goto file_contextsbin_and_file_contexts_home
else
)
if not exist "vendor" (
call :vendor_else
goto file_contextsbin_and_file_contexts_home
else
)
call bin\file_contexts.bat >nul 2>nul
rd /s /q split_img >nul 2>nul
rd /s /q ramdisk >nul 2>nul
del system_AIHGT_file_contexts >nul 2>nul
del vendor_AIHGT_file_contexts >nul 2>nul
ren file_contexts system_AIHGT_file_contexts >nul 2>nul
copy system_AIHGT_file_contexts vendor_AIHGT_file_contexts >nul 2>nul
goto home
:file_contexts_to_file_contextsbin
del file_contexts.bin >nul 2>nul
echo.
if not exist "file_contexts" (
echo.
echo.
!cecho! {0C}    û�ҵ�file_contexts�ļ������file_contexts�ŵ�������Ŀ¼��!{0F}{\n}
echo.
echo.
pause
goto home
else
)
!file_contexts_tool! file_contexts -o file_contexts.bin
if not exist "file_contexts.bin" !cecho! {0C}   ת��������־���֣�����file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto file_contextsbin_and_file_contexts_home & else
goto home
:unpack_bootimg_new
echo.
if not exist "boot.img" (
echo.
echo.
!cecho! {0C}      ���麽ĸĿ¼���Ƿ����boot.img��{0F}{\n}
echo.
echo.
pause
goto home
else
)
echo.
!cecho! {0E} ���ڽ���ں� boot.img   ...{0F}{\n}
echo.
rd /s /q bin\split_img >nul 2>nul
rd /s /q bin\ramdisk >nul 2>nul
del bin\boot.img >nul 2>nul
copy boot.img bin\boot.img >nul 2>nul
del boot---old.img >nul 2>nul
ren boot.img boot---old.img >nul 2>nul
call bin\�ں�rec�ֽ�.bat boot.img
goto home
:unpack_recovery_new
echo.
if not exist "recovery.img" (
echo.
echo.
!cecho! {0C}      ���麽ĸĿ¼���Ƿ����recovery.img��{0F}{\n}
echo.
echo.
pause
goto home
else
)
echo.
!cecho! {0E} ���ڽ�� recovery.img   ...{0F}{\n}
echo.
rd /s /q bin\split_img >nul 2>nul
rd /s /q bin\ramdisk >nul 2>nul
del bin\recovery.img >nul 2>nul
copy recovery.img bin\recovery.img >nul 2>nul
del recovery---old.img >nul 2>nul
ren recovery.img recovery---old.img >nul 2>nul
call bin\�ں�rec�ֽ�.bat recovery.img
goto home
:make_bootimg_new
if not exist "ramdisk\file_contexts.bin" (
call :Nougat_boot
else
)
copy !file_contexts_tool! ramdisk\file_contexts_tool.exe >nul 2>nul
ramdisk\file_contexts_tool.exe ramdisk\file_contexts -o ramdisk\file_contexts.bin >nul 2>nul
if not exist "ramdisk\file_contexts.bin" !cecho! {0C}   ת��������־���֣�����file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home & else
del ramdisk\file_contexts >nul 2>nul
del ramdisk\file_contexts_tool.exe >nul 2>nul
goto Nougat_boot
:Nougat_boot
del ramdisk.cpio.gz >nul 2>nul
del ramdisk.cpio.gz.tmp >nul 2>nul
del boot-new.img >nul 2>nul
del boot.img.tmp >nul 2>nul
del boot_old.img >nul 2>nul
rd /s /q bin\split_img >nul 2>nul
rd /s /q bin\ramdisk >nul 2>nul
del bin\boot.img >nul 2>nul
move ramdisk bin\ramdisk >nul 2>nul
move split_img bin\split_img >nul 2>nul
call bin\����ں�.bat
del ramdisk.cpio.gz >nul 2>nul
del ramdisk.cpio.gz.tmp >nul 2>nul
goto home
:make_recovery_new
if not exist "ramdisk\file_contexts.bin" (
call :Nougat_recovery
else
)
copy !file_contexts_tool! ramdisk\file_contexts_tool.exe >nul 2>nul
ramdisk\file_contexts_tool.exe ramdisk\file_contexts -o ramdisk\file_contexts.bin >nul 2>nul
if not exist "ramdisk\file_contexts.bin" !cecho! {0C}   ת��������־���֣�����file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home & else
del ramdisk\file_contexts >nul 2>nul
del ramdisk\file_contexts_tool.exe >nul 2>nul
goto Nougat_recovery
:Nougat_recovery
del ramdisk.cpio.gz >nul 2>nul
del ramdisk.cpio.gz.tmp >nul 2>nul
del boot-new.img >nul 2>nul
del boot.img.tmp >nul 2>nul
del boot_old.img >nul 2>nul
rd /s /q bin\split_img >nul 2>nul
rd /s /q bin\ramdisk >nul 2>nul
del bin\recovery.img >nul 2>nul
move split_img bin\split_img >nul 2>nul
move ramdisk bin\ramdisk >nul 2>nul
call bin\���recovery.bat
del ramdisk.cpio.gz >nul 2>nul
del ramdisk.cpio.gz.tmp >nul 2>nul
goto home
:unpack_bootimg
echo.
if not exist "boot.img" (
echo.
echo.
!cecho! {0C}      ���麽ĸĿ¼���Ƿ����boot.img��{0F}{\n}
echo.
echo.
pause
goto home
else
)
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
!bootimg! --unpack-bootimg
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
!file_contexts_tool! AIHGTkernel\file_contexts.bin -o AIHGTkernel\file_contexts -e >nul 2>nul
goto home
:make_bootimg
if not exist "AIHGTkernel\file_contexts.bin" (
call :make_Nougat_bootimg
else
)
copy !file_contexts_tool! AIHGTkernel\file_contexts_tool.exe >nul 2>nul
AIHGTkernel\file_contexts_tool.exe AIHGTkernel\file_contexts -o AIHGTkernel\file_contexts.bin >nul 2>nul
if not exist "AIHGTkernel\file_contexts.bin" !cecho! {0C}   ת��������־���֣�����file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home & else
del AIHGTkernel\file_contexts >nul 2>nul
del AIHGTkernel\file_contexts_tool.exe >nul 2>nul
goto make_Nougat_bootimg
:make_Nougat_bootimg
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
del boot-new.img 2>nul
del boot.img.tmp 2>nul
del boot_old.img 2>nul
!bootimg! --repack-bootimg
ren boot-new.img boot.img >nul 2>nul
ren boot-old.img boot_old.img >nul 2>nul
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
goto home
:unpack_recovery
echo.
if not exist "recovery.img" (
echo.
echo.
!cecho! {0C}      ���麽ĸĿ¼���Ƿ����recovery.img��{0F}{\n}
echo.
echo.
echo.
pause
goto home
else
)
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
ren boot.img bot.img >nul 2>nul
ren recovery.img boot.img 2>nul
!bootimg! --unpack-bootimg
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
!file_contexts_tool! AIHGTkernel\file_contexts.bin -o AIHGTkernel\file_contexts -e >nul 2>nul
goto home
:make_recovery
if not exist "AIHGTkernel\file_contexts.bin" (
call :make_Nougat_recovery
else
)
copy !file_contexts_tool! AIHGTkernel\file_contexts_tool.exe >nul 2>nul
AIHGTkernel\file_contexts_tool.exe AIHGTkernel\file_contexts -o AIHGTkernel\file_contexts.bin >nul 2>nul
if not exist "AIHGTkernel\file_contexts.bin" !cecho! {0C}   ת��������־���֣�����file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home & else
del AIHGTkernel\file_contexts >nul 2>nul
del AIHGTkernel\file_contexts_tool.exe >nul 2>nul
goto make_Nougat_recovery
:make_Nougat_recovery
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
del recovery-new.img 2>nul
del recovery-old.img 2>nul
ren boot-old.img recovery-old.img>nul 2>nul
del boot.img >nul 2>nul
!bootimg! --repack-bootimg
del boot-old.img >nul 2>nul
del boot.img >nul 2>nul
ren recovery.img recovery-old.img 2>nul
ren boot-new.img recovery-new.img >nul 2>nul
ren bot.img boot.img >nul 2>nul
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
goto home
:home_auto_custom_recovery_kernel_porting
cls
!cecho! {0A} =================================================================={\n}
echo   boot.img/recovery.img�Զ�����ֲ���һֱ����Enter��Ĭ��Ϊ�Զ���ֲ 
echo  ==================================================================
echo.
echo   1.�Զ���ֲboot.img
!cecho! {0D}{\n}
echo   2.�Զ���ֲrecovery.img
!cecho! {0B}{\n}
echo   3.�Զ�����ֲboot.img
!cecho! {0C}{\n}
echo   4.�Զ�����ֲrecovery.img
!cecho! {0A}{\n}
echo   0.�ص�������ҳ
!cecho! {0F}{\n}
echo.
set /p weby=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%weby%"=="1" goto auto_kernel_porting
if "%weby%"=="2" goto auto_recovery_porting
if "%weby%"=="3" goto custom_kernel_porting
if "%weby%"=="4" goto custom_recovery_porting
if "%weby%"=="0" goto home
goto home_auto_custom_recovery_kernel_porting
:auto_kernel_porting
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
del boot-new.img 2>nul
del boot.img.tmp 2>nul
del boot_old.img 2>nul
md �ٷ��ں� >nul 2>nul
md Ҫ��ֲ�ں� >nul 2>nul
echo.
!cecho! {0D} ========================================{\n}
echo  ���ٷ�ROM��boot.img�ŵ�"�ٷ��ں�"�ļ���
echo  ��Ҫ��ֲROM��boot.img�ŵ�"Ҫ��ֲ�ں�"�ļ���
!cecho! {0D} ========================================{0F}{\n}
pause
echo.
if not exist "�ٷ��ں�\boot.img" (
echo.
echo.
!cecho! {0C}      �����·�����Ƿ���� �ٷ��ں�\boot.img��{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
echo.
if not exist "Ҫ��ֲ�ں�\boot.img" (
echo.
echo.
!cecho! {0C}      �����·�����Ƿ���� Ҫ��ֲ�ں�\boot.img��{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
copy �ٷ��ں�\boot.img >nul 2>nul
!bootimg! --unpack-bootimg
ren kernel kernel_backups >nul 2>nul
ren kernel.gz kernel_backups >nul 2>nul
del ramdisk >nul 2>nul
del ramdisk.gz >nul 2>nul
del boot.img >nul 2>nul
rd /s /q AIHGTkernel >nul 2>nul
del bootinfo.txt >nul 2>nul
del cpiolist.txt >nul 2>nul
del boot-old.img >nul 2>nul
copy Ҫ��ֲ�ں�\boot.img >nul 2>nul
echo.
!bootimg! --unpack-bootimg
del kernel >nul 2>nul
del kernel.gz >nul 2>nul
ren kernel_backups kernel >nul 2>nul
ren kernel_backups kernel.gz >nul 2>nul
del ramdisk.cpio.gz >nul 2>nul
del ramdisk.cpio.gz.tmp >nul 2>nul
del boot-new.img >nul 2>nul
del boot.img.tmp >nul 2>nul
del boot_old.img >nul 2>nul
!file_contexts_tool! AIHGTkernel\file_contexts.bin -o AIHGTkernel\file_contexts -e >nul 2>nul
echo.
!bootimg! --repack-bootimg
md �ɹ���ֲ���ں� >nul 2>nul
ren boot-new.img boot.img
del �ɹ���ֲ���ں�\boot.img >nul 2>nul
move boot.img �ɹ���ֲ���ں� >nul 2>nul
del boot-old.img >nul 2>nul
!cecho! {0B} ============================================================{\n}
echo  �ɹ�һ����ֲboot.img�ںˣ��뵽"�ɹ���ֲ���ں�"�ļ�������ȡ
!cecho! {0B} ============================================================{0F}{\n}
start �ɹ���ֲ���ں�\
del ramdisk.cpio.gz >nul 2>nul
del ramdisk.cpio.gz.tmp >nul 2>nul
pause
goto home
:auto_recovery_porting
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
del boot-new.img 2>nul
del boot.img.tmp 2>nul
del boot_old.img 2>nul
del recovery-new.img 2>nul
md �ٷ�recovery >nul 2>nul
md Ҫ��ֲrecovery >nul 2>nul
echo.
!cecho! {0D} ==================================================={\n}
echo  ���ٷ�ROM�е�recovery.img�ŵ�"�ٷ�recovery"�ļ���
echo  ��Ҫ��ֲ��recovery.img�ŵ�"Ҫ��ֲrecovery"�ļ���
!cecho! {0D} ==================================================={0F}{\n}
pause
echo.
if not exist "Ҫ��ֲrecovery\recovery.img" (
echo.
echo.
!cecho! {0C}      �����·�����Ƿ���� Ҫ��ֲrecovery\recovery.img��{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
echo.
if not exist "�ٷ�recovery\recovery.img" (
echo.
echo.
!cecho! {0C}      �����·�����Ƿ���� �ٷ�recovery\recovery.img��{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
copy �ٷ�recovery\recovery.img >nul 2>nul
ren recovery.img boot.img >nul 2>nul
!bootimg! --unpack-bootimg
ren kernel kernel_backups >nul 2>nul
ren kernel.gz kernel_backups >nul 2>nul
del ramdisk >nul 2>nul
del ramdisk.gz >nul 2>nul
del boot.img >nul 2>nul
rd /s /q AIHGTkernel >nul 2>nul
del bootinfo.txt >nul 2>nul
del cpiolist.txt >nul 2>nul
del boot-old.img >nul 2>nul
copy Ҫ��ֲrecovery\recovery.img >nul 2>nul
ren recovery.img boot.img
echo.
!bootimg! --unpack-bootimg
del kernel >nul 2>nul
del kernel.gz >nul 2>nul
ren kernel_backups kernel >nul 2>nul
ren kernel_backups kernel.gz >nul 2>nul
del ramdisk.cpio.gz >nul 2>nul
del ramdisk.cpio.gz.tmp >nul 2>nul
del boot-new.img >nul 2>nul
del boot.img.tmp >nul 2>nul
del boot_old.img >nul 2>nul
del recovery-new.img 2>nul
echo.
!bootimg! --repack-bootimg
md �ɹ���ֲrecovery >nul 2>nul
ren boot-new.img recovery.img
del �ɹ���ֲrecovery\recovery.img >nul 2>nul
move recovery.img �ɹ���ֲrecovery >nul 2>nul
del boot-old.img >nul 2>nul
!cecho! {0B} =========================================================={\n}
echo  �ɹ�һ����ֲrecovery���뵽"�ɹ���ֲrecovery"�ļ�������ȡ
!cecho! {0B} =========================================================={0F}{\n}
start �ɹ���ֲrecovery\
del ramdisk.cpio.gz >nul 2>nul
del ramdisk.cpio.gz.tmp >nul 2>nul
pause
goto home
:custom_kernel_porting
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
del boot-new.img 2>nul
del boot.img.tmp 2>nul
del boot_old.img 2>nul
md �ٷ��ں� >nul 2>nul
md Ҫ��ֲ�ں� >nul 2>nul
echo.
!cecho! {0D} ========================================{\n}
echo  ���ٷ�ROM��boot.img�ŵ�"�ٷ��ں�"�ļ���
echo  ��Ҫ��ֲROM��boot.img�ŵ�"Ҫ��ֲ�ں�"�ļ���
!cecho! {0D} ========================================{0F}{\n}
pause
echo.
if not exist "Ҫ��ֲ�ں�\boot.img" (
echo.
echo.
!cecho! {0C}      �����·�����Ƿ���� Ҫ��ֲ�ں�\boot.img��{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
echo.
if not exist "�ٷ��ں�\boot.img" (
echo.
echo.
!cecho! {0C}      �����·�����Ƿ���� �ٷ��ں�\boot.img��{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
copy �ٷ��ں�\boot.img boot.img >nul 2>nul
!bootimg! --unpack-bootimg
ping -n 1 127.1 >nul 2>nul
if exist "file_contexts.bin" goto custom_kernel_porting_file_contexts.bin
if exist "file_contexts" goto custom_kernel_porting_file_contexts
:custom_kernel_porting_file_contexts.bin
!file_contexts_tool! AIHGTkernel\file_contexts.bin -o AIHGTkernel\file_contexts -e >nul 2>nul
del �ٷ��ں�\kernel.gz >nul 2>nul
del �ٷ��ں�\kernel >nul 2>nul
del �ٷ��ں�\ramdisk.gz >nul 2>nul
del �ٷ��ں�\ramdisk >nul 2>nul
del �ٷ��ں�\cpiolist.txt >nul 2>nul
del �ٷ��ں�\bootinfo.txt >nul 2>nul
rd /s /q �ٷ��ں�\AIHGTkernel >nul 2>nul
move kernel.gz �ٷ��ں�\ >nul 2>nul
move kernel �ٷ��ں�\ >nul 2>nul
move ramdisk.gz �ٷ��ں�\ >nul 2>nul
move ramdisk �ٷ��ں�\ >nul 2>nul
move cpiolist.txt �ٷ��ں�\ >nul 2>nul
move bootinfo.txt �ٷ��ں�\ >nul 2>nul
move AIHGTkernel �ٷ��ں�\ >nul 2>nul
move dt.img �ٷ��ں�\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
copy Ҫ��ֲ�ں�\boot.img boot.img >nul 2>nul
echo.
!bootimg! --unpack-bootimg
ping -n 1 127.1 >nul 2>nul
!file_contexts_tool! AIHGTkernel\file_contexts.bin -o AIHGTkernel\file_contexts -e >nul 2>nul
del Ҫ��ֲ�ں�\kernel.gz >nul 2>nul
del Ҫ��ֲ�ں�\kernel >nul 2>nul
del Ҫ��ֲ�ں�\ramdisk.gz >nul 2>nul
del Ҫ��ֲ�ں�\ramdisk >nul 2>nul
del Ҫ��ֲ�ں�\cpiolist.txt >nul 2>nul
del Ҫ��ֲ�ں�\bootinfo.txt >nul 2>nul
rd /s /q Ҫ��ֲ�ں�\AIHGTkernel >nul 2>nul
move kernel.gz Ҫ��ֲ�ں�\ >nul 2>nul
move kernel Ҫ��ֲ�ں�\ >nul 2>nul
move ramdisk.gz Ҫ��ֲ�ں�\ >nul 2>nul
move ramdisk Ҫ��ֲ�ں�\ >nul 2>nul
move cpiolist.txt Ҫ��ֲ�ں�\ >nul 2>nul
move bootinfo.txt Ҫ��ֲ�ں�\ >nul 2>nul
move AIHGTkernel Ҫ��ֲ�ں�\ >nul 2>nul
move dt.img Ҫ��ֲ�ں�\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
start bin\Beyond_Compare\BCompare.exe
!cecho! {0E} ============================================================{\n}
echo  ���ڴ��ļ��Ա���������ֲ��������... 
echo.
echo  ������ں˽⿪�������ļ��󣬰����������ʼ����ں�boot.img
!cecho! {0E} ============================================================{0F}{\n}
pause
del Ҫ��ֲ�ں�\AIHGTkernel\file_contexts.bin >nul 2>nul
!file_contexts_tool! Ҫ��ֲ�ں�\AIHGTkernel\file_contexts -o Ҫ��ֲ�ں�\AIHGTkernel\file_contexts.bin >nul 2>nul
if not exist "Ҫ��ֲ�ں�\AIHGTkernel\file_contexts.bin" !cecho! {0C}   ת��������־���֣�����file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home & else
del Ҫ��ֲ�ں�\AIHGTkernel\file_contexts >nul 2>nul
del �ٷ��ں�\AIHGTkernel\file_contexts.bin >nul 2>nul
!file_contexts_tool! �ٷ��ں�\AIHGTkernel\file_contexts -o �ٷ��ں�\AIHGTkernel\file_contexts.bin >nul 2>nul
if not exist "�ٷ��ں�\AIHGTkernel\file_contexts.bin" !cecho! {0C}   ת��������־���֣�����file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home & else
del �ٷ��ں�\AIHGTkernel\file_contexts >nul 2>nul
move �ٷ��ں�\kernel.gz kernel.gz >nul 2>nul
move �ٷ��ں�\kernel kernel >nul 2>nul
move Ҫ��ֲ�ں�\ramdisk.gz ramdisk.gz >nul 2>nul
move Ҫ��ֲ�ں�\ramdisk ramdisk >nul 2>nul
move Ҫ��ֲ�ں�\cpiolist.txt cpiolist.txt >nul 2>nul
move Ҫ��ֲ�ں�\bootinfo.txt bootinfo.txt >nul 2>nul
xcopy /e Ҫ��ֲ�ں�\AIHGTkernel\* AIHGTkernel\* >nul 2>nul
move Ҫ��ֲ�ں�\dt.img dt.img >nul 2>nul
ping -n 1 127.1 >nul 2>nul
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
del boot-new.img 2>nul
del boot.img.tmp 2>nul
del boot_old.img 2>nul
echo.
!bootimg! --repack-bootimg
ren boot-new.img boot.img
del �ɹ���ֲ���ں�\boot.img >nul 2>nul
md �ɹ���ֲ���ں� >nul 2>nul
move boot.img �ɹ���ֲ���ں�\ >nul 2>nul
del �ٷ��ں�\ramdisk.gz >nul 2>nul
del �ٷ��ں�\ramdisk >nul 2>nul
del �ٷ��ں�\cpiolist.txt >nul 2>nul
del �ٷ��ں�\bootinfo.txt >nul 2>nul
rd /s /q �ٷ��ں�\AIHGTkernel >nul 2>nul
del Ҫ��ֲ�ں�\kernel.gz >nul 2>nul
del Ҫ��ֲ�ں�\kernel >nul 2>nul
rd /s /q Ҫ��ֲ�ں�\AIHGTkernel >nul 2>nul
!cecho! {0B} ============================================================{\n}
echo  �ɹ�һ����ֲboot.img�ںˣ��뵽"�ɹ���ֲ���ں�"�ļ�������ȡ
!cecho! {0B} ============================================================{0F}{\n}
start �ɹ���ֲ���ں�\
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
pause
goto home
:custom_kernel_porting_file_contexts
del �ٷ��ں�\kernel.gz >nul 2>nul
del �ٷ��ں�\kernel >nul 2>nul
del �ٷ��ں�\ramdisk.gz >nul 2>nul
del �ٷ��ں�\ramdisk >nul 2>nul
del �ٷ��ں�\cpiolist.txt >nul 2>nul
del �ٷ��ں�\bootinfo.txt >nul 2>nul
rd /s /q �ٷ��ں�\AIHGTkernel >nul 2>nul
move kernel.gz �ٷ��ں�\ >nul 2>nul
move kernel �ٷ��ں�\ >nul 2>nul
move ramdisk.gz �ٷ��ں�\ >nul 2>nul
move ramdisk �ٷ��ں�\ >nul 2>nul
move cpiolist.txt �ٷ��ں�\ >nul 2>nul
move bootinfo.txt �ٷ��ں�\ >nul 2>nul
move AIHGTkernel �ٷ��ں�\ >nul 2>nul
move dt.img �ٷ��ں�\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
copy Ҫ��ֲ�ں�\boot.img boot.img >nul 2>nul
echo.
!bootimg! --unpack-bootimg
ping -n 1 127.1 >nul 2>nul
del Ҫ��ֲ�ں�\kernel.gz >nul 2>nul
del Ҫ��ֲ�ں�\kernel >nul 2>nul
del Ҫ��ֲ�ں�\ramdisk.gz >nul 2>nul
del Ҫ��ֲ�ں�\ramdisk >nul 2>nul
del Ҫ��ֲ�ں�\cpiolist.txt >nul 2>nul
del Ҫ��ֲ�ں�\bootinfo.txt >nul 2>nul
rd /s /q Ҫ��ֲ�ں�\AIHGTkernel >nul 2>nul
move kernel.gz Ҫ��ֲ�ں�\ >nul 2>nul
move kernel Ҫ��ֲ�ں�\ >nul 2>nul
move ramdisk.gz Ҫ��ֲ�ں�\ >nul 2>nul
move ramdisk Ҫ��ֲ�ں�\ >nul 2>nul
move cpiolist.txt Ҫ��ֲ�ں�\ >nul 2>nul
move bootinfo.txt Ҫ��ֲ�ں�\ >nul 2>nul
move AIHGTkernel Ҫ��ֲ�ں�\ >nul 2>nul
move dt.img Ҫ��ֲ�ں�\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
start bin\Beyond_Compare\BCompare.exe
!cecho! {0E} ============================================================{\n}
echo  ���ڴ��ļ��Ա���������ֲ��������... 
echo.
echo  ������ں˽⿪�������ļ��󣬰����������ʼ����ں�boot.img
!cecho! {0E} ============================================================{0F}{\n}
pause
move �ٷ��ں�\kernel.gz kernel.gz >nul 2>nul
move �ٷ��ں�\kernel kernel >nul 2>nul
move Ҫ��ֲ�ں�\ramdisk.gz ramdisk.gz >nul 2>nul
move Ҫ��ֲ�ں�\ramdisk ramdisk >nul 2>nul
move Ҫ��ֲ�ں�\cpiolist.txt cpiolist.txt >nul 2>nul
move Ҫ��ֲ�ں�\bootinfo.txt bootinfo.txt >nul 2>nul
xcopy /e Ҫ��ֲ�ں�\AIHGTkernel\* AIHGTkernel\* >nul 2>nul
move Ҫ��ֲ�ں�\dt.img dt.img >nul 2>nul
ping -n 1 127.1 >nul 2>nul
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
del boot-new.img 2>nul
del boot.img.tmp 2>nul
del boot_old.img 2>nul
echo.
!bootimg! --repack-bootimg
ren boot-new.img boot.img
del �ɹ���ֲ���ں�\boot.img >nul 2>nul
md �ɹ���ֲ���ں� >nul 2>nul
move boot.img �ɹ���ֲ���ں�\ >nul 2>nul
del �ٷ��ں�\ramdisk.gz >nul 2>nul
del �ٷ��ں�\ramdisk >nul 2>nul
del �ٷ��ں�\cpiolist.txt >nul 2>nul
del �ٷ��ں�\bootinfo.txt >nul 2>nul
rd /s /q �ٷ��ں�\AIHGTkernel >nul 2>nul
del Ҫ��ֲ�ں�\kernel.gz >nul 2>nul
del Ҫ��ֲ�ں�\kernel >nul 2>nul
rd /s /q Ҫ��ֲ�ں�\AIHGTkernel >nul 2>nul
!cecho! {0B} ============================================================{\n}
echo  �ɹ�һ����ֲboot.img�ںˣ��뵽"�ɹ���ֲ���ں�"�ļ�������ȡ
!cecho! {0B} ============================================================{0F}{\n}
start �ɹ���ֲ���ں�\
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
pause
goto home
:custom_recovery_porting
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
del boot-new.img 2>nul
del boot.img.tmp 2>nul
del boot_old.img 2>nul
md �ٷ�recovery >nul 2>nul
md Ҫ��ֲrecovery >nul 2>nul
!cecho! {0D} ==================================================={\n}
echo  ���ٷ�ROM�е�recovery.img�ŵ�"�ٷ�recovery"�ļ���
echo  ��Ҫ��ֲ��recovery.img�ŵ�"Ҫ��ֲrecovery"�ļ���
!cecho! {0D} ==================================================={0F}{\n}
pause
echo.
if not exist "�ٷ�recovery\recovery.img" (
echo.
echo.
!cecho! {0C}      �����·�����Ƿ���� �ٷ�recovery\recovery.img��{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
echo.
if not exist "Ҫ��ֲrecovery\recovery.img" (
echo.
echo.
!cecho! {0C}      �����·�����Ƿ���� Ҫ��ֲrecovery\recovery.img��{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
copy �ٷ�recovery\recovery.img recovery.img >nul 2>nul
ren recovery.img boot.img
!bootimg! --unpack-bootimg
ping -n 1 127.1 >nul 2>nul
if exist "file_contexts.bin" goto custom_recovery_porting_file_contexts.bin
if exist "file_contexts" goto custom_recovery_porting_file_contexts
:custom_recovery_porting_file_contexts.bin
!file_contexts_tool! AIHGTkernel\file_contexts.bin -o AIHGTkernel\file_contexts -e >nul 2>nul
rd /s /q �ٷ�recovery\kernel.gz >nul 2>nul
rd /s /q �ٷ�recovery\kernel >nul 2>nul
rd /s /q �ٷ�recovery\ramdisk.gz >nul 2>nul
rd /s /q �ٷ�recovery\ramdisk >nul 2>nul
rd /s /q �ٷ�recovery\cpiolist.txt >nul 2>nul
rd /s /q �ٷ�recovery\bootinfo.txt >nul 2>nul
rd /s /q �ٷ�recovery\AIHGTkernel >nul 2>nul
move kernel.gz �ٷ�recovery\ >nul 2>nul
move kernel �ٷ�recovery\ >nul 2>nul
move ramdisk.gz �ٷ�recovery\ >nul 2>nul
move ramdisk �ٷ�recovery\ >nul 2>nul
move cpiolist.txt �ٷ�recovery\ >nul 2>nul
move bootinfo.txt �ٷ�recovery\ >nul 2>nul
move AIHGTkernel �ٷ�recovery\ >nul 2>nul
move dt.img �ٷ�recovery\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
copy Ҫ��ֲrecovery\recovery.img recovery.img >nul 2>nul
ren recovery.img boot.img
echo.
!bootimg! --unpack-bootimg
ping -n 1 127.1 >nul 2>nul
!file_contexts_tool! AIHGTkernel\file_contexts.bin -o AIHGTkernel\file_contexts -e >nul 2>nul
rd /s /q Ҫ��ֲrecovery\kernel.gz >nul 2>nul
rd /s /q Ҫ��ֲrecovery\kernel >nul 2>nul
rd /s /q Ҫ��ֲrecovery\ramdisk.gz >nul 2>nul
rd /s /q Ҫ��ֲrecovery\ramdisk >nul 2>nul
rd /s /q Ҫ��ֲrecovery\cpiolist.txt >nul 2>nul
rd /s /q Ҫ��ֲrecovery\bootinfo.txt >nul 2>nul
rd /s /q Ҫ��ֲrecovery\AIHGTkernel >nul 2>nul
move kernel.gz Ҫ��ֲrecovery\ >nul 2>nul
move kernel Ҫ��ֲrecovery\ >nul 2>nul
move ramdisk.gz Ҫ��ֲrecovery\ >nul 2>nul
move ramdisk Ҫ��ֲrecovery\ >nul 2>nul
move cpiolist.txt Ҫ��ֲrecovery\ >nul 2>nul
move bootinfo.txt Ҫ��ֲrecovery\ >nul 2>nul
move AIHGTkernel Ҫ��ֲrecovery\ >nul 2>nul
move dt.img Ҫ��ֲrecovery\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
start bin\Beyond_Compare\BCompare.exe
!cecho! {0D} ================================================================{\n}
echo  ���ڴ��ļ��Ա���������ֲ��������...  
echo.
echo  �����recovery�⿪�������ļ��󣬰����������ʼ���recovery.img
!cecho! {0D} ================================================================{0F}{\n}
pause
del Ҫ��ֲrecovery\AIHGTkernel\file_contexts.bin >nul 2>nul
!file_contexts_tool! Ҫ��ֲrecovery\AIHGTkernel\file_contexts -o Ҫ��ֲrecovery\AIHGTkernel\file_contexts.bin >nul 2>nul
if not exist "Ҫ��ֲrecovery\AIHGTkernel\file_contexts.bin" !cecho! {0C}   ת��������־���֣�����file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home & else
del Ҫ��ֲrecovery\AIHGTkernel\file_contexts >nul 2>nul
del �ٷ�recovery\AIHGTkernel\file_contexts.bin >nul 2>nul
!file_contexts_tool! �ٷ�recovery\AIHGTkernel\file_contexts -o �ٷ�recovery\AIHGTkernel\file_contexts.bin >nul 2>nul
if not exist "�ٷ�recovery\AIHGTkernel\file_contexts.bin" !cecho! {0C}   ת��������־���֣�����file_contexts�����ͻ  ��{0F}{\n} & echo. & pause & goto home & else
del �ٷ�recovery\AIHGTkernel\file_contexts >nul 2>nul
move �ٷ�recovery\kernel.gz kernel.gz >nul 2>nul
move �ٷ�recovery\kernel kernel >nul 2>nul
move Ҫ��ֲrecovery\ramdisk.gz ramdisk.gz >nul 2>nul
move Ҫ��ֲrecovery\ramdisk ramdisk >nul 2>nul
move Ҫ��ֲrecovery\cpiolist.txt cpiolist.txt >nul 2>nul
move Ҫ��ֲrecovery\bootinfo.txt bootinfo.txt >nul 2>nul
xcopy /e Ҫ��ֲrecovery\AIHGTkernel\* AIHGTkernel\* >nul 2>nul
move Ҫ��ֲrecovery\dt.img dt.img >nul 2>nul
ping -n 1 127.1 >nul 2>nul
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
del boot-new.img 2>nul
del boot.img.tmp 2>nul
del boot_old.img 2>nul
echo.
!bootimg! --repack-bootimg
ren boot-new.img recovery.img
del �ɹ���ֲrecovery\recovery.img >nul 2>nul
md �ɹ���ֲrecovery >nul 2>nul
move recovery.img �ɹ���ֲrecovery\ >nul 2>nul
del �ٷ�recovery\ramdisk.gz >nul 2>nul
del �ٷ�recovery\ramdisk >nul 2>nul
del �ٷ�recovery\cpiolist.txt >nul 2>nul
del �ٷ�recovery\bootinfo.txt >nul 2>nul
rd /s /q �ٷ�recovery\AIHGTkernel >nul 2>nul
del Ҫ��ֲrecovery\kernel.gz >nul 2>nul
del Ҫ��ֲrecovery\kernel >nul 2>nul
rd /s /q Ҫ��ֲrecovery\AIHGTkernel >nul 2>nul
!cecho! {0B} =========================================================={\n}
echo  �ɹ�һ����ֲrecovery���뵽"�ɹ���ֲrecovery"�ļ�������ȡ 
!cecho! {0B} =========================================================={0F}{\n}
start �ɹ���ֲrecovery\
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
pause
goto home
:custom_recovery_porting_file_contexts
rd /s /q �ٷ�recovery\kernel.gz >nul 2>nul
rd /s /q �ٷ�recovery\kernel >nul 2>nul
rd /s /q �ٷ�recovery\ramdisk.gz >nul 2>nul
rd /s /q �ٷ�recovery\ramdisk >nul 2>nul
rd /s /q �ٷ�recovery\cpiolist.txt >nul 2>nul
rd /s /q �ٷ�recovery\bootinfo.txt >nul 2>nul
rd /s /q �ٷ�recovery\AIHGTkernel >nul 2>nul
move kernel.gz �ٷ�recovery\ >nul 2>nul
move kernel �ٷ�recovery\ >nul 2>nul
move ramdisk.gz �ٷ�recovery\ >nul 2>nul
move ramdisk �ٷ�recovery\ >nul 2>nul
move cpiolist.txt �ٷ�recovery\ >nul 2>nul
move bootinfo.txt �ٷ�recovery\ >nul 2>nul
move AIHGTkernel �ٷ�recovery\ >nul 2>nul
move dt.img �ٷ�recovery\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
copy Ҫ��ֲrecovery\recovery.img recovery.img >nul 2>nul
ren recovery.img boot.img
echo.
!bootimg! --unpack-bootimg
ping -n 1 127.1 >nul 2>nul
rd /s /q Ҫ��ֲrecovery\kernel.gz >nul 2>nul
rd /s /q Ҫ��ֲrecovery\kernel >nul 2>nul
rd /s /q Ҫ��ֲrecovery\ramdisk.gz >nul 2>nul
rd /s /q Ҫ��ֲrecovery\ramdisk >nul 2>nul
rd /s /q Ҫ��ֲrecovery\cpiolist.txt >nul 2>nul
rd /s /q Ҫ��ֲrecovery\bootinfo.txt >nul 2>nul
rd /s /q Ҫ��ֲrecovery\AIHGTkernel >nul 2>nul
move kernel.gz Ҫ��ֲrecovery\ >nul 2>nul
move kernel Ҫ��ֲrecovery\ >nul 2>nul
move ramdisk.gz Ҫ��ֲrecovery\ >nul 2>nul
move ramdisk Ҫ��ֲrecovery\ >nul 2>nul
move cpiolist.txt Ҫ��ֲrecovery\ >nul 2>nul
move bootinfo.txt Ҫ��ֲrecovery\ >nul 2>nul
move AIHGTkernel Ҫ��ֲrecovery\ >nul 2>nul
move dt.img Ҫ��ֲrecovery\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
start bin\Beyond_Compare\BCompare.exe
!cecho! {0D} ================================================================{\n}
echo  ���ڴ��ļ��Ա���������ֲ��������...  
echo.
echo  �����recovery�⿪�������ļ��󣬰����������ʼ���recovery.img
!cecho! {0D} ================================================================{0F}{\n}
pause
move �ٷ�recovery\kernel.gz kernel.gz >nul 2>nul
move �ٷ�recovery\kernel kernel >nul 2>nul
move Ҫ��ֲrecovery\ramdisk.gz ramdisk.gz >nul 2>nul
move Ҫ��ֲrecovery\ramdisk ramdisk >nul 2>nul
move Ҫ��ֲrecovery\cpiolist.txt cpiolist.txt >nul 2>nul
move Ҫ��ֲrecovery\bootinfo.txt bootinfo.txt >nul 2>nul
xcopy /e Ҫ��ֲrecovery\AIHGTkernel\* AIHGTkernel\* >nul 2>nul
move Ҫ��ֲrecovery\dt.img dt.img >nul 2>nul
ping -n 1 127.1 >nul 2>nul
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
del boot-new.img 2>nul
del boot.img.tmp 2>nul
del boot_old.img 2>nul
echo.
!bootimg! --repack-bootimg
ren boot-new.img recovery.img
del �ɹ���ֲrecovery\recovery.img >nul 2>nul
md �ɹ���ֲrecovery >nul 2>nul
move recovery.img �ɹ���ֲrecovery\ >nul 2>nul
del �ٷ�recovery\ramdisk.gz >nul 2>nul
del �ٷ�recovery\ramdisk >nul 2>nul
del �ٷ�recovery\cpiolist.txt >nul 2>nul
del �ٷ�recovery\bootinfo.txt >nul 2>nul
rd /s /q �ٷ�recovery\AIHGTkernel >nul 2>nul
del Ҫ��ֲrecovery\kernel.gz >nul 2>nul
del Ҫ��ֲrecovery\kernel >nul 2>nul
rd /s /q Ҫ��ֲrecovery\AIHGTkernel >nul 2>nul
!cecho! {0B} =========================================================={\n}
echo  �ɹ�һ����ֲrecovery���뵽"�ɹ���ֲrecovery"�ļ�������ȡ 
!cecho! {0B} =========================================================={0F}{\n}
start �ɹ���ֲrecovery\
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
pause
goto home
:simg2img
echo.
echo.
!cecho! {0A} ===================================================================================================================={\n}
!cecho! {0E}   ��ȷ������������ext4��ʽ��img�����ļ��ͱ�������ͬ�����̷������ڱ�����Ŀ¼�£���ͬ�����̷��޷�ת��ʹ�ã�{\n}
echo.
!cecho! {0C}   ���ڵ���ѡ������������ext4��ʽ��img�����ļ������½�λ�õ�ѡ���򿪡�ѡ��ɿ�ʼת��{\n}
echo.
!cecho! {0B}   ��Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...{\n}
!cecho! {0A} ===================================================================================================================={0F}{\n}
set afolder=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
if "%" == " " (
	set afolder=%date:~0,4%%date:~5,2%%date:~8,2%_t%time:~3,2%%time:~6,2%
)
echo.
set simg3img=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set simg3img=" "%~dp0\*.img"`) do %%a
!simg2img! %simg3img% %afolder%.ext4.img >nul 2>nul
echo.
!cecho! {0F}ת����ϣ�ת�������ļ�Ϊ{0D} %afolder%.ext4.img {0F}{\n}
pause
goto home
:img2simg
echo.
echo.
!cecho! {0A} ===================================================================================================================={\n}
!cecho! {0E}   ��ȷ������������simg��ʽ��img�����ļ��ͱ�������ͬ�����̷������ڱ�����Ŀ¼�£���ͬ�����̷��޷�ת��ʹ�ã�{\n}
echo.
!cecho! {0C}   ���ڵ���ѡ������������simg��ʽ��img�����ļ������½�λ�õ�ѡ���򿪡�ѡ��ɿ�ʼת��{\n}
echo.
!cecho! {0B}   ��Ҫ������ʱ�������ɣ��ٶȿ���ȡ������ĵ������ã������ĵȴ�...{\n}
!cecho! {0A} ===================================================================================================================={0F}{\n}
set folderb=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
if "%" == " " (
	set folderb=%date:~0,4%%date:~5,2%%date:~8,2%_t%time:~3,2%%time:~6,2%
)
echo.
set img2simg=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set img2simg=" "%~dp0\*.img;*.raw;*.ext4;*.win"`) do %%a
!raw2simg! %img2simg% %folderb%.simg.img >nul 2>nul
echo.
!cecho! {0F}ת����ϣ�ת�������ļ�Ϊ{0D} %folderb%.simg.img {0F}{\n}
pause
goto home
:systemdatbr_to_img
!cecho! {0F}������dat��ʽ��ȷ�Ϻ�ĸĿ¼��ͬʱ��system.new.dat��system.transfer.list  {0F}{\n}
echo.
!cecho! {0F}������br��ʽ��ȷ�Ϻ�ĸĿ¼��ͬʱ��system.new.dat.br��system.transfer.list{\n}
pause
!dat2br! -d -o system.new.dat system.new.dat.br >nul 2>nul
!sdat2img! system.transfer.list system.new.dat system.img
goto home
:vendordatbr_to_img
!cecho! {0F}������dat��ʽ��ȷ�Ϻ�ĸĿ¼��ͬʱ��vendor.new.dat��vendor.transfer.list{\n}
echo.
!cecho! {0F}������br��ʽ��ȷ�Ϻ�ĸĿ¼��ͬʱ��vendor.new.dat.br��vendor.transfer.list{0F}{\n}
pause
!dat2br! -d -o vendor.new.dat vendor.new.dat.br >nul 2>nul
!sdat2img! vendor.transfer.list vendor.new.dat vendor.img
goto home
:unpack_xxx.imgdatbr
echo.
echo.
!cecho! {0E}{\n}
echo   1.�����������xxx.img
!cecho! {0B}{\n}
echo   2.�����������xxx.dat
!cecho! {0C}{\n}
echo   3.�����������xxx.dat.br
!cecho! {0A}{\n}
echo   0.���ع�����ҳ
!cecho! {0F}{\n}
echo.
set /p webxxximgdatbr=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webxxximgdatbr%"=="1" goto xxx_img
if "%webxxximgdatbr%"=="2" goto xxx_dat
if "%webxxximgdatbr%"=="3" goto xxx_br
if "%webxxximgdatbr%"=="0" goto home
goto unpack_xxx.imgdatbr
:xxx_br
echo.
echo.
!cecho! {0A} ==========================================================================================================={\n}
!cecho! {0E}   ��ȷ������������xxx.dat.br\xxx.list��ʽ�ľ����ļ��ͱ�������ͬ�����̷������ڱ�����Ŀ¼�£���ͬ�����̷��޷����ʹ�ã�{\n}
echo.
!cecho! {0C}   ���ڵ���ѡ������������xxx.dat.br\xxx.list��ʽ�ļ������½�λ�õ�ѡ���򿪡�ѡ��ɿ�ʼ���...{\n}
!cecho! {0A} ==========================================================================================================={0F}{\n}
call :xxx_foldrr
set unpackxxxbrdat=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set unpackxxxbrdat=" "%~dp0\*.br"`) do %%a
set unpackxxxbrlist=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set unpackxxxbrlist=" "%~dp0\*.list"`) do %%a
call :custom_unpack
!dat2br! -d -o %unpackxxxbrdat%.dat %unpackxxxbrdat%
!sdat2img! %unpackxxxbrlist% %unpackxxxbrdat%.dat %unpackxxxbrdat%.img
call :xxx_brdat
:xxx_dat
echo.
echo.
!cecho! {0A} ==========================================================================================================={\n}
!cecho! {0E}   ��ȷ������������xxx.dat\xxx.list��ʽ�ľ����ļ��ͱ�������ͬ�����̷������ڱ�����Ŀ¼�£���ͬ�����̷��޷����ʹ�ã�{\n}
echo.
!cecho! {0C}   ���ڵ���ѡ������������xxx.dat\xxx.list��ʽ�ļ������½�λ�õ�ѡ���򿪡�ѡ��ɿ�ʼ���...{\n}
!cecho! {0A} ==========================================================================================================={0F}{\n}
call :xxx_foldrr
set unpackxxxbrdat=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set unpackxxxbrdat=" "%~dp0\*.dat"`) do %%a
set unpackxxxdatlist=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set unpackxxxdatlist=" "%~dp0\*.list"`) do %%a
call :custom_unpack
!sdat2img! %unpackxxxbrlist% %unpackxxxbrdat%.dat %unpackxxxbrdat%.img
call :xxx_brdat
:xxx_brdat
echo.
!unpack-image! %unpackxxxbrdat%.img
del %unpackxxxbrdat%.img >nul 2>nul
del %unpackxxxbrdat%.dat >nul 2>nul
goto home
:xxx_img
echo.
echo.
!cecho! {0A} ==========================================================================================================={\n}
!cecho! {0E}   ��ȷ������������xxx.img��ʽ�ľ����ļ��ͱ�������ͬ�����̷������ڱ�����Ŀ¼�£���ͬ�����̷��޷����ʹ�ã�{\n}
echo.
!cecho! {0C}   ���ڵ���ѡ������������xxx.img��ʽ�ļ������½�λ�õ�ѡ���򿪡�ѡ��ɿ�ʼ���...{\n}
!cecho! {0A} ==========================================================================================================={0F}{\n}
call :xxx_foldrr
set unpackxxximg=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set unpackxxximg=" "%~dp0\*.img"`) do %%a
echo.
!unpack-image! %unpackxxximg%
goto home
:xxx_foldrr
set foldrr=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
if "%" == " " (
	set foldrr=%date:~0,4%%date:~5,2%%date:~8,2%_t%time:~3,2%%time:~6,2%
)
rd /s /q bin\cache >nul 2>nul
md bin\cache >nul 2>nul
goto :eof
:img_mount
echo.
echo.
!cecho! {0B}{\n}
echo   1.���ؽ����������.img����
!cecho! {0B}{\n}
echo   2.���ؽ��system.img
!cecho! {0B}{\n}
echo   3.���ؽ��vendor.img
!cecho! {0C}{\n}
echo   0.�ص�������ҳ
!cecho! {0F}{\n}
echo.
set /p webmountt=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webmountt%"=="1" goto img_mount_custom
if "%webmountt%"=="2" call :img_mount system
if "%webmountt%"=="3" call :img_mount vendor
if "%webmountt%"=="0" goto home
goto pc_home
:img_mount_custom
cd.>custom_AIHGT_permissions
echo.
echo.
!cecho! {0A} ==========================================================================================================={\n}
!cecho! {0E}   ��ȷ������������img\ext4��ʽ�ľ����ļ��ͱ�������ͬ�����̷������ڱ�����Ŀ¼�£���ͬ�����̷��޷����ʹ�ã�{\n}
echo.
!cecho! {0C}   ���ڵ���ѡ������������xxx.img\xxx.ext4��ʽ�ļ������½�λ�õ�ѡ���򿪡�ѡ��ɿ�ʼ���ؽ��...{\n}
!cecho! {0A} ==========================================================================================================={0F}{\n}
set folderd=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
if "%" == " " (
	set folderd=%date:~0,4%%date:~5,2%%date:~8,2%_t%time:~3,2%%time:~6,2%
)
echo.
set imgh=
md ����img_ext4_%folderd%
rd /s /q bin\cache >nul 2>nul
md bin\cache >nul 2>nul
for /f "usebackq delims=" %%a in (`!FileToOpen! "set imgh=" "%~dp0\*.img;*.ext4;*.raw;*.win"`) do %%a
!simg2img! %imgh% bin\cache\xxximg.ext4 >nul 2>nul
call :custom_unpack
!cecho! {0E}�����ļ��Ա���BCompare���ش򿪺�{\n}
echo.
!cecho! {0E}ѡ����Ҫ��ȡĿ¼���ļ���������Ҽ������Ƶ��ļ��С�����ĸĿ¼�µ�{0D} ����img_ext4_%folderd% {0E}�ļ���{\n}
echo.
!cecho! {0E}��ȡ��Ϻ���Ϲر��ļ��Ա���BCompare����{0F}{\n}
echo.
for /r bin\cache\ %%a in (xxximg.ext4) do (
if %%~za==0 del bin\cache\xxximg.ext4
)
if not exist "bin\cache\xxximg.ext4" bin\Beyond_Compare\BCompare.exe %imgh% ����img_ext4_%folderd%
if exist "bin\cache\xxximg.ext4" bin\Beyond_Compare\BCompare.exe bin\cache\xxximg.ext4 ����img_ext4_%folderd%
rd /s /q bin\cache 2>nul
echo.
!cecho! {0F}��ȡ��ϣ���ȡ�����ļ���{0D} ����img_ext4_%folderd% {0F}Ŀ¼����.{\n}
echo.
rd /s /q ����img_ext4_%folderd%\[SYS] >nul 2>nul
pause
goto home
:img_mount
cd.>%1_AIHGT_permissions
rd /s /q %1 >nul 2>nul
md %1 >nul 2>nul
echo.
echo.
!cecho! {0A} ==========================================================================================================={\n}
!cecho! {0C}   ���ڵ���ѡ������������%1.img\%1.ext4��ʽ�ļ������½�λ�õ�ѡ���򿪡�ѡ��ɿ�ʼ���ؽ��...{\n}
!cecho! {0A} ==========================================================================================================={0F}{\n}
set folderd=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
if "%" == " " (
	set folderd=%date:~0,4%%date:~5,2%%date:~8,2%_t%time:~3,2%%time:~6,2%
)
echo.
!simg2img! %1.img %1ext4.img >nul 2>nul
call :custom_unpack
!cecho! {0E}�����ļ��Ա���BCompare���ش򿪺�{\n}
echo.
!cecho! {0E}ѡ����Ҫ��ȡĿ¼���ļ���������Ҽ������Ƶ��ļ��С�����ĸĿ¼�µ�{0D} %1 {0E}�ļ���{\n}
echo.
!cecho! {0E}��ȡ��Ϻ���Ϲر��ļ��Ա���BCompare����{0F}{\n}
echo.
for /r %~dp0 %%a in (%1ext4.img) do (
if %%~za==0 del %1ext4.img
)
del /f /s /q %1 >nul 2>nul
if not exist "%1ext4.img" bin\Beyond_Compare\BCompare.exe %1.img %1
if exist "%1ext4.img" bin\Beyond_Compare\BCompare.exe %1ext4.img %1
echo.
!cecho! {0F}��ȡ��ϣ���ȡ�����ļ���{0D} %1 {0F}Ŀ¼����.{\n}
echo.
rd /s /q %1\[SYS] >nul 2>nul
goto rom_look_build_%1
:unpack_systemimg
echo.
!cecho! {0B} ��Ҫ������ʱ�����ֽ�system.img���ٶȿ���ȡ������ĵ�������,�����ĵȴ�...{\n}
echo.
!cecho! {0B} ������ʧ��,����������ROM��system.img��system.new.dat���ƶԵ������½��������611193563��ĸȺ����ˢ���ű�è��{0F}{\n}
rd /s /q system\ >nul 2>nul
del /f /s /q system_AIHGT_permissions >nul 2>nul
del /f /s /q system_AIHGT_file_contexts >nul 2>nul
echo.
!unpack-image! system.img
if not exist "system\system" (
goto :unpack_system
else
)
if not exist "system\system\build.prop" (
else
)
FOR /f "tokens=1* delims==" %%a IN ('type "system\system\build.prop"') DO (
	if /I "%%~a"=="ro.build.version.release" (
		if not "%%~b"=="%api%" (
			set api=%%~b
			)
		)
	)
)
goto unpack_system_api
:unpack_system
if not exist "system\build.prop" (
goto home
else
)
FOR /f "tokens=1* delims==" %%a IN ('type "system\build.prop"') DO (
	if /I "%%~a"=="ro.build.version.release" (
		if not "%%~b"=="%api%" (
			set api=%%~b
			)
		)
	)
)
goto unpack_system_api
:unpack_system_api
if %api%==2.3 (goto unpack_system_build)
if %api%==4.0 (goto unpack_system_build)
if %api%==4.1 (goto unpack_system_build)
if %api%==4.2 (goto unpack_system_build)
if %api%==4.2.1 (goto unpack_system_build)
if %api%==4.2.2 (goto unpack_system_build)
if %api%==4.3 (goto unpack_system_build)
if %api%==4.4 (goto unpack_system_build)
if %api%==4.4.1 (goto unpack_system_build)
if %api%==4.4.2 (goto unpack_system_build)
if %api%==4.4.3 (goto unpack_system_build)
if %api%==4.4.4 (goto unpack_system_build)
if %api%==5.0 (goto unpack_system_build)
if %api%==5.1 (goto unpack_system_build)
if %api%==5.1.1 (goto unpack_system_build)
if %api%==6.0 (goto unpack_system_build)
if %api%==6.0.1 (goto unpack_system_build)
if %api%==7.0 (goto unpack_system_build)
if %api%==7.1 (goto unpack_system_build)
if %api%==7.1.1 (goto unpack_system_build)
if %api%==7.1.2 (goto unpack_system_build)
if %api%==8.0 (goto unpack_system_build)
if %api%==8.1 (goto unpack_system_build)
if %api%==9 (call :unpack_system_contexts 9)
if %api%==10 (call :unpack_system_contexts 10)
if %api%==Q (call :unpack_system_contexts 10)
if %api%==R (call :unpack_system_contexts 10)
if %api%==S (call :unpack_system_contexts 10)
if %api%==11 (call :unpack_system_contexts 10)
if %api%==12 (call :unpack_system_contexts 10)
if %api%==13 (call :unpack_system_contexts 10)
:unpack_system_contexts
del /f /s /q bin\system_AIHGT_file_context >nul 2>nul
del /f /s /q bin\temp.txt >nul 2>nul
copy system_AIHGT_file_contexts bin\temp.txt >nul 2>nul
for /f "skip=1 tokens=*" %%i in (bin\temp.txt) do echo %%i>>bin\system_AIHGT_file_context
call file_contexts%1.bat
:unpack_system_build
del /f /f /q system.ext4 >nul 2>nul
del /f /s /q bin\system_AIHGT_file_context >nul 2>nul
goto rom_look_build_system
:unpack_vendorimg
echo.
!cecho! {0B} ��Ҫ������ʱ�����ֽ�vendor.img���ٶȿ���ȡ������ĵ�������,�����ĵȴ�...{\n}
echo.
!cecho! {0B} ������ʧ��,����������ROM��vendor.img��vendor.new.dat���ƶԵ������½��������611193563��ĸȺ����ˢ���ű�è��{0F}{\n}
rd /s /q vendor\ >nul 2>nul
del /f /s /q vendor_AIHGT_permissions >nul 2>nul
del /f /s /q vendor_AIHGT_file_contexts >nul 2>nul
echo.
!unpack-image! vendor.img
del /f /f /q vendor.ext4 >nul 2>nul
goto rom_look_build_vendor
:unpack_systemdat
if not exist "system.new.dat" (
call :systemdat_else
goto home
else
)
if not exist "system.transfer.list" (
call :systemdat_else
goto home
else
)
rd /s /q system >nul 2>nul
del /f /s /q system_AIHGT_permissions >nul 2>nul
del /f /s /q system_AIHGT_file_contexts >nul 2>nul
del /f /s /q system.img.ext4 >nul 2>nul
del /f /s /q system.img >nul 2>nul
!sdat2img! system.transfer.list system.new.dat system.img
goto unpack_systemimg
:unpack_vendordat
if not exist "vendor.new.dat" (
call :vendordat_else
goto home
else
)
if not exist "vendor.transfer.list" (
call :vendordat_else
goto home
else
)
rd /s /q vendor >nul 2>nul
del /f /s /q vendor_AIHGT_permissions >nul 2>nul
del /f /s /q vendor_AIHGT_file_contexts >nul 2>nul
del /f /s /q vendor.img.ext4 >nul 2>nul
del /f /s /q vendor.img >nul 2>nul
!sdat2img! vendor.transfer.list vendor.new.dat vendor.img
goto unpack_vendorimg
:unpack_systembr
if not exist "system.new.dat.br" (
call :systemdat_else
goto home
else
)
if not exist "system.transfer.list" (
call :systemdat_else
goto home
else
)
rd /s /q system >nul 2>nul
del /f /s /q system_AIHGT_permissions >nul 2>nul
del /f /s /q system_AIHGT_file_contexts >nul 2>nul
del /f /s /q system.img.ext4 >nul 2>nul
del /f /s /q system.img >nul 2>nul
del /f /s /q system.new.dat >nul 2>nul
echo.
echo.
!cecho! {0E}  ����ת��system.new.dat.brת���ٶȿ���ȡ����ĵ�������...{0F}{\n}
echo.
!dat2br! -d -o system.new.dat system.new.dat.br
!sdat2img! system.transfer.list system.new.dat system.img
goto unpack_systemimg
:unpack_vendorbr
if not exist "vendor.new.dat.br" (
call :vendordat_else
goto home
else
)
if not exist "vendor.transfer.list" (
call :vendordat_else
goto home
else
)
rd /s /q vendor >nul 2>nul
del /f /s /q vendor_AIHGT_permissions >nul 2>nul
del /f /s /q vendor_AIHGT_file_contexts >nul 2>nul
del /f /s /q vendor.img.ext4 >nul 2>nul
del /f /s /q vendor.img >nul 2>nul
del /f /s /q vendor.new.dat >nul 2>nul
echo.
echo.
!cecho! {0E}  ����ת��vendor.new.dat.brת���ٶȿ���ȡ����ĵ�������...{0F}{\n}
echo.
!dat2br! -d -o vendor.new.dat vendor.new.dat.br
!sdat2img! vendor.transfer.list vendor.new.dat vendor.img
goto unpack_vendorimg
:not_build
if not exist "system\system\build.prop" (
echo  ����������޷�ʶ��build��Ϣ��systemĿ¼���Ƿ���build.prop���ļ�
echo.
pause
goto home
else
)
goto build_system_looking
:rom_look_build_system
del system\.journal >nul 2>nul
rd /s /q system\[SYS] 2>nul
rd /s /q bin\cache 2>nul
echo.
echo.
if not exist "system\build.prop" (
goto not_build
else
)
:build_system_looking
if not exist "system\system\build.prop" (
powershell -c "dir system\build.prop|%%{[IO.File]::ReadAllText($_, [Text.Encoding]::UTF8)|out-file ('bin\system_new_'+$_.Name) -encoding Default}"
goto system_build_version
else
)
powershell -c "dir system\system\build.prop|%%{[IO.File]::ReadAllText($_, [Text.Encoding]::UTF8)|out-file ('bin\system_new_'+$_.Name) -encoding Default}"
goto system_build_version
:build
echo --------------ROM��Ϣ---------------
for /f "tokens=1,2 delims==" %%a in ('find /v "#" ^<!BP!') do (
	if "%%a"=="ro.vendor.build.date" (echo ��������^:%%b) 
	if "%%a"=="ro.vendor.product.manufacturer" (echo �ֻ�����^:%%b)
	if "%%a"=="ro.vendor.product.model" (echo ��Ʒ�ͺ�^:%%b) 
	if "%%a"=="ro.vendor.product.brand" (echo Ʒ��^:%%b)
	if "%%a"=="ro.vendor.product.name" (echo �豸����^:%%b)
	if "%%a"=="ro.build.id" (echo ��ƷID^:%%b) 
	if "%%a"=="ro.build.version.sdk" (echo SDK�汾^:%%b) 
	if "%%a"=="ro.build.version.release" (echo ��׿�汾^:%%b) 
	if "%%a"=="ro.build.date" (echo ��������^:%%b) 
	if "%%a"=="ro.product.model" (echo ��Ʒ�ͺ�^:%%b) 
	if "%%a"=="ro.product.brand" (echo Ʒ��^:%%b)
	if "%%a"=="ro.product.name" (echo �豸����^:%%b)
	if "%%a"=="ro.vendor.product.manufacturer" (echo �ֻ�����^:%%b)
	if "%%a"=="ro.product.cpu.abi" (echo CPUָ�^:%%b) 
	if "%%a"=="ro.product.locale.language" (echo ����^:%%b) 
	if "%%a"=="ro.hardware" (echo Ӳ��^:%%b)
	if "%%a"=="telephony.lteOnCdmaDevice" (echo ȫ��ͨ���ͣ�0������,1���ڣ�^:%%b)
	if "%%a"=="ro.mediatek.platform" (echo CPUоƬƽ̨^:%%b)
	if "%%a"=="ro.product.first_api_level" (echo ��׿�汾api^:%%b)
	if "%%a"=="ro.board.platform" (echo CPU�ͺ�^:%%b)
	if "%%a"=="dalvik.vm.heapstartsize" (echo �������ʼ^:%%b) 
	if "%%a"=="dalvik.vm.heapgrowthlimit" (echo ���������^:%%b) 
	if "%%a"=="dalvik.vm.heapsize" (echo �������С^:%%b)  
	if "%%a"=="ro.sf.lcd_density" (echo ��ĻDPI^:%%b)
	if "%%a"=="ro.wifi.channels" (echo WIFI�ŵ�^:%%b)
	if "%%a"=="ro.sf.gsensorposition" (echo ������Ӧ^:%%b)
	if "%%a"=="persist.sys.timezone" (echo ʱ��ʱ��^:%%b) 
	if "%%a"=="ro.sf.hwrotation" (echo ��Ļ���÷���0������Ļ,180������Ļ��^:%%b) 
	if "%%a"=="ro.product.locale" (echo ����^:%%b)
	if "%%a"=="ro.yunos.version" (echo �����ư汾^:%%b)
	if "%%a"=="ro.yunos.build.version" (echo ������ROM�汾^:%%b)
	if "%%a"=="ro.build.display.id" (echo ROM�汾^:%%b)
	if "%%a"=="qemu.hw.mainkeys" (echo ���ⰴ����0����,1�رգ�^:%%b)
	if "%%a"=="dalvik.vm.isa.arm64.variant" (echo 64λCPU���ļܹ�^:%%b)
	if "%%a"=="dalvik.vm.isa.arm.variant" (echo ARM����CPU�ܹ�^:%%b)
	if "%%a"=="ro.treble.enabled" (!cecho! {0B}�ȸ�Project Treble��true֧��,false��֧�֣�:%%b{0F}{\n})
)
!cecho! {0E}  ========================================================================================={\n}
!cecho! {0E}                                         ���ʶ�����! {\n}
!cecho! {0E}  ========================================================================================={0F}{\n}
pause
del bin\system_new_build.prop >nul 2>nul
del bin\vendor_new_build.prop >nul 2>nul
goto home
:system_build_version
set BP="bin\system_new_build.prop"
goto build
echo.
if not exist "bin\system_new_build.prop" (
echo   �Ҳ���build.prop���ļ��޷�ʶ��build��Ϣ����ȷ���Ƿ�˺�ĸĿ¼��������ļ�
echo.
pause
goto home
else
)
del bin\system_new_build.prop >nul 2>nul
goto home
:rom_look_build_vendor
del vendor\.journal >nul 2>nul
rd /s /q vendor\[SYS] 2>nul
rd /s /q bin\cache 2>nul
echo.
echo.
if not exist "vendor\build.prop" (
echo   �Ҳ���vendor\build.prop���ļ��޷�ʶ��build��Ϣ����ȷ���Ƿ�˺�ĸĿ¼��������ļ�
echo.
pause
goto home
else
)
powershell -c "dir vendor\build.prop|%%{[IO.File]::ReadAllText($_, [Text.Encoding]::UTF8)|out-file ('bin\vendor_new_'+$_.Name) -encoding Default}"
set BP="bin\vendor_new_build.prop"
goto build
:home_adb_fastboot
cls
!cecho! {0A} **********************************************************************************************************************{\n}
!cecho! {0B} ���¹�����ȷ���Ƿ���˿�����ѡ�� - USB���Ժ�OEM�����������ֻ���Ļ�Ϲ��ϡ�����USB���ԡ���ʾ��������ʹ��!{\n}
!cecho! {0B} �������adb��fastboot�豸�����ʾ����ABCDEFG123 unauthorized(unauthorize�����ֻ���δ��Ȩ������,�޷�����ʹ�����¹���!{\n}
echo.
!cecho! {0E} ������߲���ʾ�豸��ſɳ��������ֻ�,������������adb��fastboot�豸����б�{0C}{\n}
!adb! devices & !fastboot! devices
!cecho! {0A} ��ѡ������ѡ��:{\n}
echo  **********************************************************************************************************************
echo.
!cecho!   {0E}0.�ص�������ҳ                                 5.ADB������recovery״̬�½�ͼ������{\n}
echo   1.ADB��ӡlogcatʵʱ������־                    6.ADB�����ֻ�����״̬�½�ͼ������
echo   2.ADB��ӡlogcat������־                        7.ADB������Ļ¼��(���mp4��ʽ)
echo   3.ADB�����ֻ��Զ�����ϵͳ                      8.ADB����apk��װ���ֻ���apk����ֻ�����ֻ���Ӣ��,�������޷���װ��
echo   4.ADB�����ֻ��Զ�������recoveryģʽ            9.fastbootģʽ��ˢsystem\vendor\boot\recovery\vbmeta����img��ʽ
!cecho! {0D}{\n}
echo  10 .recovery״̬��ADB Sideloadģʽ��������.zip��ʽ��ˢ��ˢ��
echo  11.����recovery�Զ���ˢ��rec������˫��,�ӿ�ˢ��META-INF\com\google\android\update-binary��ȡ�ŵ�������Ŀ¼�¡�
echo  12.fastbootģʽ����recovery�����recovery����Ϊrecovery.img�������ڱ�����Ŀ¼��,�����ֻ�����״̬�����С�
echo  13.��ADB����̨adb shellģʽ����Ҫ�ֶ������������ʵ��ADB���ֹ��ܡ�
echo  14.��ADB\fastboot����̨�ֶ�ģʽ����Ҫ�ֶ������������ʵ��ADB\fastboot���ֹ��ܡ�
!cecho! {0B}{\n}
echo  15.��ͨ900Eģʽת���ɸ�ͨ9008ģʽ              18.ADB�鿴CPU�ͺ���Ϣ                        21.ADB�鿴�ֻ�������ַ
echo  16.���ɹٷ�ԭ��recovery.img                    19.ADB�鿴�ֻ�������С                       22.ADB�鿴�ֻ�����
echo  17.ADB�鿴�ֻ���Ļ�ֱ���                       20.ADB�鿴�ֻ�����������                     23.ADB�鿴�ں˰汾
!cecho! {0F}{\n}
set /p webz=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webz%"=="0" goto home
if "%webz%"=="1" goto Print_logcat_time
if "%webz%"=="2" goto Print_logcat_cache
if "%webz%"=="3" !cecho! {0E}����ʹ��adb�������������ֻ�... {07}{\n} & !adb! reboot & pause & goto home_adb_fastboot
if "%webz%"=="4" !cecho! {0B}����ʹ��adb����������recoveryģʽ... {07}{\n} & !adb! reboot recovery & pause & goto home_adb_fastboot
if "%webz%"=="5" goto recovery_Screenshot
if "%webz%"=="6" goto android_screenshot
if "%webz%"=="7" goto ScreenVideo
if "%webz%"=="8" goto adb_install_apk
if "%webz%"=="9" goto fastboot_flash_img
if "%webz%"=="10" goto adb_sideload
if "%webz%"=="11" goto adb_flash_zip
if "%webz%"=="12" goto fastboot_install_recovery
if "%webz%"=="13" goto open_adb_fastboot_shell
if "%webz%"=="14" goto open_adb_fastboot_Manual
if "%webz%"=="15" !adb! reboot bootloader & !fastboot! reboot-edl & goto home_adb_fastboot
if "%webz%"=="16" goto adb_official_recovery
if "%webz%"=="17" goto adb_look_phone_screen_size
if "%webz%"=="18" !adb! shell cat /proc/cpuinfo & echo. &  pause & goto home_adb_fastboot
if "%webz%"=="19" !adb! shell df & echo. &  pause & goto home_adb_fastboot
if "%webz%"=="20" !adb! shell cat /proc/partitions & echo. &  pause & goto home_adb_fastboot
if "%webz%"=="21" !adb! shell cat /proc/mounts & echo. &  pause & goto home_adb_fastboot
if "%webz%"=="22" !adb! shell ls -l & echo. &  pause & goto home_adb_fastboot
if "%webz%"=="23" !adb! shell cat /proc/version & echo. &  pause & goto home_adb_fastboot
goto home_adb_fastboot
:adb_look_phone_screen_size
echo.
echo.
echo.
!cecho! {0B}�����ǵ�ǰ�ֻ�����Ļ�ֱ���{0E}{\n}
echo.
!adb! shell wm size
!cecho! {0F}{\n}
echo.
pause
goto home_adb_fastboot
:adb_official_recovery
if not exist "boot.img" (
call :bootimg_else
goto home_adb_fastboot
else
)
echo.
if not exist "recovery-from-boot.p" (
echo.
echo.
!cecho! {0C}      û�ҵ�recovery-from-boot.p����ȷ�Ϻ�ĸĿ¼���Ƿ����recovery-from-boot.p{0F}{\n}
echo.
echo.
echo.
pause
goto home_adb_fastboot
else
)
echo.
if not exist "recovery-resource.dat" (
echo.
echo.
!cecho! {0C}      û�ҵ�recovery-resource.dat����ȷ�Ϻ�ĸĿ¼���Ƿ����recovery-resource.dat{0F}{\n}
echo.
echo.
echo.
pause
goto home_adb_fastboot
else
)
echo.
if not exist "install-recovery.sh" (
echo.
echo.
!cecho! {0C}      û�ҵ�install-recovery.sh����ȷ�Ϻ�ĸĿ¼���Ƿ����install-recovery.sh{0F}{\n}
echo.
echo.
echo.
pause
goto home_adb_fastboot
else
)
echo.
echo.
!cecho! {0E}      ��Ҫ�ֻ�������-������ѡ��-USB���ԣ�����˳�����ɹٷ�recovery.img{\n}
echo.
!cecho! {0C}      �������·���ٷ��ļ���ȡ�������ں�ĸ��Ŀ¼��{\n}
!cecho! {0B}      boot.img{\n}
!cecho! {0B}      system\recovery-from-boot.p{\n}
!cecho! {0B}      system\etc\recovery-resource.dat{\n}
!cecho! {0B}      system\bin\install-recovery.sh{0F}{\n}
echo.
echo.
copy boot.img recovery.img >nul 2>nul
pause
ping 127.1 -n 2 >nul
bin\rec_sh.exe -i %cd%\install-recovery.sh -b -o %cd%\Recovery-Merge.sh
set /p Recovery_Merge=<Recovery-Merge.sh
del Recovery-Merge.sh
del recovery.img
fsutil file createnew recovery.img 0 >nul 2>nul
!adb! devices
!adb! push boot.img /data/local/tmp/
!adb! push recovery.img /data/local/tmp/
!adb! push recovery-from-boot.p /data/local/tmp/
!adb! push recovery-resource.dat /data/local/tmp/
!adb! shell %Recovery_Merge%
!adb! pull /data/local/tmp/recovery.img recovery.img
!adb! shell rm -f /data/local/tmp/boot.img
!adb! shell rm -f /data/local/tmp/recovery.img
!adb! shell rm -f /data/local/tmp/recovery-from-boot.p
!adb! shell rm -f /data/local/tmp/recovery-resource.dat
echo.
!cecho! {0C}          ���ɹٷ�recovery.img�ں�ĸ��Ŀ¼�£�{0F}{\n}
echo.
pause
goto home_adb_fastboot
:open_adb_fastboot_shell
call :adbfastboot_else
!adb! devices & !fastboot! devices
!cecho! {0A} ����exit���ɷ���adb\fastboot����̨��ҳ�棨��ע:����������su����ʾroot������������exit������adb\fastboot����̨��ҳ�棩{\n}
echo.
start bin\adb_help.txt
!adb! shell
echo ������������Զ��ر� ��shellģʽadb\fastboot����̨�� ��adb_help.txt���±����ص�������ҳ��
echo.
pause
taskkill /FI "WINDOWTITLE eq adb_help.txt*"
goto home_adb_fastboot
:adbfastboot_else
cls
echo.
!cecho! {0A}  ���ڿ���ֱ���������adb��fastboot������ʵ�ֶ�Ӧ���ܣ������ǲο����壺{\n}
echo.
!cecho! {0E} �ֻ�SD�����͵�������Ŀ¼��:adb pull /sdcard/1.mp3 1.mp3    {0f}�о������ӵ�fastboot�豸��  fastboot devices{\n}
!cecho! {0E} ������Ŀ¼�·��͵��ֻ�SD��:adb push 1.mp3 /sdcard/1.mp3    {0f}ˢ��boot.img��              fastboot flash boot boot.img{\n}
!cecho! {0E} �о������ӵ�adb�豸��      adb devices                     {0f}����bootloader(�׳ƽ�BL��)��fastboot oem unlock{\n}
!cecho! {0E} ����adb���л�����          adb shell                       {0f}�����ֻ�:                   fastboot reboot{\n}
!cecho! {0E} �鿴adb���������          adb help                        {0f}�鿴fastboot���������      fastboot help{\n}
echo.
!cecho! {0D}��ȷ���Ƿ���˿�����ѡ�� - USB���Ժ�OEM������ѡ�񱾹��ߡ����԰�װADB\fastboot���������{\n}
!cecho! {0D}�����ֻ���Ļ�Ϲ��ϡ�����USB���ԡ���ʾ,��Ҫ��adb��fastboot�豸��Ų��ܽ�������adb��fastboot����{\n}
echo.
echo.
!cecho! {0B}  ������adb��fastboot�豸����б�{0C}{\n}
goto eof
:open_adb_fastboot_Manual
call :adbfastboot_else
!adb! devices & !fastboot! devices
!cecho! {0A} ����exit���ɷ���adb\fastboot����̨��ҳ�棨��ע:����������su����ʾroot������������exit������adb\fastboot����̨��ҳ�棩{\n}
echo.
start bin\adb_help.txt
@cmd /k
echo.
echo ������������Զ��ر� ���ֶ�ģʽadb\fastboot����̨�� ��adb_help.txt���±����ص�������ҳ��
echo.
pause
taskkill /FI "WINDOWTITLE eq adb_help.txt*"
goto home_adb_fastboot
:fastboot_flash_img
echo.
echo.
echo.
echo.
!fastboot! devices
echo.
!cecho! {0E} 1.fastbootģʽˢ���������Ƶ�system����img��ʽ{\n}
echo.
!cecho! {0D} 2.fastbootģʽˢ���������Ƶ�vendor����img��ʽ{\n}
echo.
!cecho! {0B} 3.fastbootģʽˢ���������Ƶ�boot����img��ʽ{\n}
echo.
!cecho! {0C} 4.fastbootģʽˢ���������Ƶ�recovery����img��ʽ{\n}
echo.
!cecho! {0A} 5.fastbootģʽˢ��vbmeta.img(���vbmeta�ٷ���֤��ˢ��ٷ�vbmeta){\n}
!cecho! {0F}{\n}
set /p webflashimg=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webflashimg%"=="1" call :fastboot_flashimg system system
if "%webflashimg%"=="2" call :fastboot_flashimg vendor vendor
if "%webflashimg%"=="3" call :fastboot_flashimg boot boot
if "%webflashimg%"=="4" call :fastboot_flashimg recovery recovery
if "%webflashimg%"=="5" goto fastboot_flashvbmeta
goto fastboot_flash_img
:fastboot_flashvbmeta
echo.
echo.
echo.
!cecho! {0E} 1.fastbootģʽˢ��հ�vbmeta������ٷ���֤{\n}
echo.
!cecho! {0C} 2.fastbootģʽˢ��ˢ��ٷ�vbmeta{\n}
!cecho! {0F}{\n}
set /p webflashvbmeta=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webflashvbmeta%"=="1" goto fastboot_flashvbmeta_remove
if "%webflashvbmeta%"=="2" goto fastboot_flashvbmeta_official
goto fastboot_flashvbmeta
:fastboot_flashvbmeta_remove
echo.
echo.
!cecho! {0E}     ׼�����vbmeta�ٷ���֤{\n}
pause
!fastboot! --disable-verity --disable-verification flash vbmeta bin\vbmeta.img
echo.
!cecho! {0B}     ���vbmeta�ٷ���֤��ϣ�{0F}{\n}
echo.
pause
goto home_adb_fastboot
:fastboot_flashvbmeta_official
!cecho! {0A} ========================================================================================{\n}
!cecho! {0E}   ���ڵ�������ѡ��ٷ�vbmeta.img��ʽ�ļ������½�λ�õ�ѡ���򿪡�ѡ���ʼˢ��vbmeta.img{\n}
!cecho! {0A} ========================================================================================{0F}{\n}
set flashvbmeta=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set flashvbmeta=" "%~dp0\*.img"`) do %%a
!fastboot! flash vbmeta %flashvbmeta%
echo.
!cecho! {0B}     �ٷ�vbmeta.imgˢ����ϣ�{0F}{\n}
echo.
pause
goto home_adb_fastboot
:fastboot_flashimg
!cecho! {0A} ===================================================================================={\n}
!cecho! {0E}   ���ڵ�������ѡ��img��ʽ�ļ������½�λ�õ�ѡ���򿪡�ѡ���ʼˢ��img��ʽ%2����{\n}
!cecho! {0A} ===================================================================================={0F}{\n}
set flashimg=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set flashimg=" "%~dp0\*.img"`) do %%a
!fastboot! flash %1 %flashimg%
echo.
!cecho! {0B}     img��ʽ%2����ˢ����ϣ�{0F}{\n}
echo.
pause
goto home_adb_fastboot
:fastboot_install_recovery
echo.
echo.     ����bootloader���׳���BL�����ֻ����Ƚ����������޷�ˢ�������recovery��
echo.
pause
echo.
if not exist "recovery.img" (
echo.
echo.
!cecho! {0C}      ���麽ĸĿ¼���Ƿ����recovery.img��{0F}{\n}
echo.
echo.
echo.
pause
goto home_adb_fastboot
else
)
taskkill /f /im adb.exe >nul 2>nul
taskkill /f /im tadb.exe >nul 2>nul
taskkill /f /im kwAdb.exe >nul 2>nul
taskkill /f /im aapt.exe >nul 2>nul
taskkill /f /im shuame_helper.exe >nul 2>nul
taskkill /f /im romaster_daemon.exe >nul 2>nul
taskkill /f /fi "imagename eq wandoujia*" >nul 2>nul
taskkill /f /im "AndroidInterface.exe" >nul 2>nul
taskkill /f /im "Android PC Suite.exe" >nul 2>nul
taskkill /f /im "360MobileMgr.exe" >nul 2>nul
taskkill /f /im "qitu_adb.exe" >nul 2>nul
echo.
!adb! devices
echo. --- ����adb�豸
echo.     �Ժ��ֻ��������fastbootģʽ
echo.
!adb! reboot bootloader
!fastboot! devices
ping -n 1 127.1 >nul 2>nul
echo. --- ����fastboot�豸
echo.     �Ժ��ֻ��������fastbootģʽ
echo.
!cecho! {0D}  ====================={\n}
!cecho! {0D}   �Զ�ˢдrecovery... {\n}
!cecho! {0D}  ====================={0F}{\n}
!cecho! {0F}{\n}
!fastboot! flash recovery recovery.img
echo.
echo.
echo. ������ϳ��֡�... OKAY�������������ʾˢ��ɹ����ֻ���������recovery...
echo.
!fastboot! flash recovery recovery.img >nul 2>nul
pause
echo.
!fastboot! oem reboot-recovery
goto home_adb_fastboot
:recovery_Screenshot
!adb! push bin/fb2png /tmp/ >nul
!adb! shell chmod 755 /tmp/fb2png >nul
for /f "delims=" %%b in ('wmic OS Get localdatetime  ^| find "."') do set "dt=%%b"
set "timestampa=%dt:~8,6%"
set "YYYYa=%dt:~0,4%"
set "MMa=%dt:~4,2%"
set "DDa=%dt:~6,2%"
set "aimg=%DD%_%timestampa%"	
set "afolder=recovery��ͼ_%YYYYa%-%MMa%-%DDa%"
set "afile=recovery��ͼ_%aimg%.png"
if not exist %afolder% md %afolder% >nul
set "ascreenshot=%afolder%\%afile%"
echo( 
!adb! shell "/tmp/fb2png /tmp/fbdump.png > /tmp/info; head -n 20 /tmp/info | tail -n 13; rm -f /tmp/info"
!cecho! {0B}���ƽ�ͼ������{07}{\n}
!adb! pull /tmp/fbdump.png %ascreenshot%
!adb! shell rm -f /tmp/fbdump.png >nul
echo(
!cecho! ��ͼ�ɹ�! {0E}%afile% {07}�����{0E}%afolder% {07}�ļ�������.{\n}
echo.
echo 1.��ȷ���Ƿ���˿�����ѡ�� - USB���Ժ�OEM��������װ�������������ֻ���Ļ�Ϲ��ϡ�����USB���ԡ���ʾ��������ʹ��!
echo.
echo 2.���û�ҵ���ͼ��ͼƬ���������ֻ���ѡ�񱾹��ߡ����԰�װADB\fastboot�����������
echo.
pause
goto home_adb_fastboot
:android_screenshot
!adb! shell mkdir -p /sdcard/Screenshots >nul 2>nul
for /f "delims=" %%d in ('wmic OS Get localdatetime  ^| find "."') do set "dt=%%d"
set "timestampb=%dt:~8,6%"
set "YYYYb=%dt:~0,4%"
set "MMb=%dt:~4,2%"
set "DDb=%dt:~6,2%"
set "bimg=%YYYYb%.%MMb%.%DDb%_%timestampb%"	
set "bfolder=����״̬�½�ͼ_%YYYYb%-%MMb%-%DDb%"
set "bfile=����״̬�½�ͼ_%bimg%.png"
if not exist %bfolder% md %bfolder% >nul 2>nul
set "bscreenshot=%bfolder%\%bfile%"
echo( 
!adb! shell screencap -p /sdcard/Screenshots/screenos.png >nul 2>nul
!cecho! {0E}���ƽ�ͼ������{07}{\n}
!adb! pull /sdcard/Screenshots/screenos.png %bscreenshot% >nul 2>nul
!adb! shell rm -f /sdcard/Screenshots/screenos.png >nul 2>nul
echo(
!cecho! ��ͼ�ɹ�! {0E}%bfile% {07}�����{0E}%bfolder% {07}�ļ�������.{\n}
echo.
echo 1.��ȷ���Ƿ���˿�����ѡ�� - USB���Ժ�OEM��������װ�������������ֻ���Ļ�Ϲ��ϡ�����USB���ԡ���ʾ��������ʹ��!
echo.
echo 2.���û�ҵ���ͼ��ͼƬ���������ֻ���ѡ�񱾹��ߡ����԰�װADB/fastboot�����������
echo.
pause
goto home_adb_fastboot
:ScreenVideo
for /f "delims=" %%d in ('wmic OS Get localdatetime  ^| find "."') do set "dt=%%d"
set "timestampc=%dt:~8,6%"
set "YYYYc=%dt:~0,4%"
set "MMc=%dt:~4,2%"
set "DDc=%dt:~6,2%"
set "cimg=%YYYYc%.%MMc%.%DDc%_%timestampc%"	
set "cfolder=��Ļ¼��_%YYYYc%-%MMc%-%DDc%"
set "cfile=��Ļ¼��_%cimg%.mp4"
if not exist %cfolder% md %cfolder% >nul 2>nul
set "video=%cfolder%\%cfile%"
echo( 
echo.
!cecho! {0B} �ֻ���Ļ����¼����...{\n}
echo.
echo n|start /max /wait cmd /c "mode 110,20& !cecho! {0B}������Ļ��Ƶ¼��,��ֱ�ӹرմ˴��ڼ����Զ�������Ļ¼�Ƶ���Ƶ����ĸ��ǰĿ¼!�����ֻ����������¼��ʱ�����ơ�{0F} & !adb! shell screenrecord --verbose /sdcard/screenrecord.mp4"
ping 127.1 -n 3 >nul
!cecho! {0E} ��Ļ¼��¼��ʱ��Խ���ļ�Խ��,�����ٶȿ���ȡ��������Ļ¼��ʱ��ĳ��̣�{\n}
!cecho! {0E} ���ڸ�����Ļ¼��mp4������,�����ĵȴ�...{07}{\n}
!adb! pull /sdcard/screenrecord.mp4 %video% >nul 2>nul
!adb! shell rm -f /sdcard/screenrecord.mp4 >nul 2>nul
echo(
!cecho! ��Ļ¼����Ƶmp4�ɹ�! {0E}%cfile% {07}�����{0E}%cfolder% {07}�ļ�������.{\n}
echo.
echo 1.��ȷ���Ƿ���˿�����ѡ�� - USB���Ժ�OEM��������װ�������������ֻ���Ļ�Ϲ��ϡ�����USB���ԡ���ʾ��������ʹ��!
echo.
echo 2.���û�ҵ���Ļ¼�Ƶ���Ƶ�ļ����������ֻ���ѡ�񱾹��ߡ����԰�װADB/fastboot�����������
echo.
pause
goto home_adb_fastboot
:adb_sideload
echo.
!cecho! {0C}��ȷ������ֻ����ô洢���㹻������ſ�ˢ��,�����ڴ治�㽫�޷�����adb sideloadģʽ��ˢ��{0F}{\n}
echo.
pause
echo.
echo ��recovery�����adb sideloadģʽ���ɣ��Ƿ���Ҫ˫�����о�����
echo.
!cecho! {0E}���ڵ���ѡ������������zip��ʽ�Ŀ�ˢ�������½�λ�õ�ѡ���򿪡�ѡ��ɿ�ʼ����...{0F}{\n}
echo.
echo �������Ϳ�ˢ�����ֻ������Ժ�...
echo.
set rom=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set rom=" "%~dp0\*.zip"`) do %%a
!adb! sideload %rom%
echo ����ˢ������ϣ��������ֻ�...
echo.
pause
goto home_adb_fastboot
:adb_install_apk
echo.
!cecho! {0D}  ==================================================================={\n}
echo   �����Ƿ�򿪰�ȫ-δ֪��Դ�Ϳ�����ѡ��-USB���Ժ�OEM���� ��
echo.
echo   ����װ�������������ֻ���Ļ�Ϲ��ϣ�����USB���ԣ���ʾ��������ʹ��!��
echo.
echo   ����ѡ�񱾹��ߡ����԰�װADB\fastboot��������� 
!cecho! {0D}  ==================================================================={0F}{\n}
echo.
!cecho! {0E}apk����ֻ�����ֻ���Ӣ��,���������޷���װ{\n}
echo.
echo.
!cecho! {0C}���ڵ���ѡ������������apk��������½�λ�õ�ѡ���򿪡�ѡ��ɿ�ʼ���Ͱ�װ������ֻ���...{0F}{\n}
echo.
set apk=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set apk=" "%~dp0\*.apk"`) do %%a
!adb! install -r %apk%
goto home_adb_fastboot
:adb_flash_zip
if not exist "update-binary" (
echo.
echo.
!cecho! {0C}      ȱ��update-binary��ˢ���,�����ϼ�鱾����Ŀ¼���Ƿ���ڶ�ӦCPU�ͺ�update-binaryˢ�������{0F}{\n}
echo.
!cecho! {0C}      �ӿ�ˢ����ȡMETA-INF\com\google\android\update-binary��ˢ����ŵ�������Ŀ¼�¡�{0F}{\n}
echo.
echo.
pause
goto home_adb_fastboot
else
)
echo.
!cecho! {0C}��ȷ������ֻ����ô洢���㹻������ſ�ˢ��,�����ڴ治�㽫�޷�����recovery��ˢ��{0F}{\n}
echo.
pause
!adb! reboot recovery
set num=20
:Second_reading
if %num% equ 0 (goto:flashzip) else set /a num-=1
!cecho! {0A}����recovery���浹����ʣ{0F} %num% {0A}��ʱ�䣬����ˢ��update-binaryˢ�����...{0F}{\n}
ping -n 2 127.0.1 >nul 2>nul
goto:Second_reading
:flashzip
echo.
!adb! push update-binary /tmp/update-binary
!adb! shell chmod 0777 /tmp/update-binary
echo.
echo.
!cecho! {0C}�ɹ�ˢ���ӦCPU�ͺ�update-binaryˢ���������ʾ��[100%]������{0F}{\n}
echo.
!cecho! {0C}ˢ��ʧ�ܽ���ʾ��No such file or directory���������鱾����Ŀ¼���Ƿ���ڶ�ӦCPU�ͺ�update-binaryˢ�������{0F}{\n}
echo.
echo.
!cecho! {0B}���ڵ���ѡ������������zip��ʽ�Ŀ�ˢ�������½�λ�õ�ѡ���򿪡�ѡ��ɿ�ʼ����...{0F}{\n}
echo.
!cecho! {0B}��������recovery�������о����Ƿ���Ҫ˫��������������Ϳ�ˢ�����ֻ������Ժ�...{0F}{\n}
set roma=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set roma=" "%~dp0\*.zip"`) do %%a
!adb! push %roma% /sdcard/flashrom.zip
!adb! shell "/tmp/update-binary" 2 2 /sdcard/flashrom.zip
echo ˢ���ɹ�!����������ֻ�������...
!adb! shell rm -f /sdcard/flashrom.zip >nul 2>nul
pause
!adb! shell rm -f /sdcard/flashrom.zip >nul 2>nul
!adb! reboot 
goto home_adb_fastboot
:Flash_Tool
cls
!cecho! {0A}{\n}
echo  *************************************************************************************************
echo.
echo. ���ѣ�����ˢ���ֻ�ʺ�MTK�͸�ͨоƬ���ֻ���ˢ��
echo.
echo. �޷���ˢ���Ȱ�װ��ˢ����,���ڸ���Ʒ����ˢ����������,��������������,������ֻ�ṩ������ˢ������װ!
echo. 
echo. *************************************************************************************************
!cecho! {0E}{\n}
echo   1.��MTK��ˢ����SP_Flash_Tool(���İ�)
!cecho! {0E}{\n}
echo   2.��װMTK������ˢ����
!cecho! {0D}{\n}
echo   3.�򿪸�ͨ9008��ˢ����QFIL
!cecho! {0D}{\n}
echo   4.��װ��ͨ����9008��ˢ����
!cecho! {0B}{\n}
echo   5.�鿴�°�MTK��ˢ����SP_Flash_Tool(�������ظ���)
!cecho! {0C}{\n}
echo   0.�ص�������ҳ
!cecho! {0F}{\n}
echo.
set /p webcc=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webcc%"=="1" goto SP_Flash_Tool
if "%webcc%"=="2" goto install_BrushDrive
if "%webcc%"=="3" goto qualcomm_QFIL
if "%webcc%"=="4" goto qualcomm_Diag_QD_Loader
if "%webcc%"=="5" goto update_SP_Flash_Tool
if "%webcc%"=="0" goto home
goto Flash_Tool
:SP_Flash_Tool
echo.
!cecho! {0C}��ˢSP_Flash_Tool�����������ķ�������������Ϸ�ѡ�����ѡ��Options-General-Language-��������{0F}{\n}
!cecho! {0C}���ڴ�MTK��ˢ����SP_Flash_Tool�����Ժ�...{0F}{\n}
echo.
start bin\Flash_Tool\SP_Flash_Tool\flash_tool.exe
pause
goto Flash_Tool
:install_BrushDrive
echo.
!cecho! {0C}���ļ�����ΪMTKоƬ������ˢ����������ѡ��װ����Щ���ð�װ��Щ��{0F}{\n}
echo.
start bin\MTK_Sp_Flash_Tools_Driver\
pause
goto Flash_Tool
:qualcomm_QFIL
echo.
!cecho! {0C}���ڴ򿪸�ͨ9008��ˢ����QFIL�����Ժ�...{0F}{\n}
echo.
start bin\Flash_Tool\Qualcomm_Flash_Image_Loader\QFIL.exe
pause
goto Flash_Tool
:qualcomm_Diag_QD_Loader
echo.
!cecho! {0C}���ڰ�װ��ͨ����9008��ˢ���������Ժ�...{0F}{\n}
echo.
start bin\Qualcomm_Diag_QD_Loader_2016_driver.exe
pause
goto Flash_Tool
:update_SP_Flash_Tool
echo.
!cecho! {0C}���������°汾�����ֶ�MTK��CPU�ļ�����......{0F}{\n}
!cecho! {0C}��ˢSP_Flash_Tool�����������ķ�������������Ϸ�ѡ�����ѡ��Options-General-Language-��������{0F}{\n}
echo.
start https://androidmtk.com/smart-phone-flash-tool
start http://sp-flash-tool.com/
pause
goto Flash_Tool
:install_notepad
cls
!cecho! {0A}{\n}
echo  *************************************************************************************************
echo.
echo.                             ��л���ٷ�notepad++������ĸ��£�
echo. 
echo. *************************************************************************************************
!cecho! {0E}{\n}
echo   1.������װnotepad++�ı��༭��
!cecho! {0D}{\n}
echo   2.�鿴�°�notepad++�ı��༭��
!cecho! {0A}{\n}
echo   0.�ص�������ҳ
!cecho! {0F}{\n}
echo.
set /p webdd=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webdd%"=="1" goto install_notepad
if "%webdd%"=="2" goto update_notepad
if "%webdd%"=="0" goto home
goto install_notepad
:install_notepad
echo.
!cecho! {0C}���ڴ�notepad++��װ�������Ժ�...��{0F}{\n}
echo.
start bin\notepad.exe
pause
goto home
:update_notepad
echo.
echo ���ڴ�notepad����......
echo.
start https://notepad-plus-plus.org/downloads/
goto home
:rootkernel
echo.
!cecho! {0E}    ���ڵ���ѡ��boot.img\recovery.img�ļ������½�λ�õ�ѡ���򿪡�ѡ��ɿ�ʼʶ��kernel�ں˰汾...{0F}{\n}
echo.
set kernelversion=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set kernelversion=" "%~dp0\*img"`) do %%a
copy %kernelversion% bin\rootkernel\boot.img >nul 2>nul
echo.
!cecho! {0E} ��鿴�ں�kernel�汾��Ϣ��Ϻ���������ص���ĸ��ҳ���Զ�����ʶ������в������ļ�{0F}{\n}
echo.
start bin\rootkernel\��ק�ں�REC������.bat
pause
rd /s /q bin\rootkernel\ramdisk >nul 2>nul
del bin\rootkernel\kernel >nul 2>nul
del bin\rootkernel\rd.gz >nul 2>nul
del bin\rootkernel\boot.img >nul 2>nul
goto home
:odex_vdex_merge
echo.
echo.
echo.
echo.
echo.
!cecho! {0A}����������������������������������{0C}���¹�������java��װ��java����{0A}����������������������������������{\n}
echo.
!cecho! {0E}   1.ʹ��ClassyKitchen.exe����odex\vdex�ϲ����������Զ����ɴ�ͳ��ˢ�ű��ȵȹ���(��׿5.0-9.0){\n}
echo.
!cecho! {0D}   2.ʹ��SVADeodexerForArt.exe����odex�ϲ�(��׿5.0-7.1.2){\n}
echo.
!cecho! {0B}   3.��XDA��վ�鿴SVADeodexerForArt��ClassyKitchen�°�{\n}
echo.
!cecho! {0E}   0.�غ�ĸ������ҳ{\n}
echo.
!cecho! {0A}��������������������������������������������������������������������������������������������������{0F}{\n}
echo.
set /p webee=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webee%"=="1" goto ClassyKitchen
if "%webee%"=="2" goto SVADeodexerForArt
if "%webee%"=="3" goto update_odex
if "%webee%"=="0" goto home
goto odex_vdex_merge
:ClassyKitchen
echo.
echo.
echo.
!cecho! {0E} ����Ҫ�ϲ���system����vendorĿ¼����{0C} PROJECT {0E}�ļ������漴�ɺϲ�,���ڴ�ClassyKitchen����,��ɧ��...{0F}{\n}
echo.
md PROJECT >nul 2>nul
md PROJECT_FILES >nul 2>nul
ping 127.1 -n 1 >nul
if exist "PROJECT_FILES\full_permissions""PROJECT_FILES\full_permissions_vendor" (
goto ClassyKitchen_else
else
)
cd.>PROJECT_FILES\full_permissions
cd.>PROJECT_FILES\full_permissions_vendor
:ClassyKitchen_else
if exist "ClassyKitchen.exe" (
start ClassyKitchen.exe >nul 2>nul
goto home
else
)
copy bin\ClassyKitchen.exe ClassyKitchen.exe >nul 2>nul
start ClassyKitchen.exe >nul 2>nul
goto home
:SVADeodexerForArt
echo.
echo.
!cecho! {0E} ��ѡ��SVADeodexerForArt.exe������ODEX�ϲ�!(֧�ְ�׿5.0-7.1.2){\n}
echo.
start bin\odex_merge\
pause
goto home
:update_odex
start https://forum.xda-developers.com/galaxy-s5/general/tool-deodex-tool-android-l-t2972025
start https://forum.xda-developers.com/chef-central/android/tool-classykitchen-android-roms-t3862584
goto home
:open_Compare
echo.
echo.
!cecho! {0A}   1.�򿪶Ա���{\n}
echo.
!cecho! {0C}   2.�Զ�����Ա�����ʾ�ܳ׹��ڱ���������{\n}
echo.
!cecho! {0B}   0.���ع�����ҳ{0F}{\n}
echo.
set /p webee=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webee%"=="1" echo. & echo ���ڴ��ļ��Ա��������Ժ�... & echo. & start bin\Beyond_Compare\BCompare.exe & pause & goto home
if "%webee%"=="2" call bin\����Ա�����ʾ�ܳ׹��ڱ���������.bat
if "%webee%"=="0" goto home
goto open_Compare
:install_Apkdb
cls
!cecho! {0A}{\n}
echo  *************************************************************************************************
echo.
echo.                 ��л�� ����˹��-��οƼ�ԭ���߶�Apkdb�����빤������ĸ��£�
echo. 
echo. *************************************************************************************************
!cecho! {0E}{\n}
echo   1.������װApkdb�����빤��
!cecho! {0D}{\n}
echo   2.�鿴����Apkdb�����빤��
!cecho! {0B}{\n}
echo   3.�鿴����java�汾
!cecho! {0C}{\n}
echo   0.�ص�������ҳ
!cecho! {0F}{\n}
echo.
set /p webff=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webff%"=="1" goto install_apkdb
if "%webff%"=="2" goto apkdb_update
if "%webff%"=="3" goto update_java8
if "%webff%"=="0" goto home
goto install_Apkdb
:apkdb_update
echo.
echo ���ڴ�Apkdb�����빤�߹������ص�ַ�����Ժ�......
echo.
start https://idoog.cn/?p=2933
pause
goto home
:install_apkdb
echo.
!cecho! {0C}���ڴ�Apkdb������������Ժ�...��{\n}
echo.
start bin\Apkdb.exe
pause
goto home
:open_AdbFileExplorer
echo.
echo �˹�����Ҫ�ֻ���ǰϵͳ֧��system\xbin\busybox�������ʹ�á�
echo ���ڴ�ADB�ļ�������...
echo.
start bin\AdbFileExplorer.exe
pause
goto home_adb_fastboot
:Print_logcat_time
set foldery=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
if "%" == " " (
	set foldery=%date:~0,4%%date:~5,2%%date:~8,2%_t%time:~3,2%%time:~6,2%
)
md ʵʱ����logcat������־_%foldery%
!adb! logcat -t 10000 -v time > ʵʱ����logcat������־_%foldery%\����ϵͳ������־.log
!adb! logcat *:F -t 10000 -v time > ʵʱ����logcat������־_%foldery%\������־-���ش���fatal.log
!adb! logcat *:E -t 10000 -v time > ʵʱ����logcat������־_%foldery%\������־-��ͨ����error.log
!adb! logcat *:W -t 10000 -v time > ʵʱ����logcat������־_%foldery%\������־-����warning.log
!adb! logcat *:I -t 10000 -v time > ʵʱ����logcat������־_%foldery%\������־-��Ϣinfo.log
!adb! logcat *:D -t 10000 -v time > ʵʱ����logcat������־_%foldery%\������־-����debug.log
!adb! logcat *:V -t 10000 -v time > ʵʱ����logcat������־_%foldery%\������־-��ϸverbose.log
!adb! logcat -b radio -t 10000 -v time > ʵʱ����logcat������־_%foldery%\��ӡ�źŻ������������־.log
!adb! logcat -b main -t 10000 -v time > ʵʱ����logcat������־_%foldery%\��ӡ����Ӧ�ó�����־.log
!adb! logcat -b events -t 10000 -v time > ʵʱ����logcat������־_%foldery%\��ӡϵͳ�¼���־.log
!cecho! {0C}{\n}
echo �ɹ���ӡʵʱ����logcat������־�����ڹ��߸�Ŀ¼���Ҵ���ʵʱ����logcat������־_xxʱ��xx���ڡ����ļ��У�
!cecho! {0F}{\n}
echo android�����ÿһ����־����һ����Ǻ����ȼ����������
echo ���ȼ���������ַ���˳���Ǵӵ͵��ߣ�
echo V �� ��ϸ verbose(������ȼ�)
echo D �� ���� debug
echo I �� ��Ϣ info
echo W �� ���� warning
echo E �� ���� error
echo F �� ���ش��� fatal
echo S �� �޼��� silent
pause
goto home
:Print_logcat_cache
set folderw=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
if "%" == " " (
	set folderw=%date:~0,4%%date:~5,2%%date:~8,2%_t%time:~3,2%%time:~6,2%
)
md ����logcat������־_%folderw%
md ����logcat������־_%folderw%\tombstones
!adb! bugreport > ����logcat������־_%folderw%\������־-bug����.log
!adb! shell dmesg > ����logcat������־_%folderw%\������־-�ں�kernel��Ӳ����������.log
!adb! shell dumpsys > ����logcat������־_%folderw%\������־-ϵͳservice����״̬.log
!adb! shell dumpstate > ����logcat������־_%folderw%\������־-ϵͳ״̬��Ϣ.log
!adb! pull /data/anr/traces.txt ����logcat������־_%folderw%\���������web����ĸ�����־.log
!adb! pull /data/tombstones %folderw%\tombstones
!cecho! {0C}{\n}
echo �ɹ���ӡ����logcat������־�����ڹ��߸�Ŀ¼���Ҵ�������logcat������־_xxʱ��xx���ڡ����ļ��У�
!cecho! {0F}{\n}
echo android�����ÿһ����־����һ����Ǻ����ȼ����������
echo ���ȼ���������ַ���˳���Ǵӵ͵��ߣ�
echo V �� ��ϸ verbose(������ȼ�)
echo D �� ���� debug
echo I �� ��Ϣ info
echo W �� ���� warning
echo E �� ���� error
echo F �� ���ش��� fatal
echo S �� �޼��� silent
pause
goto home
:pc_home
cls
!cecho! {0A}{\n}
echo  *****************************************************
echo. 
echo.    ����һ�������������������������Զ�ʱ�ػ��ȹ��ܣ�
echo. 
echo. *****************************************************
!cecho! {0E}{\n}
echo   1.���Կ�������
!cecho! {0D}{\n}
echo   2.���Կ�������
!cecho! {0B}{\n}
echo   3.���Զ�ʱ�ػ�
!cecho! {0A}{\n}
echo   0.�ص�������ҳ
!cecho! {0F}{\n}
echo.
set /p webgg=-^-^> ��������ѡ���Ӧ�Ĳ���:
if "%webgg%"=="1" shutdown -r -t 0 & goto home
if "%webgg%"=="2" rundll32.exe user32.dll,LockWorkStation & goto home
if "%webgg%"=="3" goto time_off_pc
if "%webgg%"=="0" goto home
goto pc_home
:time_off_pc
echo ��ָ��24Сʱ��ʽʱ��,��Ӣ��״̬�������ʽΪ��Сʱ:���ӡ�
echo  ����:  00:00  ��  19:30
echo ========================================
set shutdowntime=
set /p shutdowntime=��ʱ:
schtasks /create /sc once /tn ��ʱ�ػ� /tr "shutdown.exe -s -hybrid -t 10" -st "%shutdowntime%:00"
if not errorlevel 1 goto ok
echo %shutdowntime% ���Ǳ�׼��ʱ���ʽ,����������
echo.
goto home
:update_CarrierClassTools
!cecho! {0A}{\n}
echo  ***********************************************************
echo.    ��ע�ҵ�����΢������ʱ�鿴��ĸ�������°汾��
echo.
echo     ��ע��ĸ���߹ٷ�QQȺ��611193563
echo.
echo.    ��ĸ����֧����΢�Ŷ�ά��ɨ��򿪵�ͼƬ���������Һ�һ�����ȣ�
echo. ***********************************************************
!cecho! {0F}{\n}
start bin\��ĸ����֧����΢�Ŷ�ά�����.png & start http://shang.qq.com/wpa/qunwpa?idkey=8da3fa12ed1d48b24b52efa1a6e60f641806b08be93edac5e549a3d1617f3c70 & start http://weibo.com/jooks
pause
goto home
:exit
echo.
echo.
echo ���ڹرպ�ĸ�������н���...
del bin\AIHGT >nul 2>nul
taskkill /f /im adb.exe >nul 2>nul
taskkill /f /im tadb.exe >nul 2>nul
taskkill /f /im kwAdb.exe >nul 2>nul
taskkill /f /im aapt.exe >nul 2>nul
taskkill /f /im javaw.exe >nul 2>nul
taskkill /f /im shuame_helper.exe >nul 2>nul
taskkill /f /im ShuameDaemon.exe >nul 2>nul
taskkill /f /im romaster_daemon.exe >nul 2>nul
taskkill /f /im BCompare.exe >nul 2>nul
taskkill /f /im SVADeodexerForArt.exe >nul 2>nul
taskkill /f /im flash_tool.exe >nul 2>nul
taskkill /f /im adb_installer.exe >nul 2>nul
taskkill /f /im raw2simg.exe >nul 2>nul
taskkill /f /im fastboot.exe >nul 2>nul
taskkill /f /im FileSplitter.exe >nul 2>nul
taskkill /f /im make_ext4fs.exe >nul 2>nul
taskkill /f /im notepad.exe >nul 2>nul
taskkill /f /im img2dat.exe >nul 2>nul
taskkill /f /im simg2img.exe >nul 2>nul
taskkill /f /im 7z.exe >nul 2>nul
taskkill /f /im 7za.exe >nul 2>nul
taskkill /f /im file_contexts_tool.exe >nul 2>nul
taskkill /f /im FileToOpen.exe >nul 2>nul
taskkill /f /im inifile.exe >nul 2>nul
taskkill /f /im NDP47-KB3186497-x86-x64-AllOS-ENU.exe >nul 2>nul
taskkill /f /im nhrt.exe >nul 2>nul
taskkill /f /im nircmdc.exe >nul 2>nul
taskkill /f /im notepad.exe >nul 2>nul
taskkill /f /im sdat2img.exe >nul 2>nul
taskkill /f /im sfk.exe >nul 2>nul
taskkill /f /im simg2sdat.exe >nul 2>nul
taskkill /f /im strings.exe >nul 2>nul
taskkill /f /im zip.exe >nul 2>nul
taskkill /f /im java.exe >nul 2>nul
taskkill /f /fi "imagename eq wandoujia*" >nul 2>nul
taskkill /f /im AndroidInterface.exe >nul 2>nul
taskkill /f /im Android PC Suite.exe >nul 2>nul
taskkill /f /im 360MobileMgr.exe >nul 2>nul
taskkill /f /im qitu_adb.exe >nul 2>nul
taskkill /f /im sparseimg2scatterwith.exe >nul 2>nul
taskkill /f /im Apkdb.exe >nul 2>nul
taskkill /f /im bootimg.exe >nul 2>nul
taskkill /f /im dat2br.exe >nul 2>nul
taskkill /f /im busybox.exe >nul 2>nul
taskkill /f /im cecho.exe >nul 2>nul
taskkill /f /im chmod.exe >nul 2>nul
taskkill /f /im findfile.exe >nul 2>nul
taskkill /f /im Qualcomm_Diag_QD_Loader_2016_driver.exe >nul 2>nul
taskkill /f /im ozip2zip.exe >nul 2>nul
taskkill /f /im rec_sh.exe >nul 2>nul
taskkill /f /im sparse2img.exe >nul 2>nul
taskkill /f /im unpack-image.exe >nul 2>nul
taskkill /f /im vdexExtractor.exe >nul 2>nul
taskkill /f /im unpackapp.exe >nul 2>nul
echo.
echo ��յ��Ի���վ�ļ�
for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
if exist %%a:\ (
del /f /s /q "%%a:\$recycle.bin\*.*" >nul 2>nul
)
)
del /f /s /q "%systemdrive%\recycled\*.*" >nul 2>nul
echo.
echo ��պ�ĸ���������з�ֻ�������ļ���Ŀ¼
del/a-r /s /q %~dp0*.*
for /f "tokens=*" %%i in ('dir/s/b/ad^|sort /r') do rd "%%i"
goto home
:eof

