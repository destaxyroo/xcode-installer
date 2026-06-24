#!/bin/bash

# ============================================================
# XCODE INSTALLER - Create Node & Location
# Version: 2.0
# Author: Xyro
# ============================================================

NC='\033[0m'
BOLD='\033[1m'
RED='\033[91m'
GREEN='\033[92m'
YELLOW='\033[93m'
BLUE='\033[94m'
CYAN='\033[96m'
WHITE='\033[97m'

print_info() {
  echo -e "\n  ${BLUE}${BOLD}[INFO]${NC} ${BOLD}$1${NC}\n"
}

print_success() {
  echo -e "\n  ${GREEN}${BOLD}[SUCCESS]${NC} ${BOLD}$1${NC}\n"
}

print_error() {
  echo -e "\n  ${RED}${BOLD}[ERROR]${NC} ${BOLD}$1${NC}\n"
}

print_warning() {
  echo -e "\n  ${YELLOW}${BOLD}[WARNING]${NC} ${BOLD}$1${NC}\n"
}

banner() {
  clear
  echo -e "${CYAN}${BOLD}"
  echo "    ╔══════════════════════════════════════════════╗"
  echo "    ║  ✦ XCODE INSTALLER v2.0 ✦                  ║"
  echo "    ║  🛡️ Create Node & Location                  ║"
  echo "    ║  🌟 By Xyro                                 ║"
  echo "    ╚══════════════════════════════════════════════╝"
  echo -e "${NC}"
  echo -e "    ${GREEN}✦ Anime Girl:${NC} (◕‿◕)♡"
  echo -e "    ${YELLOW}✦ Status:${NC} Ready to create node! ✨"
  echo ""
}

check_panel() {
  if [ ! -d "/var/www/pterodactyl" ]; then
    print_error "Direktori Pterodactyl tidak ditemukan!"
    exit 1
  fi
}

create_location_node() {
  banner
  check_panel

  echo -e "${BOLD}${CYAN}┌───[ LOCATION & NODE DETAILS ]───${NC}"
  echo ""

  read -p "$(echo -e ${BOLD}"➜ Masukkan nama location (contoh: SGP): "${NC})" location_name
  read -p "$(echo -e ${BOLD}"➜ Masukkan ID location (contoh: 1): "${NC})" locid
  read -p "$(echo -e ${BOLD}"➜ Masukkan nama node: "${NC})" node_name
  read -p "$(echo -e ${BOLD}"➜ Masukkan deskripsi: "${NC})" description
  read -p "$(echo -e ${BOLD}"➜ Masukkan domain node: "${NC})" domain
  read -p "$(echo -e ${BOLD}"➜ Masukkan RAM (MB): "${NC})" ram
  read -p "$(echo -e ${BOLD}"➜ Masukkan Disk Space (MB): "${NC})" disk_space

  echo ""
  echo -e "${BOLD}${YELLOW}⚠️  Konfirmasi Data:${NC}"
  echo -e "   Location: ${GREEN}$location_name${NC} (ID: $locid)"
  echo -e "   Node: ${GREEN}$node_name${NC}"
  echo -e "   Domain: ${GREEN}$domain${NC}"
  echo -e "   RAM: ${GREEN}$ram MB${NC}"
  echo -e "   Disk: ${GREEN}$disk_space MB${NC}"
  echo ""

  read -p "$(echo -e ${BOLD}"Lanjutkan? (y/n): "${NC})" confirm
  if [[ "$confirm" != [yY] ]]; then
    print_info "Dibatalkan."
    exit 0
  fi

  cd /var/www/pterodactyl || { print_error "Gagal masuk direktori!"; exit 1; }

  print_info "Membuat Location..."
  php artisan p:location:make --short="$location_name" --long="$description"
  
  if [ $? -eq 0 ]; then
    print_success "Location berhasil dibuat!"
  else
    print_error "Gagal membuat Location!"
    exit 1
  fi

  print_info "Membuat Node..."
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

  if [ $? -eq 0 ]; then
    print_success "Node berhasil dibuat!"
  else
    print_error "Gagal membuat Node!"
    exit 1
  fi

  print_info "Mengambil konfigurasi otomatis untuk Wings..."
  
  NODE_ID=$(php artisan tinker --execute="echo optional(\Pterodactyl\Models\Node::latest()->first())->id;" 2>/dev/null | grep -E '^[0-9]+$' | tail -n 1)
  
  if [ -z "$NODE_ID" ]; then
    print_warning "Gagal mendapatkan Node ID dari database."
    print_warning "Silakan konfigurasi Wings secara manual."
  else
    print_success "Node ID terdeteksi: $NODE_ID"
    
    print_info "Membuat file konfigurasi..."
    mkdir -p /etc/pterodactyl
    php artisan p:node:configuration "$NODE_ID" > /etc/pterodactyl/config.yml

    print_info "Menyalakan Wings..."
    systemctl daemon-reload
    systemctl enable wings
    systemctl restart wings
    sleep 2
    
    if systemctl is-active --quiet wings; then
      print_success "Wings berhasil dikonfigurasi dan AKTIF (Online)! 🚀"
    else
      print_warning "Wings gagal start otomatis. Cek 'systemctl status wings' untuk detail."
    fi
  fi

  echo ""
  echo -e "${GREEN}${BOLD}"
  echo "    ╔══════════════════════════════════════════════╗"
  echo "    ║  ✅ CREATE NODE & LOCATION SUCCESS!         ║"
  echo "    ║  🛡️ Node: $node_name                        ║"
  echo "    ║  🌐 Domain: $domain                         ║"
  echo "    ║  📍 Location: $location_name                ║"
  echo "    ╚══════════════════════════════════════════════╝"
  echo -e "${NC}"
  echo ""
  
  read -p "Tekan Enter untuk kembali..."
}

create_location_node