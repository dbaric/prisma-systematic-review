# Phase 4: Results — PRISMA Items 16–22

## Dependencies
> Before starting, read these sections from `output/{theme}/phase-3.md`:
> - `## Eligibility Criteria` — to reference what studies were eligible
> - `## Synthesis Methods` (all sub-items 13a–13f) — to explain how synthesis was conducted
> - `## GRADE Setup` — to understand your GRADE framework and SoF table structure

## ⚠️ Data Mode
> **No studies have been screened or analyzed.** For every numeric field (counts, effect sizes, CI, I², p-values), write `[DATA REQUIRED: description]`. Do not fabricate data. The output of this phase is a structured template for real results, not a simulation.

## Steps

1. **Item 16a: Study Selection (Flow Diagram)**
   - Present number of records identified through searching
   - Records excluded before screening (duplicates, obvious ineligibility)
   - Records screened (title/abstract review)
   - Records excluded after screening, with reasons
   - Full texts assessed for eligibility
   - Full texts excluded with specific reasons
   - Number of studies included in qualitative synthesis
   - Number of studies included in quantitative synthesis
   - State whether the PRISMA 2020 flow diagram format was used
   - If automation tools were used at any stage, report proportions of records excluded by humans vs. automation at each stage with confidence intervals if available
   → Write to: `output/{theme}/phase-4.md` → `## Study Flow`

2. **Item 16b: Excluded Studies**
   - Present a list of studies that were assessed at full-text stage and appeared eligible based on title/abstract but were ultimately excluded
   - For each excluded study: provide full citation, specific reason for exclusion (referencing which eligibility criterion was not met), and note if multiple reasons apply
   - If the list is long, present complete list in supplementary appendix and summarize main exclusion reasons in the text
   - State explicitly if there were no studies that appeared eligible but were ultimately excluded
   → Write to: `output/{theme}/phase-4.md` → `## Excluded Studies`

3. **Item 17: Study Characteristics**
   - Create table(s) presenting:
     - Author, year, country
     - Study design
     - Participant demographics (age, gender, diagnosis)
     - Intervention details (type, duration, frequency)
     - Outcomes measured
     - Key findings for each study
   - Report funding sources of included studies (industry-funded, publicly funded, mixed, unclear)
   - For updated reviews: distinguish newly included studies from those carried over from the previous review
   → Write to: `output/{theme}/phase-4.md` → `## Study Characteristics`

4. **Item 18: Risk of Bias in Included Studies**
   - Present assessments in tables or figures
   - Show risk of bias judgments for each domain/component in each study
   - Summarize overall risk of bias across studies
   - Justify any judgments, with relevant quotations from study reports
   → Write to: `output/{theme}/phase-4.md` → `## Risk of Bias in Included Studies`

5. **Item 19: Individual Study Results**
   - For each outcome in each study, present:
     - Summary statistics for each group (N, mean, SD for continuous; events, total for binary)
     - Effect estimates with confidence/credible intervals
     - If obtained from published reports directly, cite the source
   - For studies contributing to meta-analysis: provide data in format allowing independent replication (e.g., n, mean, SD per arm; or events/total for binary outcomes)
   - Where multiple reports exist for a single study, note which report each data point was taken from
   → Write to: `output/{theme}/phase-4.md` → `## Individual Study Results`

6. **Items 20a–20d: Synthesis Results**

   **Item 20a: Characteristics of Studies in Each Synthesis**
   - For each meta-analysis or narrative synthesis, describe characteristics of contributing studies (sample sizes, population demographics, intervention variations, follow-up durations)
   - Note any important clinical or methodological diversity within the group of studies contributing to each synthesis
   - Cross-reference the characteristics table (Item 17)
   → Write to: `output/{theme}/phase-4.md` → `## Synthesis Results` → `### 20a: Study Characteristics for Synthesis`

   **Item 20b: Statistical Synthesis Results**
   - For each meta-analysis: present summary effect estimate, 95% CI, and prediction interval
   - Present measures of statistical heterogeneity: I² with 95% CI, tau², and Cochran's Q with degrees of freedom and exact p-value
   - Present forest plots (or reference them as figures) for all pooled outcomes
   - For narrative synthesis: present structured summary tables organized by outcome domain, describing direction, magnitude, and consistency of effects across studies
   → Write to: `output/{theme}/phase-4.md` → `## Synthesis Results` → `### 20b: Statistical Results`

   **Item 20c: Results of Heterogeneity Investigations**
   - Present subgroup analysis results: effect estimate and 95% CI for each subgroup separately, test of interaction (chi-square for subgroup differences) with exact p-value, and I² for subgroup difference test
   - Present meta-regression results if conducted: coefficients, 95% CI, R² (proportion of heterogeneity explained), and exact p-value
   - State clearly whether each heterogeneity investigation was pre-specified (in protocol) or post-hoc
   → Write to: `output/{theme}/phase-4.md` → `## Synthesis Results` → `### 20c: Heterogeneity Results`

   **Item 20d: Sensitivity Analysis Results**
   - Present results of each planned and any post-hoc sensitivity analysis
   - For each sensitivity analysis, compare primary result with sensitivity result and comment on whether conclusion changes
   - Note any analyses where exclusion of a single influential study substantially alters the summary estimate (influence analysis / leave-one-out)
   → Write to: `output/{theme}/phase-4.md` → `## Synthesis Results` → `### 20d: Sensitivity Analysis Results`

7. **Item 21: Reporting Bias Assessment**
   - If applicable, describe methods to assess publication bias
   - Present funnel plots or other evidence of selective reporting
   - Assess for small-study effects
   - Provide exact test statistic and p-value for any asymmetry test (e.g., "Egger's test: t = x.xx, df = xx, p = 0.xxx"; "Begg's test: z = x.xx, p = 0.xxx")
   - Note the minimum number of studies required before conducting asymmetry test (standard is ≥10 studies per meta-analysis); explain if test was not conducted
   - Distinguish between asymmetry attributable to publication bias vs. small-study effects vs. heterogeneity
   → Write to: `output/{theme}/phase-4.md` → `## Reporting Bias Assessment`

8. **Item 22: Certainty of Evidence**
   - Present GRADE certainty ratings for each outcome included in the Summary of Findings table
   - For each outcome, state: certainty level (High / Moderate / Low / Very Low), number of studies and participants contributing, and specific factors leading to downgrading or upgrading (with magnitude: serious vs. very serious)
   - Present the full Summary of Findings table, including: outcome name, number of studies, number of participants, relative effect with CI, absolute effect per 1000 participants, certainty level, and plain-language comments
   - Where certainty was upgraded (large effect, dose-response, opposing confounding), explicitly justify the decision
   → Write to: `output/{theme}/phase-4.md` → `## GRADE Ratings` and `## Summary of Findings Table`

---

All 4 Synthesis Results sub-items (20a–20d) must be explicitly labeled — do not merge or omit. For updated/living review requirements, see `phases/output-format.md` → Special Requirements.
