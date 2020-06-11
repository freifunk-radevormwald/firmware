# Radevormwald Firmware Repository - Stand 11.06.2020

Freifunk Firmware für Freifunk Radevormwald und Freifunk Wuppertal 

## build-Prozess


Pre-Requsites:

gluon-dependencies müssen ebenfalls auf dem System installiert sein (Stand 09.01.2019).

```sudo apt install git subversion python build-essential gawk unzip libncurses5-dev zlib1g-dev libssl-dev wget time```


Sites-Dateien, wie `sites.ffrade` enthalten eine Liste an Site-Konfigurationen die aus dem Template (aus `templates/`) erstellt werden.
Diese enthalten dann Zeilen im Format wie `experimentall2tp v2018.2.x dusl2tp dusl2tp`.
**Zeilenumbrüche müssen im UNIX- Format** sein. Jede Zeile muss mit **`<LR>`** abgeschlossen sein,  Leerzeilen sind ungültig.

### Serviervorschlag:


```
git clone https://github.com/freifunk-radevormwald/firmware
cd firmware
git clone https://github.com/freifunk-gluon/gluon -b v2019.1.2
./build.sh sites.ffrade.stable
```


Das Buildscript wird mit der Sites-Datei als Parameter aufgerufen, zusätzlich können beliebig viele Architekturen angegeben werden, für die Images gebaut werden sollen. Wird keine Architektur angegeben, werden alle gebaut.

`./build.sh sites.ffmet ar71xx-generic ar71xx-nand`



## Branches
broken, experimental und stable 

- **broken** exisitiert kein Release Kanal, **experimental** der Kanal `experimental` und **stable* ist Kanal `stable`
- **nur Freifunk Düsseldorf-Flingern**: es gibt jeden Releasekanal in "l2tp" und "fastd" (bei fastd entfällt der namenszusatz im Releasekanal)
- **nur Neanderfunk**: es gibt einen den Releasekanal (fastd).

- es gibt noch den zusätzlichen _Bau-Stand_ **key** (z.B. **stable/stablekey stablel2tp/stablel2tpkey**) in der "bypassconfigmode" und mehrere ssh-keys der Admins gesetzt sind. Diese Firmware wird auschließlich für Administratoren gebaut und ist ohne Rücksprache nicht zu verwenden!



## Development

You can check the right modules with

    tests/validate_site.sh

This will perform a basic check, if all packages from `site.mk` are found in any of the defined repositories in `modules`, gluon itself and the gluon/packages repo.
