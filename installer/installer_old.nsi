SetCompress force ;ʼ��ѹ��,��ѹ���ᱻ360��Malware.QVM06.GEN����
SetCompressor /FINAL lzma  ;ʹ��zip�ᱻ360��Ϊ���� ;/FINAL ����ߵ��õ� SetCompressor ���ᱻ���ԡ�
                           ;/SOLID ���е����ݽ���ѹ����һ��������������ѹ���ʡ�ʹ��SOLIDʱ��SetCompress������Ч���п��ܻᱻ360��Ϊ����
RequestExecutionLevel admin ;��Ҫдע�������Ҫ����ԱȨ��

;����һ�������������ݵ�7zѹ��������ִ���ļ�ͷ����ʹ7-zip�򿪿������������ݡ�
!system '>blank set/p=MSCF<nul'
!packhdr temp.dat 'cmd /c Copy /b temp.dat /b + blank && del blank'
; �������
!define tst ;��ʾ���ԣ���������ļ�����Լʱ��
#!define bin "bind" ;���԰汾
#!define bin "bin" ;��ʽ���ɰ汾;

/*** ���� ***/ ; ��װ�����ʼ���峣��
;--------------------------------
!define Project "QssStylesheetEditor" ;��Ŀ����
!define ProductName ${Project} ;��Ʒ��������Ŀ����ͬ
!define FileName "AppStart" ;.exe�ļ���,���������exe����
!define ProductVersion "1.4.0" ;�汾
!define ProductPublisher "lileilei" ;������
!define ProductWebsite "https://blog.csdn.net/hustlei/article/details/87887369" ;��վ��ַ
!define Year "2019"
!define ProductBrandText "hustlei,${Year} @wuhan" ;Ʒ��,��������
!define StartMenuDir ${ProductName} ;�����װĬ���ļ�������
!define IconInst "..\res\colorize.ico" ;��װ��ͼ��
!define IconUninst "uninstall.ico" ;��װ��ͼ��

!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\${ProductName}.exe" ;���λ��ע���keyֵ������.exe������ʲô������ProductName
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${ProductName}" ;ж��ע���key
!define PRODUCT_UNINST_ROOT_KEY "HKLM" ;ע���λ��

Name "${ProductName} ${ProductVersion}" ;����
OutFile "..\dist\${ProductName}${ProductVersion}_win_x64_Installer.exe" ;��װ������
InstallDir "$PROGRAMFILES\${ProductName}" ;installerλ��
InstallDirRegKey HKLM "${PRODUCT_UNINST_KEY}" "UninstallString" ;����Ѿ���װ�˱����������ע�����Ұ�װĿ¼��ʹ�ø�ֵ������InstallDir


/*** ��װ���� ***/
;--------------------------------
;;; MUI(����) Ԥ���峣�� ;MUI �ִ����涨�� (1.67 �汾���ϼ���)
!define MUI_ICON ${IconInst} ; �޸İ�װ��ͼ��
!define MUI_UNICON ${IconUninst} ;�޸�ж��ͼ��
!define MUI_BGCOLOR F3F3F3 ; �޸Ļ�ӭ�����ҳ�汳��ɫ ++++++
!define MUI_WELCOMEFINISHPAGE_BITMAP "side.bmp"  ;��ӭ�ͽ���ҳ������ͼƬ(�Ƽ��ߴ�: 164x314 ����).
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Wizard\orange-uninstall.bmp" ;����ж��ҳ������ͼƬ(�Ƽ��ߴ�: 164x314 ����).
!define MUI_HEADERIMAGE ;�޸�HeadͼƬ
!define MUI_HEADERIMAGE_LEFT ;HeadͼƬλ��
!define MUI_HEADERIMAGE_BITMAP "header.bmp"
#!define MUI_HEADERIMAGE_BITMAP_NOSTRETCH
!define MUI_HEADERIMAGE_UNBITMAP "${NSISDIR}\Contrib\Graphics\Header\orange-uninstall.bmp"

; �޸Ļ�ӭҳ���ı�ѡ��
!define MUI_WELCOMEPAGE_TITLE "��ӭʹ�� ${ProductName} v${ProductVersion} ��װ����"
!define MUI_WELCOMEPAGE_TEXT "$\r$\n������򽫰�װ${ProductName}�����������б���������\
$\r$\n�ڿ�ʼ��װ֮ǰ�������ȹر�����Ӧ�ó����Ա㡰��װ���򡱸���ָ����ϵͳ�ļ� \
$\r$\n$\r$\n$\r$\n���[��һ��(N)]������"
; �޸����ҳ���ı�
!define MUI_LICENSEPAGE_TEXT_BOTTOM \
"�����������Э����������[�ҽ���(I)]������װ���������Э����ܰ�װ�������"
; �޸����ҳ���ı�
!define MUI_COMPONENTSPAGE_TEXT_TOP "ѡ������Ҫ��װ�����������[��һ��(N)]������" ;ѡ����Ϸ�˵������
!define MUI_COMPONENTSPAGE_TEXT_INSTTYPE "ѡ��װ����:" ;��װ����Full classicѡ���ǰ����
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "ѡ��װ���ͣ������Զ���ѡ�����" ;ѡ��װ����˵��
!define MUI_COMPONENTSPAGE_TEXT_DESCRIPTION_TITLE "���˵��" ;˵�������
!define MUI_COMPONENTSPAGE_SMALLDESC ;˵��λ�����ѡ����·�����Ƚ�Сmyui.exe��Ч
#!define MUI_COMPONENTSPAGE_TEXT_DESCRIPTION_INFO "����������ϲ鿴˵����"  #��û��ѡ�������˵������ʾ����
; ����ҳ�湫�õ��ı�
BrandingText "${ProductBrandText}" ;����ҳ�涼��ʾ��brand��Ϣ

!include "MUI2.nsh"
!include "Assoc.nsh"
#!include "nsDialogs.nsh"
#!include "WordFunc.nsh"
;;; ��װҳ��
!define MUI_LANGDLL_ALLLANGUAGES
;Remember the installer language
!define MUI_LANGDLL_REGISTRY_ROOT "HKCU"
!define MUI_LANGDLL_REGISTRY_KEY "Software\Modern UI Test"
!define MUI_LANGDLL_REGISTRY_VALUENAME "Installer Language"
  #!define MUI_PAGE_CUSTOMFUNCTION_SHOW show ;��ӭҳ�����ú���
!insertmacro MUI_PAGE_WELCOME ;1.��ӭҳ��
!insertmacro MUI_PAGE_LICENSE "License.rtf" ;2.���Э��ҳ��
!insertmacro MUI_PAGE_COMPONENTS ;3.���ѡ��ҳ��
  ShowInstDetails show ;�����Ƿ���ʾ��װ��ϸ��Ϣ�����������ʹ�� SetDetailsView �������������á�
  ShowUnInstDetails show
  #ChangeUI IDD_SELCOM myui.exe ;�޸�ѡ�����ҳ���ui,myui.exeĬ��˵���������,�ռ�Ƚϴ�
  #!define MUI_PAGE_CUSTOMFUNCTION_SHOW shownet ;4.�Զ��尲װҳ��
!insertmacro MUI_PAGE_DIRECTORY ;5.��װĿ¼ѡ��ҳ��
!insertmacro MUI_PAGE_INSTFILES ;6.��װ����ҳ��
  !define MUI_FINISHPAGE_RUN "$INSTDIR\${FileName}.exe" ;����ҳ���Ƿ���ʾ���г���ѡ��
  !define MUI_FINISHPAGE_RUN_NOTCHECKED ;��װ��ɺ��Ƿ�����Ӧ�ó��� checkbox Ϊ��ѡ��״̬
!insertmacro MUI_PAGE_FINISH ;7.��װ���ҳ��

;!insertmacro MUI_UNPAGE_WELCOME
;!insertmacro MUI_UNPAGE_CONFIRM
;!insertmacro MUI_UNPAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
;!insertmacro MUI_UNPAGE_COMPONENTS
;!insertmacro MUI_UNPAGE_DIRECTORY
;!insertmacro MUI_UNPAGE_INSTFILES
;!insertmacro MUI_UNPAGE_FINISH
!insertmacro MUI_UNPAGE_INSTFILES ;��װж�ع���ҳ��

!define MUI_ABORTWARNING ;���û�Ҫ�رհ�װ����ʱ, ��ʾһ��������Ϣ��
!define MUI_UNABORTWARNING ;���û�Ҫ�ر�ж�س���ʱ, ��ʾһ��������Ϣ��
!define MUI_FINISHPAGE_NOAUTOCLOSE ;���Զ��������ҳ��, �����û���鰲װ��¼
!define MUI_UNFINISHPAGE_NOAUTOCLOSE ;���Զ��������ҳ��, �����û����ж�ؼ�¼

#ReserveFile "my.dll" #�����ʹ���˹�ʵѹ������װǰʹ�õ��ļ����봢�������ݿ�Ŀ�ʼ����������İ�װ���������ĸ��졣��������κͺ���֮ǰ��Ϊ��Щ�ļ�ʹ��Ԥ���ļ����


; ��װ�����������������
!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "English"
#!insertmacro MUI_LANGUAGE "TradChinese"
!insertmacro MUI_RESERVEFILE_LANGDLL ;Ԥ���ͷ�����ѡ��Ի�����Դ
#!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

#��װ���ļ���������
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${ProductName}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "${ProductVersion}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${ProductName}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${ProductVersion}" ;���ȼ�VIFileVersion>VIProductVersion>FileVersion����������ֻ��ʾһ��
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "${ProductName} ${ProductVersion}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "${ProductPublisher}"
;VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" "${ProductName} is a trademark of ${ProductPbulisher}" ;�̱�
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "Copyright (C) ${Year} ${ProductPublisher}" ;��Ȩ

!define LANG_CHINESE 2052
VIAddVersionKey /LANG=${LANG_CHINESE} "ProductName" "${ProductName}"
VIAddVersionKey /LANG=${LANG_CHINESE} "ProductVersion" "${ProductVersion}"
VIAddVersionKey /LANG=${LANG_CHINESE} "FileDescription" "${ProductName}"
VIAddVersionKey /LANG=${LANG_CHINESE} "FileVersion" "${ProductVersion}"
VIAddVersionKey /LANG=${LANG_CHINESE} "Comments" "${ProductName} ${ProductVersion}"
VIAddVersionKey /LANG=${LANG_CHINESE} "CompanyName" "${ProductPublisher}"
;VIAddVersionKey /LANG=${LANG_CHINESE} "LegalTrademarks" "${ProductName} is a trademark of ${ProductPbulisher}" ;�̱�
VIAddVersionKey /LANG=${LANG_CHINESE} "LegalCopyright" "��Ȩ���� (C) ${Year} ${ProductPublisher}"

VIProductVersion "1.4.0.0}" ;���붨�����VIFileVersion���ܱ���ͨ��
VIFileVersion "1.4.0.0"

/*** ����װѡ������ļ� ***/
;--------------------------------
; ��װ�����б�
!ifndef NOINSTTYPES
  InstType "Default" ;����
  InstType "Full" ;��ȫ
  InstType "Minimal" ;��С��
  #�Զ�����Ĭ�Ͼ��еģ�����Ҫ�Լ����
!endif

;����
Section "!QssStylesheetEditor" SEC0 ;
  SectionIn 1 2 3 RO   #�ڵ�1 2 3��instType�ڣ�ROָ�����޸�
  SetOverwrite ifnewer
  !ifndef tst
    SetOutPath "$INSTDIR"
    File /r /x ".git" "..\dist\build\*.*"
    Sleep 1000
  !endif
SectionEnd

Section "����qss�ļ�" SEC1                                     	#### please change
  SectionIn 1 2
    !insertmacro Assoc "qss,qsst" "qss" "qss��ʽ�ļ�" "$INSTDIR\${ProductName}.exe" "$INSTDIR\scripts\res\qss.ico"
    System::Call 'Shell32::SHChangeNotify(i 0x8000000, i 0, i 0, i 0)'
    Sleep 500
SectionEnd

# ������������
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN                 #### please change
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC0} "QssStylesheetEditor����"
  !insertmacro MUI_DESCRIPTION_TEXT ${SEC1} "����.qss,.qsst�ļ�"
!insertmacro MUI_FUNCTION_DESCRIPTION_END

;LangString DESC_Section1 ${LANG_ENGLISH} "�������� 1."
;LangString DESC_Section2 ${LANG_ENGLISH} "�������� 2."

;!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
;  !insertmacro MUI_DESCRIPTION_TEXT ${Section1} $(DESC_Section1)
;  !insertmacro MUI_DESCRIPTION_TEXT ${Section2} $(DESC_Section2)
;!insertmacro MUI_FUNCTION_DESCRIPTION_END


# ע�����ݷ�ʽ��
Section -AdditionalIcons
  SetOutPath "$INSTDIR"
  CreateDirectory "$SMPROGRAMS\${StartMenuDir}"
  CreateShortCut "$SMPROGRAMS\${StartMenuDir}\${Project}.lnk" "$INSTDIR\${ProductName}.exe"
  CreateShortCut "$DESKTOP\${Project}.lnk" "$INSTDIR\${ProductName}.exe"
  WriteIniStr "$INSTDIR\${Project}.url" "InternetShortcut" "URL" "${ProductWebsite}"
  CreateShortCut "$SMPROGRAMS\${StartMenuDir}\Website.lnk" "$INSTDIR\${Project}.url"
  CreateShortCut "$SMPROGRAMS\${StartMenuDir}\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "${IconInst}" "$INSTDIR\${ProductName}.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  #WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\bin\rc4net.dll"    #
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${ProductVersion}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${ProductWebsite}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${ProductPublisher}"
SectionEnd



;ж�ز���
Section Uninstall                                           #### please change
	;Ϊ�˷���������û�й����ļ���ʽ������ȡ������
	!insertmacro UnAssoc "qss,qsst"
	!insertmacro UnAssoc "qss"
	!insertmacro UnAssoc "qsst"
	System::Call 'Shell32::SHChangeNotify(i 0x8000000, i 0, i 0, i 0)'

	Delete "$INSTDIR\${Project}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\${ProductName}.exe"
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


/*** �ص��������Զ��庯�� ***/ ;����NSIS�ű��༭��������Function���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#
;--------------------------------
Function .onInit
  #!insertmacro MUI_LANGDLL_DISPLAY ;����ѡ��Ի���
  Push ""
  Push ${LANG_SIMPCHINESE}
  Push "��������"
  Push ${LANG_ENGLISH}
  Push English
  Push A ; A means auto count languages      ; for the auto count to work the first empty push (Push "") must remain

  StrCpy $0 "1033"
  System::Call "Kernel32::GetSystemDefaultLangID(v ..) i .s"
  #IfErrors 0 +3
  Pop $0
  IntOp $0 $0 & 0xFFFF

  ${If} $0 == "2052"
  LangDLL::LangDialog "����ѡ��" "��ѡ��װ������ʹ�õ����ԣ�"
  ${Else}
  LangDLL::LangDialog "Installer Language" "Please select the language of the installer"
  ${EndIf}
  
  Pop $LANGUAGE
  StrCmp $LANGUAGE "cancel" 0 +2
  Abort
  

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
  !insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "��ȷʵҪ��ȫ�Ƴ� $(^Name) ���������е������" IDYES +2
  Abort
FunctionEnd

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) �ѳɹ��ش����ļ�����Ƴ���"
FunctionEnd
