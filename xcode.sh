#!/bin/bash

NC='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'
UNDERLINE='\033[4m'
BLINK='\033[5m'
REVERSE='\033[7m'
HIDDEN='\033[8m'

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

BRIGHT_BLACK='\033[90m'
BRIGHT_RED='\033[91m'
BRIGHT_GREEN='\033[92m'
BRIGHT_YELLOW='\033[93m'
BRIGHT_BLUE='\033[94m'
BRIGHT_MAGENTA='\033[95m'
BRIGHT_CYAN='\033[96m'
BRIGHT_WHITE='\033[97m'

BG_BLACK='\033[40m'
BG_RED='\033[41m'
BG_GREEN='\033[42m'
BG_YELLOW='\033[43m'
BG_BLUE='\033[44m'
BG_MAGENTA='\033[45m'
BG_CYAN='\033[46m'
BG_WHITE='\033[47m'

BG_BRIGHT_BLACK='\033[100m'
BG_BRIGHT_RED='\033[101m'
BG_BRIGHT_GREEN='\033[102m'
BG_BRIGHT_YELLOW='\033[103m'
BG_BRIGHT_BLUE='\033[104m'
BG_BRIGHT_MAGENTA='\033[105m'
BG_BRIGHT_CYAN='\033[106m'
BG_BRIGHT_WHITE='\033[107m'

print_info() {
  echo -e "\n  ${BG_BLUE}${BRIGHT_WHITE}${BOLD} INFO ${NC} ${BOLD}$1${NC}\n"
}

print_success() {
  echo -e "\n  ${BG_GREEN}${BRIGHT_WHITE}${BOLD} SUCCESS ${NC} ${BOLD}$1${NC}\n"
}

print_warning() {
  echo -e "\n  ${BG_YELLOW}${BRIGHT_WHITE}${BOLD} WARNING ${NC} ${BOLD}$1${NC}\n"
}

print_error() {
  echo -e "\n  ${BG_RED}${BRIGHT_WHITE}${BOLD} ERROR ${NC} ${BOLD}$1${NC}\n"
}

log_info() {
  echo -e "${BOLD}${CYAN}$1${NC}"
}

log_success() {
  echo -e "${BOLD}${GREEN}$1${NC}"
}

log_error() {
  echo -e "${BOLD}${RED}$1${NC}"
}

select_language() {
  clear
  echo -e "${BOLD}${BLUE}"
  echo "    ╔══════════════════════════════════════════════╗"
  echo "    ║  ✦ XCODE INSTALLER v3.0 ✦                  ║"
  echo "    ║  🚀 Pterodactyl Theme Manager               ║"
  echo "    ║  🌟 By Xyro                                 ║"
  echo "    ╚══════════════════════════════════════════════╝"
  echo -e "${NC}"
  echo -e "${BOLD}${YELLOW}  SELECT LANGUAGE / PILIH BAHASA:${NC}"
  echo ""
  echo -e "  ${BRIGHT_WHITE}[1]${NC} English"
  echo -e "  ${BRIGHT_WHITE}[2]${NC} Indonesia"
  echo -e "  ${BRIGHT_WHITE}[3]${NC} Malay"
  echo -e "  ${BRIGHT_WHITE}[4]${NC} Arabic"
  echo -e "  ${BRIGHT_WHITE}[5]${NC} Chinese"
  echo -e "  ${BRIGHT_WHITE}[6]${NC} Spanish"
  echo -e "  ${BRIGHT_WHITE}[7]${NC} French"
  echo ""
  echo -ne "${BOLD}➜ Select language: ${NC}"
  read -r LANG_CHOICE

  case $LANG_CHOICE in
    1) LANG="en" ;;
    2) LANG="id" ;;
    3) LANG="ms" ;;
    4) LANG="ar" ;;
    5) LANG="zh" ;;
    6) LANG="es" ;;
    7) LANG="fr" ;;
    *) LANG="en" ;;
  esac
  clear
}

get_text() {
  case $LANG in
    id)
      case $1 in
        title) echo "✦ XCODE INSTALLER v3.0 ✦" ;;
        subtitle) echo "🚀 Pterodactyl Theme Manager" ;;
        author) echo "🌟 Oleh Xyro" ;;
        menu_title) echo "📋 MENU UTAMA" ;;
        menu_theme) echo "🎨 Install Themes" ;;
        menu_blueprint) echo "🛠️ Install Blueprint Framework" ;;
        menu_reset) echo "🔄 Reset Panel" ;;
        menu_backup) echo "💾 Backup Panel" ;;
        menu_uninstall) echo "📦 Uninstall Panel" ;;
        menu_node) echo "🛡️ Create Node & Location" ;;
        menu_recovery) echo "🔑 Recovery Admin" ;;
        menu_exit) echo "❌ Keluar" ;;
        select_theme) echo "🎨 PILIH TEMA" ;;
        open_source) echo "--- TEMA OPEN SOURCE ---" ;;
        premium) echo "--- TEMA PREMIUM ---" ;;
        back) echo "🔙 Kembali" ;;
        install_confirm) echo "Lanjutkan instalasi? (y/n): " ;;
        install_start) echo "Memulai instalasi" ;;
        install_success) echo "berhasil diinstall! ✨" ;;
        install_failed) echo "Gagal menginstall" ;;
        blueprint_not_found) echo "Blueprint tidak ditemukan, menginstall..." ;;
        blueprint_installed) echo "Blueprint Framework berhasil diinstall! 🛠️" ;;
        reset_warning) echo "⚠️ Ini akan mereset panel ke default!" ;;
        reset_confirm) echo "Lanjutkan? (y/n): " ;;
        reset_cancel) echo "Dibatalkan." ;;
        reset_start) echo "Meriset panel..." ;;
        reset_success) echo "Panel berhasil direset! 🔄" ;;
        backup_start) echo "Membuat backup panel..." ;;
        backup_success) echo "Backup tersimpan di:" ;;
        uninstall_warning) echo "⚠️ Ini akan MENGHAPUS TOTAL panel!" ;;
        uninstall_confirm) echo "Lanjutkan? (y/n): " ;;
        uninstall_start) echo "Menghapus panel..." ;;
        uninstall_success) echo "Panel berhasil diuninstall! 📦" ;;
        node_start) echo "Membuat Node & Location..." ;;
        node_success) echo "Node & Location berhasil dibuat! 🛡️" ;;
        recovery_start) echo "Membuat user admin baru (Recovery)..." ;;
        recovery_username) echo "Masukkan Username: " ;;
        recovery_password) echo "Masukkan Password: " ;;
        recovery_success) echo "User admin berhasil dibuat! 🔑" ;;
        invalid) echo "Pilihan tidak valid!" ;;
        exit) echo "✨ Bye bye! (◕‿◕)♡" ;;
        *) echo "$1" ;;
      esac
      ;;
    ms)
      case $1 in
        title) echo "✦ XCODE INSTALLER v3.0 ✦" ;;
        subtitle) echo "🚀 Pterodactyl Theme Manager" ;;
        author) echo "🌟 Oleh Xyro" ;;
        menu_title) echo "📋 MENU UTAMA" ;;
        menu_theme) echo "🎨 Install Themes" ;;
        menu_blueprint) echo "🛠️ Install Blueprint Framework" ;;
        menu_reset) echo "🔄 Reset Panel" ;;
        menu_backup) echo "💾 Backup Panel" ;;
        menu_uninstall) echo "📦 Uninstall Panel" ;;
        menu_node) echo "🛡️ Create Node & Location" ;;
        menu_recovery) echo "🔑 Recovery Admin" ;;
        menu_exit) echo "❌ Keluar" ;;
        select_theme) echo "🎨 PILIH TEMA" ;;
        open_source) echo "--- TEMA OPEN SOURCE ---" ;;
        premium) echo "--- TEMA PREMIUM ---" ;;
        back) echo "🔙 Kembali" ;;
        install_confirm) echo "Teruskan pemasangan? (y/n): " ;;
        install_start) echo "Memulakan pemasangan" ;;
        install_success) echo "berjaya dipasang! ✨" ;;
        install_failed) echo "Gagal memasang" ;;
        blueprint_not_found) echo "Blueprint tidak dijumpai, memasang..." ;;
        blueprint_installed) echo "Blueprint Framework berjaya dipasang! 🛠️" ;;
        reset_warning) echo "⚠️ Ini akan mereset panel ke default!" ;;
        reset_confirm) echo "Teruskan? (y/n): " ;;
        reset_cancel) echo "Dibatalkan." ;;
        reset_start) echo "Meriset panel..." ;;
        reset_success) echo "Panel berjaya direset! 🔄" ;;
        backup_start) echo "Membuat backup panel..." ;;
        backup_success) echo "Backup disimpan di:" ;;
        uninstall_warning) echo "⚠️ Ini akan MENGHAPUS TOTAL panel!" ;;
        uninstall_confirm) echo "Teruskan? (y/n): " ;;
        uninstall_start) echo "Menghapus panel..." ;;
        uninstall_success) echo "Panel berjaya diuninstall! 📦" ;;
        node_start) echo "Membuat Node & Location..." ;;
        node_success) echo "Node & Location berjaya dibuat! 🛡️" ;;
        recovery_start) echo "Membuat user admin baru (Recovery)..." ;;
        recovery_username) echo "Masukkan Username: " ;;
        recovery_password) echo "Masukkan Password: " ;;
        recovery_success) echo "User admin berjaya dibuat! 🔑" ;;
        invalid) echo "Pilihan tidak sah!" ;;
        exit) echo "✨ Bye bye! (◕‿◕)♡" ;;
        *) echo "$1" ;;
      esac
      ;;
    ar)
      case $1 in
        title) echo "✦ XCODE INSTALLER v3.0 ✦" ;;
        subtitle) echo "🚀 مدير ثيمات Pterodactyl" ;;
        author) echo "🌟 بواسطة Xyro" ;;
        menu_title) echo "📋 القائمة الرئيسية" ;;
        menu_theme) echo "🎨 تثبيت الثيمات" ;;
        menu_blueprint) echo "🛠️ تثبيت إطار Blueprint" ;;
        menu_reset) echo "🔄 إعادة تعيين اللوحة" ;;
        menu_backup) echo "💾 نسخ احتياطي للوحة" ;;
        menu_uninstall) echo "📦 إلغاء تثبيت اللوحة" ;;
        menu_node) echo "🛡️ إنشاء عقدة وموقع" ;;
        menu_recovery) echo "🔑 استعادة المدير" ;;
        menu_exit) echo "❌ خروج" ;;
        select_theme) echo "🎨 اختر الثيم" ;;
        open_source) echo "--- ثيمات مفتوحة المصدر ---" ;;
        premium) echo "--- ثيمات مدفوعة ---" ;;
        back) echo "🔙 رجوع" ;;
        install_confirm) echo "هل تريد متابعة التثبيت؟ (y/n): " ;;
        install_start) echo "بدء تثبيت" ;;
        install_success) echo "تم التثبيت بنجاح! ✨" ;;
        install_failed) echo "فشل التثبيت" ;;
        blueprint_not_found) echo "Blueprint غير موجود، جارٍ التثبيت..." ;;
        blueprint_installed) echo "تم تثبيت Blueprint Framework بنجاح! 🛠️" ;;
        reset_warning) echo "⚠️ سيتم إعادة تعيين اللوحة إلى الوضع الافتراضي!" ;;
        reset_confirm) echo "هل تريد المتابعة؟ (y/n): " ;;
        reset_cancel) echo "تم الإلغاء." ;;
        reset_start) echo "جاري إعادة تعيين اللوحة..." ;;
        reset_success) echo "تم إعادة تعيين اللوحة بنجاح! 🔄" ;;
        backup_start) echo "جاري إنشاء نسخة احتياطية..." ;;
        backup_success) echo "تم حفظ النسخة الاحتياطية في:" ;;
        uninstall_warning) echo "⚠️ سيتم حذف اللوحة بالكامل!" ;;
        uninstall_confirm) echo "هل تريد المتابعة؟ (y/n): " ;;
        uninstall_start) echo "جاري حذف اللوحة..." ;;
        uninstall_success) echo "تم حذف اللوحة بنجاح! 📦" ;;
        node_start) echo "جاري إنشاء العقدة والموقع..." ;;
        node_success) echo "تم إنشاء العقدة والموقع بنجاح! 🛡️" ;;
        recovery_start) echo "جاري إنشاء مستخدم مدير جديد..." ;;
        recovery_username) echo "أدخل اسم المستخدم: " ;;
        recovery_password) echo "أدخل كلمة المرور: " ;;
        recovery_success) echo "تم إنشاء المستخدم المدير بنجاح! 🔑" ;;
        invalid) echo "خيار غير صالح!" ;;
        exit) echo "✨ وداعاً! (◕‿◕)♡" ;;
        *) echo "$1" ;;
      esac
      ;;
    zh)
      case $1 in
        title) echo "✦ XCODE INSTALLER v3.0 ✦" ;;
        subtitle) echo "🚀 Pterodactyl 主题管理器" ;;
        author) echo "🌟 作者 Xyro" ;;
        menu_title) echo "📋 主菜单" ;;
        menu_theme) echo "🎨 安装主题" ;;
        menu_blueprint) echo "🛠️ 安装 Blueprint 框架" ;;
        menu_reset) echo "🔄 重置面板" ;;
        menu_backup) echo "💾 备份面板" ;;
        menu_uninstall) echo "📦 卸载面板" ;;
        menu_node) echo "🛡️ 创建节点和位置" ;;
        menu_recovery) echo "🔑 恢复管理员" ;;
        menu_exit) echo "❌ 退出" ;;
        select_theme) echo "🎨 选择主题" ;;
        open_source) echo "--- 开源主题 ---" ;;
        premium) echo "--- 付费主题 ---" ;;
        back) echo "🔙 返回" ;;
        install_confirm) echo "继续安装？(y/n): " ;;
        install_start) echo "开始安装" ;;
        install_success) echo "安装成功！✨" ;;
        install_failed) echo "安装失败" ;;
        blueprint_not_found) echo "未找到 Blueprint，正在安装..." ;;
        blueprint_installed) echo "Blueprint Framework 安装成功！🛠️" ;;
        reset_warning) echo "⚠️ 这将重置面板为默认状态！" ;;
        reset_confirm) echo "继续？(y/n): " ;;
        reset_cancel) echo "已取消。" ;;
        reset_start) echo "正在重置面板..." ;;
        reset_success) echo "面板重置成功！🔄" ;;
        backup_start) echo "正在备份面板..." ;;
        backup_success) echo "备份保存在：" ;;
        uninstall_warning) echo "⚠️ 这将完全删除面板！" ;;
        uninstall_confirm) echo "继续？(y/n): " ;;
        uninstall_start) echo "正在删除面板..." ;;
        uninstall_success) echo "面板卸载成功！📦" ;;
        node_start) echo "正在创建节点和位置..." ;;
        node_success) echo "节点和位置创建成功！🛡️" ;;
        recovery_start) echo "正在创建新管理员用户..." ;;
        recovery_username) echo "输入用户名：" ;;
        recovery_password) echo "输入密码：" ;;
        recovery_success) echo "管理员用户创建成功！🔑" ;;
        invalid) echo "无效选项！" ;;
        exit) echo "✨ 再见！(◕‿◕)♡" ;;
        *) echo "$1" ;;
      esac
      ;;
    es)
      case $1 in
        title) echo "✦ XCODE INSTALLER v3.0 ✦" ;;
        subtitle) echo "🚀 Gestor de Temas Pterodactyl" ;;
        author) echo "🌟 Por Xyro" ;;
        menu_title) echo "📋 MENÚ PRINCIPAL" ;;
        menu_theme) echo "🎨 Instalar Temas" ;;
        menu_blueprint) echo "🛠️ Instalar Blueprint Framework" ;;
        menu_reset) echo "🔄 Restablecer Panel" ;;
        menu_backup) echo "💾 Respaldar Panel" ;;
        menu_uninstall) echo "📦 Desinstalar Panel" ;;
        menu_node) echo "🛡️ Crear Nodo y Ubicación" ;;
        menu_recovery) echo "🔑 Recuperar Administrador" ;;
        menu_exit) echo "❌ Salir" ;;
        select_theme) echo "🎨 SELECCIONAR TEMA" ;;
        open_source) echo "--- TEMAS DE CÓDIGO ABIERTO ---" ;;
        premium) echo "--- TEMAS PREMIUM ---" ;;
        back) echo "🔙 Volver" ;;
        install_confirm) echo "¿Continuar con la instalación? (y/n): " ;;
        install_start) echo "Iniciando instalación de" ;;
        install_success) echo "¡instalado con éxito! ✨" ;;
        install_failed) echo "Error al instalar" ;;
        blueprint_not_found) echo "Blueprint no encontrado, instalando..." ;;
        blueprint_installed) echo "¡Blueprint Framework instalado con éxito! 🛠️" ;;
        reset_warning) echo "⚠️ ¡Esto restablecerá el panel a su estado predeterminado!" ;;
        reset_confirm) echo "¿Continuar? (y/n): " ;;
        reset_cancel) echo "Cancelado." ;;
        reset_start) echo "Restableciendo panel..." ;;
        reset_success) echo "¡Panel restablecido con éxito! 🔄" ;;
        backup_start) echo "Creando respaldo del panel..." ;;
        backup_success) echo "Respaldo guardado en:" ;;
        uninstall_warning) echo "⚠️ ¡Esto ELIMINARÁ COMPLETAMENTE el panel!" ;;
        uninstall_confirm) echo "¿Continuar? (y/n): " ;;
        uninstall_start) echo "Eliminando panel..." ;;
        uninstall_success) echo "¡Panel desinstalado con éxito! 📦" ;;
        node_start) echo "Creando Nodo y Ubicación..." ;;
        node_success) echo "¡Nodo y Ubicación creados con éxito! 🛡️" ;;
        recovery_start) echo "Creando nuevo usuario administrador..." ;;
        recovery_username) echo "Ingrese nombre de usuario: " ;;
        recovery_password) echo "Ingrese contraseña: " ;;
        recovery_success) echo "¡Usuario administrador creado con éxito! 🔑" ;;
        invalid) echo "¡Opción no válida!" ;;
        exit) echo "✨ ¡Adiós! (◕‿◕)♡" ;;
        *) echo "$1" ;;
      esac
      ;;
    fr)
      case $1 in
        title) echo "✦ XCODE INSTALLER v3.0 ✦" ;;
        subtitle) echo "🚀 Gestionnaire de Thèmes Pterodactyl" ;;
        author) echo "🌟 Par Xyro" ;;
        menu_title) echo "📋 MENU PRINCIPAL" ;;
        menu_theme) echo "🎨 Installer des Thèmes" ;;
        menu_blueprint) echo "🛠️ Installer Blueprint Framework" ;;
        menu_reset) echo "🔄 Réinitialiser le Panneau" ;;
        menu_backup) echo "💾 Sauvegarder le Panneau" ;;
        menu_uninstall) echo "📦 Désinstaller le Panneau" ;;
        menu_node) echo "🛡️ Créer un Nœud et un Emplacement" ;;
        menu_recovery) echo "🔑 Récupération Admin" ;;
        menu_exit) echo "❌ Quitter" ;;
        select_theme) echo "🎨 CHOISIR UN THÈME" ;;
        open_source) echo "--- THÈMES OPEN SOURCE ---" ;;
        premium) echo "--- THÈMES PREMIUM ---" ;;
        back) echo "🔙 Retour" ;;
        install_confirm) echo "Continuer l'installation ? (y/n): " ;;
        install_start) echo "Début de l'installation de" ;;
        install_success) echo "installé avec succès ! ✨" ;;
        install_failed) echo "Échec de l'installation" ;;
        blueprint_not_found) echo "Blueprint introuvable, installation en cours..." ;;
        blueprint_installed) echo "Blueprint Framework installé avec succès ! 🛠️" ;;
        reset_warning) echo "⚠️ Cela réinitialisera le panneau par défaut !" ;;
        reset_confirm) echo "Continuer ? (y/n): " ;;
        reset_cancel) echo "Annulé." ;;
        reset_start) echo "Réinitialisation du panneau..." ;;
        reset_success) echo "Panneau réinitialisé avec succès ! 🔄" ;;
        backup_start) echo "Création d'une sauvegarde du panneau..." ;;
        backup_success) echo "Sauvegarde enregistrée dans :" ;;
        uninstall_warning) echo "⚠️ Cela SUPPRIMERA COMPLÈTEMENT le panneau !" ;;
        uninstall_confirm) echo "Continuer ? (y/n): " ;;
        uninstall_start) echo "Suppression du panneau..." ;;
        uninstall_success) echo "Panneau désinstallé avec succès ! 📦" ;;
        node_start) echo "Création du Nœud et de l'Emplacement..." ;;
        node_success) echo "Nœud et Emplacement créés avec succès ! 🛡️" ;;
        recovery_start) echo "Création d'un nouvel utilisateur admin..." ;;
        recovery_username) echo "Entrez le nom d'utilisateur : " ;;
        recovery_password) echo "Entrez le mot de passe : " ;;
        recovery_success) echo "Utilisateur admin créé avec succès ! 🔑" ;;
        invalid) echo "Option invalide !" ;;
        exit) echo "✨ Au revoir ! (◕‿◕)♡" ;;
        *) echo "$1" ;;
      esac
      ;;
    *)
      case $1 in
        title) echo "✦ XCODE INSTALLER v3.0 ✦" ;;
        subtitle) echo "🚀 Pterodactyl Theme Manager" ;;
        author) echo "🌟 By Xyro" ;;
        menu_title) echo "📋 MAIN MENU" ;;
        menu_theme) echo "🎨 Install Themes" ;;
        menu_blueprint) echo "🛠️ Install Blueprint Framework" ;;
        menu_reset) echo "🔄 Reset Panel" ;;
        menu_backup) echo "💾 Backup Panel" ;;
        menu_uninstall) echo "📦 Uninstall Panel" ;;
        menu_node) echo "🛡️ Create Node & Location" ;;
        menu_recovery) echo "🔑 Recovery Admin" ;;
        menu_exit) echo "❌ Exit" ;;
        select_theme) echo "🎨 SELECT THEME" ;;
        open_source) echo "--- OPEN SOURCE THEMES ---" ;;
        premium) echo "--- PREMIUM THEMES ---" ;;
        back) echo "🔙 Back" ;;
        install_confirm) echo "Continue installation? (y/n): " ;;
        install_start) echo "Starting installation of" ;;
        install_success) echo "installed successfully! ✨" ;;
        install_failed) echo "Failed to install" ;;
        blueprint_not_found) echo "Blueprint not found, installing..." ;;
        blueprint_installed) echo "Blueprint Framework installed successfully! 🛠️" ;;
        reset_warning) echo "⚠️ This will reset the panel to default!" ;;
        reset_confirm) echo "Continue? (y/n): " ;;
        reset_cancel) echo "Cancelled." ;;
        reset_start) echo "Resetting panel..." ;;
        reset_success) echo "Panel reset successfully! 🔄" ;;
        backup_start) echo "Creating panel backup..." ;;
        backup_success) echo "Backup saved to:" ;;
        uninstall_warning) echo "⚠️ This will COMPLETELY REMOVE the panel!" ;;
        uninstall_confirm) echo "Continue? (y/n): " ;;
        uninstall_start) echo "Removing panel..." ;;
        uninstall_success) echo "Panel uninstalled successfully! 📦" ;;
        node_start) echo "Creating Node & Location..." ;;
        node_success) echo "Node & Location created successfully! 🛡️" ;;
        recovery_start) echo "Creating new admin user..." ;;
        recovery_username) echo "Enter Username: " ;;
        recovery_password) echo "Enter Password: " ;;
        recovery_success) echo "Admin user created successfully! 🔑" ;;
        invalid) echo "Invalid choice!" ;;
        exit) echo "✨ Bye bye! (◕‿◕)♡" ;;
        *) echo "$1" ;;
      esac
      ;;
  esac
}

start_script() {
  clear
  echo -e "${BOLD}${BLUE}"
  echo "    ╔══════════════════════════════════════════════╗"
  echo "    ║  $(get_text title)  ║"
  echo "    ║  $(get_text subtitle)                ║"
  echo "    ║  $(get_text author)                 ║"
  echo "    ╚══════════════════════════════════════════════╝"
  echo -e "${NC}"
  echo -e "${BOLD}${CYAN}        _,gggggggggg.${NC}"
  echo -e "${BOLD}${CYAN}    ,ggggggggggggggggg.${NC}"
  echo -e "${BOLD}${CYAN}  ,ggggg        gggggggg.${NC}"
  echo -e "${BOLD}${CYAN} ,ggg'               'ggg.${NC}"
  echo -e "${BOLD}${CYAN}',gg       ,ggg.      'ggg:${NC}"
  echo -e "${BOLD}${CYAN}'ggg      ,gg'''  .    ggg${NC}     ${BOLD}${BLUE}$(get_text title)${NC}"
  echo -e "${BOLD}${CYAN}gggg      gg     ,    ggg${NC}      ${BOLD}${BLUE}$(get_text subtitle)${NC}"
  echo -e "${BOLD}${CYAN}ggg:     gg.     -   ,ggg${NC}     ${BOLD}${GREEN}----------------------------------${NC}"
  echo -e "${BOLD}${CYAN} ggg:     ggg._    _,ggg${NC}       ${BOLD}${BLUE}$(get_text author)${NC}"
  echo -e "${BOLD}${CYAN} ggg.    '.'''ggggggp${NC}"
  echo -e "${BOLD}${CYAN}  'ggg    '-.__${NC}"
  echo -e "${BOLD}${CYAN}    ggg${NC}"
  echo -e "${BOLD}${CYAN}      ggg${NC}"
  echo -e "${BOLD}${CYAN}        ggg.${NC}"
  echo -e "${BOLD}${CYAN}          ggg.${NC}"
  echo -e "${BOLD}${CYAN}             b.${NC}"
  echo -e "  "
  echo -e "${BOLD} $(get_text menu_title)${NC}"
  echo -e "${BOLD}  1. $(get_text menu_theme)${NC}"
  echo -e "${BOLD}  2. $(get_text menu_blueprint)${NC}"
  echo -e "${BOLD}  3. $(get_text menu_reset)${NC}"
  echo -e "${BOLD}  4. $(get_text menu_backup)${NC}"
  echo -e "${BOLD}  5. $(get_text menu_uninstall)${NC}"
  echo -e "${BOLD}  6. $(get_text menu_node)${NC}"
  echo -e "${BOLD}  7. $(get_text menu_recovery)${NC}"
  echo -e "${BOLD}  x. $(get_text menu_exit)${NC}"
  echo -e "  "
  print_info "Jika panel mengalami eror setelah menginstall tema, silakan jalankan fitur reset panel."
  echo -n -e "${BOLD}➜ $(get_text menu_title): ${NC}"
  read -r MENU_CHOICE

  case "$MENU_CHOICE" in
    1) install_theme ;;
    2) install_blueprint ;;
    3) uninstall_theme ;;
    4) backup_panel ;;
    5) uninstall_panel ;;
    6) create_node ;;
    7) hackback_panel ;;
    x|X) 
      echo -e "${BOLD}${YELLOW}$(get_text exit)${NC}"
      exit 0 
      ;;
    *) 
      print_error "$(get_text invalid)"
      sleep 2 
      start_script
      ;;
  esac
}

install_theme() {
  local SELECT_THEME
  local THEME_NAME
  local THEME_URL

  while true; do
    clear
    echo " "
    echo -e "${BLUE}${BOLD}[+] =============================================== [+]${NC}"
    echo -e "${BLUE}${BOLD}[+]${NC} ${BG_BLUE}${BRIGHT_WHITE}${BOLD}        $(get_text select_theme)        ${NC} ${BLUE}${BOLD}[+]${NC}"
    echo -e "${BLUE}${BOLD}[+] =============================================== [+]${NC}"
    echo " "
    echo -e "${BRIGHT_CYAN}${BOLD}$(get_text open_source)${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[1]${NC} ${WHITE}Stellar${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[2]${NC} ${WHITE}Billing${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[3]${NC} ${WHITE}Elysium${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[4]${NC} ${WHITE}Frostcore${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[5]${NC} ${WHITE}Nightcore${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[6]${NC} ${WHITE}Noobe${NC}"
    echo " "
    echo -e "${BRIGHT_MAGENTA}${BOLD}$(get_text premium)${NC}"
    echo -e "${BG_RED}${BRIGHT_WHITE} (!) WAJIB INSTALL BLUEPRINT DULU (OPSI #2 DI MENU UTAMA) ${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b1]${NC} ${WHITE}Enigma${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b2]${NC} ${WHITE}Nebula V1.8-3${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b3]${NC} ${WHITE}Nebula V2.0-1${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b4]${NC} ${WHITE}Recolor${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b5]${NC} ${WHITE}NavySeals${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b6]${NC} ${WHITE}LememTheme${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b7]${NC} ${WHITE}Darkenate${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b8]${NC} ${WHITE}AbyssPurple${NC}"
    echo -e " ${BRIGHT_WHITE}${BOLD}[b9]${NC} ${WHITE}Arix${NC}"
    echo " "
    echo -e " ${BRIGHT_WHITE}${BOLD}[x]${NC} ${WHITE}$(get_text back)${NC}"
    echo " "
    echo -n -e "${BOLD}➜ $(get_text select_theme): ${NC}"
    read SELECT_THEME
    case "$SELECT_THEME" in
      1) THEME_NAME="Stellar"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/stellar.zip"; break;;
      2) THEME_NAME="Billing"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/billing.zip"; break;;
      3) THEME_NAME="Elysium"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/elysium.zip"; break;;
      4) THEME_NAME="Frostcore"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/frostcore.zip"; break;;
      5) THEME_NAME="Nightcore"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/nightcore.zip"; break;;
      6) THEME_NAME="Noobe"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/noobe.zip"; break;;
      [bB]1) THEME_NAME="Enigma"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/enigma.zip"; break;;
      [bB]2) THEME_NAME="Nebula V1.8-3"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/nebula_v1.8-3.zip"; break;;
      [bB]3) THEME_NAME="Nebula V2.0-1"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/nebula_v2.0-1.zip"; break;;
      [bB]4) THEME_NAME="Recolor"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/recolor.zip"; break;;
      [bB]5) THEME_NAME="NavySeals"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/navyseals.zip"; break;;
      [bB]6) THEME_NAME="LememTheme"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/lemem.zip"; break;;
      [bB]7) THEME_NAME="Darkenate"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/darkenate.zip"; break;;
      [bB]8) THEME_NAME="AbyssPurple"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/abysspurple.zip"; break;;
      [bB]9) THEME_NAME="Arix"; THEME_URL="https://github.com/RendzzXs/Installtheme/raw/main/Theme/arix.zip"; break;;
      x|X) echo -e "${BOLD}$(get_text back)${NC}"; return;;
      *) print_error "$(get_text invalid)";;
    esac
  done

  echo " "
  echo -n -e "${BOLD}$(get_text install_confirm)${NC}"
  read confirmation
  if [[ "$confirmation" != [yY] ]]; then echo -e "${BOLD}$(get_text reset_cancel)${NC}"; return; fi
  
  set -e
  export DEBIAN_FRONTEND=noninteractive
  export NEEDRESTART_MODE=a
  
  TEMP_DIR=$(mktemp -d)
  trap 'rm -rf -- "$TEMP_DIR"' EXIT
  cd "$TEMP_DIR"
  
  print_info "$(get_text install_start) $THEME_NAME..."

  sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get update -y
  sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get install -y ca-certificates curl gnupg zip unzip git wget
  
  if [ "$SELECT_THEME" == "[bB]1" ]; then
    echo -n -e "${BOLD}Masukkan link whatsapp (diawali https://): ${NC}"; read LINK_ADMIN
    echo -n -e "${BOLD}Masukkan link channel whatsapp (diawali https://): ${NC}"; read LINK_CHANNEL
    echo -n -e "${BOLD}Masukkan link grup whatsapp (diawali https://): ${NC}"; read LINK_GROUP
  fi

  if [ -f /etc/needrestart/needrestart.conf ]; then
    sudo sed -i "s/#\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
    sudo sed -i "s/\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
  fi

  print_info "[1/4] Mengunduh file tema..."
  wget -q "$THEME_URL"
  local THEME_ZIP_FILE=$(basename "$THEME_URL")

  print_info "[2/4] Mengekstrak file tema..."
  if [[ "$THEME_ZIP_FILE" == *.tar.gz ]]; then
    tar -xzf "$THEME_ZIP_FILE"
  else
    unzip -oq "$THEME_ZIP_FILE" || true
  fi
  
  rm -f "$THEME_ZIP_FILE"

  if [[ "$SELECT_THEME" == [bB]* ]]; then
    print_info "[3/4] Menyiapkan Blueprint..."
    if [ ! -f "/var/www/pterodactyl/blueprint.sh" ]; then 
      print_warning "$(get_text blueprint_not_found)"
      bash <(curl -s https://raw.githubusercontent.com/infinityForge-labs/blueprint-installer/main/install.sh)
    fi
    
    FOUND_FILE=$(find . -maxdepth 1 -name "*.blueprint" -print -quit)
    
    if [ -z "$FOUND_FILE" ]; then
        print_error "File .blueprint tidak ditemukan dalam zip!"
        return 1
    fi

    BLUEPRINT_FILENAME=$(basename "$FOUND_FILE")
    IDENTIFIER="${BLUEPRINT_FILENAME%.*}"
    sudo mv "$BLUEPRINT_FILENAME" /var/www/pterodactyl/
    
    print_info "[4/4] Menginstall via Blueprint..."
    cd /var/www/pterodactyl
    sudo blueprint -install "$IDENTIFIER"
    sudo chown -R www-data:www-data /var/www/pterodactyl
    sudo rm "/var/www/pterodactyl/$BLUEPRINT_FILENAME"
    
    print_success "$THEME_NAME $(get_text install_success)"
  else
    if [ "$SELECT_THEME" == "[bB]1" ]; then
      print_info "Mengkonfigurasi variabel Enigma..."
      sed -i "s|LINK_ADMIN|$LINK_ADMIN|g" pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
      sed -i "s|LINK_CHANNEL|$LINK_CHANNEL|g" pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
      sed -i "s|LINK_GROUP|$LINK_GROUP|g" pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
    fi

    print_info "[3/4] Menyalin file..."
    sudo cp -rfT pterodactyl /var/www/pterodactyl
    cd /var/www/pterodactyl

    print_info "Memeriksa versi Node.js..."
    CURRENT_NODE_VER=$(node -v 2>/dev/null | cut -d'.' -f1 | sed 's/v//')
    
    if [[ "$CURRENT_NODE_VER" == "22" ]]; then
      print_success "Node.js v22 sudah terinstall. Instalasi ulang dilewati."
    else
      if [[ -z "$CURRENT_NODE_VER" ]]; then
        print_warning "Node.js tidak terdeteksi di sistem. Memulai instalasi Node.js v22..."
      else
        print_warning "Versi Node.js tidak sesuai (Terdeteksi: v$CURRENT_NODE_VER). Menginstall Node.js v22..."
      fi
      unset NVM_DIR
      sudo apt-get remove -y nodejs npm > /dev/null 2>&1 || true
      sudo apt-get purge -y nodejs > /dev/null 2>&1 || true
      sudo rm -f /usr/bin/node /usr/local/bin/node /usr/bin/npm /usr/local/bin/npm
      sudo rm -rf /etc/apt/sources.list.d/nodesource.list
      sudo rm -rf "$HOME/.nvm"
      sudo mkdir -p /etc/apt/keyrings
      curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor --yes | sudo tee /etc/apt/keyrings/nodesource.gpg > /dev/null
      echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list > /dev/null
      sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get update -y
      sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get install -y nodejs
    fi

    hash -r
    sudo npm i -g yarn
    
    print_info "Menginstal dependensi build..."
    yarn add cross-env react-feather
    yarn install

    if [ "$SELECT_THEME" == "2" ]; then
      print_info "Menjalankan instalasi Billing..."
      php artisan billing:install stable
    fi

    print_info "[4/4] Membangun aset panel..."
    print_warning "Proses build sedang berjalan. Mohon bersabar dan JANGAN tutup terminal sampai proses selesai!"
    RAM_SIZE=$(free -m | awk '/Mem:/ {print $2}')
    if [ "$RAM_SIZE" -lt 4000 ]; then print_warning "Di RAM kecil mungkin proses buildnya akan memakan waktu sedikit lebih lama."; fi

    export NODE_OPTIONS=--openssl-legacy-provider
    php artisan migrate --force
    yarn build:production
    php artisan view:clear
    php artisan optimize:clear
    
    print_success "$THEME_NAME $(get_text install_success)"
  fi

  echo " "
  log_success "[+] =============================================== [+]"
  log_success "[+]          INSTALASI BERHASIL SELESAI             [+]"
  log_success "[+] =============================================== [+]"
  echo " "
  sleep 3
  return 0
}

install_blueprint() {
  unset NVM_DIR
  unset NVM_CD_FLAGS
  unset NVM_BIN
  unset NVM_INC
  export PATH=$(echo $PATH | tr ":" "\n" | grep -v "nvm" | tr "\n" ":")
  export DEBIAN_FRONTEND=noninteractive
  export NEEDRESTART_MODE=a

  set -e
  echo -e "                                                       "
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${GREEN}[+]          $(get_text menu_blueprint)          [+]${NC}"
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  
  echo -n -e "${BOLD}$(get_text install_confirm)${NC}"
  read confirmation
  if [[ "$confirmation" != [yY] ]]; then
    echo -e "${BOLD}$(get_text reset_cancel)${NC}"
    return
  fi

  print_info "$(get_text install_start) Blueprint..."

  sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get update -y
  sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get install -y ca-certificates curl gnupg zip unzip git wget

  if [ -f /etc/needrestart/needrestart.conf ]; then
    sudo sed -i "s/#\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
    sudo sed -i "s/\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf
  fi

  print_info "Mengunduh dan mengekstrak Blueprint Framework..."
  DOWNLOAD_URL=$(curl -s https://api.github.com/repos/BlueprintFramework/framework/releases/latest | grep 'browser_download_url' | grep 'release.zip' | cut -d '"' -f 4)
  if [ -z "$DOWNLOAD_URL" ]; then
    print_error "$(get_text install_failed) Blueprint!"
    return 1
  fi
  wget -q "$DOWNLOAD_URL" -O /tmp/blueprint.zip
  unzip -oq /tmp/blueprint.zip -d /var/www/pterodactyl
  rm /tmp/blueprint.zip

  print_info "Memeriksa versi Node.js..."
  CURRENT_NODE_VER=$(node -v 2>/dev/null | cut -d'.' -f1 | sed 's/v//')
  
  if [[ "$CURRENT_NODE_VER" == "22" ]]; then
    print_success "Node.js v22 sudah terinstall. Instalasi ulang dilewati."
  else
    if [[ -z "$CURRENT_NODE_VER" ]]; then
      print_warning "Node.js tidak terdeteksi di sistem. Memulai instalasi Node.js v22..."
    else
      print_warning "Versi Node.js tidak sesuai (Terdeteksi: v$CURRENT_NODE_VER). Menginstall Node.js v22..."
    fi
    unset NVM_DIR
    sudo apt-get remove -y nodejs npm > /dev/null 2>&1 || true
    sudo apt-get purge -y nodejs > /dev/null 2>&1 || true
    sudo rm -f /usr/bin/node /usr/local/bin/node /usr/bin/npm /usr/local/bin/npm
    sudo rm -rf /etc/apt/sources.list.d/nodesource.list
    sudo rm -rf "$HOME/.nvm"
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor --yes | sudo tee /etc/apt/keyrings/nodesource.gpg > /dev/null
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list > /dev/null
    sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get update -y
    sudo DEBIAN_FRONTEND=noninteractive NEEDRESTART_MODE=a apt-get install -y nodejs
  fi

  hash -r
  sudo npm i -g yarn

  print_info "Menginstal dependensi Pterodactyl..."
  cd /var/www/pterodactyl
  yarn add cross-env
  yarn install

  print_info "Menjalankan blueprint.sh..."
  cd /var/www/pterodactyl
  sed -i -E -e "s|WEBUSER=\"www-data\" #;|WEBUSER=\"www-data\" #;|g" \
             -e "s|USERSHELL=\"/bin/bash\" #;|USERSHELL=\"/bin/bash\" #;|g" \
             -e "s|OWNERSHIP=\"www-data:www-data\" #;|OWNERSHIP=\"www-data:www-data\" #;|g" blueprint.sh
  chmod +x blueprint.sh
  yes | sudo bash blueprint.sh

  echo -e "                                                       "
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${GREEN}[+]          $(get_text blueprint_installed)           [+]${NC}"
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 3
  start_script
}

uninstall_theme() {
  echo " "
  log_info "[+] =============================================== [+]"
  log_info "[+]       $(get_text menu_reset)       [+]"
  log_info "[+] =============================================== [+]"
  echo " "

  while true; do
    echo -n -e "${BOLD}$(get_text reset_confirm)${NC}"
    read yn
    
    case $yn in
      [Yy]*)
        set -e
        if [ ! -d "/var/www/pterodactyl" ]; then
          print_error "Direktori Pterodactyl tidak ditemukan."
          return 1
        fi
        cd /var/www/pterodactyl || { print_error "Gagal masuk ke direktori Pterodactyl."; return 1; }

        print_info "$(get_text reset_start)"

        echo -e "${BOLD}   - Mem-backup file .env...${NC}"
        TEMP_BACKUP=$(mktemp -d)
        if [ -f ".env" ]; then sudo mv .env "$TEMP_BACKUP/"; fi

        echo -e "${BOLD}   - Menghapus semua file panel lama...${NC}"
        sudo find . -mindepth 1 -delete
        
        echo -e "${BOLD}   - Mengunduh panel original terbaru...${NC}"
        curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | sudo tar -xzf - -C /var/www/pterodactyl
    
        echo -e "${BOLD}   - Mengembalikan file .env...${NC}"
        if [ -f "$TEMP_BACKUP/.env" ]; then sudo mv "$TEMP_BACKUP"/.env .; fi
        rm -rf "$TEMP_BACKUP"

        echo -e "${BOLD}   - Install ulang dependensi (Composer)...${NC}"
        sudo chmod -R 755 storage/* bootstrap/cache/
        sudo chown -R www-data:www-data /var/www/pterodactyl
        curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
        sudo rm -rf /var/www/.cache
        sudo mkdir -p /var/www/.cache
        sudo chown -R www-data:www-data /var/www/.cache
        sudo -u www-data env COMPOSER_PROCESS_TIMEOUT=2000 composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist > /dev/null 2>&1

        echo -e "${BOLD}   - Menjalankan migrasi...${NC}"
        sudo -u www-data php artisan migrate --seed --force

        echo -e "${BOLD}   - Membersihkan cache sistem...${NC}"
        sudo -u www-data php artisan optimize:clear
        sudo -u www-data php artisan view:clear
        sudo -u www-data php artisan config:clear
        sudo -u www-data php artisan route:clear
        sudo -u www-data php artisan cache:clear
        sudo rm -f /usr/local/bin/blueprint

        echo -e "${BOLD}   - Restart layanan webserver & worker...${NC}"
        sudo systemctl restart nginx > /dev/null 2>&1 || sudo systemctl restart apache2 > /dev/null 2>&1
        sudo systemctl restart "php*-fpm" > /dev/null 2>&1 || true
        sudo systemctl restart pteroq
        sudo -u www-data php artisan up

        break
        ;;
      [Nn]*)
        echo -e "\n${BOLD}❌ $(get_text reset_cancel)${NC}"
        return
        ;;
      *)
        echo -e "\n${BOLD}$(get_text invalid)${NC}"
        ;;
    esac
  done

  echo " "
  log_success "[+] =============================================== [+]"
  log_success "[+]             $(get_text reset_success)             [+]"
  log_success "[+] =============================================== [+]"
  echo " "
  sleep 3
  start_script
}

backup_panel() {
  echo " "
  log_info "[+] =============================================== [+]"
  log_info "[+]             $(get_text menu_backup)             [+]"
  log_info "[+] =============================================== [+]"
  echo " "
  
  print_info "$(get_text backup_start)"
  
  BACKUP_DIR="/root/panel_backup_$(date +%Y%m%d_%H%M%S)"
  mkdir -p "$BACKUP_DIR"
  
  cp -r /var/www/pterodactyl "$BACKUP_DIR/"
  mysqldump -u root -p panel > "$BACKUP_DIR/database.sql" 2>/dev/null || echo "    ${yellow}⚠️  Backup database gagal (password required)${reset}"
  
  echo " "
  log_success "[+] =============================================== [+]"
  log_success "[+]         $(get_text backup_success) $BACKUP_DIR         [+]"
  log_success "[+] =============================================== [+]"
  echo " "
  sleep 3
  start_script
}

uninstall_panel() {
  echo " "
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${BLUE}[+]             $(get_text menu_uninstall)              [+]${NC}"
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo " "
  echo -n -e "${BOLD}$(get_text uninstall_confirm)${NC}"
  read confirmation
  if [[ "$confirmation" != [yY] ]]; then echo -e "${BOLD}$(get_text reset_cancel)${NC}"; return; fi

  print_info "$(get_text uninstall_start)"

  if [ -f "/var/www/pterodactyl/.env" ]; then
      print_info "Mencoba menghapus database panel..."
      DB_NAME=$(grep "^DB_DATABASE=" /var/www/pterodactyl/.env | cut -d'=' -f2)
      DB_USER=$(grep "^DB_USERNAME=" /var/www/pterodactyl/.env | cut -d'=' -f2)
      DB_PASS=$(grep "^DB_PASSWORD=" /var/www/pterodactyl/.env | cut -d'=' -f2)
      mysql -u root -e "DROP DATABASE IF EXISTS $DB_NAME; DROP USER IF EXISTS '$DB_USER'@'127.0.0.1';" > /dev/null 2>&1 || true
      print_success "Database cleaning selesai."
  else
      print_warning "File .env tidak ditemukan, melewati penghapusan database otomatis."
  fi

  print_info "Menghentikan layanan pterodactyl..."
  systemctl disable --now wings pteroq > /dev/null 2>&1 || true
  systemctl disable --now redis-server > /dev/null 2>&1 || true
  systemctl disable --now redis > /dev/null 2>&1 || true
  systemctl disable --now "php*-fpm" > /dev/null 2>&1 || true
  systemctl stop nginx apache2 > /dev/null 2>&1 || true

  print_info "Membersihkan Cronjob..."
  (crontab -l 2>/dev/null | grep -v "pterodactyl" | crontab -) || true

  print_info "Menghapus file sistem Pterodactyl..."
  rm -rf /var/www/pterodactyl
  rm -rf /etc/pterodactyl
  rm -rf /var/lib/pterodactyl
  rm -f /usr/local/bin/wings
  rm -f /usr/local/bin/composer
  rm -f /usr/local/bin/blueprint

  print_info "Menghapus konfigurasi service..."
  rm -f /etc/systemd/system/wings.service
  rm -f /etc/systemd/system/pteroq.service
  systemctl daemon-reload

  print_info "Menghapus konfigurasi webserver..."
  rm -f /etc/nginx/sites-enabled/pterodactyl.conf
  rm -f /etc/nginx/sites-available/pterodactyl.conf
  rm -f /etc/nginx/conf.d/pterodactyl.conf
  rm -f /etc/apache2/sites-enabled/pterodactyl.conf
  rm -f /etc/apache2/sites-available/pterodactyl.conf
  rm -f /etc/php/*/fpm/pool.d/www-pterodactyl.conf
  rm -f /etc/php-fpm.d/www-pterodactyl.conf
  if [ -f /etc/nginx/sites-available/default ] && [ ! -L /etc/nginx/sites-enabled/default ]; then
      ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default > /dev/null 2>&1 || true
  fi

  print_info "Membersihkan sisa Docker..."
  docker rm -f $(docker ps -a -q) > /dev/null 2>&1 || true
  docker system prune -af > /dev/null 2>&1 || true 

  print_info "Merestart layanan sistem..."
  systemctl restart nginx > /dev/null 2>&1 || true
  systemctl restart apache2 > /dev/null 2>&1 || true
  
  echo -e "                                                       "
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${GREEN}[+]          $(get_text uninstall_success)          [+]${NC}"
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 3
  exit 0
}

create_node() {
  set -e
  echo " "
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${BLUE}[+]            $(get_text menu_node)           [+]${NC}"
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo " "

  cd /var/www/pterodactyl || exit
  
  read -p "Masukkan nama location (contoh: SGP): " location_name
  read -p "Masukkan id location (contoh: 1): " locid
  read -p "Masukkan nama node: " node_name
  read -p "Masukkan deskripsi: " description
  read -p "Masukkan domain node: " domain
  read -p "Masukkan RAM (MB): " ram
  read -p "Masukkan Disk Space (MB): " disk_space

  php artisan p:location:make --short="$location_name" --long="$description"
  php artisan p:node:make \
    --name="$node_name" \
    --description="$description" \
    --locationId="$locid" \
    --fqdn="$domain" \
    --public=1 \
    --scheme="https" \
    --proxy=0 \
    --maintenance=0 \
    --maxMemory="$ram" \
    --overallocateMemory=0 \
    --maxDisk="$disk_space" \
    --overallocateDisk=0 \
    --uploadSize=100 \
    --daemonListeningPort=8080 \
    --daemonSFTPPort=2022 \
    --daemonBase="/var/lib/pterodactyl/volumes"

  echo " "
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${GREEN}[+]         $(get_text node_success)          [+]${NC}"
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo " "
  sleep 3
  start_script
}

hackback_panel() {
  echo -e "                                                       "
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${BLUE}[+]            $(get_text menu_recovery)            [+]${NC}"
  echo -e "${BOLD}${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  read -p "$(get_text recovery_username)" user
  read -sp "$(get_text recovery_password)" pwhb
  echo

  if [[ -z "$user" || -z "$pwhb" ]]; then
    print_error "Username dan Password tidak boleh kosong!"
    return 1
  fi

  if ! cd /var/www/pterodactyl; then
    print_error "Gagal pindah ke direktori /var/www/pterodactyl. Pastikan Pterodactyl terinstal."
    return 1
  fi

  print_info "$(get_text recovery_start)"
  if ! printf 'yes\n%s@admin.com\n%s\n%s\n%s\n%s\n' "$user" "$user" "$user" "$user" "$pwhb" | php artisan p:user:make
  then
    print_error "Gagal menjalankan perintah 'php artisan p:user:make'. Periksa log Pterodactyl."
    return 1
  fi

  echo -e "                                                       "
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${BOLD}${GREEN}[+]          $(get_text recovery_success)          [+]${NC}"
  echo -e "${BOLD}${GREEN}[+] ----------------------------------------------- [+]${NC}"
  echo -e "${BOLD}${GREEN}[+] Username: $user${NC}"
  echo -e "${BOLD}${GREEN}[+] Password: (Password yang Anda masukkan tadi)${NC}"
  echo -e "${BOLD}${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 4
  start_script
}

select_language
start_script