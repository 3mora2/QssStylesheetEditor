;����һ�������������ݵ�7zѹ��������ִ���ļ�ͷ����ʹ7-zip�򿪿������������ݡ�
#!system '>blank set/p=MSCF< '
#!packhdr temp.dat 'cmd /c Copy /b temp.dat /b + blank && del blank'
;!packhdr temp.dat 'cmd /c Copy /B temp.dat /B +hust.dat temp.dat'

/******************************
 *  �������......            *
 ******************************/
#!define tst ;��ʾ���ԣ���������ļ�����Լʱ��
#!define bind "bind" ;���԰汾
#!define bind "bin" ;��ʽ���ɰ汾;�����ļ�Ŀ¼bind(debug��),bin(release��)

/******************************
 *  �����ǰ�װ����            *
 ******************************/

; ��װ�����ʼ���峣��
!define Project "QssStylesheetEditor"     																#### please change
!define PRODUCT_NAME ${Project}																						#### please change
!define Exe_Name "AppStart"                                               #### please change
!define PRODUCT_VERSION "1.40" 																						#### please change
!define ProjectIcon "..\res\colorize.ico"	                              	#### please change
!define PRODUCT_PUBLISHER "lileilei"              												#### please change
!define PRODUCT_WEB_SITE "https://blog.csdn.net/hustlei/article/details/87887369"                       #### please change
!define PRODUCt_BRAND_TEXT "hustlei,2015 @wuhan"                          #### please change
!define StartMenuDir ${Project}						                          			#### please change

!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\${PRODUCT_NAME}.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

SetCompress auto
SetCompressor /SOLID lzma
#SetCompressor /SOLID bzip2
RequestExecutionLevel admin

!include "MUI2.nsh"
!include "nsDialogs.nsh"
!include "WordFunc.nsh"
!include "Assoc.nsh"

/********************************
 *  ��װ����ÿ������Ľ�������  *
 ********************************/
; ------ MUI �ִ����涨�� (1.67 �汾���ϼ���) ------

; MUI(����) Ԥ���峣��
!define MUI_ABORTWARNING
; �޸�ͼ��
!define MUI_ICON ${ProjectIcon}				                              	#### please change
!define MUI_UNICON "uninstall.ico"
; �޸Ļ�ӭ����ɱ���ɫ
!define MUI_BGCOLOR F3F3F3
; �޸����ͼƬ
!define MUI_WELCOMEFINISHPAGE_BITMAP "side.bmp"                       #### please change
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\orange-uninstall.bmp"
; �޸�HeadͼƬ
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP "..\res\colorize.ico"                  #### please change
#!define MUI_HEADERIMAGE_BITMAP_NOSTRETCH
#!define MUI_HEADERIMAGE_UNBITMAP "${NSISDIR}\Contrib\Graphics\Header\orange-uninstall.bmp"

; �޸Ļ�ӭҳ���ı�
!define MUI_WELCOMEPAGE_TITLE "$\r$\n��ӭʹ�� ${PRODUCT_NAME} v${PRODUCT_VERSION} ��װ����"
!define MUI_WELCOMEPAGE_TEXT "$\r$\n������򽫰�װ${PRODUCT_NAME}�����������б���������\
$\r$\n�ڿ�ʼ��װ֮ǰ�������ȹر�����Ӧ�ó����Ա㡰��װ���򡱸���ָ����ϵͳ�ļ� \
$\r$\n$\r$\n$\r$\n���[��һ��(N)]������"
; �޸����ҳ���ı�
!define MUI_LICENSEPAGE_TEXT_BOTTOM \
"�����������Э����������[�ҽ���(I)]������װ���������Э����ܰ�װ�������"
; �޸����ҳ���ı�
#!define MUI_COMPONENTSPAGE_SMALLDESC ;˵��λ�����ѡ����·�����Ƚ�С
#!define MUI_COMPONENTSPAGE_TEXT_TOP "ѡ������Ҫ��װ�����������[��һ��(N)]������"
#!define MUI_COMPONENTSPAGE_TEXT_DESCRIPTION_TITLE ""
#!define MUI_COMPONENTSPAGE_TEXT_DESCRIPTION_INFO "ѡ����Ҫ��װ�����������ѡ��Ĭ�����á�"
!define MUI_COMPONENTSPAGE_TEXT_INSTTYPE "ѡ����Ҫ��װ�����:"
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "-------------------"


; ��ӭҳ��
!define MUI_PAGE_CUSTOMFUNCTION_SHOW show
!insertmacro MUI_PAGE_WELCOME
; ���Э��ҳ��
!insertmacro MUI_PAGE_LICENSE "License.rtf"                       	#### please change
; ���ѡ��ҳ��
!insertmacro MUI_PAGE_COMPONENTS
;�Զ��尲װҳ��
#!define MUI_PAGE_CUSTOMFUNCTION_SHOW shownet                       #### please change
; ��װĿ¼ѡ��ҳ��
!insertmacro MUI_PAGE_DIRECTORY

; ��װ����ҳ��
!insertmacro MUI_PAGE_INSTFILES
; ��ʾ�Զ��尲װҳ��
!define MUI_PAGE_CUSTOMFUNCTION_SHOW show                           #### please change
; ��װ���ҳ��
!define MUI_FINISHPAGE_RUN "$INSTDIR\${Exe_Name}.exe"
#!define MUI_FINISHPAGE_RUN_NOTCHECKED                              #### please change
#ָ����װ��ɺ��Ƿ�����Ӧ�ó��� checkbox Ϊ��ѡ��״̬
!insertmacro MUI_PAGE_FINISH

; ��װж�ع���ҳ��
!insertmacro MUI_UNPAGE_INSTFILES

; ��װ�����������������
!insertmacro MUI_LANGUAGE "SimpChinese"

/******************************
 *  �����ǰ�װ����            *
 ******************************/

ChangeUI IDD_SELCOM myui.exe
Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "..\dist\${Project}${PRODUCT_VERSION}_win_Installer.exe"                   	    #### please change
InstallDir "$PROGRAMFILES\${Project}"
InstallDirRegKey HKLM "${PRODUCT_UNINST_KEY}" "UninstallString"
ShowInstDetails show
ShowUnInstDetails show
BrandingText "${PRODUCt_BRAND_TEXT}"
; ��װԤ�ͷ��ļ�
#ReserveFile '${NSISDIR}\Plugins\InstallOptions.dll'
ReserveFile "${NSISDIR}\Plugins\nsWater.dll"
ReserveFile "${NSISDIR}\Plugins\SkinH.dll"
ReserveFile skinh.she
; ------ MUI �ִ����涨����� ------


/****************************
 *  �����ǳ���װ��������  *
 ****************************/

!ifndef NOINSTTYPES
#    InstType "Default"  ;���Ͱ�װ �Ƽ�  ����                  		#### please change
#    InstType "Full"     ;��ȫ��ȫ
#    InstType "Minimal"  ;��С��װ
!endif

Section "!QssStylesheetEditor" SEC0                               #### please change
	SectionIn 1 RO
  SetOverwrite ifnewer
  SetOutPath "$INSTDIR"
  File /r /x ".git" "..\dist\build\*.*"
  Sleep 1000
SectionEnd

Section "����epub�ļ�" SEC1                                     	#### please change
	SectionIn 1 RO
	!insertmacro Assoc "qss,qsst" "qss" "qss��ʽ�ļ�" "$INSTDIR\${Exe_Name}.exe" \
											 "$INSTDIR\scripts\res\qss.ico"
		System::Call 'Shell32::SHChangeNotify(i 0x8000000, i 0, i 0, i 0)'
		Sleep 500
SectionEnd

Section -AdditionalIcons
  SetOutPath "$INSTDIR"
  CreateDirectory "$SMPROGRAMS\${StartMenuDir}"
  CreateShortCut "$SMPROGRAMS\${StartMenuDir}\${Project}.lnk" "$INSTDIR\${Exe_Name}.exe"
  CreateShortCut "$DESKTOP\${Project}.lnk" "$INSTDIR\${Exe_Name}.exe"
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\${StartMenuDir}\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\${StartMenuDir}\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "${ProjectIcon}" "$INSTDIR\${Exe_Name}.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\bin\rc4net.dll"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd

# ������������
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN                 #### please change
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC0} "QssStylesheetEditor����"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC1} "����.qss,.qsst�ļ�"
!insertmacro MUI_FUNCTION_DESCRIPTION_END


/******************************
 *  �����ǰ�װ�����ж�ز���  *
 ******************************/

Section Uninstall                                           #### please change
	;Ϊ�˷���������û�й����ļ���ʽ������ȡ������
	!insertmacro UnAssoc "qss,qsst"
	!insertmacro UnAssoc "qss"
	!insertmacro UnAssoc "qsst"
	System::Call 'Shell32::SHChangeNotify(i 0x8000000, i 0, i 0, i 0)'

	Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\${Exe_Name}.exe"
  RMDir /r "$INSTDIR\*.*"

  Delete "$SMPROGRAMS\${StartMenuDir}\Uninstall.lnk"
  Delete "$SMPROGRAMS\${StartMenuDir}\Website.lnk"
  Delete "$SMPROGRAMS\${StartMenuDir}\${Project}.lnk"
  RMDir "$SMPROGRAMS\${StartMenuDir}"
  
  Delete "$DESKTOP\${Project}.lnk"

  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd


/********************************
 *  �����ǻص��������Զ��庯��  *
 ********************************/
#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#

Function .onInit
	#Ƥ��
  InitPluginsDir
  SetOutPath $PLUGINSDIR
  File "${NSISDIR}\Plugins\SkinH.dll"
#  File "${NSISDIR}\Plugins\nsWater.dll"
  
  File skinh.she
  System::Call SkinH::SkinH_Attach()
	################ SkinSharp����, ��С�·�����ʾ ################
  System::Call Kernel32::GetModuleHandle(t"SkinH.dll")i.r0
  IntOp $0 $0 + 0x0002CA98
  System::Call Kernel32::GetCurrentProcess()i.s
  System::Call Kernel32::VirtualProtectEx(is,ir0,i4,i0x40,*i)
  System::Call "*$0(&i1 0)"
  ###############################################################

	#����sectiongroupֻ��
#	IntOp $0 ${SF_SECGRP} | ${SF_RO}
#	SectionSetFlags ${SEC0} $0
#	SectionSetFlags ${SEC1} $0

	#��ֹ�����װ����ʵ��
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "JWBClient") i .r1 ?e'
	Pop $R0
	StrCmp $R0 0 +3
	MessageBox MB_OK|MB_ICONEXCLAMATION "��װ�����Ѿ������С�"
	Abort
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "��ȷʵҪ��ȫ�Ƴ� $(^Name) ���������е������" IDYES +2
  Abort
FunctionEnd

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) �ѳɹ��ش����ļ�����Ƴ���"
FunctionEnd

Function show
	${If} $mui.finishPage == ""
	  GetDlgItem $0 $mui.welcomePage 1200
	${Else}
	  GetDlgItem $0 $mui.finishPage 1200
	${EndIf}
	System::Call 'User32::GetWindowLong(i r0, i ${GWL_STYLE})i.r1'
	System::Call 'User32::SetWindowLong(i r0, i ${GWL_STYLE}, i $1|${SS_NOTIFY})'
	SendMessage $0 ${STM_GETIMAGE} 0 0 $1
	nsWater::Set $0 $1
	!define WM_SETBLOB 0x0470
	; WM_SETBLOBΪ�Զ�����Ϣ������������������ˮ����С
	; wParam   ˮ�ư뾶�����ˮ�ƿ�������Χ���㡣
	; lParam   ˮ�Ƹ߶ȣ����ˮ�ƿ��������
	SendMessage $0 ${WM_SETBLOB} 10 1000        ;����һ����״��ʼˮ��
	SendMessage $0 ${WM_MOUSEMOVE} 0 0x00E60052 ;������״ˮ��00E6��ʾy���꣬0052��ʾx����
	SendMessage $0 ${WM_SETBLOB} 3 50           ;��������ƶ�ˮ��
FunctionEnd
