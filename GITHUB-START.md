# Gemeinsam auf GitHub hochladen

## Projektordner

In PowerShell immer zuerst diesen Ordner öffnen:

```powershell
Set-Location C:\zhaw\datastandard_sushi\dg-ig\dg-ig
```

Hier müssen `sushi-config.yaml`, `input` und `.github` direkt liegen.
Das ZIP und das Aufgabenblatt ausserhalb dieses Ordners gehören nicht zum Repository.

## 1. Namen festlegen

Das Repository ist `Utschu/dg-ig`. Konfiguration und Pages-Adresse sind angepasst.

Die Adresse für `canonical` hat diese Form:

```text
https://utschu.github.io/dg-ig
```

## 2. Leeres Repository auf GitHub erstellen

1. Auf GitHub anmelden und über **+ → New repository** ein Repository anlegen.
2. Den vereinbarten Namen eingeben.
3. Für diesen Ablauf **Public** wählen, damit GitHub Pages auch mit GitHub Free nutzbar ist.
4. Keine README, keine `.gitignore` und keine Lizenz hinzufügen; die lokalen Dateien bilden den Anfang.
5. **Create repository** anklicken und die HTTPS-Adresse kopieren.

## 3. Lokal mit GitHub verbinden und hochladen

Das lokale Repository ist mit `https://github.com/Utschu/dg-ig.git` verbunden:

```powershell
git remote -v
git push -u origin main
```

Falls Git beim Push eine Anmeldung öffnet, diese im Browser abschliessen.
Passwörter und Tokens nicht in Projektdateien oder in den Chat kopieren.

## 4. GitHub Pages aktivieren

1. Im Repository **Settings → Pages** öffnen.
2. Unter **Build and deployment → Source** die Option **GitHub Actions** wählen.
3. Unter **Actions → IG bauen** den ersten Lauf prüfen.
4. Falls die fehlende Pages-Einstellung den Lauf verhindert hat: **Re-run all jobs**.

Nach erfolgreichem Deployment:

```text
https://utschu.github.io/dg-ig/
https://utschu.github.io/dg-ig/qa.html
```

## 5. Spätere Änderungen hochladen

```powershell
git status
git add .
git commit -m "IG aktualisieren"
git push
```

## Inhalte und Prüfung

Konfiguration, Allergieprofil, zwei Beispieldarstellungen und die Startseite sind ausgefüllt.
Als Autor ist der GitHub-Name Utschu eingetragen.

Lokal mit derselben SUSHI-Version wie in GitHub Actions prüfen:

```powershell
npx --yes --package fsh-sushi@3.21.0 sushi build .
```

Nach dem Push den aktuellen GitHub-Actions-Lauf und den QA-Report prüfen.
Für die Abgabe muss der QA-Report keine Errors enthalten. Warnungen nur nach
inhaltlicher Prüfung und mit Begründung in `input/ignoreWarnings.txt` unterdrücken.

Offizielle Anleitung: https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages
