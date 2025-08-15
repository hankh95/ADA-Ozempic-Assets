// OzempicOrderSet.fsh - PlanDefinition Instance for Order Set
Alias: CPG = http://hl7.org/fhir/uv/cpg/StructureDefinition
Alias: FHIRHelpers = http://fhir.org/guides/cqf/common/Library/FHIRHelpers
Alias: SNOMED = http://snomed.info/sct
Alias: ICD10 = http://hl7.org/fhir/sid/icd-10
Alias: RxNorm = http://www.nlm.nih.gov/research/umls/rxnorm
Alias: UCUM = http://unitsofmeasure.org

Instance: OzempicOrderSet
InstanceOf: CPG/cpg-ordersetdefinition
Title: "Ozempic (Semaglutide) Order Set for Type 2 Diabetes (ADA 2025)"
Description: "Condensed order set for initiating Ozempic in adults with T2DM per ADA guidelines, emphasizing ASCVD/HF/CKD risk reduction and weight loss."
* status = #active
* experimental = true
* purpose = "Supports pharmacologic approaches to glycemic treatment in T2DM, prioritizing GLP-1 RA for cardiorenal benefits."
* usage = "For adults with T2DM; start at 0.25 mg SC weekly, titrate to 1 mg; monitor for GI side effects."
* topic[0].coding.system = "http://terminology.hl7.org/CodeSystem/definition-topic"
* topic[0].coding.code = #treatment
* topic[0].coding.display = "treatment"
* library = "http://example.org/Library/OzempicEligibilityCriteria"
* action[0].title = "Initiate Ozempic Therapy"
* action[0].description = "Prescribe semaglutide (Ozempic) for T2DM management."
* action[0].trigger[0].type = #named-event
* action[0].trigger[0].name = "order-sign"
* action[0].condition[0].kind = #applicability
* action[0].condition[0].expression.language = #text/cql-identifier
* action[0].condition[0].expression.expression = "IsEligibleForGLP1RA"
* action[0].action[0].title = "Order Ozempic Injection"
* action[0].action[0].description = "Subcutaneous injection starting at 0.25 mg weekly."
* action[0].action[0].definitionCanonical = "http://example.org/ActivityDefinition/OzempicMedicationRequest"
* action[0].action[0].dynamicValue[0].path = "status"
* action[0].action[0].dynamicValue[0].expression.language = #text/cql
* action[0].action[0].dynamicValue[0].expression.expression = "'draft'"