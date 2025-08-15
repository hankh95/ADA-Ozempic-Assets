### Updated CQL Shorthand (CQLS) Specification

#### Overview

CQL Shorthand (CQLS), which serves as a bridge in our broader knowledge architecture model. CQLS aligns with the Reusable Assets and Logic (RALL) layer by providing human-readable, editable logic artifacts that can be authored as code, versioned via Git, tested with TDD/BDD in CI/CD pipelines, and published for loading into graph databases. It leverages FHIR Shorthand (FSH) principles for compactness while integrating CQL's ELM semantics, UMLS terminologies (e.g., SNOMED-CT, LOINC, ICD-10), and NLM/HL7 value sets to avoid redundancy. 

Pseudocode is mandated above each Define/Function for clinical editors, enhancing traceability to prose guidelines in the Guideline Semantic Relationship Layer (GSRL). In the Workflow and Time Layer (WATL), CQLS outputs can inline into PlanDefinition.actions for workflow graphs, incorporating GLIFv2's explicit steps and OpenEHR GDL2's clarity in temporal sequencing.

CQLS remains a declarative shorthand for CQL, emphasizing indentation, keywords, and shortcuts to reduce boilerplate. Updates based on your query:  
- **Pseudocode Simplification**: Pseudocode is now purely descriptive natural language, avoiding any CQL-like terms (e.g., no "Exists", "Check", or query structures). It focuses on clinical intent for editors.

- **CQL `exists` Parameters**: As clarified, `exists` in CQL takes only one parameter: the list expression (e.g., a retrieve or query). No named/optional params exist on `exists` itself. However, the inner expression (retrieve) supports extensions via clauses like `where` (filters), `sort by` (ordering), `return` (projections), `with/without` (joins), and aggregations (e.g., `Count()`). In CQLS, these are handled via optional flags (e.g., `{where X}`) or indented clauses, expanding to full CQL. Retrieves implicitly use context (e.g., Patient) and can reference value sets/codes from NLM/HL7 without recreation.

- **Implicit Existence Checks**: In CQLS, simple resource checks (e.g., `Condition: Code`) now implicitly compile to `exists [Condition: Code]`, making it even more editor-friendly.  
- **One Asset per File**: Per RALL properties, each CQLS file outputs one primary logic asset (e.g., library), with test folders for BDD/TDD (e.g., /tests/eligibility.feature).  
- **Integration with Broader Architecture**: CQLS artifacts can be referenced in GSRL (e.g., as CaseFeatureDefinitions for risk factors), RALL (e.g., as ECA Rules or Measures), and WATL (e.g., inlined in FHIR-CPG pathways for time-based sequences).

#### Key Features of CQLS

- **Keyword-Driven Structure**: Top-level keywords like `Library:`, `Define:` for sections.  
- **Indentation for Hierarchy**: Nests expressions/queries.  
- **Aliases and Shortcuts**: `Alias:` for URIs/codesystems.  
- **Concise Notation**: Implicit existence; flags like `{where X}` for retrieve extensions.  
- **Human-Readable Aspects**: Pseudocode as `# Descriptive intent...`; intuitive for clinicians.  
- **Modularity**: `RuleSet:` for grouped logic.  
- **Limitations**: Declarative only; complex scripting via functions.

#### Transformation Rules Between CQL and CQLS

1. **Library Definition**: CQL: `library Name version 'X.Y.Z'` → CQLS: `Library: Name vX.Y.Z`. Expand version if omitted (default '1.0').  
2. **Using/Includes**: CQL: `using Model version 'X.Y.Z'` → CQLS: `Using: Model vX.Y.Z`. Add `called` in expansion.  
3. **Codesystems/Valuesets/Codes**: CQL: `codesystem "Name": 'URI'` → CQLS: `CodeSystem: Name = 'URI'`. Use `=`; reference NLM/HL7 value sets directly (e.g., `ValueSet: Diabetes = 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.103.12.1001'`).  
4. **Parameters**: CQL: `parameter "Name" Type default Value` → CQLS: `Param: Name = Type default Value`.  
5. **Context**: CQL: `context Name` → CQLS: `Context: Name`. Implicit Patient if omitted → Explicit in CQL.  
6. **Defines (Expressions/Queries)**: CQL: `define "Name": Expression` → CQLS: `Define: Name = Expression` (indent sub-parts).  
   - Retrieves: CQLS: `Resource: "ValueSet/Code" {where status='active'}` → CQL: `[Resource: "ValueSet/Code"] where status='active'`.  
   - Implicit Existence: CQLS: `Condition: Code` → CQL: `exists [Condition: Code]`.  
   - Queries: Indent: `From Resource: "ValueSet" Where Condition Return Item {sort desc}` → Full CQL query.  
   - Functions: `Function: Name(Params) = Expression` → CQL: `define function "Name"(Params): Expression`.  
   - Pseudocode: `# Plain description...` → CQL comment `// Plain description...`.  
7. **RuleSets**: CQLS: `RuleSet: Name` + indented Defines → Expand to prefixed defines or includes.  
8. **Pseudocode**: Always precede Define/Function; simplified to descriptive prose only.  
9. **General Rules**: Indentation → Parentheses in CQL. Flags (e.g., `{where X, during last 1 year}`) → Clauses. Use UMLS codes (e.g., SNOMED) inline. One asset/file for RALL compliance. Test folders: Include /tests with BDD features (e.g., Gherkin for TDD).