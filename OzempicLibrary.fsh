// OzempicLibrary.fsh - Library Instance for CQL Logic
Instance: OzempicEligibilityCriteria
InstanceOf: CPG/cpg-computablelibrary
Title: "Ozempic Eligibility Criteria Library"
Description: "CQL library for Ozempic eligibility per ADA 2025, focusing on T2DM with cardiorenal/weight risks."
* status = #active
* type.coding[0].system = "http://terminology.hl7.org/CodeSystem/library-type"
* type.coding[0].code = #logic-library
* content[0].contentType = #text/cql
* content[0].url = "http://example.org/Library/OzempicEligibilityCriteria.cql"  // Compiled CQL from CQLS below