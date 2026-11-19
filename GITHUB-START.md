# Gemeinsam auf GitHub hochladen

## Projektordner

In PowerShell immer zuerst diesen Ordner öffnen:

```powershell
Set-Location C:\zhaw\datastandard_sushi\dg-ig\dg-ig
```

Hier müssen `sushi-config.yaml`, `input` und `.github` direkt liegen.
Das ZIP und das Aufgabenblatt ausserhalb dieses Ordners gehören nicht zum Repository.

## 1. Namen festlegen

Wir brauchen deinen GitHub-Benutzernamen und den gewünschten Repository-Namen
(Vorschlag: `dg-ig`). Danach passen wir in `sushi-config.yaml` die Paket-ID,
`canonical`, Name, Titel, Beschreibung und Herausgeber gemeinsam an.

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

Das lokale Repository wird bereits vorbereitet. Den folgenden Platzhalter erst
durch die tatsächliche Repository-Adresse ersetzen:

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

## Noch offene Inhalte

Die Vorlage enthält noch TODOs in `sushi-config.yaml`, `input/fsh/profil.fsh`,
`input/fsh/beispiele.fsh` und `input/pagecontent/index.md`.
Der Upload allein vervollständigt diese Übungsaufgaben nicht.
Ein erfolgreicher Build und der QA-Report müssen nach dem Upload geprüft werden.

Offizielle Anleitung: https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages
