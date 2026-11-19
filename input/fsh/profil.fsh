/* ---------------------------------------------------------------------------
 * --  _____       _____ _______                                             -
 * -- |_   _|     |_   _|__   __|                                            -
 * --   | |  _ __   | |    | |       Institute of Computer Science           -
 * --   | | | '_ \  | |    | |       Zurich University of                    -
 * --  _| |_| | | |_| |_   | |       Applied Sciences                        -
 * -- |_____|_| |_|_____|  |_|       8401 Winterthur, Switzerland            -
 * ---------------------------------------------------------------------------
 */

// Regeln für die sieben Anforderungen des Aufgabenblatts.
Profile: DgMedicationAllergy
Parent: CHCoreAllergyIntolerance
Id: dg-medication-allergy
Title: "DG Arzneimittelallergie"
Description: "Arzneimittelallergie, wie sie in der Hausarztpraxis erfasst und auf der Notfallstation gelesen wird."

// 1. Genau eine Kategorie; sie ist immer medication.
* category 1..1
* category = #medication

// 2. Der klinische Status muss immer vorhanden sein.
* clinicalStatus 1..1

// 3. Code ist Pflicht. Die Schweizer Liste ist zu verwenden, falls sie
// einen passenden Begriff enthält; andernfalls sind andere Codes oder Text erlaubt.
* code 1..1
* code from $ch-allergy-vs (extensible)

// 4. Die Kritikalität muss angegeben und von Systemen unterstützt werden.
// unable-to-assess bleibt als zulässiger Wert für unbekannte Kritikalität erhalten.
* criticality 1..1 MS

// 5. Beginn als Datum oder Alter; ein unbekannter Beginn bleibt möglich.
* onset[x] only dateTime or Age
* onset[x] MS

// 6. Die erfassende Ärztin oder der erfassende Arzt muss angegeben sein.
* recorder 1..1
* recorder only Reference(CHCorePractitioner)

// 7. Bekannte Reaktionen müssen unterstützt werden, sind aber nicht immer vorhanden.
// Für jede vorhandene Reaktion verlangt FHIR bereits mindestens ein Symptom.
* reaction MS
* reaction.manifestation MS
* reaction.manifestation from $ch-allergy-manifestation-vs (extensible)

// Eine bestätigte Allergie braucht mindestens eine Reaktion.
* obeys dg-allergy-1
