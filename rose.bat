@echo off&:: Want something special Smile
SetLocal EnableDelayedExpansion EnableExtensions
if "%~1"=="" Call :SetBuffer Set
Color 9A
md "%temp%\_bin2" 2>nul
pushd "%temp%\_bin2"

for /f "delims=[]" %%N in ('find /n "My_Beautiful_Rose" ^<"%~f0"') do set /a num=%%N
for /F "delims=" %%A in ('more +%num% ^<"%~f0"') do (
 Set /a n+=1
 if !n! LEQ 20 Call :ColorText "%%A" "1C"
 if !n! GTR 20 if !n! LEQ 27 Call :ColorText "%%A" "1D"
 if !n! GTR 27 if !n! LEQ 32 Call :ColorText "%%A" "1A"
 if !n! GTR 32 if !n! LEQ 45 Call :ColorText "%%A" "1A"
 if !n! GTR 45 if !n! LEQ 49 Call :ColorText "%%A" "1E"
 if !n! GTR 49 Call :ColorText "%%A" "08"
)

popd
Call :SetBuffer Recover
rd /s /q "%temp%\_bin2"
del Reg_Console_backup.reg>nul
pause>nul
goto :eof

:ColorText %1-in.Text %2-in.Color.HEX
 echo.>"%~1"
 findstr /V /a:%~2 "1" "*" 2>nul
 del /f "%~1"
Exit /B

::Setting screen buffer width = current width +2 to hide ":" in the Findstr command.
::However, the settings are static now. Needs few more code to recode x10 to x16 scales.
:SetBuffer %1-in.Operation.Set.or.Recover
if "%~1"=="Recover" (2>nul 1>&2 reg import Reg_Console_backup.reg& exit /B)
::making backup
reg export "HKCU\Console" Reg_Console_backup.reg
::making permanent backup
echo n| copy /-Y Reg_Console_backup.reg Reg_Console_backup_permanent.reg
::Creating modifications to registry
(
echo Windows Registry Editor Version 5.00
echo [HKEY_CURRENT_USER\Console\%%SystemRoot%%_system32_cmd.exe]
echo "ScreenBufferSize"=dword:3e80051
echo "WindowSize"=dword:0038004e
) > Reg_Console_Mod.reg
::Apply it
reg import Reg_Console_Mod.reg
del Reg_Console_Mod.reg
::Restarting CMD on the another thread using new environment
start cmd /c "%~f0" next
Exit

:My_Beautiful_Rose
                                 _
                   'M,        .mM'
                    IMIm_  _,mIM'
                    ,MI''IM,mIMm
         'IMmm,    ,IM____IM_'IM,           ,m'
            'IMMIMMIMm_,IM'___'IM''==mm_,mIM'
           ,mIM'____'MIM'______IM,__,mIMIM'
,mMIMIMIIMIMM,______,mM'______,IMIMIMIMMM'
IMM,_______'IMM,____,M'______,IIM'_____'MM,
'IMM,________'IM,_,M'_____,IM'_________'IM,
   'IMm_______'IMMM______,IM'___________'IM,
     'Mm________'IM______MM'______________'IM,
      IM,________IM______MM_________________'IM,
       MM,_______IM,_____'IM_________________'IM
       'IM,______'IM,_____'IM,________________IM; .
        'IM,______'IM,______'IM________.,mmmIMMMMMMMm,_
          IM,______'IM,______IM,__.mIMIMM''''._.._'IMMMM
          'IM,______'IM______mIMIMM''._._._._._.,mM'   'M
           IMm,_____;IM___,IIMM'_._._._._._..,mMM'
           'IMMIMIMMIMM,,IMM'_._._._._.,mMMMMM'
            ,IM'._._.'IMIM'._._._.,mMMMMMMMM'
          ,IM_._._._.,IMM'._._._,mMMMMMMMMM'
         IM._._._.,mIIMM,._._..mMMMMMMMMMM'
        ,M'..,mIMMIMMIMMIMmmmMMMMMMMMMМММ'
        IM.,IMI'''        ''IIMMMMMMMMMMM
       ;IMIM'                  ''IMMMMMMM
       ''                         'IMMMMM
                                    'IMMM                                    ,
                                     'IMM,                                   ,
                                      'IMM                                   ,
                                       'MM,                                  ,
                                        IMM,                                 ,
                                        'IMM           .mIMMIMMIMMIMMIMM,    ,
                  .,mIMMIMMIMM,_,mIMM,   IMM'        ,mIM'._._._._'IM,..M,   ,
                ,IMMM'_._._._'IMM._'M,   IMM       ,IM'._._._.__-_-;IM__M,   ,
              .mIM'_._._.__(_.-'IM._MM   'MM,    ,M'._._.--_+_.;mIMIMIM,_M,  ,
             ,IM'._._.__(_._.-;,IMIMIMMM__IMM   ,M'._.__(_.-mIM''   'IM,-M   ,
            ,IM'._._._(_._.-;,mIM'  `'IMM_IMM   IM._.__(_.mM'         'IMI   ,
           ,IM_._.__(_._.-;,mIM'      'IMMMMM   MM,.__(_,mM            'M'   ,
           IM'._.__(_._.;,mIM'          'IIMMM_,IMIM,.,IM'                   ,
           IM_._._(_._.,mIM'              IMMMMMMM'_'''                      ,
           `IM,.__(_;,mIM'                 IIMMM                             ,
            'IMI,_(),mIM'                   IMMM                             ,
              'IMMMM'                    '''IMM                              ,
                ''                        __IMM                              ,
                                         __IMM                               ,
                                          IMM'''                             ,
                                           IMM                               ,
                                           IMM                               ,
                                           IMM                               ,
                                         '''IMM                              ,
                                           IMM                               ,
                                           IMM                               ,
                                           IMM__                             ,
                                          IMM''                              ,