# Phase 3c: Synthesis Methods & GRADE — PRISMA Items 13a–13f, 15

## Dependencies
> Read `output/{theme}/phase-3a.md` → `## Eligibility Criteria` and `output/{theme}/phase-3b.md` → `## Effect Measures` to understand your outcome definitions and study grouping rules before writing synthesis methods.

## Steps

1. **Item 13a: Studies Contributing to Each Synthesis**
   - For each synthesis (meta-analysis or narrative summary), state which studies contribute and on what basis (e.g., "all RCTs reporting GAD-7 at end of treatment")
   - Describe criteria for determining which studies are grouped together vs. analyzed separately
   - If a study contributes to multiple syntheses, state how this is handled
   → Write to: `output/{theme}/phase-3c.md` → `## Synthesis Methods` → `### 13a: Studies Contributing to Each Synthesis`

2. **Item 13b: Data Preparation and Transformation**
   - Methods for converting or transforming data to a common metric (e.g., converting means and SDs from different scales, converting medians to means)
   - How variance measures are derived when not directly reported (e.g., deriving SD from SE, 95% CI, or p-value)
   - Handling of cluster-randomized trials (design effect calculation, intraclass correlation assumptions)
   - Handling of multi-arm trials (combining arms, using correlation for shared control groups)
   → Write to: `output/{theme}/phase-3c.md` → `## Synthesis Methods` → `### 13b: Data Preparation and Transformation`

3. **Item 13c: Methods for Tabulating and Displaying Non-Pooled Results**
   - If meta-analysis is not conducted for some outcomes, describe tabulation approach (structured tables, vote-counting by direction of effect, effect direction plots)
   - Reference Synthesis Without Meta-analysis (SWiM) reporting guideline if applicable
   - Describe any visual displays (harvest plots, albatross plots) used for non-pooled evidence
   → Write to: `output/{theme}/phase-3c.md` → `## Synthesis Methods` → `### 13c: Methods for Tabulating and Displaying Non-Pooled Results`

4. **Item 13d: Statistical Synthesis Methods**
   - Statistical model: fixed-effect vs. random-effects; if random-effects, specify estimator (DerSimonian-Laird, REML, Paule-Mandel, Bayesian)
   - Software and version (e.g., R version 4.x with metafor package version x.x; RevMan 5.4; Stata 17 with metan)
   - Convergence criteria if Bayesian models used (number of chains, iterations, burn-in, R-hat threshold)
   - Method for pooling proportions if applicable (e.g., Freeman-Tukey double-arcsine transformation)
   - Handling of zero cells in binary outcomes (continuity correction method)
   → Write to: `output/{theme}/phase-3c.md` → `## Synthesis Methods` → `### 13d: Statistical Synthesis Methods`

5. **Item 13e: Methods for Exploring Heterogeneity**
   - List all variables (moderators) hypothesized to explain heterogeneity (e.g., risk of bias level, intervention type, population severity, follow-up duration)
   - Methods used (subgroup analysis, meta-regression) and statistical approach for each
   - Planned vs. post-hoc distinction: clearly identify analyses specified in protocol vs. those added later
   - Threshold for I² or tau² that would trigger heterogeneity investigations
   → Write to: `output/{theme}/phase-3c.md` → `## Synthesis Methods` → `### 13e: Methods for Exploring Heterogeneity`

6. **Item 13f: Sensitivity Analyses**
   - List all planned sensitivity analyses with the specific decision being tested (e.g., excluding high-risk-of-bias studies, excluding unpublished studies, alternative effect measure, alternative statistical model)
   - Criteria for classifying a finding as "robust" based on sensitivity analysis results
   → Write to: `output/{theme}/phase-3c.md` → `## Synthesis Methods` → `### 13f: Sensitivity Analyses`

7. **Item 15: Certainty of Evidence Assessment**
   - Provide overview of the framework you will use (refer to GRADE Setup below for full details)
   - Note that the detailed GRADE Setup is a separate section (needed by Phase 4)
   → Write to: `output/{theme}/phase-3c.md` → `## Certainty of Evidence Assessment`

8. **GRADE Setup (prerequisite for Phase 4 Items 22)**
   - Name the framework or tool used (e.g., GRADE — Grading of Recommendations Assessment, Development and Evaluation; GRADE-CERQual for qualitative evidence)
   - List domains assessed when using GRADE: risk of bias, inconsistency, indirectness, imprecision, publication bias (for downgrading); large effect size, dose-response gradient, opposing confounding (for upgrading)
   - Decision rules: state threshold for rating down (e.g., "serious concerns = one level down; very serious = two levels down") and how disagreements between raters are resolved
   - Who performed assessment: number of reviewers, their roles, whether one reviewer assessed and one verified or both assessed independently
   - Specify which outcomes will have a Summary of Findings (SoF) table (typically primary outcome and key secondary outcomes, maximum 7)
   - State whether a full Summary of Findings table following GRADE conventions will be produced and in which section it will appear (Results)
   → Write to: `output/{theme}/phase-3c.md` → `## GRADE Setup`

---

All 6 synthesis sub-items (13a–13f) must be explicitly labeled — do not merge or omit. For updated/living review requirements, see `phases/output-format.md` → Special Requirements.
