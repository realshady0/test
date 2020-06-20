@echo off
chcp 936
cd /d "%~dp0"
:AIHGT_home
cd.>bin\AIHGT
set titles=Aircraft tool v5.5【20200208】
start /b "" cmd /v:on /c "@echo off&for /l %%a in () do (title %titles% by AIHGT Shady           current time ：%date% !time:~0,8! & ping /n 2 localhost>nul)"
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
!cecho! {0E} {0E}01{0D}\{0F}1.{0E}Decompress boot.img                 {0E}03{0D}\{0F}3.{0E}分解recovery.img                       55.生成system\vendor软衔接脚本(symlink){\n}
!cecho! {0E} {0E}02{0D}\{0F}2.{0E}合成boot.img                 {0E}04{0D}\{0F}4.{0E}合成recovery.img                      555.谷歌标准A\B分区机型payload.bin解包{\n}
!cecho! {0D}{\n}
echo   6.分解任意名称img\dat\br等格式                             14.system.img转换成system.new.dat\system.new.dat.br
echo   7.挂载分解任意名称img\win\raw\ext4镜像                     15.vendor.img转换成vendor.new.dat\vendor.new.dat.br
echo   8.分解system.new.dat.br                                    16.system.new.dat\system.new.dat.br转换成system.img
echo   9.分解system.new.dat                                       17.vendor.new.dat\vendor.new.dat.br转换成vendor.img
echo  10.分解system.img                                           18.sparse image(img压缩格式)转换成ext4 image(完整img格式)
echo  11.分解vendor.new.dat.br                                    19.ext4 image(完整img格式)转换成sparse image(img压缩格式)
echo  12.分解vendor.new.dat
echo  13.分解vendor.img 
!cecho! {0D}                                     {0A}21.system目录打包system.new.dat.br        24.vendor目录打包vendor.new.dat.br{\n}
!cecho! {0B} 20.adb\fastboot控制台和功能         {0A}22.system目录打包system.new.dat           25.vendor目录打包vendor.new.dat{\n}
!cecho! {0B}                                     {0A}23.system目录打包system.img               26.vendor目录打包vendor.img{\n}
!cecho! {0C}{\n}
echo  27.java8更新和安装                  32.odex\vdex合并(支持安卓5.0-安卓9.0)     37.boot\recovery自定义移植\自动移植
!cecho! {0C} 28.文本编辑器安装                   33.mtk线刷spFlash\高通9008工具(含驱动)    {0A}38.其他工具\格式解包和打包{0C}{\n}
echo  29.安装电脑反编译工具Apkdb          34.打开文件对比器                         39\399.system或vendor\build.prop信息鸟瞰
!cecho! {0C} 30.apk\zip卡刷包加密                35.电脑定时关机\重启\锁定                 40.zip卡刷包签名{0E}\400.apk安装包签名{0C}{\n}
echo  31.清理临时文件工具箱               36.关闭航母工具所有进程清理缓存回收站     41.检查航母工具更新和航母QQ群微信捐赠
!cecho! {0F}{\n}
set /p web=-^-^> 输入数字选择对应的操作:
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
if "%web%"=="30" call :encryption_zip e 加密
if "%web%"=="300" call :encryption_zip r 解密
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
if "%web%"=="40" call :sign_zipapk zip 卡刷包
if "%web%"=="400" call :sign_zipapk apk apk
if "%web%"=="41" goto update_CarrierClassTools
goto home
:unpack_payload
if not exist "payload.bin" (
echo.
echo.
!cecho! {0E}      没找到payload.bin文件，请确认航母工具目录下是否存在payload.bin文件。{0F}{\n}
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
!cecho! {0E}  1.system分区生成软衔接{\n}
!cecho! {0E}  2.vendor分区生成软衔接{\n}
!cecho! {0B} ========================{0F}{\n}
echo.
set /p websymlink=-^-^> 输入数字选择对应的操作:
if "%websymlink%"=="1" call :make_symlink system
if "%websymlink%"=="2" call :make_symlink vendor
goto make_symlinks
:make_symlink
del 生成%1软衔接symlinks.txt >nul 2>nul
echo.
echo.
!cecho! {0E}    正在生成软衔接symlinks脚本，请稍候...{\n}
echo.
	if not exist "生成%1软衔接symlinks.txt" for /f "delims=" %%a in ('bin\findfile.exe /%1 -type l ^| !busybox! sed "s/AIHGT//"') do (
		for /f "delims=" %%b in ('!busybox! readlink %%a') do echo symlink("%%b", "%%a";;;| !busybox! sed "s/;;;/);/">>生成%1软衔接symlinks.txt
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
!cecho! {0C}     软衔接识别完成，打开（生成%1软衔接symlinks.txt）查看. {0F}{\n}
echo.
echo.
pause
start 生成%1软衔接symlinks.txt
goto home
:rawprogram_unsparse
echo.
!cecho! {0E}    请把全部高通线刷包分段镜像放在航母当前目录！{\n}
echo.
!cecho! {0E}    请在弹窗选择rawprogram_unsparse.xml类似xml高通线刷文本文件后，右下角位置点选“打开”选项即可开始合并...{\n}
!cecho! {0C}{\n}
echo     1.system
echo     2.userdata
echo     3.cache
echo     4.自定义输入分区名称
!cecho! {0F}{\n}
set /p weba= 请选择需要合并的镜像的名称:
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
!cecho! {0C}      %1.img合并完成！{0F}{\n}
echo.
pause
goto home
:rawprogramimg_custom
echo.
echo.
echo.
!cecho! {0E}请输入分区名称！输完分区名称请认真核对无误才按下Enter回车键确认！{0F}{\n}
echo.
echo.
set /p partition=输入需要合并的分区名称（英文小写状态输入）：
echo.
set rawprogramcustom=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set rawprogramcustom=" "%~dp0\*.xml"`) do %%a
bin\sparseimg2scatterwith.exe %rawprogramcustom% %partition%
ren %partition%.raw %partition%.img >nul 2>nul
echo.
echo.
!cecho! {0C}     %partition%分区合并完成！{0F}{\n}
echo.
pause
goto home
:encryption_zip
echo.
!cecho! {0E}    请在弹窗选择任意命名的xxx.apk\xxx.zip卡刷包文件后，右下角位置点选“打开”选项即可开始%2...{0F}{\n}
echo.
set zipencryption=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set zipencryption=" "%~dp0\*.apk;*.zip"`) do %%a
bin\jre\bin\java -jar bin\ZipCenOp.jar %1 %zipencryption%
echo.
echo.
!cecho! {0C}      成功%2！{0F}{\n}
echo.
pause
goto home
:sign_zipapk
echo.
!cecho! {0E}    请在弹窗选择任意命名的xxx.%1格式的卡刷包文件后，右下角位置点选“打开”选项即可开始签名...{0F}{\n}
echo.
set zipapk=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set zipapk=" "%~dp0\*.%1"`) do %%a
bin\jre\bin\java -jar bin\signapk.jar bin\testkey.x509.pem bin\testkey.pk8 %zipapk% %zipapk%_signed.%1
echo.
!cecho! {0C}      成功签名%2！{0F}{\n}
echo.
pause
goto home
:others_unpack_repack
cls
!cecho! {0A} ==========================================================================={\n}"
echo.  
echo.                         请自行选择需要的功能！
echo. 
echo  ===========================================================================
!cecho! {0E}{\n}
echo   1.高通线刷包分段镜像合并
!cecho! {0D}{\n}
echo   2.qsb格式解包
!cecho! {0B}{\n}
echo   3.ozip转换zip格式
!cecho! {0C}{\n}
echo   4.moto的system.img_sparsechunk分段格式合并
!cecho! {0A}{\n}
echo   5.华为update.app格式解包
!cecho! {0E}{\n}
echo   6.开机LOGO第一屏制作
!cecho! {0D}{\n}
echo   7.分段dat合并\分割工具
!cecho! {0B}{\n}
echo   8.查看内核kernel版本信息
echo.
!cecho! {0C}  0.回到工具首页{\n}
!cecho! {0F}{\n}
set /p webb=-^-^> 输入数字选择对应的操作:
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
!cecho! {0D} 华为app格式解包完毕！解包后文件在huawei_app目录内请查看！{0F}
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
if not exist system.img_sparsechunk* (!cecho! {0E}请检查system.img_sparsechunk分段镜像是否存在！{0F} & echo. & echo. & pause & goto others_unpack_repack)
echo.
echo.
!cecho! {0D} 正在合并生成system.img 镜像文件中，请稍候...{0F}
(for %%a in (system.img_sparsechunk*) do %wf%bin\sparse2img.exe %%a system.img ) 
echo.
echo.
if exist system.img (!cecho! {0E} 合并system.img成功！{0F} & echo. & echo. & pause & goto home)
:Logo_splash
echo.
echo.
echo.
!cecho! {0E}{\n}
echo   1.mtk开机第一屏logo.img/logo.bin修改
!cecho! {0D}{\n}
echo   2.高通开机第一屏splash.img修改
echo.
!cecho! {0F}{\n}
set /p webb=-^-^> 输入数字选择对应的操作:
if "%webb%"=="1" goto Logo
if "%webb%"=="2" goto splash
goto Logo_splash
:Logo
start bin\LogoBuilder1.6\LogoBuilder.exe
echo.
!cecho! {0D}  =================================================================================={\n}
!cecho! {0D}   此工具适合制作logo.bin开机第一屏！请自行放置一个固定的工作目录方便管理查看解包出来的logo内置图片和配置文件！{\n}
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
!cecho! {0E}      没找到pics目录内的logo.png文件，请确认航母工具此目录下是否存在logo.png文件。{0F}{\n}
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
!cecho! {0E} 默认修改581x201尺寸黑底白字英文GOOGLE的logo.png，新生成logo文件名为splash_new.img{0F}{\n}
echo.
!cecho! {0E} 可自行更换修改里面的不大于自己机型屏幕分辨率尺寸同名logo.png覆盖到pics目录内logo.png{0F}{\n}
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
!cecho! {0D}   此工具适合system.new.dat1   system.new.dat2   ...等等这一类分段dat格式分割\合并！{\n}
!cecho! {0D}  =================================================================================={0F}{\n}
echo.
pause
goto home
:ozip2zip
echo.
echo.
!cecho! {0A} ===================================================================================={\n}
!cecho! {0E}   请在弹窗界面选择ozip格式文件后，右下角位置点选“打开”选项将自动ozip转换成zip格式！{\n}
!cecho! {0A} ===================================================================================={0F}{\n}
set ozip=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set ozip=" "%~dp0\*.ozip"`) do %%a
bin\ozip2zip.exe %ozip%
echo.
!cecho! {0B}     转换完毕！{0F}{\n}
echo.
pause
goto home
:install_java
cls
!cecho! {0A}{\n}
echo  ******************************************************************************
echo.             提醒：不更新java不需要重新配置java，默认就有java环境！
echo.                   如更新安装java8完毕后，最好重新配置java环境变量!            
echo. 
echo. ******************************************************************************
!cecho! {0E}{\n}
echo   1.更新查看java最新版本
!cecho! {0D}{\n}
echo   2.配置java环境变量 (配置完毕后将会验证环境变量是否完整正确)
!cecho! {0B}{\n}
echo   0.回到工具首页
!cecho! {0F}{\n}
echo.
set /p webaa=-^-^> 输入数字选择对应的操作:
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
echo 按下任意键来校验java环境配置是否正常！如果和上面显示雷同表示java环境配置正常！
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
if not exist bin\自定义字节设定勿删1 goto custom_size1_img
if not exist bin\自定义字节设定勿删2 goto custom_size2_img
if not exist bin\自定义字节设定勿删3 goto custom_size3_img
if not exist bin\自定义字节设定勿删4 goto custom_size4_img
if not exist bin\自定义字节设定勿删5 goto custom_size5_img
if not exist bin\自定义字节设定勿删6 goto custom_size6_img
if not exist bin\自定义大小设定勿删1 goto custom_size1_img
if not exist bin\自定义大小设定勿删2 goto custom_size2_img
if not exist bin\自定义大小设定勿删3 goto custom_size3_img
if not exist bin\自定义大小设定勿删4 goto custom_size4_img
if not exist bin\自定义大小设定勿删5 goto custom_size5_img
if not exist bin\自定义大小设定勿删6 goto custom_size6_img
for /f %%a in (bin\自定义字节设定勿删1) do (set system_size1=%%a)
for /f %%a in (bin\自定义字节设定勿删2) do (set system_size2=%%a)
for /f %%a in (bin\自定义字节设定勿删3) do (set system_size3=%%a)
for /f %%a in (bin\自定义字节设定勿删4) do (set system_size4=%%a)
for /f %%a in (bin\自定义字节设定勿删5) do (set system_size5=%%a)
for /f %%a in (bin\自定义字节设定勿删6) do (set system_size6=%%a)
for /f %%a in (bin\自定义大小设定勿删1) do (set system_sizeG1=%%a)
for /f %%a in (bin\自定义大小设定勿删2) do (set system_sizeG2=%%a)
for /f %%a in (bin\自定义大小设定勿删3) do (set system_sizeG3=%%a)
for /f %%a in (bin\自定义大小设定勿删4) do (set system_sizeG4=%%a)
for /f %%a in (bin\自定义大小设定勿删5) do (set system_sizeG5=%%a)
for /f %%a in (bin\自定义大小设定勿删6) do (set system_sizeG6=%%a)
rd /s /q "vendor\etc\device_features" >nul 2>nul
rd /s /q "system\app\miui" >nul 2>nul
rd /s /q "system\etc\device_features" >nul 2>nul
rd /s /q "system\priv-app\MiuiSystemUI" >nul 2>nul
rd /s /q "system\system\app\miui" >nul 2>nul
rd /s /q "system\system\etc\device_features" >nul 2>nul
rd /s /q "system\system\priv-app\MiuiSystemUI" >nul 2>nul
goto :eof
:system_size_set
attrib -r -h bin\自定义字节设定勿删1 >nul 2>nul
attrib -r -h bin\自定义字节设定勿删2 >nul 2>nul
attrib -r -h bin\自定义字节设定勿删3 >nul 2>nul
attrib -r -h bin\自定义字节设定勿删4 >nul 2>nul
attrib -r -h bin\自定义字节设定勿删5 >nul 2>nul
attrib -r -h bin\自定义字节设定勿删6 >nul 2>nul
attrib -r -h bin\自定义大小设定勿删1 >nul 2>nul
attrib -r -h bin\自定义大小设定勿删2 >nul 2>nul
attrib -r -h bin\自定义大小设定勿删3 >nul 2>nul
attrib -r -h bin\自定义大小设定勿删4 >nul 2>nul
attrib -r -h bin\自定义大小设定勿删5 >nul 2>nul
attrib -r -h bin\自定义大小设定勿删6 >nul 2>nul
del bin\自定义字节设定勿删1
del bin\自定义字节设定勿删2
del bin\自定义字节设定勿删3
del bin\自定义字节设定勿删4
del bin\自定义字节设定勿删5
del bin\自定义字节设定勿删6
del bin\自定义大小设定勿删1
del bin\自定义大小设定勿删2
del bin\自定义大小设定勿删3
del bin\自定义大小设定勿删4
del bin\自定义大小设定勿删5
del bin\自定义大小设定勿删6
goto :eof
:system_AIHGT_permissions_else
echo.
echo.
!cecho! {0C}  没找到system_AIHGT_permissions，请确认航母目录下是否存在system_AIHGT_permissions文件。{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:vendor_AIHGT_permissions_else
echo.
echo.
!cecho! {0C}  没找到vendor_AIHGT_permissions，请确认航母目录下是否存在vendor_AIHGT_permissions文件。{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:system_else
echo.
echo.
!cecho! {0C}  没找到system文件夹，请确认航母目录下是否存在system文件夹的完整性。{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:vendor_else
echo.
echo.
!cecho! {0C}      没找到vendor文件夹，请确认航母目录下是否存在vendor文件夹的完整性。{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:file_contexts_system_else
echo.
echo.
!cecho! {0C} 缺少system_AIHGT_file_contexts生成组件，无法继续下一步操作！{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:file_contexts_vendor_else
echo.
echo.
!cecho! {0C} 缺少vendor_AIHGT_file_contexts生成组件，无法继续下一步操作！{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:bootimg_else
echo.
echo.
!cecho! {0C}      请检查航母目录下是否存在boot.img，无法继续下一步操作！{0F}{\n}
echo.
echo.
pause
goto eof
:system_build_else
echo.
echo.
!cecho! {0C}         system目录下没发现build.prop，system并不完整请检查!{0F}{\n}
echo.
echo.
pause
goto eof
:vendor_build_else
echo.
echo.
!cecho! {0C}         vendor目录下没发现build.prop，vendor并不完整请检查!{0F}{\n}
echo.
echo.
pause
goto eof
:systemimg_else
echo.
echo.
!cecho! {0C}      没找到system.img，请确认航母目录下是否存在system.img。{0F}{\n}
echo.
echo.
pause
goto :eof
:vendorimg_else
echo.
echo.
!cecho! {0C}      没找到vendor.img，请确认航母目录下是否存在vendor.img。{0F}{\n}
echo.
echo.
pause
goto :eof
:custom_unpack
echo.
echo.
!cecho! {0B} 正在转换解包,速度快慢取决于你的电脑配置,请耐心等待...{0F}{\n}
echo.
echo.
goto :eof
:simg2img_systemimg_else
echo.
echo.
echo.正在转换官方system.img，稍后请查看将显示容量字节大小
echo.
echo 需要几分钟时间来生成！速度快慢取决于你的电脑配置，请耐心等待...
echo.
goto :eof
:simg2img_systemdat_else
echo.
echo.
echo.正在转换官方system.new.dat和system.transfer.list
echo.稍后请查看system.img.ext4此文件的属性即可查看容量字节大小
echo.
echo 需要几分钟时间来生成！速度快慢取决于你的电脑配置，请耐心等待...
echo.
goto :eof
:simg2img_systembr_else
echo.
echo.
echo.正在转换官方system.new.dat.br和system.transfer.list
echo.稍后请查看system.img.ext4此文件的属性即可查看容量字节大小
echo.
echo 需要几分钟时间来生成！速度快慢取决于你的电脑配置，请耐心等待...
echo.
goto :eof
:simg2img_vendorimg_else
echo.
echo.
echo.正在转换官方vendor.img，稍后请查看将显示容量字节大小
echo.
echo 需要几分钟时间来生成！速度快慢取决于你的电脑配置，请耐心等待...
echo.
goto :eof
:simg2img_vendordat_else
echo.
echo.
echo.正在转换官方vendor.new.dat和vendor.transfer.list
echo.稍后请查看vendor.img.ext4此文件的属性即可查看容量字节大小
echo.
echo 需要几分钟时间来生成！速度快慢取决于你的电脑配置，请耐心等待...
echo.
goto :eof
:simg2img_vendorbr_else
echo.
echo.
echo.正在转换官方vendor.new.dat.br和vendor.transfer.list
echo.稍后请查看vendor.img.ext4此文件的属性即可查看容量字节大小
echo.
echo 需要几分钟时间来生成！速度快慢取决于你的电脑配置，请耐心等待...
echo.
goto :eof
:systembr_make_else
echo.
echo.
echo 请耐心等待，正在打包生成system.new.dat.br和system.transfer.list  ...
echo.
echo 需要几分钟时间来生成！速度快慢取决于你的电脑配置，请耐心等待...
echo.
goto :eof
:systemdat_make_else
echo.
echo.
echo 请耐心等待，正在打包生成system.new.dat和system.transfer.list  ...
echo.
echo 需要几分钟时间来生成！速度快慢取决于你的电脑配置，请耐心等待...
echo.
goto :eof
:vendorbr_make_else
echo.
echo.
echo 请耐心等待，正在打包生成vendor.new.dat.br和vendor.transfer.list  ...
echo.
echo 需要几分钟时间来生成！速度快慢取决于你的电脑配置，请耐心等待...
echo.
goto :eof
:vendordat_make_else
echo.
echo.
echo 请耐心等待，正在打包生成vendor.new.dat和vendor.transfer.list  ...
echo.
echo 需要几分钟时间来生成！速度快慢取决于你的电脑配置，请耐心等待...
echo.
goto :eof
:systemimg_make_else
echo.
echo.
echo.
echo  正在打包生成ext4编码system.img镜像，需要几分钟时间来生成，速度快慢取决于你的电脑配置，请耐心等待...
echo.
echo.
echo.
goto :eof
:vendorimg_make_else
echo.
echo.
echo.
echo  正在打包生成ext4编码vendor.img镜像，需要几分钟时间来生成，速度快慢取决于你的电脑配置，请耐心等待...
echo.
echo.
echo.
goto :eof
:customimg_make_else
echo.
echo.
echo.
echo  正在打包生成ext4编码img镜像，需要几分钟时间来生成，速度快慢取决于你的电脑配置，请耐心等待...
echo.
echo.
echo.
goto :eof
:systemdat_else
echo.
echo.
!cecho! {0C}      请检查航母目录下是否存在官方system.new.dat和system.transfer.list。{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:vendordat_else
echo.
echo.
!cecho! {0C}      请检查航母目录下是否存在官方vendor.new.dat和vendor.transfer.list。{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:systembr_else
echo.
echo.
!cecho! {0C}      请检查航母目录下是否存在官方system.new.dat.br和system.transfer.list。{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:vendorbr_else
echo.
echo.
!cecho! {0C}      请检查航母目录下是否存在官方vendor.new.dat.br和vendor.transfer.list。{0F}{\n}
echo.
echo.
echo.
pause
goto :eof
:looksize_system
echo.
echo.
set Dir=system
for /f "tokens=3* delims= " %%a in ('dir/a-d/s "%Dir%"^|findstr /c:"个文件"') do set looksize=%%~a
!cecho! {0E}  当前航母目录下system目录属性总大小为：{0C}%looksize:,=%{0E} 字节{0F}{\n}
echo.
goto eof
:looksize_vendor
echo.
echo.
set Dir=vendor
for /f "tokens=3* delims= " %%a in ('dir/a-d/s "%Dir%"^|findstr /c:"个文件"') do set looksize=%%~a
!cecho! {0E}  当前航母目录下vendor目录属性总大小为：{0C}%looksize:,=%{0E} 字节{0F}{\n}
echo.
goto eof
:home_systemimg
ren system_AIHGT system >nul 2>nul
call :system_size_else
!cecho! {0A} ==============================================================================================={\n}
echo. 
echo    使用事项：识别system为工作目录,直接从system文件夹打包成system.img 
echo. 
echo  ===============================================================================================
echo  请根据自己机型的官方system分区字节大小选择下面选项:
echo.
!cecho! {0E} 1.打包成system.img大小(%system_size1% 字节) %system_sizeG1% {0C}GB{\n}
!cecho! {0E} 2.打包成system.img大小(%system_size2% 字节) %system_sizeG2% {0C}GB{\n}
!cecho! {0E} 3.打包成system.img大小(%system_size3% 字节) %system_sizeG3% {0C}GB{\n}
echo.
!cecho! {0D} 4.打包成system.img大小(%system_size4% 字节) %system_sizeG4% {0C}GB{\n}
!cecho! {0D} 5.打包成system.img大小(%system_size5% 字节) %system_sizeG5% {0C}GB{\n}
!cecho! {0D} 6.打包成system.img大小(%system_size6% 字节) %system_sizeG6% {0C}GB{\n}
!cecho! {0B}{\n}
echo  7.使用航母目录下system_size.txt解包自动析出镜像字节大小打包或自定义打包system.img大小
echo  8.自定义打包任意分区名称任意大小ext4编码（完整格式）的img镜像
echo  9.查看自己机型官方system分区容量大小【把自己机型官方system.img名称sparse image(img压缩格式)镜像文件复制到本工具目录】
!cecho! {0C}{\n}
echo 10.根据官方system分区容量大小来打包第三方ROM的system文件夹生成system.img
echo    前提:【把自己机型官方system.img名称sparse image(img压缩格式)镜像文件复制到本工具目录】
echo.
!cecho! {0A}11.重新设定本页面1-6全部选项容量大小{\n}
!cecho! {0A}12.重新设定本页面1-6单独选项容量大小{\n}
!cecho! {0A} 0.回到工具首页{\n}
!cecho! {0F}{\n}
echo.
echo.
set /p webc=-^-^> 输入数字选择对应的操作:
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
!cecho! {0A}        1.选项1的容量大小设定{\n}
!cecho! {0A}        2.选项2的容量大小设定{\n}
echo.
!cecho! {0E}        3.选项3的容量大小设定{\n}
!cecho! {0E}        4.选项4的容量大小设定{\n}
echo.
!cecho! {0D}        5.选项5的容量大小设定{\n}
!cecho! {0D}        6.选项6的容量大小设定{\n}
!cecho! {0B}====================================={0F}{\n}"
echo.
set /p systemzize=-^-^> 请输入需要重新设定的选项:
if "%systemzize%"=="1" goto custom_size_img1
if "%systemzize%"=="2" goto custom_size_img2
if "%systemzize%"=="3" goto custom_size_img3
if "%systemzize%"=="4" goto custom_size_img4
if "%systemzize%"=="5" goto custom_size_img5
if "%systemzize%"=="6" goto custom_size_img6
goto custom_settings_size_img2
:custom_size_img1
attrib -r -h bin\自定义大小设定勿删1 >nul 2>nul
del bin\自定义大小设定勿删1
goto custom_size1_img
:custom_size_img2
attrib -r -h bin\自定义大小设定勿删2 >nul 2>nul
del bin\自定义大小设定勿删2
goto custom_size2_img
:custom_size_img3
attrib -r -h bin\自定义大小设定勿删3 >nul 2>nul
del bin\自定义大小设定勿删3
goto custom_size3_img
:custom_size_img4
attrib -r -h bin\自定义大小设定勿删4 >nul 2>nul
del bin\自定义大小设定勿删4
goto custom_size4_img
:custom_size_img5
attrib -r -h bin\自定义大小设定勿删5 >nul 2>nul
del bin\自定义大小设定勿删5
goto custom_size5_img
:custom_size_img6
attrib -r -h bin\自定义大小设定勿删6 >nul 2>nul
del bin\自定义大小设定勿删6
goto custom_size6_img
:custom_sizesystem1_else
attrib -r -h bin\自定义字节设定勿删1 >nul 2>nul
!cecho! {0C}请输入选项1容量字节大小（纯阿拉伯数字）进行自我设定:{\n}
set /p system_imgsize1=
echo %system_imgsize1%>bin\自定义字节设定勿删1
powershell %system_imgsize1%d/1024/1024/1024>bin\自定义大小设定勿删1
attrib +r +h bin\自定义大小设定勿删1 >nul 2>nul
goto eof
:custom_sizesystem2_else
attrib -r -h bin\自定义字节设定勿删2 >nul 2>nul
!cecho! {0C}请输入选项2容量字节大小（纯阿拉伯数字）进行自我设定:{\n}
set /p system_imgsize2=
echo %system_imgsize2%>bin\自定义字节设定勿删2
powershell %system_imgsize2%d/1024/1024/1024>bin\自定义大小设定勿删2
attrib +r +h bin\自定义大小设定勿删2 >nul 2>nul
goto eof
:custom_sizesystem3_else
attrib -r -h bin\自定义字节设定勿删3 >nul 2>nul
!cecho! {0C}请输入选项3容量字节大小（纯阿拉伯数字）进行自我设定:{\n}
set /p system_imgsize3=
echo %system_imgsize3%>bin\自定义字节设定勿删3
powershell %system_imgsize3%d/1024/1024/1024>bin\自定义大小设定勿删3
attrib +r +h bin\自定义大小设定勿删3 >nul 2>nul
goto eof
:custom_sizesystem4_else
attrib -r -h bin\自定义字节设定勿删4 >nul 2>nul
!cecho! {0C}请输入选项4容量字节大小（纯阿拉伯数字）进行自我设定:{\n}
set /p system_imgsize4=
echo %system_imgsize4%>bin\自定义字节设定勿删4
powershell %system_imgsize4%d/1024/1024/1024>bin\自定义大小设定勿删4
attrib +r +h bin\自定义大小设定勿删4 >nul 2>nul
goto eof
:custom_sizesystem5_else
attrib -r -h bin\自定义字节设定勿删5 >nul 2>nul
!cecho! {0C}请输入选项5容量字节大小（纯阿拉伯数字）进行自我设定:{\n}
set /p system_imgsize5=
echo %system_imgsize5%>bin\自定义字节设定勿删5
powershell %system_imgsize5%d/1024/1024/1024>bin\自定义大小设定勿删5
attrib +r +h bin\自定义大小设定勿删5 >nul 2>nul
goto eof
:custom_sizesystem6_else
attrib -r -h bin\自定义字节设定勿删6 >nul 2>nul
!cecho! {0C}请输入选项6容量字节大小（纯阿拉伯数字）进行自我设定:{\n}
set /p system_imgsize6=
echo %system_imgsize6%>bin\自定义字节设定勿删6
powershell %system_imgsize6%d/1024/1024/1024>bin\自定义大小设定勿删6
attrib +r +h bin\自定义大小设定勿删6 >nul 2>nul
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
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemimg & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemimg & else
)
goto home
:custom_arbitrarily_img
echo.
!cecho! {0E}    请在弹窗选择合适的_permissions文件进行打包！{0F}{\n}
echo.
set custom_permissions=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set custom_permissions=" "%~dp0\*_permissions"`) do %%a
echo.
!cecho! {0E}    请在弹窗选择合适的_file_contexts文件进行打包！{0F}{\n}
echo.
set custom_file_contexts=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set custom_file_contexts=" "%~dp0\*_file_contexts"`) do %%a
echo.
!cecho! {0E}确保{0C}custom_AIHGT_permissions{0E}文件内容对应需要打包分区名称，否则无法打包！{\n}
!cecho! {0E}看不懂{0C}custom_AIHGT_permissions{0E}文件请教611193563航母群大神解决！{\n}
echo.
!cecho! {0E}你所输入的分区名称需要{0C}file_contexts{0E}对应文本上下文代码支持！输完分区名称请认真核对无误才按下Enter回车键确认！{0F}{\n}
echo.
echo.
set /p arbitrarily=输入需要打包的分区名称（英文小写状态输入）：
echo.
pause
!cecho! {0F}{\n}
if not exist "bin\自定义大小任意分区打包勿删" (
goto custom_arbitrarily_size_new
else
)
for /f %%a in (bin\自定义大小任意分区打包勿删) do (set arbitrarily_sizeo=%%a)
!cecho! {0F}     上次打包的容量大小字节是:{0C}%arbitrarily_sizeo%{\n}
echo.
:custom_arbitrarily_img_begin
!cecho! {0B} ================================================{\n}
!cecho! {0E}  1.使用上次保存的容量大小字节{0C}%arbitrarily_sizeo%{0E}进行打包{\n}
!cecho! {0E}  2.新建容量大小字节打包{\n}
!cecho! {0B} ================================================{0F}{\n}
echo.
set /p webfo=-^-^> 输入数字选择对应的操作:
if "%webfo%"=="1" goto custom_arbitrarily_size
if "%webfo%"=="2" goto custom_arbitrarily_size_new
goto custom_arbitrarily_img_begin
:custom_arbitrarily_size
call :customimg_make_else
del %arbitrarily%.img 2>nul
!make_ext4fs! -S %custom_file_contexts% -X %custom_permissions% -l %arbitrarily_sizeo% -L %arbitrarily% -K vUA6spGTE7EuEd4H -a /%arbitrarily% %arbitrarily%.img %arbitrarily%
echo.
if not exist "%arbitrarily%.img" !cecho! {0C}      航母目录内不存在 %arbitrarily% 打包目录,无法进行打包！{0F}{\n} & echo. & pause & goto home_systemimg & else
goto home
:custom_arbitrarily_size_new
attrib -r -h bin\自定义大小任意分区打包勿删 >nul 2>nul
!cecho! 请输入自己机型{0C}%arbitrarily%分区{0F}容量字节大小:{\n}
set /p arbitrarily_sizeo=
echo %arbitrarily_sizeo%>bin\自定义大小任意分区打包勿删
attrib +r +h bin\自定义大小任意分区打包勿删 >nul 2>nul
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
if not exist bin\自定义大小打包system分区勿删 goto custom_size_img
for /f %%a in (bin\自定义大小打包system分区勿删) do (set system_size=%%a)
if not exist system_size.txt goto custom_size_img
for /f %%a in (system_size.txt) do (set system2size=%%a)
:build_api_system_custom_begin
!cecho! {0B} ==========================================================={\n}
!cecho! {0E}  1.使用航母目录下system_size.txt里面{0C}%system2size%{0E}字节容量打包{\n}
!cecho! {0E}  2.使用上次保存的容量大小字节{0C}%system_size%{0E}进行打包{\n}
!cecho! {0E}  3.新建容量大小字节打包{\n}
!cecho! {0B} ==========================================================={0F}{\n}
echo.
set /p webh=-^-^> 输入数字选择对应的操作:
if "%webh%"=="1" goto record_system_size
if "%webh%"=="2" goto custom_system_size_start
if "%webh%"=="3" goto custom_size_img
goto build_api_system_custom_begin
:custom_system_size_start
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %system_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemimg & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemimg & else
)
goto home
:custom_size_img
attrib -r -h bin\自定义大小打包system分区勿删 >nul 2>nul
!cecho! 请输入自己机型{0C}官方system分区{0F}容量字节大小:{\n}
set /p system_size=
echo %system_size%>bin\自定义大小打包system分区勿删
attrib +r +h bin\自定义大小打包system分区勿删 >nul 2>nul
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %system_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemimg & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemimg & else
)
goto home
:record_system_size
if not exist system_size.txt call :not_system_size
for /f %%a in (system_size.txt) do (set system_size=%%a)
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %system_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemimg & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemimg & else
)
goto home
:not_system_size
echo.
echo 没找到system_size.txt
echo.
echo 请输入容量字节打包:
set /p system_size=
echo %system_size%>system_size.txt
goto eof
:not_vendor_size
echo.
echo 没找到vendor_size.txt
echo.
echo 请输入容量字节打包:
set /p vendor_size=
echo %vendor_size%>vendor_size.txt
goto eof
:look_systemimg_else
echo.
echo.
!cecho! {0C}      没找到官方system.img（sparse image(img压缩格式)），请确认航母目录下是否存在官方system.img。{0F}{\n}
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
!cecho! %%i:官方system分区字节容量大小={0C}%%~zi{0F}字节.{\n}
)
pause
del system_ext4.img 2>nul
goto home
:looking_systemimg_size2
for /f "delims=" %%i in ('dir /a-d /b system_ext4.img') do (
!cecho! %%i:官方system分区字节容量大小={0C}%%~zi{0F}字节.{\n}
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
!cecho! %%i:官方system分区字节容量大小={0C}%%~zi{0F}字节.{\n}
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
!cecho! {0C}  检测到当前system.img为ext4编码，请确认是否为官方system.img，否则分区容量超过官方大小导致无法刷入{0F}{\n}
pause
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
!cecho! %%i:官方system分区字节容量大小={0C}%%~zi{0F}字节.{\n}
set ext4imgsizea=%%~zi
)
goto Continue
:Continue
call :systemimg_make_else
del system_ext4.img 2>nul
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %ext4imgsizea% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemimg & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemimg & else
)
goto home
:home_systemdat
ren system_AIHGT system >nul 2>nul
call :system_size_else
!cecho! {0A} ====================================================================================================={\n}
echo.
echo.    使用事项：识别system为工作目录,直接从system文件夹打包成system.new.dat和system.transfer.list
echo.
echo. =====================================================================================================
!cecho!  {0A} 请根据自己机型的官方system分区字节大小选择下面选项:{\n}
!cecho! {0E}{\n}
!cecho! {0E}  1.打包成system.new.dat和system.transfer.list大小 (%system_size1% 字节) %system_sizeG1% {0C}GB{\n}
!cecho! {0E}  2.打包成system.new.dat和system.transfer.list大小 (%system_size2% 字节) %system_sizeG2% {0C}GB{\n}
!cecho! {0E}  3.打包成system.new.dat和system.transfer.list大小 (%system_size3% 字节) %system_sizeG3% {0C}GB{\n}
!cecho! {0D}{\n}
!cecho! {0D}  4.打包成system.new.dat和system.transfer.list大小 (%system_size4% 字节) %system_sizeG4% {0C}GB{\n}
!cecho! {0D}  5.打包成system.new.dat和system.transfer.list大小 (%system_size5% 字节) %system_sizeG5% {0C}GB{\n}
!cecho! {0D}  6.打包成system.new.dat和system.transfer.list大小 (%system_size6% 字节) %system_sizeG6% {0C}GB{\n}
!cecho! {0B} {\n}
echo   7.使用航母目录下system_size.txt解包自动析出镜像字节大小打包或自定义打包system.new.dat和system.transfer.list大小
echo   8.查看官方system分区容量大小【提取官方system.new.dat和system.transfer.list复制到本工具目录】
!cecho! {0C}{\n}
!cecho! {0C}  9.根据官方system分区容量大小来打包第三方ROM的system目录生成system.new.dat和system.transfer.list{\n}
!cecho! {0C}    前提:【提取官方system.new.dat和system.transfer.list复制到本工具目录】{\n}
!cecho! {0A}{\n}
echo  10.重新设定本页面1-6全部选项容量大小
echo  11.重新设定本页面1-6单独选项容量大小
echo   0.回到工具首页
!cecho! {0F}{\n}
echo.
set /p webj=-^-^> 输入数字选择对应的操作:
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
!cecho! {0A}        1.选项1的容量大小设定{\n}
!cecho! {0A}        2.选项2的容量大小设定{\n}
echo.
!cecho! {0E}        3.选项3的容量大小设定{\n}
!cecho! {0E}        4.选项4的容量大小设定{\n}
echo.
!cecho! {0D}        5.选项5的容量大小设定{\n}
!cecho! {0D}        6.选项6的容量大小设定{\n}
!cecho! {0B}====================================={0F}{\n}"
echo.
set /p systemzize=-^-^> 请输入需要重新设定的选项:
if "%systemzize%"=="1" goto custom_size_dat1
if "%systemzize%"=="2" goto custom_size_dat2
if "%systemzize%"=="3" goto custom_size_dat3
if "%systemzize%"=="4" goto custom_size_dat4
if "%systemzize%"=="5" goto custom_size_dat5
if "%systemzize%"=="6" goto custom_size_dat6
goto custom_settings_size_dat2
:custom_size_dat1
attrib -r -h bin\自定义大小设定勿删1 >nul 2>nul
del bin\自定义大小设定勿删1
goto custom_size1_dat
:custom_size_dat2
attrib -r -h bin\自定义大小设定勿删2 >nul 2>nul
del bin\自定义大小设定勿删2
goto custom_size2_dat
:custom_size_dat3
attrib -r -h bin\自定义大小设定勿删3 >nul 2>nul
del bin\自定义大小设定勿删3
goto custom_size3_dat
:custom_size_dat4
attrib -r -h bin\自定义大小设定勿删4 >nul 2>nul
del bin\自定义大小设定勿删4
goto custom_size4_dat
:custom_size_dat5
attrib -r -h bin\自定义大小设定勿删5 >nul 2>nul
del bin\自定义大小设定勿删5
goto custom_size5_dat
:custom_size_dat6
attrib -r -h bin\自定义大小设定勿删6 >nul 2>nul
del bin\自定义大小设定勿删6
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
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemdat & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemdat & else
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
echo 正在马不停蹄转换中... & !raw2simg! system.img bin\cache\system_simg.img >nul 2>nul
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
if not exist bin\自定义大小打包system分区勿删 goto custom_size_dat
for /f %%a in (bin\自定义大小打包system分区勿删) do (set dat_size=%%a)
if not exist system_size.txt goto custom_size_dat
for /f %%a in (system_size.txt) do (set dat2size=%%a)
:build_api_custom_system_make_dat_begin
!cecho! {0B} ==========================================================={\n}
!cecho! {0E}  1.使用航母目录下system_size.txt里面{0C}%dat2size%{0E}字节容量打包{\n}
!cecho! {0E}  2.使用上次保存的容量大小字节{0C}%dat_size%{0E}进行打包{\n}
!cecho! {0E}  3.新建容量大小字节打包{\n}
!cecho! {0B} ==========================================================={0F}{\n}
echo.
set /p webm=-^-^> 输入数字选择对应的操作:
if "%webm%"=="1" goto record_system_size_dat
if "%webm%"=="2" goto custom_dat_size_start
if "%webm%"=="3" goto custom_size_dat
goto build_api_custom_system_make_dat_begin
:custom_dat_size_start
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %dat_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemdat & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemdat & else
)
goto systemimg_to_dat
:custom_size_dat
attrib -r -h bin\自定义大小打包system分区勿删 >nul 2>nul
!cecho! 请输入自己机型{0C}官方system分区{0F}容量字节大小:{\n}
set /p dat_size=
echo %dat_size%>bin\自定义大小打包system分区勿删
attrib +r +h bin\自定义大小打包system分区勿删 >nul 2>nul
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %dat_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemdat & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemdat & else
)
goto systemimg_to_dat
:record_system_size_dat
if not exist system_size.txt call :not_system_size
for /f %%a in (system_size.txt) do (set system_size=%%a)
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %dat_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemdat & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemdat & else
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
!cecho! %%i:官方system分区字节容量大小={0C}%%~zi{0F}字节.{\n}
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
!cecho! %%i:官方system分区字节容量大小={0C}%%~zi{0F}字节.{\n}
set ext4imgage2sizec=%%~zi
)
call :systemimg_make_else
del system.img.ext4 2>nul
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %ext4imgage2sizec% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
echo.
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemdat & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systemdat & else
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
echo 正在马不停蹄转换中... & !raw2simg! system.img bin\cache\system_simg.img >nul 2>nul
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
echo.    使用事项：识别system为工作目录,直接从vendor文件夹打包成system.new.dat.br和system.transfer.list
echo.       
echo. =====================================================================================================
!cecho!  {0A} 请根据自己机型的官方system分区字节大小选择下面选项:{\n}
!cecho! {0E}{\n}
!cecho! {0E}  1.打包成system.new.dat.br和system.transfer.list大小 (%system_size1% 字节) %system_sizeG1% {0C}GB{\n}
!cecho! {0E}  2.打包成system.new.dat.br和system.transfer.list大小 (%system_size2% 字节) %system_sizeG2% {0C}GB{\n}
!cecho! {0E}  3.打包成system.new.dat.br和system.transfer.list大小 (%system_size3% 字节) %system_sizeG3% {0C}GB{\n}
!cecho! {0D}{\n}
!cecho! {0D}  4.打包成system.new.dat.br和system.transfer.list大小 (%system_size4% 字节) %system_sizeG4% {0C}GB{\n}
!cecho! {0D}  5.打包成system.new.dat.br和system.transfer.list大小 (%system_size5% 字节) %system_sizeG5% {0C}GB{\n}
!cecho! {0D}  6.打包成system.new.dat.br和system.transfer.list大小 (%system_size6% 字节) %system_sizeG6% {0C}GB{\n}
!cecho! {0B}{\n}
echo   7.使用航母目录下system_size.txt解包自动析出镜像字节大小打包或自定义打包system.new.dat.br和system.transfer.list
echo   8.查看官方system分区容量大小【提取官方system.new.dat.br和system.transfer.list复制到本工具目录】
!cecho! {0C}{\n}
echo   9.根据官方system分区容量大小来打包第三方ROM的system目录生成system.new.dat.br和system.transfer.list
echo     前提:【提取官方system.new.dat.br和system.transfer.list复制到本工具目录】
!cecho! {0A}{\n}
echo  10.重新设定本页面1-6全部选项容量大小
echo  11.重新设定本页面1-6单独选项容量大小
echo   0.回到工具首页
!cecho! {0F}{\n}
echo.
set /p webbr=-^-^> 输入数字选择对应的操作:
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
!cecho! {0A}        1.选项1的容量大小设定{\n}
!cecho! {0A}        2.选项2的容量大小设定{\n}
echo.
!cecho! {0E}        3.选项3的容量大小设定{\n}
!cecho! {0E}        4.选项4的容量大小设定{\n}
echo.
!cecho! {0D}        5.选项5的容量大小设定{\n}
!cecho! {0D}        6.选项6的容量大小设定{\n}
!cecho! {0B}====================================={0F}{\n}
echo.
set /p systembrzize=-^-^> 请输入需要重新设定的选项:
if "%systembrzize%"=="1" goto custom_size_br1
if "%systembrzize%"=="2" goto custom_size_br2
if "%systembrzize%"=="3" goto custom_size_br3
if "%systembrzize%"=="4" goto custom_size_br4
if "%systembrzize%"=="5" goto custom_size_br5
if "%systembrzize%"=="6" goto custom_size_br6
goto custom_settings_size_dat2
:custom_size_br1
attrib -r -h bin\自定义大小设定勿删1 >nul 2>nul
del bin\自定义大小设定勿删1
goto custom_size1_br
:custom_size_br2
attrib -r -h bin\自定义大小设定勿删2 >nul 2>nul
del bin\自定义大小设定勿删2
goto custom_size2_br
:custom_size_br3
attrib -r -h bin\自定义大小设定勿删3 >nul 2>nul
del bin\自定义大小设定勿删3
goto custom_size3_br
:custom_size_br4
attrib -r -h bin\自定义大小设定勿删4 >nul 2>nul
del bin\自定义大小设定勿删4
goto custom_size4_br
:custom_size_br5
attrib -r -h bin\自定义大小设定勿删5 >nul 2>nul
del bin\自定义大小设定勿删5
goto custom_size5_br
:custom_size_br6
attrib -r -h bin\自定义大小设定勿删6 >nul 2>nul
del bin\自定义大小设定勿删6
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
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systembr & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systembr & else
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
echo 正在马不停蹄转换中... & !raw2simg! system.img bin\cache\system_simg.img >nul 2>nul
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
if not exist bin\自定义大小打包system分区勿删 goto custom_size_br
for /f %%a in (bin\自定义大小打包system分区勿删) do (set br_size=%%a)
if not exist system_size.txt goto custom_size_br
for /f %%a in (system_size.txt) do (set br2size=%%a)
:build_api_custom_system_br_begin
!cecho! {0B} ==========================================================={\n}
!cecho! {0E}  1.使用航母目录下system_size.txt里面{0C}%br2size%{0E}字节容量打包{\n}
!cecho! {0E}  2.使用上次保存的容量大小字节{0C}%br_size%{0E}进行打包{\n}
!cecho! {0E}  3.新建容量大小字节打包{\n}
!cecho! {0B} ==========================================================={0F}{\n}
echo.
set /p webmbr=-^-^> 输入数字选择对应的操作:
if "%webmbr%"=="1" goto record_system_size_br
if "%webmbr%"=="2" goto custom_br_size_start
if "%webmbr%"=="3" goto custom_size_br
goto build_api_custom_system_br_begin
:custom_br_size_start
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %br_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systembr & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systembr & else
)
goto systemimg_to_datbr
:custom_size_br
attrib -r -h bin\自定义大小打包system分区勿删 >nul 2>nul
!cecho! 请输入自己机型{0C}官方system分区{0F}容量字节大小:{\n}
set /p br_size=
echo %br_size%>bin\自定义大小打包system分区勿删
attrib +r +h bin\自定义大小打包system分区勿删 >nul 2>nul
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %br_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systembr & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systembr & else
)
goto systemimg_to_datbr
:record_system_size_br
if not exist system_size.txt call :not_system_size
for /f %%a in (system_size.txt) do (set system_size=%%a)
call :systemimg_make_else
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %br_size% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systembr & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systembr & else
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
!cecho! %%i:官方system分区字节容量大小={0C}%%~zi{0F}字节.{\n}
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
!cecho! %%i:官方system分区字节容量大小={0C}%%~zi{0F}字节.{\n}
set ext4imgage2sizecbr=%%~zi
)
call :systemimg_make_else
del system.img.ext4 2>nul
del system.img 2>nul
!make_ext4fs! -S system_AIHGT_file_contexts -X system_AIHGT_permissions -l %ext4imgage2sizecbr% -L system -K vUA6spGTE7EuEd4H -a /system system.img system
echo.
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_systembr & else
for /f "delims=" %%i in ('dir /a-d /b system.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (system.img) do (
if %%~za==0 del %~dp0\system.img 
if not exist "system.img" !cecho! {0C}  打包报错日志出现，请检查system_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_systembr & else
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
echo 正在马不停蹄转换中... & !raw2simg! system.img bin\cache\system_simg.img >nul 2>nul
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
bin\cecho {0C}——————————{0C}{\n}
bin\cecho {0A}  1.安卓5.0{\n}
echo.
bin\cecho {0E}  2.安卓5.1{\n}
echo.
bin\cecho {0D}  3.安卓6.0{\n}
echo.
bin\cecho {0B}  4.安卓7.0-安卓9.0{\n}
bin\cecho {0C}——————————{0F}{\n}
echo.
set /p versionss=-^-^> 请选择对应安卓版本:
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
echo 正在马不停蹄转换中... & !raw2simg! system.img bin\cache\system_simg.img >nul 2>nul
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
echo.    使用事项：识别vendor为工作目录,直接从vendor文件夹打包成vendor.new.dat.br和vendor.transfer.list
echo.
echo. =====================================================================================================
!cecho!  {0A} 请根据自己机型的官方vendor分区字节大小选择下面选项:{\n}
echo.
!cecho! {0E} 1.打包成vendor.new.dat.br和vendor.transfer.list大小 (%vendor_size1% 字节) %vendor_sizeG1% {0C}MB{\n}
!cecho! {0E} 2.打包成vendor.new.dat.br和vendor.transfer.list大小 (%vendor_size2% 字节) %vendor_sizeG2% {0C}MB{\n}
!cecho! {0E} 3.打包成vendor.new.dat.br和vendor.transfer.list大小 (%vendor_size3% 字节) %vendor_sizeG3% {0C}MB{\n}
!cecho! {0D}{\n}
echo  4.使用航母目录下system_size.txt解包自动析出镜像字节大小打包或自定义打包vendor.new.dat.br和vendor.transfer.list
echo  5.查看官方vendor分区容量大小【提取官方vendor.new.dat.br和vendor.transfer.list复制到本工具目录】
!cecho! {0B}{\n}
echo  6.根据官方vendor分区容量大小来打包第三方ROM的vendor目录生成vendor.new.dat.br和vendor.transfer.list
echo    前提:【提取官方vendor.new.dat.br和vendor.transfer.list复制到本工具目录】
!cecho! {0C}{\n}
echo  7.重新设定本页面1-3全部选项容量大小
echo  8.重新设定本页面1-3单独选项容量大小
echo  0.回到工具首页
!cecho! {0F}{\n}
echo.
set /p webvendorbr=-^-^> 输入数字选择对应的操作:
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
set /p vendorzizebr=-^-^> 请输入需要重新设定的选项:
if "%vendorzizebr%"=="1" goto vendor_custom_size_br1
if "%vendorzizebr%"=="2" goto vendor_custom_size_br2
if "%vendorzizebr%"=="3" goto vendor_custom_size_br3
goto vendor_custom_settings_size_br2
:vendor_custom_size_br1
attrib -r -h bin\vendor自定义大小设定勿删1 >nul 2>nul
del bin\vendor自定义大小设定勿删1
goto vendor_custom_size1_br
:vendor_custom_size_br2
attrib -r -h bin\vendor自定义大小设定勿删2 >nul 2>nul
del bin\vendor自定义大小设定勿删2
goto vendor_custom_size2_br
:vendor_custom_size_br3
attrib -r -h bin\vendor自定义大小设定勿删3 >nul 2>nul
del bin\vendor自定义大小设定勿删3
goto vendor_custom_size3_br
:custom_sizevendor1_else
attrib -r -h bin\vendor自定义字节设定勿删1 >nul 2>nul
!cecho! {0C}请输入选项1容量字节大小（纯阿拉伯数字）进行自我设定:{\n}
set /p vendor_imgsize1=
echo %vendor_imgsize1%>bin\vendor自定义字节设定勿删1
powershell %vendor_imgsize1%d/1024/1024>bin\vendor自定义大小设定勿删1
attrib +r +h bin\vendor自定义大小设定勿删1 >nul 2>nul
goto eof
:custom_sizevendor2_else
attrib -r -h bin\vendor自定义字节设定勿删2 >nul 2>nul
!cecho! {0C}请输入选项2容量字节大小（纯阿拉伯数字）进行自我设定:{\n}
set /p vendor_imgsize2=
echo %vendor_imgsize2%>bin\vendor自定义字节设定勿删2
powershell %vendor_imgsize2%d/1024/1024>bin\vendor自定义大小设定勿删2
attrib +r +h bin\vendor自定义大小设定勿删2 >nul 2>nul
goto eof
:custom_sizevendor3_else
attrib -r -h bin\vendor自定义字节设定勿删3 >nul 2>nul
!cecho! {0C}请输入选项3容量字节大小（纯阿拉伯数字）进行自我设定:{\n}
set /p vendor_imgsize3=
echo %vendor_imgsize3%>bin\vendor自定义字节设定勿删3
powershell %vendor_imgsize3%d/1024/1024>bin\vendor自定义大小设定勿删3
attrib +r +h bin\vendor自定义大小设定勿删3 >nul 2>nul
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
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorbr & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorbr & else
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
if not exist bin\自定义大小打包vendor分区勿删 goto custom_size_vendorbr
for /f %%a in (bin\自定义大小打包vendor分区勿删) do (set vendoroobr_size=%%a)
if not exist vendor_size.txt goto custom_size_vendorbr
for /f %%a in (vendor_size.txt) do (set vendoroobr2size=%%a)
:custom_vendor_br_begin
!cecho! {0B} ==========================================================={\n}
!cecho! {0E}  1.使用航母目录下vendor_size.txt里面{0C}%vendoroobr2size%{0E}字节容量打包{\n}
!cecho! {0E}  1.使用上次保存的容量大小字节{0C}%vendoroobr_size%{0E}进行打包{\n}
!cecho! {0E}  2.新建容量大小字节打包{\n}
!cecho! {0B} ==========================================================={0F}{\n}
echo.
set /p webmovendorbr=-^-^> 输入数字选择对应的操作:
if "%webmovendorbr%"=="1" goto record_vendor_size_br
if "%webmovendorbr%"=="2" goto custom_vendorbr_size
if "%webmovendorbr%"=="3" goto custom_size_vendorbr
goto custom_vendor_br_begin
:custom_vendorbr_size
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendoroobr_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorbr & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorbr & else
)
goto vendorimg_to_br
:custom_size_vendorbr
attrib -r -h bin\自定义大小打包vendor分区勿删 >nul 2>nul
!cecho! 请输入自己机型{0C}官方vendor分区{0F}容量字节大小:{\n}
set /p vendoroobr_size=
echo %vendoroobr_size%>bin\自定义大小打包vendor分区勿删
attrib +r +h bin\自定义大小打包vendor分区勿删 >nul 2>nul
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendoroobr_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorbr & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorbr & else
)
goto vendorimg_to_br
:record_vendor_size_br
if not exist vendor_size.txt call :not_vendor_size
for /f %%a in (vendor_size.txt) do (set vendor_size=%%a)
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendor_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorbr & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorbr & else
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
!cecho! %%i:官方vendor分区字节容量大小={0C}%%~zi{0F}字节.{\n}
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
!cecho! %%i:官方vendor分区字节容量大小={0C}%%~zi{0F}字节.{\n}
set vendorext4imgage2sizecobr=%%~zi
)
call :vendorimg_make_else
del vendor.img.ext4 2>nul
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendorext4imgage2sizecobr% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
echo.
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorbr & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorbr & else
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
echo.    使用事项：识别vendor为工作目录,直接从vendor文件夹打包成vendor.new.dat和vendor.transfer.list
echo.
echo. =====================================================================================================
!cecho!  {0A} 请根据自己机型的官方vendor分区字节大小选择下面选项:{\n}
echo.
!cecho! {0E} 1.打包成vendor.new.dat和vendor.transfer.list大小 (%vendor_size1% 字节) %vendor_sizeG1% {0C}MB{\n}
!cecho! {0E} 2.打包成vendor.new.dat和vendor.transfer.list大小 (%vendor_size2% 字节) %vendor_sizeG2% {0C}MB{\n}
!cecho! {0E} 3.打包成vendor.new.dat和vendor.transfer.list大小 (%vendor_size3% 字节) %vendor_sizeG3% {0C}MB{\n}
!cecho! {0D}{\n}
echo  4.使用航母目录下system_size.txt解包自动析出镜像字节大小打包或自定义打包vendor.new.dat和vendor.transfer.list
echo  5.查看官方vendor分区容量大小【提取官方vendor.new.dat和vendor.transfer.list复制到本工具目录】
!cecho! {0B}{\n}
echo  6.根据官方vendor分区容量大小来打包第三方ROM的vendor目录生成vendor.new.dat和vendor.transfer.list
echo    前提:【提取官方vendor.new.dat和vendor.transfer.list复制到本工具目录】
!cecho! {0C}{\n}
echo  7.重新设定本页面1-3全部选项容量大小
echo  8.重新设定本页面1-3单独选项容量大小
echo  0.回到工具首页
!cecho! {0F}{\n}
echo.
set /p webvendor=-^-^> 输入数字选择对应的操作:
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
set /p vendorzize=-^-^> 请输入需要重新设定的选项:
if "%vendorzize%"=="1" goto vendor_custom_size_dat1
if "%vendorzize%"=="2" goto vendor_custom_size_dat2
if "%vendorzize%"=="3" goto vendor_custom_size_dat3
goto vendor_custom_settings_size_dat2
:vendor_custom_size_dat1
attrib -r -h bin\vendor自定义大小设定勿删1 >nul 2>nul
del bin\vendor自定义大小设定勿删1
goto vendor_custom_size1_dat
:vendor_custom_size_dat2
attrib -r -h bin\vendor自定义大小设定勿删2 >nul 2>nul
del bin\vendor自定义大小设定勿删2
goto vendor_custom_size2_dat
:vendor_custom_size_dat3
attrib -r -h bin\vendor自定义大小设定勿删3 >nul 2>nul
del bin\vendor自定义大小设定勿删3
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
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendordat & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendordat & else
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
if not exist bin\自定义大小打包vendor分区勿删 goto custom_size_vendordat
for /f %%a in (bin\自定义大小打包vendor分区勿删) do (set vendoroodat_size=%%a)
if not exist vendor_size.txt goto custom_size_vendordat
for /f %%a in (vendor_size.txt) do (set vendoroodat2size=%%a)
:custom_vendor_dat_begin
!cecho! {0B} ==========================================================={\n}
!cecho! {0E}  1.使用航母目录下vendor_size.txt里面{0C}%vendoroodat2size%{0E}字节容量打包{\n}
!cecho! {0E}  2.使用上次保存的容量大小字节{0C}%vendoroodat_size%{0E}进行打包{\n}
!cecho! {0E}  3.新建容量大小字节打包{\n}
!cecho! {0B} ==========================================================={0F}{\n}
echo.
set /p webmovendor=-^-^> 输入数字选择对应的操作:
if "%webmovendor%"=="1" goto record_vendor_size_dat
if "%webmovendor%"=="2" goto custom_vendordat_size
if "%webmovendor%"=="3" goto custom_size_vendordat
goto custom_vendor_dat_begin
:custom_vendordat_size
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendoroodat_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendordat & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendordat & else
)
goto vendorimg_to_dat
:custom_size_vendordat
attrib -r -h bin\自定义大小打包vendor分区勿删 >nul 2>nul
!cecho! 请输入自己机型{0C}官方vendor分区{0F}容量字节大小:{\n}
set /p vendoroodat_size=
echo %vendoroodat_size%>bin\自定义大小打包vendor分区勿删
attrib +r +h bin\自定义大小打包vendor分区勿删 >nul 2>nul
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendoroodat_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendordat & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendordat & else
)
goto vendorimg_to_dat
:record_vendor_size_dat
if not exist vendor_size.txt call :not_vendor_size
for /f %%a in (vendor_size.txt) do (set vendor_size=%%a)
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendor_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendordat & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendordat & else
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
!cecho! %%i:官方vendor分区字节容量大小={0C}%%~zi{0F}字节.{\n}
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
!cecho! %%i:官方vendor分区字节容量大小={0C}%%~zi{0F}字节.{\n}
set vendorext4imgage2sizeco=%%~zi
)
call :vendorimg_make_else
del vendor.img.ext4 2>nul
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendorext4imgage2sizeco% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendordat & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendordat & else
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
if not exist bin\vendor自定义字节设定勿删1 goto vendor_custom_size1_img
if not exist bin\vendor自定义字节设定勿删2 goto vendor_custom_size2_img
if not exist bin\vendor自定义字节设定勿删3 goto vendor_custom_size3_img
if not exist bin\vendor自定义大小设定勿删1 goto vendor_custom_size1_img
if not exist bin\vendor自定义大小设定勿删2 goto vendor_custom_size2_img
if not exist bin\vendor自定义大小设定勿删3 goto vendor_custom_size3_img
for /f %%a in (bin\vendor自定义字节设定勿删1) do (set vendor_size1=%%a)
for /f %%a in (bin\vendor自定义字节设定勿删2) do (set vendor_size2=%%a)
for /f %%a in (bin\vendor自定义字节设定勿删3) do (set vendor_size3=%%a)
for /f %%a in (bin\vendor自定义大小设定勿删1) do (set vendor_sizeG1=%%a)
for /f %%a in (bin\vendor自定义大小设定勿删2) do (set vendor_sizeG2=%%a)
for /f %%a in (bin\vendor自定义大小设定勿删3) do (set vendor_sizeG3=%%a)
rd /s /q "vendor\etc\device_features" >nul 2>nul
rd /s /q "system\app\miui" >nul 2>nul
rd /s /q "system\etc\device_features" >nul 2>nul
rd /s /q "system\priv-app\MiuiSystemUI" >nul 2>nul
rd /s /q "system\system\app\miui" >nul 2>nul
rd /s /q "system\system\etc\device_features" >nul 2>nul
rd /s /q "system\system\priv-app\MiuiSystemUI" >nul 2>nul
goto :eof
:vendor_size_set
attrib -r -h bin\vendor自定义字节设定勿删1 >nul 2>nul
attrib -r -h bin\vendor自定义字节设定勿删2 >nul 2>nul
attrib -r -h bin\vendor自定义字节设定勿删3 >nul 2>nul
attrib -r -h bin\vendor自定义大小设定勿删1 >nul 2>nul
attrib -r -h bin\vendor自定义大小设定勿删2 >nul 2>nul
attrib -r -h bin\vendor自定义大小设定勿删3 >nul 2>nul
del bin\vendor自定义字节设定勿删1
del bin\vendor自定义字节设定勿删2
del bin\vendor自定义字节设定勿删3
del bin\vendor自定义大小设定勿删1
del bin\vendor自定义大小设定勿删2
del bin\vendor自定义大小设定勿删3
goto :eof
:vendor_size_set_custom
echo.
echo.
echo.
!cecho! {0B}====================================={\n}
!cecho! {0A}        1.选项1的容量大小设定{\n}
echo.
!cecho! {0E}        2.选项2的容量大小设定{\n}
echo.
!cecho! {0D}        3.选项3的容量大小设定{\n}
!cecho! {0B}====================================={0F}{\n}
echo.
goto :eof
:home_vendorimg
ren vendorbr_AIHGT vendorbr >nul 2>nul
call :vendor_size_else
!cecho! {0A} ====================================================================================================={\n}
echo.
echo.    使用事项：识别vendor为工作目录,直接从vendor文件夹打包成vendor.img
echo.
echo. =====================================================================================================
!cecho!  {0A} 请根据自己机型的官方vendor分区字节大小选择下面选项:{\n}
echo.
!cecho! {0E} 1.打包成vendor.img大小 (%vendor_size1% 字节) %vendor_sizeG1% {0C}MB{\n}
!cecho! {0E} 2.打包成vendor.img大小 (%vendor_size2% 字节) %vendor_sizeG2% {0C}MB{\n}
!cecho! {0E} 3.打包成vendor.img大小 (%vendor_size3% 字节) %vendor_sizeG3% {0C}MB{\n}
!cecho! {0D}{\n}
echo  4.使用航母目录下system_size.txt解包自动析出镜像字节大小打包或自定义打包vendor.img字节容量大小
echo  5.查看官方vendor分区容量大小【提取官方vendor.img复制到本工具目录】
!cecho! {0B}{\n}
echo  6.根据官方vendor分区容量大小来打包第三方ROM的vendor目录生成vendor.img
echo    前提:【提取官方vendor.img复制到本工具目录】
!cecho! {0C}{\n}
echo  7.重新设定本页面1-3全部选项容量大小
echo  8.重新设定本页面1-3单独选项容量大小
echo  0.回到工具首页
!cecho! {0F}{\n}
echo.
set /p webvendorimg=-^-^> 输入数字选择对应的操作:
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
set /p vendorzizeimg=-^-^> 请输入需要重新设定的选项:
if "%vendorzizeimg%"=="1" goto vendor_custom_size_img1
if "%vendorzizeimg%"=="2" goto vendor_custom_size_img2
if "%vendorzizeimg%"=="3" goto vendor_custom_size_img3
goto vendor_custom_settings_size_img2
:vendor_custom_size_img1
attrib -r -h bin\vendor自定义大小设定勿删1 >nul 2>nul
del bin\vendor自定义大小设定勿删1
goto vendor_custom_size1_img
:vendor_custom_size_img2
attrib -r -h bin\vendor自定义大小设定勿删2 >nul 2>nul
del bin\vendor自定义大小设定勿删2
goto vendor_custom_size2_img
:vendor_custom_size_img3
attrib -r -h bin\vendor自定义大小设定勿删3 >nul 2>nul
del bin\vendor自定义大小设定勿删3
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
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorimg & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorimg & else
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
if not exist bin\自定义大小打包vendor分区勿删 goto custom_size_vendorimg
for /f %%a in (bin\自定义大小打包vendor分区勿删) do (set vendorooimg_size=%%a)
if not exist vendor_size.txt goto custom_size_vendorimg
for /f %%a in (vendor_size.txt) do (set vendorooimg2size=%%a)
:custom_vendor_img_begin
!cecho! {0B} ==========================================================={\n}
!cecho! {0E}  1.使用航母目录下vendor_size.txt里面{0C}%vendorooimg_size%{0E}字节容量打包{\n}
!cecho! {0E}  2.使用上次保存的容量大小字节{0C}%vendorooimg_size%{0E}进行打包{\n}
!cecho! {0E}  3.新建容量大小字节打包{\n}
!cecho! {0B} ==========================================================={0F}{\n}
echo.
set /p webmovendorimg=-^-^> 输入数字选择对应的操作:
if "%webmovendorimg%"=="1" goto make_img_vendor_size
if "%webmovendorimg%"=="2" goto custom_vendorimg_size
if "%webmovendorimg%"=="3" goto custom_size_vendorimg
goto custom_vendor_img_begin
:custom_vendorimg_size
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendorooimg_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorimg & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorimg & else
)
goto home
:custom_size_vendorimg
attrib -r -h bin\自定义大小打包vendor分区勿删 >nul 2>nul
!cecho! 请输入自己机型{0C}官方vendor分区{0F}容量字节大小:{\n}
set /p vendorooimg_size=
echo %vendorooimg_size%>bin\自定义大小打包vendor分区勿删
attrib +r +h bin\自定义大小打包vendor分区勿删 >nul 2>nul
call :vendorimg_make_else
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendorooimg_size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorimg & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorimg & else
)
goto home
:make_img_vendor_size
if not exist vendor_size.txt call :not_vendor_size
for /f %%a in (vendor_size.txt) do (set vendor-size=%%a)
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %vendor-size% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorimg & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorimg & else
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
!cecho! %%i:官方vendor分区字节容量大小={0C}%%~zi{0F}字节.{\n}
)
pause
del vendor_ext4.img 2>nul
goto home
:looking_vendorimg_size2
for /f "delims=" %%i in ('dir /a-d /b vendor_ext4.img') do (
!cecho! %%i:官方vendor分区字节容量大小={0C}%%~zi{0F}字节.{\n}
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
!cecho! %%i:官方vendor分区字节容量大小={0C}%%~zi{0F}字节.{\n}
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
!cecho! {0C}  检测到当前vendor.img为ext4编码，请确认是否为官方vendor.img，否则分区容量超过官方大小导致无法刷入{0F}{\n}
pause
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
!cecho! %%i:官方vendor分区字节容量大小={0C}%%~zi{0F}字节.{\n}
set ext4imgsizeaovendor=%%~zi
)
goto Continue_vendor
:Continue_vendor
call :vendorimg_make_else
del vendor_ext4.img 2>nul
del vendor.img 2>nul
!make_ext4fs! -S vendor_AIHGT_file_contexts -X vendor_AIHGT_permissions -l %ext4imgsizeaovendor% -L vendor -K vUA6spGTE7EuEd4H -a /vendor vendor.img vendor
echo.
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorimg & else
for /f "delims=" %%i in ('dir /a-d /b vendor.img') do (
echo.
)
echo.
for /r %~dp0 %%a in (vendor.img) do (
if %%~za==0 del %~dp0\vendor.img 
if not exist "vendor.img" !cecho! {0C}  打包报错日志出现，请检查vendor_AIHGT_file_permissions代码冲突  ！{0F}{\n} & echo. & pause & goto home_vendorimg & else
)
goto home
:Clear_home
cls
!cecho! {0A} =================================================================={\n}
echo                         请选择其中一种清理方式
echo  ==================================================================
echo.
echo   1.清理临时内核\rec遗留文件
!cecho! {0D}{\n}
echo   2.清理所有的文件和文件夹(慎用！只读属性将不被清除)
!cecho! {0A}{\n}
echo   0.回到工具首页
!cecho! {0F}{\n}
echo.
set /p webs=-^-^> 输入数字选择对应的操作:
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
rd /s /q 官方内核 2>nul
rd /s /q 要移植内核 2>nul
rd /s /q 成功移植的内核 2>nul
rd /s /q 官方recovery 2>nul
rd /s /q 要移植recovery 2>nul
rd /s /q 成功移植recovery 2>nul
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
echo   1.file_contexts.bin和安卓8.0-安卓9.0以上转换生成file_contexts
!cecho! {0B}{\n}
echo   2.file_contexts转换为file_contexts.bin
!cecho! {0C}{\n}
echo   0.返回工具首页
!cecho! {0F}{\n}
set /p webt=-^-^> 输入数字选择对应的操作:
if "%webt%"=="1" goto file_contextsbin_to_file_contexts
if "%webt%"=="2" goto file_contexts_to_file_contextsbin
if "%webt%"=="0" goto home
goto file_contextsbin_and_file_contexts_home
:file_contextsbin_to_file_contexts
del /f /s /q file_contexts >nul 2>nul
echo.
echo.
!cecho! {0B} ============================================={\n}
!cecho! {0E}  1.安卓7.0 - 安卓7.1.2转换file_contexts.bin{\n}
!cecho! {0E}  2.安卓8.0 - 安卓9.0生成file_contexts{\n}
!cecho! {0B} ============================================={0F}{\n}
echo.
set /p webu=-^-^> 输入数字选择对应的操作:
if "%webu%"=="1" goto file_contextsbin_txt
if "%webu%"=="2" goto file_contextsbin_oreo
goto file_contextsbin_to_file_contexts
:file_contextsbin_txt
echo.
if not exist "file_contexts.bin" (
echo.
echo.
!cecho! {0C}    没找到file_contexts.bin文件，请把file_contexts.bin放到本工具目录下!{0F}{\n}
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
!cecho! {0C}    没找到file_contexts文件，请把file_contexts放到本工具目录下!{0F}{\n}
echo.
echo.
pause
goto home
else
)
!file_contexts_tool! file_contexts -o file_contexts.bin
if not exist "file_contexts.bin" !cecho! {0C}   转换报错日志出现，请检查file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto file_contextsbin_and_file_contexts_home & else
goto home
:unpack_bootimg_new
echo.
if not exist "boot.img" (
echo.
echo.
!cecho! {0C}      请检查航母目录下是否存在boot.img。{0F}{\n}
echo.
echo.
pause
goto home
else
)
echo.
!cecho! {0E} 正在解包内核 boot.img   ...{0F}{\n}
echo.
rd /s /q bin\split_img >nul 2>nul
rd /s /q bin\ramdisk >nul 2>nul
del bin\boot.img >nul 2>nul
copy boot.img bin\boot.img >nul 2>nul
del boot---old.img >nul 2>nul
ren boot.img boot---old.img >nul 2>nul
call bin\内核rec分解.bat boot.img
goto home
:unpack_recovery_new
echo.
if not exist "recovery.img" (
echo.
echo.
!cecho! {0C}      请检查航母目录下是否存在recovery.img。{0F}{\n}
echo.
echo.
pause
goto home
else
)
echo.
!cecho! {0E} 正在解包 recovery.img   ...{0F}{\n}
echo.
rd /s /q bin\split_img >nul 2>nul
rd /s /q bin\ramdisk >nul 2>nul
del bin\recovery.img >nul 2>nul
copy recovery.img bin\recovery.img >nul 2>nul
del recovery---old.img >nul 2>nul
ren recovery.img recovery---old.img >nul 2>nul
call bin\内核rec分解.bat recovery.img
goto home
:make_bootimg_new
if not exist "ramdisk\file_contexts.bin" (
call :Nougat_boot
else
)
copy !file_contexts_tool! ramdisk\file_contexts_tool.exe >nul 2>nul
ramdisk\file_contexts_tool.exe ramdisk\file_contexts -o ramdisk\file_contexts.bin >nul 2>nul
if not exist "ramdisk\file_contexts.bin" !cecho! {0C}   转换报错日志出现，请检查file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home & else
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
call bin\打包内核.bat
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
if not exist "ramdisk\file_contexts.bin" !cecho! {0C}   转换报错日志出现，请检查file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home & else
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
call bin\打包recovery.bat
del ramdisk.cpio.gz >nul 2>nul
del ramdisk.cpio.gz.tmp >nul 2>nul
goto home
:unpack_bootimg
echo.
if not exist "boot.img" (
echo.
echo.
!cecho! {0C}      请检查航母目录下是否存在boot.img。{0F}{\n}
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
if not exist "AIHGTkernel\file_contexts.bin" !cecho! {0C}   转换报错日志出现，请检查file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home & else
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
!cecho! {0C}      请检查航母目录下是否存在recovery.img。{0F}{\n}
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
if not exist "AIHGTkernel\file_contexts.bin" !cecho! {0C}   转换报错日志出现，请检查file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home & else
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
echo   boot.img/recovery.img自定义移植如果一直按下Enter将默认为自动移植 
echo  ==================================================================
echo.
echo   1.自动移植boot.img
!cecho! {0D}{\n}
echo   2.自动移植recovery.img
!cecho! {0B}{\n}
echo   3.自定义移植boot.img
!cecho! {0C}{\n}
echo   4.自定义移植recovery.img
!cecho! {0A}{\n}
echo   0.回到工具首页
!cecho! {0F}{\n}
echo.
set /p weby=-^-^> 输入数字选择对应的操作:
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
md 官方内核 >nul 2>nul
md 要移植内核 >nul 2>nul
echo.
!cecho! {0D} ========================================{\n}
echo  将官方ROM中boot.img放到"官方内核"文件夹
echo  将要移植ROM中boot.img放到"要移植内核"文件夹
!cecho! {0D} ========================================{0F}{\n}
pause
echo.
if not exist "官方内核\boot.img" (
echo.
echo.
!cecho! {0C}      请检查此路径下是否存在 官方内核\boot.img。{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
echo.
if not exist "要移植内核\boot.img" (
echo.
echo.
!cecho! {0C}      请检查此路径下是否存在 要移植内核\boot.img。{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
copy 官方内核\boot.img >nul 2>nul
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
copy 要移植内核\boot.img >nul 2>nul
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
md 成功移植的内核 >nul 2>nul
ren boot-new.img boot.img
del 成功移植的内核\boot.img >nul 2>nul
move boot.img 成功移植的内核 >nul 2>nul
del boot-old.img >nul 2>nul
!cecho! {0B} ============================================================{\n}
echo  成功一键移植boot.img内核！请到"成功移植的内核"文件夹中提取
!cecho! {0B} ============================================================{0F}{\n}
start 成功移植的内核\
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
md 官方recovery >nul 2>nul
md 要移植recovery >nul 2>nul
echo.
!cecho! {0D} ==================================================={\n}
echo  将官方ROM中的recovery.img放到"官方recovery"文件夹
echo  将要移植的recovery.img放到"要移植recovery"文件夹
!cecho! {0D} ==================================================={0F}{\n}
pause
echo.
if not exist "要移植recovery\recovery.img" (
echo.
echo.
!cecho! {0C}      请检查此路径下是否存在 要移植recovery\recovery.img。{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
echo.
if not exist "官方recovery\recovery.img" (
echo.
echo.
!cecho! {0C}      请检查此路径下是否存在 官方recovery\recovery.img。{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
copy 官方recovery\recovery.img >nul 2>nul
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
copy 要移植recovery\recovery.img >nul 2>nul
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
md 成功移植recovery >nul 2>nul
ren boot-new.img recovery.img
del 成功移植recovery\recovery.img >nul 2>nul
move recovery.img 成功移植recovery >nul 2>nul
del boot-old.img >nul 2>nul
!cecho! {0B} =========================================================={\n}
echo  成功一键移植recovery！请到"成功移植recovery"文件夹中提取
!cecho! {0B} =========================================================={0F}{\n}
start 成功移植recovery\
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
md 官方内核 >nul 2>nul
md 要移植内核 >nul 2>nul
echo.
!cecho! {0D} ========================================{\n}
echo  将官方ROM中boot.img放到"官方内核"文件夹
echo  将要移植ROM中boot.img放到"要移植内核"文件夹
!cecho! {0D} ========================================{0F}{\n}
pause
echo.
if not exist "要移植内核\boot.img" (
echo.
echo.
!cecho! {0C}      请检查此路径下是否存在 要移植内核\boot.img。{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
echo.
if not exist "官方内核\boot.img" (
echo.
echo.
!cecho! {0C}      请检查此路径下是否存在 官方内核\boot.img。{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
copy 官方内核\boot.img boot.img >nul 2>nul
!bootimg! --unpack-bootimg
ping -n 1 127.1 >nul 2>nul
if exist "file_contexts.bin" goto custom_kernel_porting_file_contexts.bin
if exist "file_contexts" goto custom_kernel_porting_file_contexts
:custom_kernel_porting_file_contexts.bin
!file_contexts_tool! AIHGTkernel\file_contexts.bin -o AIHGTkernel\file_contexts -e >nul 2>nul
del 官方内核\kernel.gz >nul 2>nul
del 官方内核\kernel >nul 2>nul
del 官方内核\ramdisk.gz >nul 2>nul
del 官方内核\ramdisk >nul 2>nul
del 官方内核\cpiolist.txt >nul 2>nul
del 官方内核\bootinfo.txt >nul 2>nul
rd /s /q 官方内核\AIHGTkernel >nul 2>nul
move kernel.gz 官方内核\ >nul 2>nul
move kernel 官方内核\ >nul 2>nul
move ramdisk.gz 官方内核\ >nul 2>nul
move ramdisk 官方内核\ >nul 2>nul
move cpiolist.txt 官方内核\ >nul 2>nul
move bootinfo.txt 官方内核\ >nul 2>nul
move AIHGTkernel 官方内核\ >nul 2>nul
move dt.img 官方内核\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
copy 要移植内核\boot.img boot.img >nul 2>nul
echo.
!bootimg! --unpack-bootimg
ping -n 1 127.1 >nul 2>nul
!file_contexts_tool! AIHGTkernel\file_contexts.bin -o AIHGTkernel\file_contexts -e >nul 2>nul
del 要移植内核\kernel.gz >nul 2>nul
del 要移植内核\kernel >nul 2>nul
del 要移植内核\ramdisk.gz >nul 2>nul
del 要移植内核\ramdisk >nul 2>nul
del 要移植内核\cpiolist.txt >nul 2>nul
del 要移植内核\bootinfo.txt >nul 2>nul
rd /s /q 要移植内核\AIHGTkernel >nul 2>nul
move kernel.gz 要移植内核\ >nul 2>nul
move kernel 要移植内核\ >nul 2>nul
move ramdisk.gz 要移植内核\ >nul 2>nul
move ramdisk 要移植内核\ >nul 2>nul
move cpiolist.txt 要移植内核\ >nul 2>nul
move bootinfo.txt 要移植内核\ >nul 2>nul
move AIHGTkernel 要移植内核\ >nul 2>nul
move dt.img 要移植内核\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
start bin\Beyond_Compare\BCompare.exe
!cecho! {0E} ============================================================{\n}
echo  正在打开文件对比器进行移植操作处理... 
echo.
echo  处理好内核解开的所有文件后，按下任意键开始打包内核boot.img
!cecho! {0E} ============================================================{0F}{\n}
pause
del 要移植内核\AIHGTkernel\file_contexts.bin >nul 2>nul
!file_contexts_tool! 要移植内核\AIHGTkernel\file_contexts -o 要移植内核\AIHGTkernel\file_contexts.bin >nul 2>nul
if not exist "要移植内核\AIHGTkernel\file_contexts.bin" !cecho! {0C}   转换报错日志出现，请检查file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home & else
del 要移植内核\AIHGTkernel\file_contexts >nul 2>nul
del 官方内核\AIHGTkernel\file_contexts.bin >nul 2>nul
!file_contexts_tool! 官方内核\AIHGTkernel\file_contexts -o 官方内核\AIHGTkernel\file_contexts.bin >nul 2>nul
if not exist "官方内核\AIHGTkernel\file_contexts.bin" !cecho! {0C}   转换报错日志出现，请检查file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home & else
del 官方内核\AIHGTkernel\file_contexts >nul 2>nul
move 官方内核\kernel.gz kernel.gz >nul 2>nul
move 官方内核\kernel kernel >nul 2>nul
move 要移植内核\ramdisk.gz ramdisk.gz >nul 2>nul
move 要移植内核\ramdisk ramdisk >nul 2>nul
move 要移植内核\cpiolist.txt cpiolist.txt >nul 2>nul
move 要移植内核\bootinfo.txt bootinfo.txt >nul 2>nul
xcopy /e 要移植内核\AIHGTkernel\* AIHGTkernel\* >nul 2>nul
move 要移植内核\dt.img dt.img >nul 2>nul
ping -n 1 127.1 >nul 2>nul
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
del boot-new.img 2>nul
del boot.img.tmp 2>nul
del boot_old.img 2>nul
echo.
!bootimg! --repack-bootimg
ren boot-new.img boot.img
del 成功移植的内核\boot.img >nul 2>nul
md 成功移植的内核 >nul 2>nul
move boot.img 成功移植的内核\ >nul 2>nul
del 官方内核\ramdisk.gz >nul 2>nul
del 官方内核\ramdisk >nul 2>nul
del 官方内核\cpiolist.txt >nul 2>nul
del 官方内核\bootinfo.txt >nul 2>nul
rd /s /q 官方内核\AIHGTkernel >nul 2>nul
del 要移植内核\kernel.gz >nul 2>nul
del 要移植内核\kernel >nul 2>nul
rd /s /q 要移植内核\AIHGTkernel >nul 2>nul
!cecho! {0B} ============================================================{\n}
echo  成功一键移植boot.img内核！请到"成功移植的内核"文件夹中提取
!cecho! {0B} ============================================================{0F}{\n}
start 成功移植的内核\
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
pause
goto home
:custom_kernel_porting_file_contexts
del 官方内核\kernel.gz >nul 2>nul
del 官方内核\kernel >nul 2>nul
del 官方内核\ramdisk.gz >nul 2>nul
del 官方内核\ramdisk >nul 2>nul
del 官方内核\cpiolist.txt >nul 2>nul
del 官方内核\bootinfo.txt >nul 2>nul
rd /s /q 官方内核\AIHGTkernel >nul 2>nul
move kernel.gz 官方内核\ >nul 2>nul
move kernel 官方内核\ >nul 2>nul
move ramdisk.gz 官方内核\ >nul 2>nul
move ramdisk 官方内核\ >nul 2>nul
move cpiolist.txt 官方内核\ >nul 2>nul
move bootinfo.txt 官方内核\ >nul 2>nul
move AIHGTkernel 官方内核\ >nul 2>nul
move dt.img 官方内核\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
copy 要移植内核\boot.img boot.img >nul 2>nul
echo.
!bootimg! --unpack-bootimg
ping -n 1 127.1 >nul 2>nul
del 要移植内核\kernel.gz >nul 2>nul
del 要移植内核\kernel >nul 2>nul
del 要移植内核\ramdisk.gz >nul 2>nul
del 要移植内核\ramdisk >nul 2>nul
del 要移植内核\cpiolist.txt >nul 2>nul
del 要移植内核\bootinfo.txt >nul 2>nul
rd /s /q 要移植内核\AIHGTkernel >nul 2>nul
move kernel.gz 要移植内核\ >nul 2>nul
move kernel 要移植内核\ >nul 2>nul
move ramdisk.gz 要移植内核\ >nul 2>nul
move ramdisk 要移植内核\ >nul 2>nul
move cpiolist.txt 要移植内核\ >nul 2>nul
move bootinfo.txt 要移植内核\ >nul 2>nul
move AIHGTkernel 要移植内核\ >nul 2>nul
move dt.img 要移植内核\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
start bin\Beyond_Compare\BCompare.exe
!cecho! {0E} ============================================================{\n}
echo  正在打开文件对比器进行移植操作处理... 
echo.
echo  处理好内核解开的所有文件后，按下任意键开始打包内核boot.img
!cecho! {0E} ============================================================{0F}{\n}
pause
move 官方内核\kernel.gz kernel.gz >nul 2>nul
move 官方内核\kernel kernel >nul 2>nul
move 要移植内核\ramdisk.gz ramdisk.gz >nul 2>nul
move 要移植内核\ramdisk ramdisk >nul 2>nul
move 要移植内核\cpiolist.txt cpiolist.txt >nul 2>nul
move 要移植内核\bootinfo.txt bootinfo.txt >nul 2>nul
xcopy /e 要移植内核\AIHGTkernel\* AIHGTkernel\* >nul 2>nul
move 要移植内核\dt.img dt.img >nul 2>nul
ping -n 1 127.1 >nul 2>nul
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
del boot-new.img 2>nul
del boot.img.tmp 2>nul
del boot_old.img 2>nul
echo.
!bootimg! --repack-bootimg
ren boot-new.img boot.img
del 成功移植的内核\boot.img >nul 2>nul
md 成功移植的内核 >nul 2>nul
move boot.img 成功移植的内核\ >nul 2>nul
del 官方内核\ramdisk.gz >nul 2>nul
del 官方内核\ramdisk >nul 2>nul
del 官方内核\cpiolist.txt >nul 2>nul
del 官方内核\bootinfo.txt >nul 2>nul
rd /s /q 官方内核\AIHGTkernel >nul 2>nul
del 要移植内核\kernel.gz >nul 2>nul
del 要移植内核\kernel >nul 2>nul
rd /s /q 要移植内核\AIHGTkernel >nul 2>nul
!cecho! {0B} ============================================================{\n}
echo  成功一键移植boot.img内核！请到"成功移植的内核"文件夹中提取
!cecho! {0B} ============================================================{0F}{\n}
start 成功移植的内核\
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
md 官方recovery >nul 2>nul
md 要移植recovery >nul 2>nul
!cecho! {0D} ==================================================={\n}
echo  将官方ROM中的recovery.img放到"官方recovery"文件夹
echo  将要移植的recovery.img放到"要移植recovery"文件夹
!cecho! {0D} ==================================================={0F}{\n}
pause
echo.
if not exist "官方recovery\recovery.img" (
echo.
echo.
!cecho! {0C}      请检查此路径下是否存在 官方recovery\recovery.img。{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
echo.
if not exist "要移植recovery\recovery.img" (
echo.
echo.
!cecho! {0C}      请检查此路径下是否存在 要移植recovery\recovery.img。{0F}{\n}
echo.
echo.
echo.
pause
goto home_auto_custom_recovery_kernel_porting
else
)
copy 官方recovery\recovery.img recovery.img >nul 2>nul
ren recovery.img boot.img
!bootimg! --unpack-bootimg
ping -n 1 127.1 >nul 2>nul
if exist "file_contexts.bin" goto custom_recovery_porting_file_contexts.bin
if exist "file_contexts" goto custom_recovery_porting_file_contexts
:custom_recovery_porting_file_contexts.bin
!file_contexts_tool! AIHGTkernel\file_contexts.bin -o AIHGTkernel\file_contexts -e >nul 2>nul
rd /s /q 官方recovery\kernel.gz >nul 2>nul
rd /s /q 官方recovery\kernel >nul 2>nul
rd /s /q 官方recovery\ramdisk.gz >nul 2>nul
rd /s /q 官方recovery\ramdisk >nul 2>nul
rd /s /q 官方recovery\cpiolist.txt >nul 2>nul
rd /s /q 官方recovery\bootinfo.txt >nul 2>nul
rd /s /q 官方recovery\AIHGTkernel >nul 2>nul
move kernel.gz 官方recovery\ >nul 2>nul
move kernel 官方recovery\ >nul 2>nul
move ramdisk.gz 官方recovery\ >nul 2>nul
move ramdisk 官方recovery\ >nul 2>nul
move cpiolist.txt 官方recovery\ >nul 2>nul
move bootinfo.txt 官方recovery\ >nul 2>nul
move AIHGTkernel 官方recovery\ >nul 2>nul
move dt.img 官方recovery\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
copy 要移植recovery\recovery.img recovery.img >nul 2>nul
ren recovery.img boot.img
echo.
!bootimg! --unpack-bootimg
ping -n 1 127.1 >nul 2>nul
!file_contexts_tool! AIHGTkernel\file_contexts.bin -o AIHGTkernel\file_contexts -e >nul 2>nul
rd /s /q 要移植recovery\kernel.gz >nul 2>nul
rd /s /q 要移植recovery\kernel >nul 2>nul
rd /s /q 要移植recovery\ramdisk.gz >nul 2>nul
rd /s /q 要移植recovery\ramdisk >nul 2>nul
rd /s /q 要移植recovery\cpiolist.txt >nul 2>nul
rd /s /q 要移植recovery\bootinfo.txt >nul 2>nul
rd /s /q 要移植recovery\AIHGTkernel >nul 2>nul
move kernel.gz 要移植recovery\ >nul 2>nul
move kernel 要移植recovery\ >nul 2>nul
move ramdisk.gz 要移植recovery\ >nul 2>nul
move ramdisk 要移植recovery\ >nul 2>nul
move cpiolist.txt 要移植recovery\ >nul 2>nul
move bootinfo.txt 要移植recovery\ >nul 2>nul
move AIHGTkernel 要移植recovery\ >nul 2>nul
move dt.img 要移植recovery\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
start bin\Beyond_Compare\BCompare.exe
!cecho! {0D} ================================================================{\n}
echo  正在打开文件对比器进行移植操作处理...  
echo.
echo  处理好recovery解开的所有文件后，按下任意键开始打包recovery.img
!cecho! {0D} ================================================================{0F}{\n}
pause
del 要移植recovery\AIHGTkernel\file_contexts.bin >nul 2>nul
!file_contexts_tool! 要移植recovery\AIHGTkernel\file_contexts -o 要移植recovery\AIHGTkernel\file_contexts.bin >nul 2>nul
if not exist "要移植recovery\AIHGTkernel\file_contexts.bin" !cecho! {0C}   转换报错日志出现，请检查file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home & else
del 要移植recovery\AIHGTkernel\file_contexts >nul 2>nul
del 官方recovery\AIHGTkernel\file_contexts.bin >nul 2>nul
!file_contexts_tool! 官方recovery\AIHGTkernel\file_contexts -o 官方recovery\AIHGTkernel\file_contexts.bin >nul 2>nul
if not exist "官方recovery\AIHGTkernel\file_contexts.bin" !cecho! {0C}   转换报错日志出现，请检查file_contexts代码冲突  ！{0F}{\n} & echo. & pause & goto home & else
del 官方recovery\AIHGTkernel\file_contexts >nul 2>nul
move 官方recovery\kernel.gz kernel.gz >nul 2>nul
move 官方recovery\kernel kernel >nul 2>nul
move 要移植recovery\ramdisk.gz ramdisk.gz >nul 2>nul
move 要移植recovery\ramdisk ramdisk >nul 2>nul
move 要移植recovery\cpiolist.txt cpiolist.txt >nul 2>nul
move 要移植recovery\bootinfo.txt bootinfo.txt >nul 2>nul
xcopy /e 要移植recovery\AIHGTkernel\* AIHGTkernel\* >nul 2>nul
move 要移植recovery\dt.img dt.img >nul 2>nul
ping -n 1 127.1 >nul 2>nul
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
del boot-new.img 2>nul
del boot.img.tmp 2>nul
del boot_old.img 2>nul
echo.
!bootimg! --repack-bootimg
ren boot-new.img recovery.img
del 成功移植recovery\recovery.img >nul 2>nul
md 成功移植recovery >nul 2>nul
move recovery.img 成功移植recovery\ >nul 2>nul
del 官方recovery\ramdisk.gz >nul 2>nul
del 官方recovery\ramdisk >nul 2>nul
del 官方recovery\cpiolist.txt >nul 2>nul
del 官方recovery\bootinfo.txt >nul 2>nul
rd /s /q 官方recovery\AIHGTkernel >nul 2>nul
del 要移植recovery\kernel.gz >nul 2>nul
del 要移植recovery\kernel >nul 2>nul
rd /s /q 要移植recovery\AIHGTkernel >nul 2>nul
!cecho! {0B} =========================================================={\n}
echo  成功一键移植recovery！请到"成功移植recovery"文件夹中提取 
!cecho! {0B} =========================================================={0F}{\n}
start 成功移植recovery\
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
pause
goto home
:custom_recovery_porting_file_contexts
rd /s /q 官方recovery\kernel.gz >nul 2>nul
rd /s /q 官方recovery\kernel >nul 2>nul
rd /s /q 官方recovery\ramdisk.gz >nul 2>nul
rd /s /q 官方recovery\ramdisk >nul 2>nul
rd /s /q 官方recovery\cpiolist.txt >nul 2>nul
rd /s /q 官方recovery\bootinfo.txt >nul 2>nul
rd /s /q 官方recovery\AIHGTkernel >nul 2>nul
move kernel.gz 官方recovery\ >nul 2>nul
move kernel 官方recovery\ >nul 2>nul
move ramdisk.gz 官方recovery\ >nul 2>nul
move ramdisk 官方recovery\ >nul 2>nul
move cpiolist.txt 官方recovery\ >nul 2>nul
move bootinfo.txt 官方recovery\ >nul 2>nul
move AIHGTkernel 官方recovery\ >nul 2>nul
move dt.img 官方recovery\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
copy 要移植recovery\recovery.img recovery.img >nul 2>nul
ren recovery.img boot.img
echo.
!bootimg! --unpack-bootimg
ping -n 1 127.1 >nul 2>nul
rd /s /q 要移植recovery\kernel.gz >nul 2>nul
rd /s /q 要移植recovery\kernel >nul 2>nul
rd /s /q 要移植recovery\ramdisk.gz >nul 2>nul
rd /s /q 要移植recovery\ramdisk >nul 2>nul
rd /s /q 要移植recovery\cpiolist.txt >nul 2>nul
rd /s /q 要移植recovery\bootinfo.txt >nul 2>nul
rd /s /q 要移植recovery\AIHGTkernel >nul 2>nul
move kernel.gz 要移植recovery\ >nul 2>nul
move kernel 要移植recovery\ >nul 2>nul
move ramdisk.gz 要移植recovery\ >nul 2>nul
move ramdisk 要移植recovery\ >nul 2>nul
move cpiolist.txt 要移植recovery\ >nul 2>nul
move bootinfo.txt 要移植recovery\ >nul 2>nul
move AIHGTkernel 要移植recovery\ >nul 2>nul
move dt.img 要移植recovery\ >nul 2>nul
del boot.img
del boot-old.img
ping -n 1 127.1 >nul 2>nul
start bin\Beyond_Compare\BCompare.exe
!cecho! {0D} ================================================================{\n}
echo  正在打开文件对比器进行移植操作处理...  
echo.
echo  处理好recovery解开的所有文件后，按下任意键开始打包recovery.img
!cecho! {0D} ================================================================{0F}{\n}
pause
move 官方recovery\kernel.gz kernel.gz >nul 2>nul
move 官方recovery\kernel kernel >nul 2>nul
move 要移植recovery\ramdisk.gz ramdisk.gz >nul 2>nul
move 要移植recovery\ramdisk ramdisk >nul 2>nul
move 要移植recovery\cpiolist.txt cpiolist.txt >nul 2>nul
move 要移植recovery\bootinfo.txt bootinfo.txt >nul 2>nul
xcopy /e 要移植recovery\AIHGTkernel\* AIHGTkernel\* >nul 2>nul
move 要移植recovery\dt.img dt.img >nul 2>nul
ping -n 1 127.1 >nul 2>nul
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
del boot-new.img 2>nul
del boot.img.tmp 2>nul
del boot_old.img 2>nul
echo.
!bootimg! --repack-bootimg
ren boot-new.img recovery.img
del 成功移植recovery\recovery.img >nul 2>nul
md 成功移植recovery >nul 2>nul
move recovery.img 成功移植recovery\ >nul 2>nul
del 官方recovery\ramdisk.gz >nul 2>nul
del 官方recovery\ramdisk >nul 2>nul
del 官方recovery\cpiolist.txt >nul 2>nul
del 官方recovery\bootinfo.txt >nul 2>nul
rd /s /q 官方recovery\AIHGTkernel >nul 2>nul
del 要移植recovery\kernel.gz >nul 2>nul
del 要移植recovery\kernel >nul 2>nul
rd /s /q 要移植recovery\AIHGTkernel >nul 2>nul
!cecho! {0B} =========================================================={\n}
echo  成功一键移植recovery！请到"成功移植recovery"文件夹中提取 
!cecho! {0B} =========================================================={0F}{\n}
start 成功移植recovery\
del ramdisk.cpio.gz 2>nul
del ramdisk.cpio.gz.tmp 2>nul
pause
goto home
:simg2img
echo.
echo.
!cecho! {0A} ===================================================================================================================={\n}
!cecho! {0E}   请确保任意命名的ext4格式的img镜像文件和本工具相同电脑盘符或者在本工具目录下，不同电脑盘符无法转换使用！{\n}
echo.
!cecho! {0C}   请在弹窗选择任意命名的ext4格式的img镜像文件后，右下角位置点选“打开”选项即可开始转换{\n}
echo.
!cecho! {0B}   需要几分钟时间来生成！速度快慢取决于你的电脑配置，请耐心等待...{\n}
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
!cecho! {0F}转换完毕！转换所得文件为{0D} %afolder%.ext4.img {0F}{\n}
pause
goto home
:img2simg
echo.
echo.
!cecho! {0A} ===================================================================================================================={\n}
!cecho! {0E}   请确保任意命名的simg格式的img镜像文件和本工具相同电脑盘符或者在本工具目录下，不同电脑盘符无法转换使用！{\n}
echo.
!cecho! {0C}   请在弹窗选择任意命名的simg格式的img镜像文件后，右下角位置点选“打开”选项即可开始转换{\n}
echo.
!cecho! {0B}   需要几分钟时间来生成！速度快慢取决于你的电脑配置，请耐心等待...{\n}
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
!cecho! {0F}转换完毕！转换所得文件为{0D} %folderb%.simg.img {0F}{\n}
pause
goto home
:systemdatbr_to_img
!cecho! {0F}如果解包dat格式请确认航母目录下同时有system.new.dat和system.transfer.list  {0F}{\n}
echo.
!cecho! {0F}如果解包br格式请确认航母目录下同时有system.new.dat.br和system.transfer.list{\n}
pause
!dat2br! -d -o system.new.dat system.new.dat.br >nul 2>nul
!sdat2img! system.transfer.list system.new.dat system.img
goto home
:vendordatbr_to_img
!cecho! {0F}如果解包dat格式请确认航母目录下同时有vendor.new.dat和vendor.transfer.list{\n}
echo.
!cecho! {0F}如果解包br格式请确认航母目录下同时有vendor.new.dat.br和vendor.transfer.list{0F}{\n}
pause
!dat2br! -d -o vendor.new.dat vendor.new.dat.br >nul 2>nul
!sdat2img! vendor.transfer.list vendor.new.dat vendor.img
goto home
:unpack_xxx.imgdatbr
echo.
echo.
!cecho! {0E}{\n}
echo   1.解包任意名称xxx.img
!cecho! {0B}{\n}
echo   2.解包任意名称xxx.dat
!cecho! {0C}{\n}
echo   3.解包任意名称xxx.dat.br
!cecho! {0A}{\n}
echo   0.返回工具首页
!cecho! {0F}{\n}
echo.
set /p webxxximgdatbr=-^-^> 输入数字选择对应的操作:
if "%webxxximgdatbr%"=="1" goto xxx_img
if "%webxxximgdatbr%"=="2" goto xxx_dat
if "%webxxximgdatbr%"=="3" goto xxx_br
if "%webxxximgdatbr%"=="0" goto home
goto unpack_xxx.imgdatbr
:xxx_br
echo.
echo.
!cecho! {0A} ==========================================================================================================={\n}
!cecho! {0E}   请确保任意命名的xxx.dat.br\xxx.list格式的镜像文件和本工具相同电脑盘符或者在本工具目录下，不同电脑盘符无法解包使用！{\n}
echo.
!cecho! {0C}   请在弹窗选择任意命名的xxx.dat.br\xxx.list格式文件后，右下角位置点选“打开”选项即可开始解包...{\n}
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
!cecho! {0E}   请确保任意命名的xxx.dat\xxx.list格式的镜像文件和本工具相同电脑盘符或者在本工具目录下，不同电脑盘符无法解包使用！{\n}
echo.
!cecho! {0C}   请在弹窗选择任意命名的xxx.dat\xxx.list格式文件后，右下角位置点选“打开”选项即可开始解包...{\n}
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
!cecho! {0E}   请确保任意命名的xxx.img格式的镜像文件和本工具相同电脑盘符或者在本工具目录下，不同电脑盘符无法解包使用！{\n}
echo.
!cecho! {0C}   请在弹窗选择任意命名的xxx.img格式文件后，右下角位置点选“打开”选项即可开始解包...{\n}
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
echo   1.挂载解包任意名称.img镜像
!cecho! {0B}{\n}
echo   2.挂载解包system.img
!cecho! {0B}{\n}
echo   3.挂载解包vendor.img
!cecho! {0C}{\n}
echo   0.回到工具首页
!cecho! {0F}{\n}
echo.
set /p webmountt=-^-^> 输入数字选择对应的操作:
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
!cecho! {0E}   请确保任意命名的img\ext4格式的镜像文件和本工具相同电脑盘符或者在本工具目录下，不同电脑盘符无法解包使用！{\n}
echo.
!cecho! {0C}   请在弹窗选择任意命名的xxx.img\xxx.ext4格式文件后，右下角位置点选“打开”选项即可开始挂载解包...{\n}
!cecho! {0A} ==========================================================================================================={0F}{\n}
set folderd=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
if "%" == " " (
	set folderd=%date:~0,4%%date:~5,2%%date:~8,2%_t%time:~3,2%%time:~6,2%
)
echo.
set imgh=
md 任意img_ext4_%folderd%
rd /s /q bin\cache >nul 2>nul
md bin\cache >nul 2>nul
for /f "usebackq delims=" %%a in (`!FileToOpen! "set imgh=" "%~dp0\*.img;*.ext4;*.raw;*.win"`) do %%a
!simg2img! %imgh% bin\cache\xxximg.ext4 >nul 2>nul
call :custom_unpack
!cecho! {0E}请在文件对比器BCompare挂载打开后{\n}
echo.
!cecho! {0E}选择需要提取目录和文件单击鼠标右键“复制到文件夹”到航母目录下的{0D} 任意img_ext4_%folderd% {0E}文件夹{\n}
echo.
!cecho! {0E}提取完毕后完毕关闭文件对比器BCompare即可{0F}{\n}
echo.
for /r bin\cache\ %%a in (xxximg.ext4) do (
if %%~za==0 del bin\cache\xxximg.ext4
)
if not exist "bin\cache\xxximg.ext4" bin\Beyond_Compare\BCompare.exe %imgh% 任意img_ext4_%folderd%
if exist "bin\cache\xxximg.ext4" bin\Beyond_Compare\BCompare.exe bin\cache\xxximg.ext4 任意img_ext4_%folderd%
rd /s /q bin\cache 2>nul
echo.
!cecho! {0F}提取完毕！提取所得文件在{0D} 任意img_ext4_%folderd% {0F}目录里面.{\n}
echo.
rd /s /q 任意img_ext4_%folderd%\[SYS] >nul 2>nul
pause
goto home
:img_mount
cd.>%1_AIHGT_permissions
rd /s /q %1 >nul 2>nul
md %1 >nul 2>nul
echo.
echo.
!cecho! {0A} ==========================================================================================================={\n}
!cecho! {0C}   请在弹窗选择任意命名的%1.img\%1.ext4格式文件后，右下角位置点选“打开”选项即可开始挂载解包...{\n}
!cecho! {0A} ==========================================================================================================={0F}{\n}
set folderd=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
if "%" == " " (
	set folderd=%date:~0,4%%date:~5,2%%date:~8,2%_t%time:~3,2%%time:~6,2%
)
echo.
!simg2img! %1.img %1ext4.img >nul 2>nul
call :custom_unpack
!cecho! {0E}请在文件对比器BCompare挂载打开后{\n}
echo.
!cecho! {0E}选择需要提取目录和文件单击鼠标右键“复制到文件夹”到航母目录下的{0D} %1 {0E}文件夹{\n}
echo.
!cecho! {0E}提取完毕后完毕关闭文件对比器BCompare即可{0F}{\n}
echo.
for /r %~dp0 %%a in (%1ext4.img) do (
if %%~za==0 del %1ext4.img
)
del /f /s /q %1 >nul 2>nul
if not exist "%1ext4.img" bin\Beyond_Compare\BCompare.exe %1.img %1
if exist "%1ext4.img" bin\Beyond_Compare\BCompare.exe %1ext4.img %1
echo.
!cecho! {0F}提取完毕！提取所得文件在{0D} %1 {0F}目录里面.{\n}
echo.
rd /s /q %1\[SYS] >nul 2>nul
goto rom_look_build_%1
:unpack_systemimg
echo.
!cecho! {0B} 需要几分钟时间来分解system.img！速度快慢取决于你的电脑配置,请耐心等待...{\n}
echo.
!cecho! {0B} 如果解包失败,请把这类二手ROM的system.img或system.new.dat名称对调再重新解包或请求611193563航母群大神看刷机脚本猫腻{0F}{\n}
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
!cecho! {0B} 需要几分钟时间来分解vendor.img！速度快慢取决于你的电脑配置,请耐心等待...{\n}
echo.
!cecho! {0B} 如果解包失败,请把这类二手ROM的vendor.img或vendor.new.dat名称对调再重新解包或请求611193563航母群大神看刷机脚本猫腻{0F}{\n}
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
!cecho! {0E}  正在转换system.new.dat.br转换速度快慢取决你的电脑配置...{0F}{\n}
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
!cecho! {0E}  正在转换vendor.new.dat.br转换速度快慢取决你的电脑配置...{0F}{\n}
echo.
!dat2br! -d -o vendor.new.dat vendor.new.dat.br
!sdat2img! vendor.transfer.list vendor.new.dat vendor.img
goto unpack_vendorimg
:not_build
if not exist "system\system\build.prop" (
echo  解包不完整无法识别build信息，system目录内是否有build.prop此文件
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
echo --------------ROM信息---------------
for /f "tokens=1,2 delims==" %%a in ('find /v "#" ^<!BP!') do (
	if "%%a"=="ro.vendor.build.date" (echo 创建日期^:%%b) 
	if "%%a"=="ro.vendor.product.manufacturer" (echo 手机厂家^:%%b)
	if "%%a"=="ro.vendor.product.model" (echo 产品型号^:%%b) 
	if "%%a"=="ro.vendor.product.brand" (echo 品牌^:%%b)
	if "%%a"=="ro.vendor.product.name" (echo 设备名称^:%%b)
	if "%%a"=="ro.build.id" (echo 产品ID^:%%b) 
	if "%%a"=="ro.build.version.sdk" (echo SDK版本^:%%b) 
	if "%%a"=="ro.build.version.release" (echo 安卓版本^:%%b) 
	if "%%a"=="ro.build.date" (echo 创建日期^:%%b) 
	if "%%a"=="ro.product.model" (echo 产品型号^:%%b) 
	if "%%a"=="ro.product.brand" (echo 品牌^:%%b)
	if "%%a"=="ro.product.name" (echo 设备名称^:%%b)
	if "%%a"=="ro.vendor.product.manufacturer" (echo 手机厂家^:%%b)
	if "%%a"=="ro.product.cpu.abi" (echo CPU指令集^:%%b) 
	if "%%a"=="ro.product.locale.language" (echo 语言^:%%b) 
	if "%%a"=="ro.hardware" (echo 硬件^:%%b)
	if "%%a"=="telephony.lteOnCdmaDevice" (echo 全网通机型（0不属于,1属于）^:%%b)
	if "%%a"=="ro.mediatek.platform" (echo CPU芯片平台^:%%b)
	if "%%a"=="ro.product.first_api_level" (echo 安卓版本api^:%%b)
	if "%%a"=="ro.board.platform" (echo CPU型号^:%%b)
	if "%%a"=="dalvik.vm.heapstartsize" (echo 虚拟机初始^:%%b) 
	if "%%a"=="dalvik.vm.heapgrowthlimit" (echo 虚拟机增长^:%%b) 
	if "%%a"=="dalvik.vm.heapsize" (echo 虚拟机大小^:%%b)  
	if "%%a"=="ro.sf.lcd_density" (echo 屏幕DPI^:%%b)
	if "%%a"=="ro.wifi.channels" (echo WIFI信道^:%%b)
	if "%%a"=="ro.sf.gsensorposition" (echo 重力感应^:%%b)
	if "%%a"=="persist.sys.timezone" (echo 时间时区^:%%b) 
	if "%%a"=="ro.sf.hwrotation" (echo 屏幕放置方向（0正向屏幕,180倒置屏幕）^:%%b) 
	if "%%a"=="ro.product.locale" (echo 语言^:%%b)
	if "%%a"=="ro.yunos.version" (echo 阿里云版本^:%%b)
	if "%%a"=="ro.yunos.build.version" (echo 阿里云ROM版本^:%%b)
	if "%%a"=="ro.build.display.id" (echo ROM版本^:%%b)
	if "%%a"=="qemu.hw.mainkeys" (echo 虚拟按键（0开启,1关闭）^:%%b)
	if "%%a"=="dalvik.vm.isa.arm64.variant" (echo 64位CPU核心架构^:%%b)
	if "%%a"=="dalvik.vm.isa.arm.variant" (echo ARM核心CPU架构^:%%b)
	if "%%a"=="ro.treble.enabled" (!cecho! {0B}谷歌Project Treble（true支持,false不支持）:%%b{0F}{\n})
)
!cecho! {0E}  ========================================================================================={\n}
!cecho! {0E}                                         解包识别完毕! {\n}
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
echo   找不到build.prop此文件无法识别build信息，请确认是否此航母目录下有这个文件
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
echo   找不到vendor\build.prop此文件无法识别build信息，请确认是否此航母目录下有这个文件
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
!cecho! {0B} 以下功能请确定是否打开了开发者选项 - USB调试和OEM解锁，留意手机屏幕上勾上“容许USB调试”提示才能正常使用!{\n}
!cecho! {0B} 如果下面adb或fastboot设备序号显示类似ABCDEFG123 unauthorized(unauthorize代表手机端未授权给电脑,无法正常使用以下功能!{\n}
echo.
!cecho! {0E} 如果工具不显示设备序号可尝试重启手机,以下是已连接adb或fastboot设备序号列表：{0C}{\n}
!adb! devices & !fastboot! devices
!cecho! {0A} 请选择下面选项:{\n}
echo  **********************************************************************************************************************
echo.
!cecho!   {0E}0.回到工具首页                                 5.ADB连接在recovery状态下截图到电脑{\n}
echo   1.ADB打印logcat实时调试日志                    6.ADB连接手机开机状态下截图到电脑
echo   2.ADB打印logcat缓存日志                        7.ADB连接屏幕录像(输出mp4格式)
echo   3.ADB连接手机自动重启系统                      8.ADB推送apk安装到手机【apk名称只能数字或者英文,中文名无法安装】
echo   4.ADB连接手机自动重启到recovery模式            9.fastboot模式线刷system\vendor\boot\recovery\vbmeta镜像img格式
!cecho! {0D}{\n}
echo  10 .recovery状态下ADB Sideload模式任意命名.zip格式卡刷包刷机
echo  11.进入recovery自动卡刷【rec需自行双清,从卡刷包META-INF\com\google\android\update-binary提取放到本工具目录下】
echo  12.fastboot模式更换recovery【请把recovery命名为recovery.img并放置在本工具目录下,容许手机待机状态下运行】
echo  13.打开ADB控制台adb shell模式【需要手动输入各种命令实现ADB各种功能】
echo  14.打开ADB\fastboot控制台手动模式【需要手动输入各种命令实现ADB\fastboot各种功能】
!cecho! {0B}{\n}
echo  15.高通900E模式转换成高通9008模式              18.ADB查看CPU型号信息                        21.ADB查看手机挂载区址
echo  16.生成官方原厂recovery.img                    19.ADB查看手机分区大小                       22.ADB查看手机挂载
echo  17.ADB查看手机屏幕分辨率                       20.ADB查看手机分区总容量                     23.ADB查看内核版本
!cecho! {0F}{\n}
set /p webz=-^-^> 输入数字选择对应的操作:
if "%webz%"=="0" goto home
if "%webz%"=="1" goto Print_logcat_time
if "%webz%"=="2" goto Print_logcat_cache
if "%webz%"=="3" !cecho! {0E}正在使用adb连接正在重启手机... {07}{\n} & !adb! reboot & pause & goto home_adb_fastboot
if "%webz%"=="4" !cecho! {0B}正在使用adb连接重启到recovery模式... {07}{\n} & !adb! reboot recovery & pause & goto home_adb_fastboot
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
!cecho! {0B}以下是当前手机的屏幕分辨率{0E}{\n}
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
!cecho! {0C}      没找到recovery-from-boot.p，请确认航母目录下是否存在recovery-from-boot.p{0F}{\n}
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
!cecho! {0C}      没找到recovery-resource.dat，请确认航母目录下是否存在recovery-resource.dat{0F}{\n}
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
!cecho! {0C}      没找到install-recovery.sh，请确认航母目录下是否存在install-recovery.sh{0F}{\n}
echo.
echo.
echo.
pause
goto home_adb_fastboot
else
)
echo.
echo.
!cecho! {0E}      需要手机打开设置-开发者选项-USB调试，才能顺利生成官方recovery.img{\n}
echo.
!cecho! {0C}      请把以下路径官方文件提取出来放在航母根目录下{\n}
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
!cecho! {0C}          生成官方recovery.img在航母跟目录下！{0F}{\n}
echo.
pause
goto home_adb_fastboot
:open_adb_fastboot_shell
call :adbfastboot_else
!adb! devices & !fastboot! devices
!cecho! {0A} 输入exit即可返回adb\fastboot控制台主页面（备注:代码敲入有su（显示root）需输入两次exit将返回adb\fastboot控制台主页面）{\n}
echo.
start bin\adb_help.txt
!adb! shell
echo 按下任意键会自动关闭 “shell模式adb\fastboot控制台” 和adb_help.txt记事本并回到工具首页！
echo.
pause
taskkill /FI "WINDOWTITLE eq adb_help.txt*"
goto home_adb_fastboot
:adbfastboot_else
cls
echo.
!cecho! {0A}  现在可以直接输入各种adb或fastboot命令来实现对应功能，下面是参考样板：{\n}
echo.
!cecho! {0E} 手机SD卡发送到本工具目录下:adb pull /sdcard/1.mp3 1.mp3    {0f}列举已连接的fastboot设备：  fastboot devices{\n}
!cecho! {0E} 本工具目录下发送到手机SD卡:adb push 1.mp3 /sdcard/1.mp3    {0f}刷入boot.img：              fastboot flash boot boot.img{\n}
!cecho! {0E} 列举已连接的adb设备：      adb devices                     {0f}解锁bootloader(俗称解BL锁)：fastboot oem unlock{\n}
!cecho! {0E} 进入adb运行环境：          adb shell                       {0f}重启手机:                   fastboot reboot{\n}
!cecho! {0E} 查看adb命令帮助：          adb help                        {0f}查看fastboot命令帮助：      fastboot help{\n}
echo.
!cecho! {0D}请确定是否打开了开发者选项 - USB调试和OEM解锁和选择本工具【电脑安装ADB\fastboot驱动】解决{\n}
!cecho! {0D}留意手机屏幕上勾上“容许USB调试”提示,需要有adb或fastboot设备序号才能进行以下adb或fastboot操作{\n}
echo.
echo.
!cecho! {0B}  已连接adb或fastboot设备序号列表：{0C}{\n}
goto eof
:open_adb_fastboot_Manual
call :adbfastboot_else
!adb! devices & !fastboot! devices
!cecho! {0A} 输入exit即可返回adb\fastboot控制台主页面（备注:代码敲入有su（显示root）需输入三次exit将返回adb\fastboot控制台主页面）{\n}
echo.
start bin\adb_help.txt
@cmd /k
echo.
echo 按下任意键会自动关闭 “手动模式adb\fastboot控制台” 和adb_help.txt记事本并回到工具首页！
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
!cecho! {0E} 1.fastboot模式刷入任意名称的system镜像img格式{\n}
echo.
!cecho! {0D} 2.fastboot模式刷入任意名称的vendor镜像img格式{\n}
echo.
!cecho! {0B} 3.fastboot模式刷入任意名称的boot镜像img格式{\n}
echo.
!cecho! {0C} 4.fastboot模式刷入任意名称的recovery镜像img格式{\n}
echo.
!cecho! {0A} 5.fastboot模式刷入vbmeta.img(解除vbmeta官方验证或刷入官方vbmeta){\n}
!cecho! {0F}{\n}
set /p webflashimg=-^-^> 输入数字选择对应的操作:
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
!cecho! {0E} 1.fastboot模式刷入空白vbmeta来解除官方验证{\n}
echo.
!cecho! {0C} 2.fastboot模式刷入刷入官方vbmeta{\n}
!cecho! {0F}{\n}
set /p webflashvbmeta=-^-^> 输入数字选择对应的操作:
if "%webflashvbmeta%"=="1" goto fastboot_flashvbmeta_remove
if "%webflashvbmeta%"=="2" goto fastboot_flashvbmeta_official
goto fastboot_flashvbmeta
:fastboot_flashvbmeta_remove
echo.
echo.
!cecho! {0E}     准备解除vbmeta官方验证{\n}
pause
!fastboot! --disable-verity --disable-verification flash vbmeta bin\vbmeta.img
echo.
!cecho! {0B}     解除vbmeta官方验证完毕！{0F}{\n}
echo.
pause
goto home_adb_fastboot
:fastboot_flashvbmeta_official
!cecho! {0A} ========================================================================================{\n}
!cecho! {0E}   请在弹窗界面选择官方vbmeta.img格式文件后，右下角位置点选“打开”选项将开始刷入vbmeta.img{\n}
!cecho! {0A} ========================================================================================{0F}{\n}
set flashvbmeta=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set flashvbmeta=" "%~dp0\*.img"`) do %%a
!fastboot! flash vbmeta %flashvbmeta%
echo.
!cecho! {0B}     官方vbmeta.img刷入完毕！{0F}{\n}
echo.
pause
goto home_adb_fastboot
:fastboot_flashimg
!cecho! {0A} ===================================================================================={\n}
!cecho! {0E}   请在弹窗界面选择img格式文件后，右下角位置点选“打开”选项将开始刷入img格式%2镜像！{\n}
!cecho! {0A} ===================================================================================={0F}{\n}
set flashimg=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set flashimg=" "%~dp0\*.img"`) do %%a
!fastboot! flash %1 %flashimg%
echo.
!cecho! {0B}     img格式%2镜像刷入完毕！{0F}{\n}
echo.
pause
goto home_adb_fastboot
:fastboot_install_recovery
echo.
echo.     锁了bootloader（俗称锁BL）的手机请先解锁，否则无法刷入第三方recovery！
echo.
pause
echo.
if not exist "recovery.img" (
echo.
echo.
!cecho! {0C}      请检查航母目录下是否存在recovery.img。{0F}{\n}
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
echo. --- 发现adb设备
echo.     稍后手机将会进入fastboot模式
echo.
!adb! reboot bootloader
!fastboot! devices
ping -n 1 127.1 >nul 2>nul
echo. --- 发现fastboot设备
echo.     稍后手机将会进入fastboot模式
echo.
!cecho! {0D}  ====================={\n}
!cecho! {0D}   自动刷写recovery... {\n}
!cecho! {0D}  ====================={0F}{\n}
!cecho! {0F}{\n}
!fastboot! flash recovery recovery.img
echo.
echo.
echo. 如果以上出现“... OKAY”字样两次则表示刷入成功，手机将重启到recovery...
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
set "afolder=recovery截图_%YYYYa%-%MMa%-%DDa%"
set "afile=recovery截图_%aimg%.png"
if not exist %afolder% md %afolder% >nul
set "ascreenshot=%afolder%\%afile%"
echo( 
!adb! shell "/tmp/fb2png /tmp/fbdump.png > /tmp/info; head -n 20 /tmp/info | tail -n 13; rm -f /tmp/info"
!cecho! {0B}复制截图到电脑{07}{\n}
!adb! pull /tmp/fbdump.png %ascreenshot%
!adb! shell rm -f /tmp/fbdump.png >nul
echo(
!cecho! 截图成功! {0E}%afile% {07}在这个{0E}%afolder% {07}文件夹里面.{\n}
echo.
echo 1.请确定是否打开了开发者选项 - USB调试和OEM解锁并安装好驱动且留意手机屏幕上勾上“容许USB调试”提示才能正常使用!
echo.
echo 2.如果没找到截图的图片，请重启手机或选择本工具【电脑安装ADB\fastboot驱动】解决。
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
set "bfolder=开机状态下截图_%YYYYb%-%MMb%-%DDb%"
set "bfile=开机状态下截图_%bimg%.png"
if not exist %bfolder% md %bfolder% >nul 2>nul
set "bscreenshot=%bfolder%\%bfile%"
echo( 
!adb! shell screencap -p /sdcard/Screenshots/screenos.png >nul 2>nul
!cecho! {0E}复制截图到电脑{07}{\n}
!adb! pull /sdcard/Screenshots/screenos.png %bscreenshot% >nul 2>nul
!adb! shell rm -f /sdcard/Screenshots/screenos.png >nul 2>nul
echo(
!cecho! 截图成功! {0E}%bfile% {07}在这个{0E}%bfolder% {07}文件夹里面.{\n}
echo.
echo 1.请确定是否打开了开发者选项 - USB调试和OEM解锁并安装好驱动且留意手机屏幕上勾上“容许USB调试”提示才能正常使用!
echo.
echo 2.如果没找到截图的图片，请重启手机或选择本工具【电脑安装ADB/fastboot驱动】解决。
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
set "cfolder=屏幕录制_%YYYYc%-%MMc%-%DDc%"
set "cfile=屏幕录制_%cimg%.mp4"
if not exist %cfolder% md %cfolder% >nul 2>nul
set "video=%cfolder%\%cfile%"
echo( 
echo.
!cecho! {0B} 手机屏幕正在录像中...{\n}
echo.
echo n|start /max /wait cmd /c "mode 110,20& !cecho! {0B}结束屏幕视频录制,请直接关闭此窗口即可自动保存屏幕录制的视频到航母当前目录!部分手机有最长三分钟录制时间限制。{0F} & !adb! shell screenrecord --verbose /sdcard/screenrecord.mp4"
ping 127.1 -n 3 >nul
!cecho! {0E} 屏幕录像录制时间越长文件越大,复制速度快慢取决于你屏幕录像时间的长短！{\n}
!cecho! {0E} 正在复制屏幕录像mp4到电脑,请耐心等待...{07}{\n}
!adb! pull /sdcard/screenrecord.mp4 %video% >nul 2>nul
!adb! shell rm -f /sdcard/screenrecord.mp4 >nul 2>nul
echo(
!cecho! 屏幕录像视频mp4成功! {0E}%cfile% {07}在这个{0E}%cfolder% {07}文件夹里面.{\n}
echo.
echo 1.请确定是否打开了开发者选项 - USB调试和OEM解锁并安装好驱动且留意手机屏幕上勾上“容许USB调试”提示才能正常使用!
echo.
echo 2.如果没找到屏幕录制的视频文件，请重启手机或选择本工具【电脑安装ADB/fastboot驱动】解决。
echo.
pause
goto home_adb_fastboot
:adb_sideload
echo.
!cecho! {0C}请确保你的手机内置存储有足够容量存放卡刷包,否则内存不足将无法进行adb sideload模式卡刷！{0F}{\n}
echo.
pause
echo.
echo 在recovery里面打开adb sideload模式即可！是否需要双清自行决定！
echo.
!cecho! {0E}请在弹窗选择任意命名的zip格式的卡刷包后，右下角位置点选“打开”选项即可开始推送...{0F}{\n}
echo.
echo 正在推送卡刷包到手机，请稍后...
echo.
set rom=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set rom=" "%~dp0\*.zip"`) do %%a
!adb! sideload %rom%
echo 推送刷机包完毕！请重启手机...
echo.
pause
goto home_adb_fastboot
:adb_install_apk
echo.
!cecho! {0D}  ==================================================================={\n}
echo   请检查是否打开安全-未知来源和开发者选项-USB调试和OEM解锁 ！
echo.
echo   并安装好驱动并留意手机屏幕上勾上（容许USB调试）提示才能正常使用!！
echo.
echo   或者选择本工具【电脑安装ADB\fastboot驱动】解决 
!cecho! {0D}  ==================================================================={0F}{\n}
echo.
!cecho! {0E}apk名称只能数字或者英文,中文名称无法安装{\n}
echo.
echo.
!cecho! {0C}请在弹窗选择任意命名的apk软件后，右下角位置点选“打开”选项即可开始推送安装软件到手机上...{0F}{\n}
echo.
set apk=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set apk=" "%~dp0\*.apk"`) do %%a
!adb! install -r %apk%
goto home_adb_fastboot
:adb_flash_zip
if not exist "update-binary" (
echo.
echo.
!cecho! {0C}      缺少update-binary卡刷组件,请马上检查本工具目录下是否存在对应CPU型号update-binary刷机组件。{0F}{\n}
echo.
!cecho! {0C}      从卡刷包提取META-INF\com\google\android\update-binary卡刷组件放到本工具目录下。{0F}{\n}
echo.
echo.
pause
goto home_adb_fastboot
else
)
echo.
!cecho! {0C}请确保你的手机内置存储有足够容量存放卡刷包,否则内存不足将无法进行recovery卡刷！{0F}{\n}
echo.
pause
!adb! reboot recovery
set num=20
:Second_reading
if %num% equ 0 (goto:flashzip) else set /a num-=1
!cecho! {0A}进入recovery界面倒数还剩{0F} %num% {0A}秒时间，正在刷入update-binary刷机组件...{0F}{\n}
ping -n 2 127.0.1 >nul 2>nul
goto:Second_reading
:flashzip
echo.
!adb! push update-binary /tmp/update-binary
!adb! shell chmod 0777 /tmp/update-binary
echo.
echo.
!cecho! {0C}成功刷入对应CPU型号update-binary刷机组件将显示有[100%]字样！{0F}{\n}
echo.
!cecho! {0C}刷入失败将显示有No such file or directory字样，请检查本工具目录下是否存在对应CPU型号update-binary刷机组件。{0F}{\n}
echo.
echo.
!cecho! {0B}请在弹窗选择任意命名的zip格式的卡刷包后，右下角位置点选“打开”选项即可开始推送...{0F}{\n}
echo.
!cecho! {0B}请自行在recovery界面自行决定是否需要双清操作，正在推送卡刷包到手机，请稍后...{0F}{\n}
set roma=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set roma=" "%~dp0\*.zip"`) do %%a
!adb! push %roma% /sdcard/flashrom.zip
!adb! shell "/tmp/update-binary" 2 2 /sdcard/flashrom.zip
echo 刷机成功!按下任意键手机将重启...
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
echo. 提醒：此线刷软件只适合MTK和高通芯片的手机线刷！
echo.
echo. 无法线刷请先安装线刷驱动,由于各家品牌线刷驱动有区别,请自行网上搜索,本工具只提供公版线刷驱动安装!
echo. 
echo. *************************************************************************************************
!cecho! {0E}{\n}
echo   1.打开MTK线刷工具SP_Flash_Tool(中文版)
!cecho! {0E}{\n}
echo   2.安装MTK公版线刷驱动
!cecho! {0D}{\n}
echo   3.打开高通9008线刷工具QFIL
!cecho! {0D}{\n}
echo   4.安装高通公版9008线刷驱动
!cecho! {0B}{\n}
echo   5.查看新版MTK线刷工具SP_Flash_Tool(自行下载更新)
!cecho! {0C}{\n}
echo   0.回到工具首页
!cecho! {0F}{\n}
echo.
set /p webcc=-^-^> 输入数字选择对应的操作:
if "%webcc%"=="1" goto SP_Flash_Tool
if "%webcc%"=="2" goto install_BrushDrive
if "%webcc%"=="3" goto qualcomm_QFIL
if "%webcc%"=="4" goto qualcomm_Diag_QD_Loader
if "%webcc%"=="5" goto update_SP_Flash_Tool
if "%webcc%"=="0" goto home
goto Flash_Tool
:SP_Flash_Tool
echo.
!cecho! {0C}线刷SP_Flash_Tool工具设置中文方法：打开软件左上方选项，依次选择Options-General-Language-简体中文{0F}{\n}
!cecho! {0C}正在打开MTK线刷工具SP_Flash_Tool，请稍后...{0F}{\n}
echo.
start bin\Flash_Tool\SP_Flash_Tool\flash_tool.exe
pause
goto Flash_Tool
:install_BrushDrive
echo.
!cecho! {0C}此文件夹下为MTK芯片公版线刷驱动，自行选择安装，哪些管用安装哪些。{0F}{\n}
echo.
start bin\MTK_Sp_Flash_Tools_Driver\
pause
goto Flash_Tool
:qualcomm_QFIL
echo.
!cecho! {0C}正在打开高通9008线刷工具QFIL，请稍后...{0F}{\n}
echo.
start bin\Flash_Tool\Qualcomm_Flash_Image_Loader\QFIL.exe
pause
goto Flash_Tool
:qualcomm_Diag_QD_Loader
echo.
!cecho! {0C}正在安装高通公版9008线刷驱动，请稍后...{0F}{\n}
echo.
start bin\Qualcomm_Diag_QD_Loader_2016_driver.exe
pause
goto Flash_Tool
:update_SP_Flash_Tool
echo.
!cecho! {0C}请下载最新版本，保持对MTK新CPU的兼容性......{0F}{\n}
!cecho! {0C}线刷SP_Flash_Tool工具设置中文方法：打开软件左上方选项，依次选择Options-General-Language-简体中文{0F}{\n}
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
echo.                             呜谢：官方notepad++对软件的更新！
echo. 
echo. *************************************************************************************************
!cecho! {0E}{\n}
echo   1.立即安装notepad++文本编辑器
!cecho! {0D}{\n}
echo   2.查看新版notepad++文本编辑器
!cecho! {0A}{\n}
echo   0.回到工具首页
!cecho! {0F}{\n}
echo.
set /p webdd=-^-^> 输入数字选择对应的操作:
if "%webdd%"=="1" goto install_notepad
if "%webdd%"=="2" goto update_notepad
if "%webdd%"=="0" goto home
goto install_notepad
:install_notepad
echo.
!cecho! {0C}正在打开notepad++安装程序，请稍候...！{0F}{\n}
echo.
start bin\notepad.exe
pause
goto home
:update_notepad
echo.
echo 正在打开notepad官网......
echo.
start https://notepad-plus-plus.org/downloads/
goto home
:rootkernel
echo.
!cecho! {0E}    请在弹窗选择boot.img\recovery.img文件后，右下角位置点选“打开”选项即可开始识别kernel内核版本...{0F}{\n}
echo.
set kernelversion=
for /f "usebackq delims=" %%a in (`!FileToOpen! "set kernelversion=" "%~dp0\*img"`) do %%a
copy %kernelversion% bin\rootkernel\boot.img >nul 2>nul
echo.
!cecho! {0E} 请查看内核kernel版本信息完毕后按下任意键回到航母首页并自动清理识别过程中残留的文件{0F}{\n}
echo.
start bin\rootkernel\拖拽内核REC到这里.bat
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
!cecho! {0A}—————————————————{0C}以下功能无需java安装和java环境{0A}—————————————————{\n}
echo.
!cecho! {0E}   1.使用ClassyKitchen.exe进行odex\vdex合并及解包打包自动生成传统卡刷脚本等等功能(安卓5.0-9.0){\n}
echo.
!cecho! {0D}   2.使用SVADeodexerForArt.exe进行odex合并(安卓5.0-7.1.2){\n}
echo.
!cecho! {0B}   3.到XDA网站查看SVADeodexerForArt和ClassyKitchen新版{\n}
echo.
!cecho! {0E}   0.回航母工具首页{\n}
echo.
!cecho! {0A}—————————————————————————————————————————————————{0F}{\n}
echo.
set /p webee=-^-^> 输入数字选择对应的操作:
if "%webee%"=="1" goto ClassyKitchen
if "%webee%"=="2" goto SVADeodexerForArt
if "%webee%"=="3" goto update_odex
if "%webee%"=="0" goto home
goto odex_vdex_merge
:ClassyKitchen
echo.
echo.
echo.
!cecho! {0E} 把需要合并的system或者vendor目录放在{0C} PROJECT {0E}文件夹里面即可合并,正在打开ClassyKitchen工具,请骚等...{0F}{\n}
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
!cecho! {0E} 请选择SVADeodexerForArt.exe来进行ODEX合并!(支持安卓5.0-7.1.2){\n}
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
!cecho! {0A}   1.打开对比器{\n}
echo.
!cecho! {0C}   2.自动处理对比器提示密匙过期被吊销问题{\n}
echo.
!cecho! {0B}   0.返回工具主页{0F}{\n}
echo.
set /p webee=-^-^> 输入数字选择对应的操作:
if "%webee%"=="1" echo. & echo 正在打开文件对比器，请稍候... & echo. & start bin\Beyond_Compare\BCompare.exe & pause & goto home
if "%webee%"=="2" call bin\处理对比器提示密匙过期被吊销问题.bat
if "%webee%"=="0" goto home
goto open_Compare
:install_Apkdb
cls
!cecho! {0A}{\n}
echo  *************************************************************************************************
echo.
echo.                 呜谢： 淡蓝斯宇-点滴科技原作者对Apkdb反编译工具软件的更新！
echo. 
echo. *************************************************************************************************
!cecho! {0E}{\n}
echo   1.立即安装Apkdb反编译工具
!cecho! {0D}{\n}
echo   2.查看最新Apkdb反编译工具
!cecho! {0B}{\n}
echo   3.查看最新java版本
!cecho! {0C}{\n}
echo   0.回到工具首页
!cecho! {0F}{\n}
echo.
set /p webff=-^-^> 输入数字选择对应的操作:
if "%webff%"=="1" goto install_apkdb
if "%webff%"=="2" goto apkdb_update
if "%webff%"=="3" goto update_java8
if "%webff%"=="0" goto home
goto install_Apkdb
:apkdb_update
echo.
echo 正在打开Apkdb反编译工具官网下载地址，请稍后......
echo.
start https://idoog.cn/?p=2933
pause
goto home
:install_apkdb
echo.
!cecho! {0C}正在打开Apkdb反编译程序，请稍候...！{\n}
echo.
start bin\Apkdb.exe
pause
goto home
:open_AdbFileExplorer
echo.
echo 此功能需要手机当前系统支持system\xbin\busybox组件才能使用。
echo 正在打开ADB文件管理器...
echo.
start bin\AdbFileExplorer.exe
pause
goto home_adb_fastboot
:Print_logcat_time
set foldery=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
if "%" == " " (
	set foldery=%date:~0,4%%date:~5,2%%date:~8,2%_t%time:~3,2%%time:~6,2%
)
md 实时调试logcat分析日志_%foldery%
!adb! logcat -t 10000 -v time > 实时调试logcat分析日志_%foldery%\监视系统运行日志.log
!adb! logcat *:F -t 10000 -v time > 实时调试logcat分析日志_%foldery%\分类日志-严重错误fatal.log
!adb! logcat *:E -t 10000 -v time > 实时调试logcat分析日志_%foldery%\分类日志-普通错误error.log
!adb! logcat *:W -t 10000 -v time > 实时调试logcat分析日志_%foldery%\分类日志-警告warning.log
!adb! logcat *:I -t 10000 -v time > 实时调试logcat分析日志_%foldery%\分类日志-信息info.log
!adb! logcat *:D -t 10000 -v time > 实时调试logcat分析日志_%foldery%\分类日志-调试debug.log
!adb! logcat *:V -t 10000 -v time > 实时调试logcat分析日志_%foldery%\分类日志-明细verbose.log
!adb! logcat -b radio -t 10000 -v time > 实时调试logcat分析日志_%foldery%\打印信号基带运行相关日志.log
!adb! logcat -b main -t 10000 -v time > 实时调试logcat分析日志_%foldery%\打印运行应用程序日志.log
!adb! logcat -b events -t 10000 -v time > 实时调试logcat分析日志_%foldery%\打印系统事件日志.log
!cecho! {0C}{\n}
echo 成功打印实时调试logcat分析日志！请在工具根目录查找带“实时调试logcat分析日志_xx时间xx日期”的文件夹！
!cecho! {0F}{\n}
echo android输出的每一条日志都有一个标记和优先级与其关联。
echo 优先级是下面的字符，顺序是从低到高：
echo V — 明细 verbose(最低优先级)
echo D — 调试 debug
echo I — 信息 info
echo W — 警告 warning
echo E — 错误 error
echo F — 严重错误 fatal
echo S — 无记载 silent
pause
goto home
:Print_logcat_cache
set folderw=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
if "%" == " " (
	set folderw=%date:~0,4%%date:~5,2%%date:~8,2%_t%time:~3,2%%time:~6,2%
)
md 缓存logcat分析日志_%folderw%
md 缓存logcat分析日志_%folderw%\tombstones
!adb! bugreport > 缓存logcat分析日志_%folderw%\缓存日志-bug报告.log
!adb! shell dmesg > 缓存logcat分析日志_%folderw%\缓存日志-内核kernel与硬件驱动关联.log
!adb! shell dumpsys > 缓存logcat分析日志_%folderw%\缓存日志-系统service服务状态.log
!adb! shell dumpstate > 缓存logcat分析日志_%folderw%\缓存日志-系统状态信息.log
!adb! pull /data/anr/traces.txt 缓存logcat分析日志_%folderw%\报表服务器web服务的跟踪日志.log
!adb! pull /data/tombstones %folderw%\tombstones
!cecho! {0C}{\n}
echo 成功打印缓存logcat分析日志！请在工具根目录查找带“缓存logcat分析日志_xx时间xx日期”的文件夹！
!cecho! {0F}{\n}
echo android输出的每一条日志都有一个标记和优先级与其关联。
echo 优先级是下面的字符，顺序是从低到高：
echo V — 明细 verbose(最低优先级)
echo D — 调试 debug
echo I — 信息 info
echo W — 警告 warning
echo E — 错误 error
echo F — 严重错误 fatal
echo S — 无记载 silent
pause
goto home
:pc_home
cls
!cecho! {0A}{\n}
echo  *****************************************************
echo. 
echo.    电脑一键快速重启、电脑锁定、电脑定时关机等功能！
echo. 
echo. *****************************************************
!cecho! {0E}{\n}
echo   1.电脑快速重启
!cecho! {0D}{\n}
echo   2.电脑快速锁定
!cecho! {0B}{\n}
echo   3.电脑定时关机
!cecho! {0A}{\n}
echo   0.回到工具首页
!cecho! {0F}{\n}
echo.
set /p webgg=-^-^> 输入数字选择对应的操作:
if "%webgg%"=="1" shutdown -r -t 0 & goto home
if "%webgg%"=="2" rundll32.exe user32.dll,LockWorkStation & goto home
if "%webgg%"=="3" goto time_off_pc
if "%webgg%"=="0" goto home
goto pc_home
:time_off_pc
echo 请指定24小时制式时间,在英文状态下输入格式为【小时:分钟】
echo  例如:  00:00  或  19:30
echo ========================================
set shutdowntime=
set /p shutdowntime=定时:
schtasks /create /sc once /tn 定时关机 /tr "shutdown.exe -s -hybrid -t 10" -st "%shutdowntime%:00"
if not errorlevel 1 goto ok
echo %shutdowntime% 不是标准的时间格式,请重新输入
echo.
goto home
:update_CarrierClassTools
!cecho! {0A}{\n}
echo  ***********************************************************
echo.    关注我的新浪微博，随时查看航母工具最新版本！
echo.
echo     关注航母工具官方QQ群：611193563
echo.
echo.    航母工具支付宝微信二维码扫描打开的图片捐赠，请我喝一杯咖啡！
echo. ***********************************************************
!cecho! {0F}{\n}
start bin\航母工具支付宝微信二维码捐赠.png & start http://shang.qq.com/wpa/qunwpa?idkey=8da3fa12ed1d48b24b52efa1a6e60f641806b08be93edac5e549a3d1617f3c70 & start http://weibo.com/jooks
pause
goto home
:exit
echo.
echo.
echo 正在关闭航母工具所有进程...
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
echo 清空电脑回收站文件
for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
if exist %%a:\ (
del /f /s /q "%%a:\$recycle.bin\*.*" >nul 2>nul
)
)
del /f /s /q "%systemdrive%\recycled\*.*" >nul 2>nul
echo.
echo 清空航母工具下所有非只读属性文件和目录
del/a-r /s /q %~dp0*.*
for /f "tokens=*" %%i in ('dir/s/b/ad^|sort /r') do rd "%%i"
goto home
:eof

