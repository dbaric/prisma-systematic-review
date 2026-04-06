# Phase 4b: Statistical Results — PRISMA Items 19, 20a–20d

## Dependencies
> Before starting, read these sections:
> - `output/{theme}/phase-4a.md` → `## Study Characteristics` and `## Risk of Bias in Included Studies` — to understand the studies being synthesized
> - `output/{theme}/phase-3c.md` → `## Synthesis Methods` (all sub-items 13a–13f) — to align with how synthesis was planned

## ⚠️ Data Mode
> **No studies have been analyzed.** For every numeric field (counts, effect sizes, CI, I², p-values, statistics), write `[DATA REQUIRED: description]`. Do not fabricate data. The output of this phase is a structured template for real results, not a simulation.

## Steps

1. **Item 19: Individual Study Results**
   - For each outcome in each study, present:
     - Summary statistics for each group (N, mean, SD for continuous; events, total for binary)
     - Effect estimates with confidence/credible intervals
     - If obtained from published reports directly, cite the source
   - For studies contributing to meta-analysis: provide data in format allowing independent replication (e.g., n, mean, SD per arm; or events/total for binary outcomes)
   - Where multiple reports exist for a single study, note which report each data point was taken from
   → Write to: `output/{theme}/phase-4b.md` → `## Individual Study Results`

2. **Items 20a–20d: Synthesis Results — All 4 Sub-items Must Be Explicitly Labeled**

   **Item 20a: Characteristics of Studies in Each Synthesis**
   - For each meta-analysis or narrative synthesis, describe characteristics of contributing studies (sample sizes, population demographics, intervention variations, follow-up durations)
   - Note any important clinical or methodological diversity within the group of studies contributing to each synthesis
   - Cross-reference the characteristics table (Item 17)
   → Write to: `output/{theme}/phase-4b.md` → `## Synthesis Results` → `### 20a: Study Characteristics for Synthesis`

   **Item 20b: Statistical Synthesis Results**
   - For each meta-analysis: present summary effect estimate, 95% CI, and prediction interval
   - Present measures of statistical heterogeneity: I² with 95% CI, tau², and Cochran's Q with degrees of freedom and exact p-value
   - Present forest plots (or reference them as figures) for all pooled outcomes
   - For narrative synthesis: present structured summary tables organized by outcome domain, describing direction, magnitude, and consistency of effects across studies
   → Write to: `output/{theme}/phase-4b.md` → `## Synthesis Results` → `### 20b: Statistical Results`

   **Item 20c: Results of Heterogeneity Investigations**
   - Present subgroup analysis results: effect estimate and 95% CI for each subgroup separately, test of interaction (chi-square for subgroup differences) with exact p-value, and I² for subgroup difference test
   - Present meta-regression results if conducted: coefficients, 95% CI, R² (proportion of heterogeneity explained), and exact p-value
   - State clearly whether each heterogeneity investigation was pre-specified (in protocol) or post-hoc
   → Write to: `output/{theme}/phase-4b.md` → `## Synthesis Results` → `### 20c: Heterogeneity Results`

   **Item 20d: Sensitivity Analysis Results**
   - Present results of each planned and any post-hoc sensitivity analysis
   - For each sensitivity analysis, compare primary result with sensitivity result and comment on whether conclusion changes
   - Note any analyses where exclusion of a single influential study substantially alters the summary estimate (influence analysis / leave-one-out)
   → Write to: `output/{theme}/phase-4b.md` → `## Synthesis Results` → `### 20d: Sensitivity Analysis Results`

---

For updated/living review requirements, see `phases/output-format.md` → Special Requirements.
