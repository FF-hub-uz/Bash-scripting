#!/usr/bin/bash

# Цвета
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Эффект печати
type_effect() {
  text="$1"
  delay="${2:-0.02}"
  for (( i=0; i<${#text}; i++ )); do
    printf "%s" "${text:$i:1}"
    sleep "$delay"
  done
  echo
}

# Баннер
banner() {
  echo -e "${CYAN}"
  echo "╔══════════════════════════════╗"
  echo "║   USER & GROUP MANAGER v1.0 ║"
  echo "╚══════════════════════════════╝"
  echo -e "${NC}"
}
banner

# Помощь
if [[ "$1" == "--help" ]]; then
  type_effect "[+] Show help [+]"
  echo "  --useradd     Add a new user"
  echo "  --deluser     Delete a user"
  echo "  --groupadd    Add a new group"
  echo "  --groupdel    Delete a group"
  echo "  --usermod     Add user to group"
  echo "  --gpasswd     Remove user from group"
  exit
fi

# Добавление пользователя
user_add() {
  if [[ $(id -u) -ne 0 ]]; then
    type_effect "${RED}[-] Need root permission.${NC}" 0.03
    exit
  fi

  read -p "New user name: " username
  read -sp "Password: " pass
  echo -e "\n"
  read -sp "Confirm password: " pass_check
  echo -e "\n"
  read -p "Shell: " shell

  if [[ "$pass" == "$pass_check" ]]; then
    useradd -m "$username" -s "$shell" 
    echo "$username:$pass" | chpasswd
    type_effect "${GREEN}[+] $username successfully created.${NC}" 0.02
    read -p "Do you want to see user list? [Y/n]: " answer
    if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
      compgen -u | while read -r user; do type_effect " → $user" 0.01; done
    else
      type_effect "Bye!" 0.02
    fi
  else
    type_effect "${RED}[-] Passwords do not match. Try again.${NC}" 0.03
    user_add
  fi
}

# Удаление пользователя
user_del() {
  if [[ $(id -u) -ne 0 ]]; then
    type_effect "${RED}[-] Need root permission.${NC}" 0.03
    exit
  fi

  type_effect "Available users:" 0.02
  compgen -u | while read -r user; do type_effect " → $user" 0.01; done
  echo
  read -p "Username to delete: " username

  read -p "Are you sure you want to delete '$username'? (y/N): " confirm
  if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    type_effect "${RED}[-] Canceled.${NC}" 0.03
    return
  fi

  deluser "$username" --remove-all-files 
  type_effect "${GREEN}[+] User '$username' has been deleted.${NC}" 0.02
}

# Добавление группы
group_add() {
  read -p "Name of new group: " groupname
  sudo groupadd "$groupname"
  type_effect "${GREEN}[+] Group '$groupname' has been created.${NC}" 0.02
  read -p "Do you want to see group list? (Y/n): " answer
  if [[ "$answer" == "Y" || "$answer" == "y" ]]; then
    compgen -g | while read -r group; do type_effect " → $group" 0.01; done
  else
    type_effect "Bye!" 0.02
  fi
}

# Удаление группы
group_del() {
  type_effect "Available groups:" 0.02
  compgen -g | while read -r group; do type_effect " → $group" 0.01; done
  echo
  read -p "Name of group to delete: " groupname

  if ! getent group "$groupname" > /dev/null; then
    type_effect "${RED}[-] Group '$groupname' does not exist.${NC}" 0.03
    return
  fi

  read -p "Are you sure you want to delete '$groupname'? (y/N): " confirm
  if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    type_effect "${RED}[-] Canceled.${NC}" 0.03
    return
  fi

  sudo groupdel "$groupname"
  type_effect "${GREEN}[+] Group '$groupname' has been deleted.${NC}" 0.02
}

# Добавить пользователя в группу
user_mod() {
  read -p "Username to add to group: " username
  read -p "Group name: " groupname
  compgen -g | while read -r group; do type_effect " → $group" 0.01; done
  sudo usermod -aG "$groupname" "$username"
  type_effect "${GREEN}[+] $username added to $groupname.${NC}" 0.02
  getent group "$groupname"
}

# Удалить пользователя из группы
group_passwd() {
  compgen -g | while read -r group; do type_effect " → $group" 0.01; done
  read -p "Group to remove user from: " groupname
  getent group "$groupname"
  read -p "User to remove: " username
  sudo gpasswd -d "$username" "$groupname"
  type_effect "${GREEN}[+] $username removed from $groupname.${NC}" 0.02
  getent group "$groupname"
}

# Обработка аргументов
case "$1" in
  --useradd)     user_add ;;
  --deluser)     user_del ;;
  --groupadd)    group_add ;;
  --groupdel)    group_del ;;
  --usermod)     user_mod ;;
  --gpasswd)     group_passwd ;;
  *)
    type_effect "${YELLOW}[?] Invalid option. Use --help for guidance.${NC}" 0.02
    ;;
esac
