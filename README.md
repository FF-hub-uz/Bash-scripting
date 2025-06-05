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
