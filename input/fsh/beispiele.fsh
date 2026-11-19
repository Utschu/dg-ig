/* ---------------------------------------------------------------------------
 * --  _____       _____ _______                                             -
 * -- |_   _|     |_   _|__   __|                                            -
 * --   | |  _ __   | |    | |       Institute of Computer Science           -
 * --   | | | '_ \  | |    | |       Zurich University of                    -
 * --  _| |_| | | |_| |_   | |       Applied Sciences                        -
 * -- |_____|_| |_|_____|  |_|       8401 Winterthur, Switzerland            -
 * ---------------------------------------------------------------------------
 */

Instance: PenicillinAllergieAnna
InstanceOf: DgMedicationAllergy
Usage: #example
Title: "Penicillinallergie bei Anna Muster"
Description: "Fiktive bestätigte, aktive Penicillinallergie mit Urtikaria, Beginn als Datum und erfassender Ärztin."
* patient = Reference(AnnaMuster)
* category = #medication
* clinicalStatus = $allergy-clinical#active
* verificationStatus = $allergy-verification#confirmed
* code = $sct#91936005 "Allergy to penicillin (finding)"
* criticality = #high
* onsetDateTime = "2015-04-12"
* recorder = Reference(DrSaraKeller)
* reaction.manifestation = $sct#126485001 "Urticaria (disorder)"

Instance: PenicillinAllergieAnnaBeginnAlter
InstanceOf: DgMedicationAllergy
Usage: #example
Title: "Alternative Erfassung mit Beginn als Alter"
Description: "Alternative Darstellung desselben fiktiven Falls, wenn nur das Alter bei Beginn bekannt ist; kein zweiter Allergieeintrag."
* patient = Reference(AnnaMuster)
* category = #medication
* clinicalStatus = $allergy-clinical#active
* verificationStatus = $allergy-verification#confirmed
* code = $sct#91936005 "Allergy to penicillin (finding)"
* criticality = #high
* onsetAge = 30 'a' "Jahre"
* recorder = Reference(DrSaraKeller)
* reaction.manifestation = $sct#126485001 "Urticaria (disorder)"
