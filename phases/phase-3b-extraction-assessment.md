# Phase 3b: Extraction & Assessment — PRISMA Items 7, 8, 10a, 10b, 11

## Dependencies
> Before starting, read this section from `output/{theme}/phase-3a.md`:
> - `## Eligibility Criteria` — to ground what data will be extracted and why

## ⚠️ Data Mode
> **No real data exists.** Write all methods in planned/future tense. Do not invent database names, software versions, or specific values — use `[SPECIFY: ...]` for any concrete value that depends on real decisions not in the research input.

## Steps

1. **Item 7: Data Extraction**
   - List all data points extracted from each study
   - Data items include: study characteristics (design, setting, funding), participant characteristics, intervention details, outcome measurements
   - Methods for obtaining missing data from authors
   - Specify data extraction tools or forms used
   - Document dual extraction or verification approach
   - Translation process for non-English studies: who translated, what tools (e.g., DeepL, Google Translate), how accuracy was confirmed
   - Software or methods for extracting data from figures (e.g., WebPlotDigitizer); state if used
   - Decision rules when a single study has multiple publications (e.g., use most recent for sample size, original for primary outcome)
   - Specific automation tools for data extraction (name and version, e.g., Nested Knowledge, Rayyan, DistillerSR)
   → Write to: `output/{theme}/phase-3b.md` → `## Data Extraction`

2. **Item 8: Study Risk of Bias Assessment**
   - Name the tool(s) used (e.g., Cochrane Risk of Bias, Newcastle-Ottawa Scale)
   - Domains/components assessed (e.g., selection bias, detection bias, attrition bias)
   - Methods for assessing bias (tool checklist items, criteria for judgment)
   - Number of reviewers assessing bias
   - Any adaptations made to standard tools
   → Write to: `output/{theme}/phase-3b.md` → `## Risk of Bias Assessment`

3. **Item 10a: Outcome Data Items**
   - List all outcome domains included with definitions (primary outcomes, secondary outcomes, safety/adverse event outcomes)
   - For each outcome, specify the time points at which it will be extracted (e.g., end of treatment, 3-month follow-up, 12-month follow-up)
   - State the rule for selecting results when a study reports multiple time points or multiple measures of the same construct (e.g., "use longest follow-up available")
   - Document any outcome domains or time points added after protocol registration, with the rationale
   → Write to: `output/{theme}/phase-3b.md` → `## Outcome Data Items`

4. **Item 10b: Other Variable Data Items**
   - Participant characteristics extracted: age (mean, range), sex/gender distribution, clinical diagnosis/severity at baseline, comorbidities, geographic region
   - Intervention characteristics: name, theoretical basis, dose/intensity, delivery format (individual, group, digital), duration, provider qualifications
   - Comparator characteristics: type (waitlist, treatment as usual, active control) and description
   - Funding source of each included study (industry, government, non-profit, unclear)
   - Assumptions made about missing participant-level data (e.g., missing = not improved; last observation carried forward) if aggregated data are imputed
   → Write to: `output/{theme}/phase-3b.md` → `## Other Variable Data Items`

5. **Item 11: Effect Measures**
   - For each outcome, specify the effect measure used
     - Binary outcomes: risk ratio, odds ratio, risk difference
     - Continuous outcomes: mean difference, standardized mean difference
     - Time-to-event outcomes: hazard ratios or incidence rate ratios
     - Other outcomes: specify metric
   - Thresholds for interpreting effect size if applicable (e.g., trivial, small, moderate, large)
   → Write to: `output/{theme}/phase-3b.md` → `## Effect Measures`

---

For updated/living review requirements, see `phases/output-format.md` → Special Requirements.
