# Phase 6: Other Information — PRISMA Items 24a–27

## Dependencies
> **NOTE: This is an isolated session. Input research data has been provided separately. Do NOT reference outputs from Phases 3 and 4.**

## ⚠️ Placeholder Mode
> Fields that cannot be derived from the research input (registration numbers, DOIs, author names,
> grant numbers, URLs) MUST use `[PLACEHOLDER: field description]` format.
> **Do NOT invent registration numbers, DOIs, URLs, author names, grant numbers, or file paths.**
> **Do NOT generate any URLs or DOIs.** Fabricated registration IDs or DOIs are research integrity violations.
> Examples: `[PLACEHOLDER: OSF registration number]`, `[PLACEHOLDER: GitHub URL]`,
> `[PLACEHOLDER: lead author name]`, `[PLACEHOLDER: funding source]`

## Notes
- All 3 Registration sub-items (24a–24c) must be explicitly labeled — do not merge or omit
- Item 27 (Data Availability) is a single section but must address all required elements: data repository, code repository, FAIR principles, and data license

## Steps

1. **Item 24a: Registration**
   - State the register name (e.g., PROSPERO, OSF Registries, ANZCTR, Cochrane)
   - Provide the full registration number
   - State the registration date relative to the review start date (prospective vs. retrospective registration)
   - If not registered, state this explicitly and provide the rationale
   → Write to: `output/{theme}/phase-6.md` → `## Registration`

2. **Item 24b: Protocol Availability**
   - State where the full a-priori protocol can be accessed: PROSPERO record, OSF project page, published protocol article (with full citation and DOI), or institutional repository
   - If no protocol exists, state this and explain why (e.g., rapid review, resource constraints)
   → Write to: `output/{theme}/phase-6.md` → `## Protocol`

3. **Item 24c: Amendments**
   - List any amendments to the registered protocol: what was changed, the rationale for the change, and at what stage of the review it was made (before or after data extraction, before or after analysis)
   - If no amendments were made, state "No amendments to the registered protocol"
   - Note that post-hoc analyses not in the protocol are also flagged in the relevant Results sub-sections (Items 20c, 20d)
   → Write to: `output/{theme}/phase-6.md` → `## Amendments`

4. **Item 25: Financial Support & Conflicts of Interest**
   - Sources of funding
   - Role of funders in design, conduct, or reporting
   - Conflicts of interest of review authors
   - How conflicts were managed
   - State whether any funder had authority to approve or veto publication of results
   → Write to: `output/{theme}/phase-6.md` → `## Financial Support & Conflicts of Interest`

5. **Item 26: Competing Interests**
   - Declare all competing interests for each review author (financial, non-financial, intellectual)
   - State which authors have no competing interests
   - Describe how competing interests were managed during the review process (e.g., conflicted author excluded from decisions about specific studies)
   → Write to: `output/{theme}/phase-6.md` → `## Competing Interests`

6. **Item 27: Availability of Data, Code, and Other Materials**
   - State whether the full data extraction spreadsheet (study-level data) is publicly available; provide repository URL and persistent identifier (DOI)
   - State whether analysis code (R scripts, Stata do-files, SAS programs) is available; provide repository URL (e.g., GitHub, OSF)
   - State whether the PRISMA flow diagram source file is available
   - Reference the Systematic Review Data Repository (SRDR+) at srdrplus.ahrq.gov as a domain-specific option for depositing extraction data
   - Apply FAIR data principles: state that deposited data are Findable (persistent identifier), Accessible (open license such as CC-BY), Interoperable (standard formats such as CSV or RIS), and Reusable (with metadata describing variable definitions)
   - State the data license (e.g., CC-BY 4.0, CC0)
   - If data cannot be shared openly (e.g., due to commercial database restrictions), describe what is available and what is restricted
   → Write to: `output/{theme}/phase-6.md` → `## Data Availability`

---

For updated/living review requirements, see `phases/output-format.md` → Special Requirements.
