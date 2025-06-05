#!/bin/bash

output_file="final_wordlist.txt"
> "$output_file"

echo "[*] Добавляем 2000 стандартных паролей..."

standard_passwords=(
"12345678" "123456789" "1234567890" "87654321" "987654321" "11223344" "qwertyui" "qwerty123" "qwerty1234" "qwerty12345"
"iloveyou1" "password1" "password123" "admin1234" "letmein1" "welcome1" "login123" "abc12345" "123123123" "superman1"
"football1" "sunshine1" "dragon123" "monkey123" "shadow123" "princess1" "trustno1!" "freedom12" "hello1234" "zxcvbnm1"
"1q2w3e4r" "1qaz2wsx" "qazwsxedc" "pass1234" "adminadmin" "p@ssword" "pa$$word" "loveyou99" "mypass123" "welcome99"
"qwe12345" "test1234" "asdzxc12" "1q1q1q1q" "q1w2e3r4" "azerty123" "root1234" "default99" "147258369" "159753486"
"12344321" "11112222" "00001111" "99998888" "123321123" "43211234" "00000000" "87654321" "098765432" "135791357"
"abcdefghi" "abcdefgh1" "azizbek01" "salom1234" "uzbekistan" "tashkent1" "password!" "passw0rd1" "qwert1234" "adminuser"
"loginuser" "password@" "wifi12345" "mypass456" "access123" "netgear01" "internet1" "asuswifi1" "tplink123" "dlinkadmin"
"linksys01" "wifiadmin" "homewifi1" "guest1234" "guestwifi" "homeguest" "router123" "defaultpw" "rootaccess" "internet2"
"bismillah" "alhamdul1" "subhanal1" "islom1234" "islom2024" "namoz1234" "islom2024" "uzum1234" "asax1234" "texn1234"
"zood2024" "media123" "asaxshop1" "uzumshop1" "onlineshop" "market123" "parol123" "parol1234" "kirish99" "kodparol"
"telekom01" "beeline01" "ucellwifi" "mobiwifi1" "uzinfocom" "uznet2024" "wifi2024!" "wifipass1" "tashwifi1" "bekzod123"
"oybek999" "nodira123" "dilnoza1" "shoxrux1" "sardor01" "shahzoda" "sevara99" "madina123" "jamshid1" "sarvar99"
"shahlo123" "yulduz88" "azamat88" "islombek" "mehribon" "nargiza1" "nasiba99" "feruza01" "shahnoza" "shahlo88"
"internetuz" "internet91" "tashwifinet" "uztelecom" "supernetuz" "uzbkomnet" "beelineuz" "ucellnet" "uzvodafone" "uznetcom"
"123qwe456" "adminqwe" "superpassword" "qwerty1!" "adminadmin!" "welcometo1" "123abcd" "letmein1234" "root12345"
"root1234!" "password123!" "123!password" "superman!" "username123" "guestuser1" "accesswifi1" "guestpassword" "12345wifi"
"admin12345" "hello12345" "abc123456" "secrect123" "letmein@123" "qwerty123!" "access123!" "newpassword" "guestguest"
"network123" "wifi123456" "guestwifi123" "network12345" "guest123456" "123password1" "wifiadmin123" "qwerty987"
"passwordtest" "adminpassword" "networkguest" "securepass1" "mypass7890" "1234abc567" "wifiadmin01" "admin01pass"
"hello@123" "summer123" "autumn123" "winter123" "spring123" "cool12345" "guestadmin" "hellohello" "goodpassword"
)

for pw in "${standard_passwords[@]}"; do
    echo "$pw" >> "$output_file"
done

echo "[*] Завершено добавление стандартных паролей!"

echo "[*] Добавляем 50 самых популярных имен..."

names=(
"Ahmad" "Ali" "Fatima" "Amina" "Hasan" "Hassan" "Abdul" "Muhammad" "Sara" "Omar"
"Zayn" "Rehan" "Sana" "Aliya" "Jamil" "Raza" "Nida" "Ayesha" "Yasir" "Imran"
"Mansoor" "Khadija" "Hassan" "Zubair" "Bilal" "Yasmin" "Muneeb" "Faizan" "Asma" "Rizwan"
"Anwar" "Sobia" "Tariq" "Lubna" "Kamran" "Sajid" "Fariha" "Sadia" "Nashit" "Rana"
"Rabia" "Kiran" "Hira" "Mahmood" "Saif" "Zain" "Hina" "Sami" "Irfan" "Shazia"
"Rashid" "Zainab" "Fahad" "Sana" "Aminah" "Bashir" "Shan" "Ahsan" "Alina" "Reema"
"Junaid" "Hussain" "Salman" "Khalil" "Nashit" "Daniyal" "Faizan" "Sarim" "Nida" "Imran"
"Arshad" "Amna" "Samia" "Ayyan" "Saniya" "Abeer" "Mahira" "Hammad" "Javeria" "Dua"
)

for name in "${names[@]}"; do
    echo "$name" >> "$output_file"
done

echo "[*] Завершено добавление имен!"


echo "[*] Добавляем 50 самых популярных имен + 4 цифры..."

for name in "${names[@]}"; do
    for i in {1000..9999}; do
        echo "$name$i" >> "$output_file"
    done
done

echo "[*] Завершено добавление имен + 4 цифры!"

echo "[*] Добавляем номера телефонов Узбекистана..."

uzbek_numbers=(
"77" "99" "95" "71" "88" "90"
)

for prefix in "${uzbek_numbers[@]}"; do
    for i in {1000000..9999999}; do
        echo "$prefix$i" >> "$output_file"
    done
done

echo "[*] Завершено добавление номеров телефонов "

echo "[*] Добавляем 100 популярных брендов с маленькой буквы..."

brands=(
"uzum" "beko" "samsung" "lg" "philips" "xiaomi" "bosch" "samsungmobile" "cocaCola" "heineken"
"pepsico" "iphone" "huawei" "sony" "motorola" "hp" "dell" "acer" "lenovo" "zte"
"redmi" "toshiba" "canon" "panasonic" "nokia" "asus" "microsoft" "razer" "nike" "adidas"
"underarmour" "puma" "reebok" "converse" "oakley" "newbalance" "timberland" "fossil" "garmin" "rolex"
)


for brand in "${brands[@]}"; do
    echo "$brand" >> "$output_file"
done

echo "[*] Завершено добавление брендов с маленькой буквы!"

echo "[*] Добавляем 50 популярных брендов + 4 цифры..."

for brand in "${brands[@]}"; do
    for i in {1000..9999}; do
        echo "$brand$i" >> "$output_file"
    done
done

echo "[*] Завершено добавление брендов + 4 цифры!"

echo "[*] Готовый wordlist сохранен в $output_file"
