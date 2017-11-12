;;
;;  he_IL.nsh
;;
;;  Hebrew language strings for the Xiphos installer.
;;
;;  Version 1
;;

;--------------------------------
; Text for page with release notes

!insertmacro ReadmeLangStrings "" "${LANG_HEBREW}" \
    "Release Notes" \
    "Please review the following important information." \
    "About $(^name):" \
    "$\n  Click on scrollbar arrows or press Page Down to review the entire text."


;--------------------------------
; Components Page

LangString ALLUSERS_SECTITLE ${LANG_HEBREW} "Install for All Users"
LangString STARTMENU_SECTITLE ${LANG_HEBREW} "Start Menu Shortcuts"
LangString DESKTOP_SECTITLE ${LANG_HEBREW} "Desktop Shortcut"
LangString QUICKLAUNCH_SECTITLE ${LANG_HEBREW} "Quick Launch Icon"

