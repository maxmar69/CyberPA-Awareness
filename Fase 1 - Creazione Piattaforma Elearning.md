# CREAZIONE PIATTAFORMA ELEARNING

## Premessa

Seguendo queste semplici istruzioni è possibile installare e configurare da zero una piafforma di elearning.
L'installazione non richiede skill avanzate e può essere affrontata da coloro che sono in grado di installare un sistema operativo.

Per raggiungere lo scopo avremo bisogno di:
- Un macchina dove installare linux
  E' consigliabile utilizzare una macchina virtuale ma la stessa procedura si applica anche a dispositivi fisici.
- Un server DHCP per che rilasci un ip alla macchina
- Un server DNS in grado di risolvere l'hostname associato alla macchina
- Un domain controller microsoft (opzionale) da utilizzare per far autenticare gli utenti con le medesime credenziali utilizzate per l'accesso al proprio pc
  
## Installazione

### Predisposizione del sistema operativo
Questa guida si basa sull'utilizzo della distribuzione ubuntu server che può essere scaricata da internet e facilmente installata seguendo il wizard di configurazione iniziale.

### Configurazione di rete
E' necessario riservare un'indirizzo ip alla macchina e registrarla sul server dns locale in modo che sia possibile richiamare da un qualsiasi pc i servizi che andremo ad implementarvi.

In questa guida supporremo a titolo d'esempio che la macchina abbia la seguente configurazione:
- ip (ottenuto dinamicamente da un server dhcp): `192.168.33.127` 
- hostname: `elearning`

Per poter gestire facilmente la macchina apriamo il terminale e diamo i seguenti comandi
```bash
# Chiediamo al sistema di impersonare root
sudo -s
# Impostiamo l'hostname della macchina
hostnamectl set-hostname elearning
```

### Aggiornamemento del sistema operativo
Fatto questo provvediamo ad aggiornare il sistema operativo 
```bash
sudo -s
apt-get update
apt-get upgrade
apt-get dist-upgrade
# riavviamo il sistema con gli ultimi aggiornamenti installati
reboot
```

### Installazione dei tool accessori
```bash
sudo -s
apt-get install ssh
```

### Integrazione con il dominio (opzionale)

Copiare nella directory `/tmp` della macchina il file `AdAuthSetup.sh`, aprire il terminale e dare i seguenti comandi:
```bash
sudo -s
# bash /tmp/AdAuthSetup.sh {computername} {domain admin account} {domain fqdn} [login group] [sudo group]
# dove:
# {computername} è il hostname del computer che vogliamo registrare nel dominio  (es. elearning)
# {domain admin account} è il nome di un utente amministratore del dominio (es. massimo)
# {domain fqdn} è il Full Qualified Display Name del dominio (es. papernet.provincia.mc.it)
# [login group] se indicato indica il gruppo di dominio al quale devono appartenere tutti gli utenti che debbano accedere localmente alla macchina (es. CED)
# [sudo group] se indicato indica il gruppo di dominio i cui utenti possono eseguire il comando sudo senza che venga loro richiesta un'ulteriore autenticazione (da usare solo in ambienti di test) (es. CED)
# Ad esempio il comando:
bash /tmp/AdAuthSetup.sh elearning massimo papernet.provincia.mc.it ced ced
# verrà chiesto di inserire la password dell'utente di ammistrazione indicato {domain admin account} ed al termine la macchina linux sarà integrata al dominio microsoft e sarà possibile accedervi con le credenziali di dominio.

# Riavviamo la macchina per verificare che tutto funzioni correttamente
reboot
```

### Attivazione piattaforma moodle

## [INSTALL] Installazione della piattaforma moodle  {#INSTALL}

Installeremo moodle come progetto docker

### Attivazione piattaforma moodle

Installazione di docker come mostrato su `......./Progetti/informatica/_SISTEMA/docker/howto/INSTALL.md`

#### Creazione del progetto moodle 

Leggere quanto si trova su `....../Progetti/informatica/_SISTEMA/docker/progetti-compose/moodle/`

Scaricare il progetto docker compose e partire da zero:
```
curl -sSL https://raw.githubusercontent.com/bitnami/containers/main/bitnami/moodle/docker-compose.yml > docker-compose.yml
```

In alternativa seguire la strada già fatta:

Predisporre l'ambiente
```bash 
sudo -s
mkdir -p /DATA/MainDataset/Docker/
cd /DATA/MainDataset/Docker/

git clone --depth 1 --recurse-submodules --shallow-submodules massimo@brigitta:/data/unsafe/mycloud/pCloud/Offline/myarchivio/Progetti/informatica/_SISTEMA/docker/compose/progetti-compose/moodle/

git clone --depth 1 --recurse-submodules --shallow-submodules massimo@brigitta:/data/unsafe/mycloud/pCloud/Offline/myarchivio/Progetti/informatica/_SISTEMA/docker/compose/tools/

# Creazione dei link simbolici ai tool all'interno della dir bows
cd moodle ; ln -fs ../tools/*.sh .
```

Avvio di moodle
```bash
sudo -s
cd /DATA/MainDataset/Docker/moodle
docker compose up -d
```

Test del servizio

Leggere quanto si trova su `....../Progetti/informatica/_SISTEMA/moodle/`

Andare su http://elearning.papernet.provincia.mc.it:8080/








Installazione di docker come mostrato su `......./Progetti/informatica/_SISTEMA/docker/howto/INSTALL.md`

#### Creazione del progetto moodle 

Leggere quanto si trova su `....../Progetti/informatica/_SISTEMA/docker/progetti-compose/moodle/`




```bash 
sudo -s
mkdir -p /DATA/MainDataset/Docker/
cd /DATA/MainDataset/Docker/

git clone --depth 1 --recurse-submodules --shallow-submodules massimo@brigitta:/data/unsafe/mycloud/pCloud/Offline/myarchivio/Progetti/informatica/_SISTEMA/docker/compose/progetti-compose/moodle/

git clone --depth 1 --recurse-submodules --shallow-submodules massimo@brigitta:/data/unsafe/mycloud/pCloud/Offline/myarchivio/Progetti/informatica/_SISTEMA/docker/compose/tools/

# Creazione dei link simbolici ai tool all'interno della dir bows
cd moodle ; ln -fs ../tools/*.sh .
```

Avvio di moodle
```bash
sudo -s
cd /DATA/MainDataset/Docker/moodle
docker compose up -d
```

Test del servizio

Leggere quanto si trova su `....../Progetti/informatica/_SISTEMA/moodle/`

Andare su http://elearning.papernet.provincia.mc.it:8080/

------------------------------------


## Configurazione piattaforma moodle

Leggere quanto si trova su `....../Progetti/informatica/_SISTEMA/moodle/`


### Integrazione LDAP 

@masterdc
creiamo l'utente `moodle` con password `Pdmmdmmi2402!` con le opzioni:
- User must change password at next logon: `NON spuntata`
- Password never expires `SPUNTATA`
Inseriamo l'utente come membro di UTENTI_SERVIZI per evitare il cambio di password

Leggere quanto si trova su `....../Progetti/informatica/_SISTEMA/moodle/`
Lanciato lo script /Progetti/informatica/powershell/gestioneUtenti/aggiornamentoCampi_firstName,lastName,email.ps1


Rispetto alla guida impostati i seguenti valori:
- System role mapping
- Manager context: lasciato vuoto (gli utenti scoperti trapite ldap non possono poi essere rimossi dal ruolo di manager)
- Course creator context: lasciato vuoto (gli utenti scoperti trapite ldap non possono poi essere rimossi dal ruolo di manager)
- Data Mapping
  - Lock value (First name): `Unlocked`
  - Lock value (Last name): `Unlocked`
  - Lock value (Email address): `Unlocked` 

### Impostazione dell'amministratore del sito

Leggere quanto si trova su `....../Progetti/informatica/_SISTEMA/moodle/howto/*_SITEADMIN_USER.md`

Aggiunto massimo.marconi@papernet.provincia.mc.it

### Impostazione dei Manager e dei Creatori di contenuti

Leggere quanto si trova su `....../Progetti/informatica/_SISTEMA/moodle/howto/*_SITEMNG_USER.md`

Aggiunto massimo.marconi@papernet.provincia.mc.it come manager e come course_creator

### Impostazione dell'Italiano come lingua di default 

Leggere quanto si trova su `....../Progetti/informatica/_SISTEMA/moodle/`

### Impostazione della schermata principale 

Leggere quanto si trova su `....../Progetti/informatica/_SISTEMA/moodle/`

### Togliere dalla schermata di login il link "Hai dimenticato la password?"

Leggere quanto si trova su `....../Progetti/informatica/_SISTEMA/moodle/`


