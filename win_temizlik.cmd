@ECHO OFF

:: Güvenli dosya
:: Bu dosya Windows uzerinde temizlik yapmak icin hazirlanmistir. 
:: Basit ve sistemi fazla yukten kurtaran temizlik ilkelerini kapsar.
rem Discord - bigfiggings#1228

TITLE Windows Genel Temizlik - AG
mode con cols=150 lines=46
color f0

:giris
ECHO.
ECHO  Merhaba %username%,
ECHO.
ECHO      ----------------------------------------------------------------------------------------------------------------
ECHO      -   WINDOWS UZERINDE BIRIKEN GECICI VE GEREKSIZ DOSYALARI TEMIZLEME   -  (AG tarafindan olusturuldu)           -
ECHO      ----------------------------------------------------------------------------------------------------------------
ECHO      -                                                                                                              -
ECHO      -                                                                                                              -
ECHO      -     [1] Gecici Dosyalari Temizle                             (Haftada veya ayda 1 yapilmasi tavsiye edilir)  -
ECHO      -     [2] LOG Dosyalarini Temizle                (Sistem sagligi icin uzun araliklarla silinmesi daha iyidir)  -
ECHO      -     [3] Windows Guncelleme Dosyalarini Temizle                       (Sisteminiz guncelse kesinlikle silin)  -
ECHO      -     [4] Prefetch Temizle                         (Cok fazla proglam yukleyip kaldirdiysaniz tavsiye edilir)  -
ECHO      -     [5] Ekran karti guncelleme dosyalarini temizle                     (Son surum yuklu ise silebilirsiniz)  -
ECHO      -     [6] Silinecek dosyalari elle sec                                               (Hepsini secebilirsiniz)  -
ECHO      -     [7] Sistem otomatik disk temizligi yapsin                                                                -
ECHO      -     [8] Sistem dosyalarini tara (varsa) bozuk olanlari duzelt                                                -
ECHO      -     [9] Programi Kapat                                                                                       -
ECHO      -                                                                                                              -
ECHO      -                                                                                                              -
ECHO      ----------------------------------------------------------------------------------------------------------------
ECHO.
ECHO.
set secim=
set /p secim=    Yapmak istediginiz islemi girin: 
if not '%secim%'=='' set secim=%secim:~0,1%
if '%secim%'=='1' goto gecicidosya
if '%secim%'=='2' goto logdosya
if '%secim%'=='3' goto winguncellemedosya
if '%secim%'=='4' goto prefetchtemizlik
if '%secim%'=='5' goto ekgncllmetemizlik
if '%secim%'=='6' goto manueltemizlik
if '%secim%'=='7' goto autotemizlik
if '%secim%'=='8' goto sistdosyatara
if '%secim%'=='9' goto cikis
cls
ECHO.
ECHO "%secim%" gecerli degil, lutfen asagida belirtilen rakamlari girin
goto giris

:gecicidosya
ECHO.
RD /S /Q %temp%
MKDIR %temp%
takeown /f "%temp%" /r /d y
takeown /f "C:\Windows\Temp" /r /d y
RD /S /Q C:\Windows\Temp
MKDIR C:\Windows\Temp
takeown /f "C:\Windows\Temp" /r /d y
takeown /f %temp% /r /d y
cls
ECHO.
ECHO              Gecici dosyalar basariyla temizlendi
ECHO      ________________________________________________________
ECHO.
ECHO                        AAA                  GGGGGGGGGGGGG
ECHO                       A:::A              GGG::::::::::::G
ECHO                      A:::::A           GG:::::::::::::::G
ECHO                     A:::::::A         G:::::GGGGGGGG::::G
ECHO                    A:::::::::A       G:::::G       GGGGGG
ECHO                   A:::::A:::::A     G:::::G              
ECHO                  A:::::A A:::::A    G:::::G              
ECHO                 A:::::A   A:::::A   G:::::G    GGGGGGGGGG
ECHO                A:::::A     A:::::A  G:::::G    G::::::::G
ECHO               A:::::AAAAAAAAA:::::A G:::::G    GGGGG::::G
ECHO              A:::::::::::::::::::::AG:::::G        G::::G
ECHO             A:::::AAAAAAAAAAAAA:::::AG:::::G       G::::G
ECHO            A:::::A             A:::::AG:::::GGGGGGGG::::G
ECHO           A:::::A               A:::::AGG:::::::::::::::G
ECHO          A:::::A                 A:::::A GGG::::::GGG:::G
ECHO         AAAAAAA                   AAAAAAA   GGGGGG   GGGG
ECHO.
ECHO.     ________________________________________________________
ECHO.
ECHO.
goto giris

:logdosya
ECHO.
cd/
del *.log /a /s /q /f
cls
ECHO.
ECHO               LOG dosyalari basariyla temizlendi
ECHO      ________________________________________________________
ECHO.
ECHO                        AAA                  GGGGGGGGGGGGG
ECHO                       A:::A              GGG::::::::::::G
ECHO                      A:::::A           GG:::::::::::::::G
ECHO                     A:::::::A         G:::::GGGGGGGG::::G
ECHO                    A:::::::::A       G:::::G       GGGGGG
ECHO                   A:::::A:::::A     G:::::G              
ECHO                  A:::::A A:::::A    G:::::G              
ECHO                 A:::::A   A:::::A   G:::::G    GGGGGGGGGG
ECHO                A:::::A     A:::::A  G:::::G    G::::::::G
ECHO               A:::::AAAAAAAAA:::::A G:::::G    GGGGG::::G
ECHO              A:::::::::::::::::::::AG:::::G        G::::G
ECHO             A:::::AAAAAAAAAAAAA:::::AG:::::G       G::::G
ECHO            A:::::A             A:::::AG:::::GGGGGGGG::::G
ECHO           A:::::A               A:::::AGG:::::::::::::::G
ECHO          A:::::A                 A:::::A GGG::::::GGG:::G
ECHO         AAAAAAA                   AAAAAAA   GGGGGG   GGGG
ECHO.
ECHO.     ________________________________________________________
ECHO.
goto giris

:winguncellemedosya
ECHO.
ECHO Windows guncelleme hizmeti durdurulup temizlik baslatiliyor.
ECHO.
net stop wuauserv
net stop UsoSvc
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution
net start wuauserv
net start UsoSvc
cls
ECHO.
ECHO      Windows (eski) guncelleme dosyalari basariyla temizlendi
ECHO      ________________________________________________________
ECHO.
ECHO                        AAA                  GGGGGGGGGGGGG
ECHO                       A:::A              GGG::::::::::::G
ECHO                      A:::::A           GG:::::::::::::::G
ECHO                     A:::::::A         G:::::GGGGGGGG::::G
ECHO                    A:::::::::A       G:::::G       GGGGGG
ECHO                   A:::::A:::::A     G:::::G              
ECHO                  A:::::A A:::::A    G:::::G              
ECHO                 A:::::A   A:::::A   G:::::G    GGGGGGGGGG
ECHO                A:::::A     A:::::A  G:::::G    G::::::::G
ECHO               A:::::AAAAAAAAA:::::A G:::::G    GGGGG::::G
ECHO              A:::::::::::::::::::::AG:::::G        G::::G
ECHO             A:::::AAAAAAAAAAAAA:::::AG:::::G       G::::G
ECHO            A:::::A             A:::::AG:::::GGGGGGGG::::G
ECHO           A:::::A               A:::::AGG:::::::::::::::G
ECHO          A:::::A                 A:::::A GGG::::::GGG:::G
ECHO         AAAAAAA                   AAAAAAA   GGGGGG   GGGG
ECHO.
ECHO.     ________________________________________________________
ECHO.
goto giris

:prefetchtemizlik
ECHO.
del /s /f /q %windir%\Prefetch\*.*    
rd /s /q %windir%\Prefetch    
md %windir%\Prefetch 
cls
ECHO.
ECHO       Prefetch dosyalari basariyla temizlendi
ECHO      ________________________________________________________
ECHO.
ECHO                        AAA                  GGGGGGGGGGGGG
ECHO                       A:::A              GGG::::::::::::G
ECHO                      A:::::A           GG:::::::::::::::G
ECHO                     A:::::::A         G:::::GGGGGGGG::::G
ECHO                    A:::::::::A       G:::::G       GGGGGG
ECHO                   A:::::A:::::A     G:::::G              
ECHO                  A:::::A A:::::A    G:::::G              
ECHO                 A:::::A   A:::::A   G:::::G    GGGGGGGGGG
ECHO                A:::::A     A:::::A  G:::::G    G::::::::G
ECHO               A:::::AAAAAAAAA:::::A G:::::G    GGGGG::::G
ECHO              A:::::::::::::::::::::AG:::::G        G::::G
ECHO             A:::::AAAAAAAAAAAAA:::::AG:::::G       G::::G
ECHO            A:::::A             A:::::AG:::::GGGGGGGG::::G
ECHO           A:::::A               A:::::AGG:::::::::::::::G
ECHO          A:::::A                 A:::::A GGG::::::GGG:::G
ECHO         AAAAAAA                   AAAAAAA   GGGGGG   GGGG
ECHO.
ECHO.     ________________________________________________________
goto giris

:ekgncllmetemizlik
ECHO.
del /s /f /q %SYSTEMDRIVE%\AMD\*.*
del /s /f /q %SYSTEMDRIVE%\NVIDIA\*.*
del /s /f /q %SYSTEMDRIVE%\INTEL\*.*
cls
ECHO.
ECHO      Ekran karti (eski) guncelleme dosyalari basariyla temizlendi
ECHO      ________________________________________________________
ECHO.
ECHO                        AAA                  GGGGGGGGGGGGG
ECHO                       A:::A              GGG::::::::::::G
ECHO                      A:::::A           GG:::::::::::::::G
ECHO                     A:::::::A         G:::::GGGGGGGG::::G
ECHO                    A:::::::::A       G:::::G       GGGGGG
ECHO                   A:::::A:::::A     G:::::G              
ECHO                  A:::::A A:::::A    G:::::G              
ECHO                 A:::::A   A:::::A   G:::::G    GGGGGGGGGG
ECHO                A:::::A     A:::::A  G:::::G    G::::::::G
ECHO               A:::::AAAAAAAAA:::::A G:::::G    GGGGG::::G
ECHO              A:::::::::::::::::::::AG:::::G        G::::G
ECHO             A:::::AAAAAAAAAAAAA:::::AG:::::G       G::::G
ECHO            A:::::A             A:::::AG:::::GGGGGGGG::::G
ECHO           A:::::A               A:::::AGG:::::::::::::::G
ECHO          A:::::A                 A:::::A GGG::::::GGG:::G
ECHO         AAAAAAA                   AAAAAAA   GGGGGG   GGGG
ECHO.
ECHO.     ________________________________________________________
ECHO.
goto giris

:manueltemizlik
cleanmgr
cls
ECHO.
ECHO      ________________________________________________________
ECHO.
ECHO                        AAA                  GGGGGGGGGGGGG
ECHO                       A:::A              GGG::::::::::::G
ECHO                      A:::::A           GG:::::::::::::::G
ECHO                     A:::::::A         G:::::GGGGGGGG::::G
ECHO                    A:::::::::A       G:::::G       GGGGGG
ECHO                   A:::::A:::::A     G:::::G              
ECHO                  A:::::A A:::::A    G:::::G              
ECHO                 A:::::A   A:::::A   G:::::G    GGGGGGGGGG
ECHO                A:::::A     A:::::A  G:::::G    G::::::::G
ECHO               A:::::AAAAAAAAA:::::A G:::::G    GGGGG::::G
ECHO              A:::::::::::::::::::::AG:::::G        G::::G
ECHO             A:::::AAAAAAAAAAAAA:::::AG:::::G       G::::G
ECHO            A:::::A             A:::::AG:::::GGGGGGGG::::G
ECHO           A:::::A               A:::::AGG:::::::::::::::G
ECHO          A:::::A                 A:::::A GGG::::::GGG:::G
ECHO         AAAAAAA                   AAAAAAA   GGGGGG   GGGG
ECHO.
ECHO.     ________________________________________________________
ECHO.
goto giris

:autotemizlik
cleanmgr /sagerun
cls
ECHO.
echo           Otomatik temizlik yapildi
ECHO      ________________________________________________________
ECHO.
ECHO                        AAA                  GGGGGGGGGGGGG
ECHO                       A:::A              GGG::::::::::::G
ECHO                      A:::::A           GG:::::::::::::::G
ECHO                     A:::::::A         G:::::GGGGGGGG::::G
ECHO                    A:::::::::A       G:::::G       GGGGGG
ECHO                   A:::::A:::::A     G:::::G              
ECHO                  A:::::A A:::::A    G:::::G              
ECHO                 A:::::A   A:::::A   G:::::G    GGGGGGGGGG
ECHO                A:::::A     A:::::A  G:::::G    G::::::::G
ECHO               A:::::AAAAAAAAA:::::A G:::::G    GGGGG::::G
ECHO              A:::::::::::::::::::::AG:::::G        G::::G
ECHO             A:::::AAAAAAAAAAAAA:::::AG:::::G       G::::G
ECHO            A:::::A             A:::::AG:::::GGGGGGGG::::G
ECHO           A:::::A               A:::::AGG:::::::::::::::G
ECHO          A:::::A                 A:::::A GGG::::::GGG:::G
ECHO         AAAAAAA                   AAAAAAA   GGGGGG   GGGG
ECHO.
ECHO.     ________________________________________________________
ECHO.
goto giris

:sistdosyatara
sfc /scannow
ECHO.
ECHO      ________________________________________________________
ECHO.
ECHO                        AAA                  GGGGGGGGGGGGG
ECHO                       A:::A              GGG::::::::::::G
ECHO                      A:::::A           GG:::::::::::::::G
ECHO                     A:::::::A         G:::::GGGGGGGG::::G
ECHO                    A:::::::::A       G:::::G       GGGGGG
ECHO                   A:::::A:::::A     G:::::G              
ECHO                  A:::::A A:::::A    G:::::G              
ECHO                 A:::::A   A:::::A   G:::::G    GGGGGGGGGG
ECHO                A:::::A     A:::::A  G:::::G    G::::::::G
ECHO               A:::::AAAAAAAAA:::::A G:::::G    GGGGG::::G
ECHO              A:::::::::::::::::::::AG:::::G        G::::G
ECHO             A:::::AAAAAAAAAAAAA:::::AG:::::G       G::::G
ECHO            A:::::A             A:::::AG:::::GGGGGGGG::::G
ECHO           A:::::A               A:::::AGG:::::::::::::::G
ECHO          A:::::A                 A:::::A GGG::::::GGG:::G
ECHO         AAAAAAA                   AAAAAAA   GGGGGG   GGGG
ECHO.
ECHO.     ________________________________________________________
ECHO.
goto giris

:cikis
cls
ECHO.
ECHO               Programi kullandigin icin tesekkurler
ECHO.
ECHO      _______________________created by_______________________
ECHO.
ECHO                        AAA                  GGGGGGGGGGGGG
ECHO                       A:::A              GGG::::::::::::G
ECHO                      A:::::A           GG:::::::::::::::G
ECHO                     A:::::::A         G:::::GGGGGGGG::::G
ECHO                    A:::::::::A       G:::::G       GGGGGG
ECHO                   A:::::A:::::A     G:::::G              
ECHO                  A:::::A A:::::A    G:::::G              
ECHO                 A:::::A   A:::::A   G:::::G    GGGGGGGGGG
ECHO                A:::::A     A:::::A  G:::::G    G::::::::G
ECHO               A:::::AAAAAAAAA:::::A G:::::G    GGGGG::::G
ECHO              A:::::::::::::::::::::AG:::::G        G::::G
ECHO             A:::::AAAAAAAAAAAAA:::::AG:::::G       G::::G
ECHO            A:::::A             A:::::AG:::::GGGGGGGG::::G
ECHO           A:::::A               A:::::AGG:::::::::::::::G
ECHO          A:::::A                 A:::::A GGG::::::GGG:::G
ECHO         AAAAAAA                   AAAAAAA   GGGGGG   GGGG
ECHO.
ECHO.     ________________________________________________________
ECHO.
timeout /t 2 >nul

EXIT