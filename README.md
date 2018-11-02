# Consulidator
Simple, dockerized way to backup and restore your Consul datastore.

## Usage
```
Usage: main [OPTIONS] ADDRESS

Options:
  --backup        Performs a backup - Default mode
  --restore TEXT  Performs a restore
  --port INTEGER  Consul Port
  --secure        Enables TLS connection
  --token TEXT    ACL token
  --help          Show this message and exit.
```

## Backup:
To backup to `my_backup` in the current directory:
```sh
CONSUL_ADDRESS=10.0.1.2
BACKUP_FILE=my_backup
VERSION=latest

docker run --rm \
djenriquez/consulidator:$VERSION \
$CONSUL_ADDRESS > $BACKUP_FILE
```

## Restore:
To restore from `my_backup` in the current directory:
```sh
CONSUL_ADDRESS=10.0.1.2
BACKUP_FILE=my_backup
VERSION=latest

docker run --rm \
-v `pwd`:/restore \
djenriquez/consulidator:$VERSION \
--restore $BACKUP_FILE \
$CONSUL_ADDRESS
```