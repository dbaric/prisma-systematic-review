# Phase 3: Methods — PRISMA Items 3–15

## Dependencies
> None — but keep track of all eligibility decisions, search strings, and synthesis methods, as Phase 4 will reference them.

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
   → Write to: `output/{theme}/phase-3.md` → `## Eligibility Criteria`

2. **Item 4: Information Sources**
   - List all databases with full platform names and coverage start dates (e.g., "MEDLINE via PubMed since 1966")
   - Date range covered for each source individually
   - Citation searching: backward (reference lists of included studies and relevant reviews) and forward (Google Scholar, Web of Science, Semantic Scholar)
   - Contact with authors, experts, or organizations to identify unpublished or ongoing studies
   - Conference proceedings searched (list conferences and years covered)
   - Grey literature sources: trial registries (ClinicalTrials.gov, WHO ICTRP, EU Clinical Trials Register), theses/dissertations (ProQuest, EThOS), regulatory documents, government reports
   - Search date for each individual source
   → Write to: `output/{theme}/phase-3.md` → `## Information Sources`

3. **Item 5: Search Strategy**
   - Present full search strings used for each database
   - Include keywords, MeSH terms, and operators used
   - Document any limits applied (language, date, study type)
   - NLP or text-mining tools used in developing search (e.g., Semantic Scholar related papers, Rayyan AI, PubMed Best Match); state "none" if not used
   - Cross-database translation tools used (e.g., Polyglot Search Translator, Yale MeSH Analyzer); state "none" if not used
   - Whether search strategy was peer-reviewed or validated (e.g., by information specialist using PRESS checklist); state reviewer role
   - Database-specific syntax differences and how they were handled
   → Write to: `output/{theme}/phase-3.md` → `## Search Strategy`

4. **Item 6: Study Selection Process**
   - Describe screening methods (dual review or single screener)
   - State any disagreement resolution process
   - Document automation tools used (if any)
   - Report number of reviewers at each stage
   - Machine learning or AI classifiers used (if any): specify external pre-trained vs. internal classifier, training dataset, performance metrics (sensitivity, specificity)
   - Crowdsourcing tools used (if any, e.g., Cochrane Crowd)
   - Whether previously screened citation sets were reused from prior reviews; cite prior review if so
   - How multiple reports of the same study were identified and handled at screening stage
   → Write to: `output/{theme}/phase-3.md` → `## Study Selection Process`

5. **Item 7: Data Extraction**
   - List all data points extracted from each study
   - Data items include: study characteristics (design, setting, funding), participant characteristics, intervention details, outcome measurements
   - Methods for obtaining missing data from authors
   - Specify data extraction tools or forms used
   - Document dual extraction or verification approach
   - Translation process for non-English studies: who translated, what tools (e.g., DeepL, Google Translate), how accuracy was confirmed
   - Software or methods for extracting data from figures (e.g., WebPlotDigitizer); state if used
   - Decision rules when a single study has multiple publications (e.g., use most recent for sample size, original for primary outcome)
   - Specific automation tools for data extraction (name and version, e.g., Nested Knowledge, Rayyan, DistillerSR)
   → Write to: `output/{theme}/phase-3.md` → `## Data Extraction`

6. **Item 8: Study Risk of Bias Assessment**
   - Name the tool(s) used (e.g., Cochrane Risk of Bias, Newcastle-Ottawa Scale)
   - Domains/components assessed (e.g., selection bias, detection bias, attrition bias)
   - Methods for assessing bias (tool checklist items, criteria for judgment)
   - Number of reviewers assessing bias
   - Any adaptations made to standard tools
   → Write to: `output/{theme}/phase-3.md` → `## Risk of Bias Assessment`

7. **Item 10a: Outcome Data Items**
   - List all outcome domains included with definitions (primary outcomes, secondary outcomes, safety/adverse event outcomes)
   - For each outcome, specify the time points at which it will be extracted (e.g., end of treatment, 3-month follow-up, 12-month follow-up)
   - State the rule for selecting results when a study reports multiple time points or multiple measures of the same construct (e.g., "use longest follow-up available")
   - Document any outcome domains or time points added after protocol registration, with the rationale
   → Write to: `output/{theme}/phase-3.md` → `## Outcome Data Items`

8. **Item 10b: Other Variable Data Items**
   - Participant characteristics extracted: age (mean, range), sex/gender distribution, clinical diagnosis/severity at baseline, comorbidities, geographic region
   - Intervention characteristics: name, theoretical basis, dose/intensity, delivery format (individual, group, digital), duration, provider qualifications
   - Comparator characteristics: type (waitlist, treatment as usual, active control) and description
   - Funding source of each included study (industry, government, non-profit, unclear)
   - Assumptions made about missing participant-level data (e.g., missing = not improved; last observation carried forward) if aggregated data are imputed
   → Write to: `output/{theme}/phase-3.md` → `## Other Variable Data Items`

9. **Item 11: Effect Measures**
   - For each outcome, specify the effect measure used
     - Binary outcomes: risk ratio, odds ratio, risk difference
     - Continuous outcomes: mean difference, standardized mean difference
     - Time-to-event outcomes: hazard ratios or incidence rate ratios
     - Other outcomes: specify metric
   - Thresholds for interpreting effect size if applicable (e.g., trivial, small, moderate, large)
   → Write to: `output/{theme}/phase-3.md` → `## Effect Measures`

10. **Items 13a–13f: Synthesis Methods**
    Refer to `phases/phase-3-synthesis-methods.md` for detailed sub-item guidance. Copy the complete synthesis methods section to `output/{theme}/phase-3.md` → `## Synthesis Methods` with all sub-items (13a–13f) clearly labeled.

11. **Item 15: Certainty of Evidence Assessment**
    → For full detailed guidance, refer to `phases/phase-3-synthesis-methods.md` Step 7 (GRADE Setup) — it contains the complete GRADE framework description.
    → Write to: `output/{theme}/phase-3.md` → `## Certainty of Evidence Assessment`
    
    **Note:** This section should summarize the framework you will use. The full GRADE Setup details (domains, thresholds, reviewer roles, SoF table planning) go in the separate `## GRADE Setup` section, which Phase 4 will reference.

---

For updated/living review requirements, see `phases/output-format.md` → Special Requirements.
