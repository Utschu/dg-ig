### Use Case

Eine Hausarztpraxis erfasst die Arzneimittelallergien ihrer Patientinnen und Patienten strukturiert. Eine Notfallstation liest diese Angaben, um bekannte Allergien, ihre Kritikalität und dokumentierte Reaktionen bei der Behandlung berücksichtigen zu können. Das Profil legt dafür gemeinsame Anforderungen an die FHIR-Ressource AllergyIntolerance fest.

### Scope

Dieses IG beschreibt Arzneimittelallergien auf Basis von CH Core AllergyIntolerance. Es umfasst klinischen Status, Allergiecode, Kritikalität, Beginn, erfassende Ärztin oder erfassenden Arzt und bekannte Reaktionen. Nahrungsmittel- und Umweltallergien, Medikationsverordnungen und Therapieempfehlungen sind nicht Teil dieses IG. Alle Beispiele sind fiktiv.

### Profilregeln und Entscheidungen

| Anforderung | Umsetzung und Begründung |
|---|---|
| Arzneimittel | Genau eine Kategorie, festgelegt auf `medication`. |
| Klinischer Status | Pflichtfeld (`1..1`); die zulässigen Codes werden aus FHIR geerbt. |
| Allergiecode | Pflichtfeld mit erweiterbarem Binding an die Schweizer Allergieliste. Ein passender Begriff aus der Liste muss verwendet werden; fehlt er, sind andere Codes oder eine textuelle Beschreibung möglich. |
| Kritikalität | Pflichtfeld und Must Support. Für unbekannte Kritikalität steht `unable-to-assess` zur Verfügung. |
| Beginn | Optional, Must Support, beschränkt auf `dateTime` oder `Age`. So lassen sich ein bekanntes Datum und ein nur ungefähr bekanntes Alter abbilden. |
| Erfassende Person | Pflichtfeld, beschränkt auf eine Referenz auf CH Core Practitioner. |
| Reaktionen | Optional und Must Support; Symptome verwenden ein erweiterbares Binding an die Schweizer Symptomliste. |

**Must Support** bedeutet in diesem Lab, dass erfassende Systeme die betreffenden Angaben speichern und übermitteln können und empfangende Systeme sie verarbeiten und anzeigen können. Es verpflichtet nicht dazu, unbekannte Angaben in jeder Instanz einzutragen. Pflichtfelder werden zusätzlich durch ihre Kardinalität festgelegt.

Die Invariante `dg-allergy-1` verlangt für jede bestätigte Allergie mindestens eine dokumentierte Reaktion. Für jede vorhandene Reaktion verlangt bereits FHIR mindestens ein Symptom. Die Beispiele erfüllen diese Bedingung durch die Angabe von Urtikaria.

### Artefakte

* [DG Arzneimittelallergie](StructureDefinition-dg-medication-allergy.html): Profil mit den sieben Anforderungen und der Invariante für bestätigte Allergien.
* [Penicillinallergie bei Anna Muster](AllergyIntolerance-PenicillinAllergieAnna.html): Bestätigte, aktive Penicillinallergie mit hoher Kritikalität und Urtikaria; der Beginn ist als Datum dokumentiert.
* [Alternative mit Beginn als Alter](AllergyIntolerance-PenicillinAllergieAnnaBeginnAlter.html): Derselbe fiktive Fall mit dem Alter 30 Jahre als Beginn; eine alternative Darstellung, kein zusätzlicher Allergieeintrag.
* [Anna Muster](Patient-AnnaMuster.html): Fiktive Patientin, auf die sich die Beispiele beziehen.
* [Dr. med. Sara Keller](Practitioner-DrSaraKeller.html): Ärztin, welche die Allergie erfasst hat.
* [Praxis am Park](Organization-PraxisAmPark.html): Fiktive Hausarztpraxis.
* [Dr. Sara Keller in der Praxis am Park](PractitionerRole-DrSaraKellerPraxisAmPark.html): Verknüpft die Ärztin mit ihrer Praxis.

### Abhängigkeiten

Dieses IG baut auf [CH Core 6.0.0](https://fhir.ch/ig/ch-core/6.0.0/) und [CH Term 3.3.0](https://fhir.ch/ig/ch-term/3.3.0/) für die Schweizer Terminologie auf. Es verwendet FHIR R4 (4.0.1).

### Qualitätssicherung

SUSHI kompiliert die FSH-Dateien. Der IG Publisher validiert die erzeugten Ressourcen einschliesslich der Invariante. Der [QA-Report](qa.html) zeigt die Ergebnisse des jeweiligen Builds; ein erfolgreiches Deployment allein belegt keine Fehlerfreiheit der Ressourcen.

### Autor

[Utschu](https://github.com/Utschu)

Erstellt im Lab des Moduls Data Standards in Healthcare, ZHAW, HS26. Kein offizieller Standard.
