# Phase 3a: Search Protocol — PRISMA Items 3–6

## Dependencies
> None — but all findings must be documented clearly as they become prerequisites for Phase 3b.

## ⚠️ Data Mode
> **No real data exists.** Write all methods in planned/future tense. Do not invent database names, search dates, or software versions — use `[SPECIFY: ...]` for any concrete value that depends on real decisions not in the research input.

## Steps

1. **Item 3: Eligibility Criteria**
   - Study designs included (RCTs, cohort studies, etc.)
   - Population characteristics (age, diagnosis, setting)
   - Intervention and comparators
   - Outcome measures (primary and secondary)
   - Study characteristics (language, publication date, minimum duration, sample size)
   - Exclusion criteria
   - Settings (clinical vs. community, geographic) and minimum follow-up duration
   - Eligible languages, publication years, publication status (peer-reviewed, preprints, theses, conference abstracts)
   - How studies will be grouped for synthesis (by population subgroup, intervention type, comparator type, outcome domain)
   → Write to: `output/{theme}/phase-3a.md` → `## Eligibility Criteria`

2. **Item 4: Information Sources**
   - List all databases with full platform names and coverage start dates (e.g., "MEDLINE via PubMed since 1966")
   - Date range covered for each source individually
   - Citation searching: backward (reference lists of included studies and relevant reviews) and forward (Google Scholar, Web of Science, Semantic Scholar)
   - Contact with authors, experts, or organizations to identify unpublished or ongoing studies
   - Conference proceedings searched (list conferences and years covered)
   - Grey literature sources: trial registries (ClinicalTrials.gov, WHO ICTRP, EU Clinical Trials Register), theses/dissertations (ProQuest, EThOS), regulatory documents, government reports
   - Search date for each individual source
   → Write to: `output/{theme}/phase-3a.md` → `## Information Sources`

3. **Item 5: Search Strategy**
   - Present full search strings used for each database
   - Include keywords, MeSH terms, and operators used
   - Document any limits applied (language, date, study type)
   - NLP or text-mining tools used in developing search (e.g., Semantic Scholar related papers, Rayyan AI, PubMed Best Match); state "none" if not used
   - Cross-database translation tools used (e.g., Polyglot Search Translator, Yale MeSH Analyzer); state "none" if not used
   - Whether search strategy was peer-reviewed or validated (e.g., by information specialist using PRESS checklist); state reviewer role
   - Database-specific syntax differences and how they were handled
   → Write to: `output/{theme}/phase-3a.md` → `## Search Strategy`

4. **Item 6: Study Selection Process**
   - Describe screening methods (dual review or single screener)
   - State any disagreement resolution process
   - Document automation tools used (if any)
   - Report number of reviewers at each stage
   - Machine learning or AI classifiers used (if any): specify external pre-trained vs. internal classifier, training dataset, performance metrics (sensitivity, specificity)
   - Crowdsourcing tools used (if any, e.g., Cochrane Crowd)
   - Whether previously screened citation sets were reused from prior reviews; cite prior review if so
   - How multiple reports of the same study were identified and handled at screening stage
   → Write to: `output/{theme}/phase-3a.md` → `## Study Selection Process`

---

For updated/living review requirements, see `phases/output-format.md` → Special Requirements.
