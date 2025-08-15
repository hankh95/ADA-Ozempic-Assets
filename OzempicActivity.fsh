// OzempicActivity.fsh - ActivityDefinition Instance for MedicationRequest
Instance: OzempicMedicationRequest
InstanceOf: CPG/cpg-medicationrequestactivity
Title: "Ozempic Medication Request Activity"
Description: "Activity for prescribing Ozempic (semaglutide) injection."
* status = #active
* kind = #MedicationRequest
* productCodeableConcept.coding[0].system = RxNorm
* productCodeableConcept.coding[0].code = #1991302
* productCodeableConcept.coding[0].display = "semaglutide 2 mg/1.5 mL subcutaneous solution auto-injector"
* dosage.timing.repeat.frequency = 1
* dosage.timing.repeat.period = 1
* dosage.timing.repeat.periodUnit = #wk
* dosage.route.coding[0].system = SNOMED
* dosage.route.coding[0].code = #34206005
* dosage.route.coding[0].display = "Subcutaneous"
* dosage.doseAndRate[0].doseQuantity.value = 0.25
* dosage.doseAndRate[0].doseQuantity.unit = "mg"
* dosage.doseAndRate[0].doseQuantity.system = UCUM
* dosage.doseAndRate[0].doseQuantity.code = #mg