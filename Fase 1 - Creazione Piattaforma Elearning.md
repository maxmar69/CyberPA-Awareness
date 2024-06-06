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

### Scaricamento del progetto CyberPA-Awareness
Aprire il terminale e dare i seguenti comandi:
```bash
sudo -s
apt-get install git
cd /opt
git clone https://github.com/maxmar69/CyberPA-Awareness.git
```
Ora nella directory `/opt/CyberPA-Awareness` è disponibile il progetto.


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

Per effettuare l'integrazione della macchina al dominio utilizzeremo lo script `AdAuthSetup.sh` parte di questo progetto.
Per eseguire lo script si devono prima recuperare le seguenti informazioni:
- computername
  L'hostname del computer che vogliamo registrare nel dominio  (es. elearning)
- domain admin account
  è il nome di un utente amministratore del dominio (es. massimo)
- domain fqdn
  è il Full Qualified Display Name del dominio (es. papernet.provincia.mc.it
- login group
  se indicato indica il gruppo di dominio al quale devono appartenere tutti gli utenti che debbano accedere localmente alla macchina (es. CED)
- sudo group
  se indicato indica il gruppo di dominio i cui utenti possono eseguire il comando sudo senza che venga loro richiesta un'ulteriore autenticazione (da usare solo in ambienti di test) (es. CED)
Quindi si possono dare i seguenti comandi:
```bash
sudo -s
bash /opt/CyberPA-Awareness/AdAuthSetup.sh {computername} {domain admin account} {domain fqdn} [login group] [sudo group]
# Ad esempio il comando:
bash /tmp/AdAuthSetup.sh elearning massimo papernet.provincia.mc.it ced ced
# verrà chiesto di inserire la password dell'utente di ammistrazione indicato {domain admin account} ed al termine la macchina linux sarà integrata al dominio microsoft e sarà possibile accedervi con le credenziali di dominio.

# Riavviamo la macchina per verificare che tutto funzioni correttamente
reboot
```

### Attivazione piattaforma moodle
Installeremo moodle come un progetto docker compose.

#### Installazione docker compose
```bash
# Rimozione vecchie versioni (ad esmepio quelle installate dai repository di ubuntu)
sudo apt-get remove docker docker-engine docker.io containerd runc docker-compose

# Aggiorniamo la cache
sudo apt-get update

# Installiamo i tool necessari per l'installazione
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Scarichiamo la chiave del repository da aggiungere
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg


# Aggiungiamo il repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Aggiorniamo nuovamente la cache
sudo apt-get update

# Insalliamo i pacchetti di docker compose
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin 
```

#### Avvio del progetto moodle 

```bash
sudo -s
# Creiamo la directory dove andremo a configurare il progetto
cd /opt/CyberPA-Awareness


# Avviamo il progetto docker
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

### Primo accesso
Una volta avviato il progetto docker compose di moodle la piattaforma è operativa e disponibile all'indirizzo configurato (es. elearning)

A questo si può accedere alla webgui utilizzando le credenziali di default dell'utente di amministrazione:
- username: `user`
- password: `bitnami`

### Integrazione LDAP (opzionale)
E' sicuramente utile la possibilità di poter far utenticare gli utenti utilizzando le medesime credenziali da loro utilizzate per accedere al dominio e alla propria stazione di lavoro.

#### Configurazione nel domain controller (DC)

##### Creazione utente moodle
Dobbiamo creare un utente da utilizzare esclusivamente per consentire a moodle di accedere al servizio LDAP.
Ad esempio possiamo creare l'utente `moodle` con le seguenti proprietà:
- password: una qualsiasi password corrispondente alle policy di sicurezza impostate nel dominio
- User must change password at next logon: `NON spuntata`
- Password never expires: `SPUNTATA`
  Dobbiamo assicurarci che la password dell'utente non scada mai.

##### Ottimizzazione contenuti Active Directroy (opzionale)
Moodle gestisce gli utenti interno utilizzando alcuni campi presenti in Active Directory. E' quindi importante che questi campi siano popolati correttamente.
Nel pacchetto è presente lo script powershell `aggiornamentoCampi_firstName,lastName,email.ps1` che popola i campi firstName,lastName,email utilizzando come informazione di partenza il nome dell'utente che si presume sia nel formato nome.cognome.
E' possibile modificare tale script per adattarlo alle proprie specifiche esigenze. 
Per essere eseguito lo script deve essere copiato sul domain controller ed eseguito.


#### Configurazione nella piattaforma moodle

Autenticarsi nella piattaforma con le credenziali di amministratore.

1) Abilitare l'autenticazione LDAP
   Andare su site administration/plugins/authenitcation/Manage authentication e cliccare su *Settings* in corrispondenza di *LDAP server* quindi imposare:
   - LDAP server settings
     - Host URL: 
       FQDN di un domain controller (es. dc1.papernet.provincia.mc.it)
     - Version: `3`
     - Use TLS: `No`
     - LDAP encoding: `cp1250`
     - Page size: `250`
   - Bind settings
     - Prevent password caching: `Yes`
     - Distinguished name: 
       relativo all'utente precedentemente creato in Active Directory (es. `CN=moodle,CN=Users,DC=papernet,DC=provincia,DC=mc,DC=it`). 
       Il DistinguishedName può essere ottenuto accedendo al pannello *Active Directory Users and Computers*, ed accedendo al tab *Attribute Editor* nelle proprietà dell'utente.
     - Password: 
       Impostare quella dell'utente così come impostata in Active Directory
   - User lookup settings  
     - User type: `MS ActiveDirectory`
     - Context: 
       Impostare il DistinguishedName della (Oraganization Unit) OU all'interno della quale sono contenuti gli utenti (es. `OU=UOUser_WIN10,OU=DOMINIO_WIN10,DC=papernet,DC=provincia,DC=mc,DC=it`)
       Può essere ottenuta accedendo al pannello *Active Directory Users and Computers*, ed accedendo al tab *Attribute Editor* nelle proprietà dell'OU.
     - Search subcontexts: `Yes`
     - Dereference aliases: `no`
     - User attribute: `sAMAccountName`
     - Suspended attribute: lasciato vuoto
     - Member attribute: lasciato vuoto
     - Member attribute uses dn: `Yes` 
     - Object class: `(&(objectCategory=person)(objectClass=user)(!(userAccountControl:1.2.840.113556.1.4.803:=2))(!(userAccountControl:1.2.840.113556.1.4.803:=65536)))`
       In questo modo NON vengono sincronizzati gli utenti disabilitati `(!(userAccountControl:1.2.840.113556.1.4.803:=2))` e neppure quelli hanno una password senza scadenza `(!(userAccountControl:1.2.840.113556.1.4.803:=65536))`
   - Force change password 
     - Force change password: `No`
     - Use standard page for changing password : `No` (vogliamo impedire la modifica della password da moodle e quindi gli chiediamo di chiamare un url errato inserito nel campo Password change URL)
     - Password format: `Plain text`
     - Password-change URL: 
       lasciare vuoto
   - LDAP password expiration settings  
     - Expiry: `LDAP server`
     - Exipiry warning: `5`
     - Expiration attribute: lasciato vuoto 
     - Grace logins: `No`
     - Grace login attribute: lasciato vuoto 
   - Enable user creation  
     - Create users externally: `No`
     - Context for new users: lassciato vuoto
   - System role mapping
     - Manager context: 
       Impostare il DistinguishedName della (Oraganization Unit) OU all'interno della quale sono contenuti gli utenti di amministrazione (es.    `CN=CED_OPERATORI,CN=Users,DC=papernet,DC=provincia,DC=mc,DC=it`).
       Gli utenti scoperti tramite LDAP non possono poi essere poi essere rimossi dal ruolo di manager: se si vuole maggiore flessibilità conviene lasciare questo campo vuoto ed aggiungerli poi manualmente.

     - Course creator context: 
       Impostare il DistinguishedName della (Oraganization Unit) OU all'interno della quale sono contenuti gli utenti che possono creare contenuti (es.`CN=CED_OPERATORI,CN=Users,DC=papernet,DC=provincia,DC=mc,DC=it`).
       Se si vuole maggiore flessibilità conviene lasciare questo campo vuoto ed aggiungerli poi manualmente.
   - User account synchronisation
     - Removed ext user: `Suspend Internal`
     - Synchronise local user suspension status: `Yes`
   - NTLM SSO
     NON USATO 
   - Data mapping 
     - Data mapping (First name): `givenName`
     - Data mapping (Last name): `sn`
     - Data mapping (Email address): `mail`
2) Testare la configuraizione
   - Andare su site administration/plugins/authenitcation/Manage authentication e cliccare su *Test Settings* in corrispondenza di *LDAP server* 
3) Abilitare il plugin
   - Andare su site administration/plugins/authenitcation/Manage authentication e cliccare sull'icona a forma di occhio in corrispondenza di *LDAP server* 
4) Abilitare il sync con il server ldap
  - Andare su site administration/Server/Tasks/scheduled task e cliccare sull'icona dell'ingranaggio in corrispondenza di *LDAP users sync job* ed impostare:
    - Minute: `*/30`
    - Hour: `*`
    - Day: `*`
    - Month: `*`
    - Day of week: `*`
    - Disabled: NON SPUNTATO
    
    Cliccare su *Save changes*
     
5) Testare il logon con credenziali di dominio

-----------------

### Configurazione utenti di amministrazione
Entrare con l'attuale utente di amministratore del sito.
Andare quindi nel menu Site administration/Users/Permissions/Site administrators

### Impostazione dell'Italiano come lingua di default 

- Installare un pacchetto di lingua
  Andare su site administration/General/Language/Languace packs
  Selezionare nel pannello di destra la lingua desiderata e cliccare su *Install selected language pack*
- Impostare la lingua di default 
  Andare su site administration/General/Language/Language settings ed impostare:
  - Default language: la lingua desiderata 

### Impostazione della schermata principale 
- Andare su site administration/General/Site home/Site home settings ed impostare:
  - Full site name: 
    Scrivere il nome da dare alla piattaforma (es.`Piattaforma elearning della Provincia di Macerata`)
  - Short name for site (eg single word): `Elearning`
  - Site home summary: 
    Scrivere il teso da mostrare nella home page. 

### Togliere dalla schermata di login il link "Hai dimenticato la password?"
- Vedere quale tema è utilizzato 
- Andare su site administration/Appearence/Themes/*nome del tema corrente* quindi cliccare su *Advanced settings* ed inserire il seguente testo nella sezione *Raw SCSS*
```css 
.login-form-forgotpassword {
  display: none;
}
```
