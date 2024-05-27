#!/bin/sh

# fonte: https://codymoler.github.io/tutorials/ubuntu-active-directory/

if [ $# -lt 3 ]; then
  echo "Sintassi:"
  echo  $(basename "$0") COMPUTERNAME DOMAIN_ADMIN_ACCOUNT DOMAIN_FQDN [[LOGIN_GROUP] [SUDO_GROUP]]
  echo "ad esempio: $(basename "$0") webserver massimo papernet.provincia.mc.it ced ced"
  exit 1
fi

COMPUTERNAME=$1
DOMAIN_ADMIN_ACCOUNT=${2^^}
DOMAIN_FQDN=${3^^}
LOGIN_GROUP=${4^^}
SUDO_GROUP=${5^^}

#echo $COMPUTERNAME $DOMAIN_ADMIN_ACCOUNT $DOMAIN_FQDN $LOGIN_GROUP $SUDO_GROUP
#exit 1


echo "### Installazione pacchetto sssd"
sudo apt-get update
sudo apt install -y sssd-ad sssd-tools realmd adcli

echo "### Creazione profilo krb5"
sudo sh -c "echo [libdefaults]'\n\t'default_realm = $DOMAIN_FQDN'\n\t'rdns = false > /etc/krb5.conf"

echo "### Installazione pacchetto krb5"
sudo apt install -y krb5-user sssd-krb5

echo "### Cambio hostname ad un hostname pienamente qualificato FQDN"
sudo hostnamectl set-hostname $COMPUTERNAME.$DOMAIN_FQDN
echo "nuovo hostname: $(sudo hostname)"

echo "### Adesione al dominio - inserire la password dell'utente $DOMAIN_ADMIN_ACCOUNT@$DOMAIN_FQDN"
sudo realm join -v -U $DOMAIN_ADMIN_ACCOUNT $DOMAIN_FQDN

echo "### Modifica PAM per creare automaticamente la home directory"
echo Spuntare il modulo “Create home directory on login”
sudo pam-auth-update

echo "### Test di verifica di collegamento per l'utente $DOMAIN_ADMIN_ACCOUNT sul dominio $DOMAIN_FQDN"
sudo id $DOMAIN_ADMIN_ACCOUNT@$DOMAIN_FQDN

if [ "$LOGIN_GROUP" != "" ]; then
  echo "### Limitazione dell'accesso alla macchina ai soli utenti di un gruppo $LOGIN_GROUP del dominio $DOMAIN_FQDN"
  sudo realm permit -g $LOGIN_GROUP@$DOMAIN_FQDN
fi

echo "### Visualizzazione della configurazione attuale mediante il coamndo realm list"
sudo realm list

if [ "$SUDO_GROUP" != "" ]; then
  echo "### Abilitazione del gruppo $SUDO_GROUP a svolgere l'operazione di SUDO"
  sudo sh -c "echo %$SUDO_GROUP@$DOMAIN_FQDN 'ALL=(ALL)' NOPASSWD:ALL > /etc/sudoers.d/AdConf"
fi


if [ -f "/etc/sudoers.d/AdConf" ]; then
  echo "### Visualizzazione configurazione del file /etc/sudoers.d/AdConf"
  sudo cat /etc/sudoers.d/AdConf
else
  echo "### File di configurazione sudo /etc/sudoers.d/AdConf non presente"
fi  


