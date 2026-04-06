# Phase 3c: Synthesis Methods & GRADE — PRISMA Items 13a–13f, 15

---

## Synthesis Methods
*(PRISMA Item 13)*

### 13a: Studies Contributing to Each Synthesis

Because meta-analysis is not planned for any outcome (per Phase 1 framing commitment, due to measurement heterogeneity across primary outcomes, heterogeneous baseline definitions, and proprietary data publication barriers), synthesis takes the form of structured narrative summaries and tabular evidence maps. All included studies contribute to at least one synthesis strand; the strand a study contributes to is determined by the primary outcome(s) reported and the intervention module applied.

#### Synthesis Strands

**Strand 1 — Stockout Reduction (Primary Outcome 1)**
Eligible studies: all included studies reporting at least one operationalisation of stockout frequency, stockout days, unfulfilled booking rate, or equivalent proxy (declined reservations, revenue lost due to unavailability) from a documented baseline. Studies reporting only forecast accuracy metrics without a stockout outcome contribute to the Supplementary Evidence Map only (not Strand 1).

**Strand 2 — Unplanned Maintenance Cost Reduction (Primary Outcome 2)**
Eligible studies: all included studies reporting a cost outcome attributable to predictive vs. reactive maintenance scheduling — absolute monetary cost, cost per vehicle per year, or percentage reduction in unplanned maintenance expenditure from a documented baseline. Studies applying predictive maintenance models but reporting only classification accuracy (F1, AUC-ROC) without a cost outcome contribute to Strand 4 (secondary outcomes) only.

**Strand 3 — Fleet Utilization Rate Improvement (Primary Outcome 3)**
Eligible studies: all included studies reporting fleet utilization rate (percentage of fleet generating revenue, average active vehicles per day, revenue-generating days per vehicle per year) from a documented baseline, distinguishing available fleet from total fleet (excluding vehicles in maintenance or transfer).

**Strand 4 — Secondary Outcomes Evidence Map**
All included studies not excluded from primary synthesis contribute to this map regardless of which primary strand they appear in. Demand forecast accuracy (MAPE, RMSE, MAE), maintenance prediction accuracy (F1, AUC-ROC), and vehicle replacement decision accuracy are catalogued here individually without cross-study aggregation.

**Supplementary Evidence Map**
Studies meeting inclusion criteria for population, intervention, and design but reporting only secondary forecast accuracy metrics (no primary operational outcome) are excluded from primary synthesis and catalogued here separately with a note explaining the exclusion. This operationalises the Fork 2 commitment from Phase 1.

#### Grouping Logic

Within each primary strand, studies are grouped along the following dimensions (as specified in Phase 3a):

| Grouping dimension | Subgroups |
|---|---|
| Intervention module | Demand forecasting only; predictive maintenance only; vehicle distribution optimization only; integrated (2+ modules) |
| Comparator family | Current operational practice; documented rule-based heuristics; simple statistical methods; static allocation; undefined/idiosyncratic baseline (flagged) |
| Company size | Large (15+ locations); medium (10–14 locations); small (3–9 locations) |
| Model family | Time series (ARIMA/SARIMA/Prophet/ETS); deep learning (LSTM/GRU/Transformer); ensemble ML (RF/XGBoost/GBM); hybrid or integrated |
| Publication type | Peer-reviewed; grey literature |

Subgroup analyses are conducted within strands where ≥2 studies share a subgroup cell. Where only one study occupies a cell, the study is described narratively without subgroup summary.

#### Multiple Time Points

Where a study reports primary outcome data at more than one post-intervention time point (e.g., 3-month, 6-month, and 12-month post-deployment results), the **longest available follow-up time point** is used as the primary entry in the strand evidence table. All additional time points are extracted and recorded in the Notes column for descriptive reference. Where a study reports only a single post-intervention time point, that measurement is used regardless of its duration. This rule is pre-specified and applied consistently across all strands; any deviation requires documented rationale in the extraction log.

#### Multi-Strand Contribution

Studies contributing to more than one primary strand are included fully in each relevant strand. Outcomes from the same study are not merged or collapsed across strands. Where a study reports all three primary outcomes, it is entered into Strands 1, 2, and 3 separately and cross-referenced by study ID. No adjustment for multiplicity is made in the narrative synthesis; the multi-strand contribution is noted in each strand table.

---

### 13b: Data Preparation and Transformation

Because no statistical pooling is planned, formal data transformation for meta-analytic computation (e.g., deriving variances from confidence intervals, intraclass correlation assumptions for cluster designs) is not required. Transformation is limited to the following standardisation steps applied at data extraction to enable comparable tabulation across studies.

#### Stockout Outcome Standardisation

Where a study reports absolute stockout counts (e.g., "42 stockout events per month at baseline vs. 27 per month post-intervention"), the percentage relative reduction is computed by the review team as: `(Baseline − Intervention) / Baseline × 100`. Where a study reports only the percentage reduction without absolute values, the reported figure is extracted and recorded as-is, with a notation that the absolute baseline is unavailable.

Where stockout is expressed in different units across studies (stockout events vs. stockout days vs. stockout rate as proportion of total bookings), all reported units are retained in the evidence table. No conversion between units is attempted; studies are grouped within strands by measurement unit to make this heterogeneity transparent.

#### Maintenance Cost Standardisation

Where costs are reported in different currencies, the original currency and reporting year are recorded. A purchasing power parity (PPP) conversion to USD equivalent (using OECD PPP indices for the study's reporting year) will be applied only if a cross-country cost comparison table is constructed; otherwise, original currency figures are retained. No conversion is made across study years without explicit PPP adjustment.

Where cost is reported per vehicle per year in some studies and as a total fleet cost reduction in others, both figures are retained. Where total fleet cost reduction is reported alongside fleet size, cost per vehicle per year is derived as: `Total cost reduction / Fleet size / Study duration in years`. Where fleet size is not reported, the per-vehicle figure is marked as uncomputable.

#### Fleet Utilization Rate Standardisation

Utilization rate is extracted in the units reported (percentage of fleet in active use; revenue-generating days per vehicle per year; average active vehicles per day). No unit conversion is attempted. For percentage-based utilization, the absolute percentage point change is computed where baseline and post-intervention figures are both available: `Intervention utilization % − Baseline utilization %`. Positive values indicate improvement.

Where a study reports relative percentage change in utilization without the baseline rate (e.g., "utilization improved by 12%"), this figure is extracted as-is with a flag indicating the baseline is not reconstructable from the reported data.

#### Forecast Accuracy Metrics

MAPE, RMSE, and MAE are extracted in their original units and scales. No standardisation across studies is applied for these metrics because demand volumes differ in scale across companies and locations. Where MAPE is reported at multiple forecast horizons (1-week-ahead, 1-month-ahead), all horizon-specific values are extracted and tabulated separately. Where a study reports multiple model variants and selects a best-performing model, all reported variants are extracted with the study's recommended model flagged.

#### Handling Missing Variance Information

Because no pooled effect size is computed, variance information (SEs, 95% CIs, p-values) is extracted where reported but is not used to weight studies in synthesis. Where studies report no measures of uncertainty (common in industry case studies), this is recorded in the risk of bias assessment (Phase 3b, Item 10b: outcome measurement quality) and noted in the narrative synthesis. The absence of variance reporting does not trigger exclusion but does inform GRADE certainty ratings (see Section: GRADE Setup, Imprecision domain).

#### Outliers and Extreme Values

Outliers in extracted outcome data are not excluded from primary synthesis. Where a study reports an effect magnitude that is implausibly large relative to other studies in the same strand (e.g., a reported 90%+ stockout reduction), the study is flagged in the Notes column and described separately in the narrative synthesis. The flagging criterion is defined as an effect magnitude exceeding the strand's substantial improvement threshold by more than a factor of two (e.g., >50% stockout reduction where the substantial threshold is >25%). The study remains in the evidence table and in the direction-of-effect count but is highlighted as a potential outlier for narrative discussion. No imputation of missing data is performed; missing baseline or post-intervention values are recorded as not reported.

#### Multi-Arm Studies

Where a study compares multiple ML models against a shared baseline (multi-arm design), each arm is extracted as a separate row in the evidence table. The shared baseline is recorded once and referenced by study ID across arms. Arms are not combined or averaged; each is treated as an independent estimate for narrative comparison.

---

### 13c: Methods for Tabulating and Displaying Non-Pooled Results

All primary outcome results are tabulated and presented using the Synthesis Without Meta-analysis (SWiM) reporting approach ([TRAINING-DATA CLAIM], BMJ), adapted for the operational research context of this review.

#### Primary Evidence Tables

One evidence table is produced per primary synthesis strand (Strands 1–3). Each table contains the following columns:

| Column | Content |
|---|---|
| Study ID | Unique identifier assigned at screening |
| Author(s), year | Citation shorthand |
| Publication type | Peer-reviewed / grey literature |
| Company size | Small / Medium / Large (location count in parentheses) |
| Intervention module | Demand forecasting / Predictive maintenance / Distribution optimization / Integrated |
| Model family | Time series / Deep learning / Ensemble ML / Hybrid |
| Comparator family | Current practice / Rule-based heuristics / Simple statistics / Static allocation / Undefined |
| Baseline value | Reported baseline metric (with units) |
| Intervention value | Reported post-intervention metric (with units) |
| Effect measure | % relative reduction or pp change (as specified in Phase 3b) |
| Improvement category | Marginal / Moderate / Substantial (per Phase 3b thresholds) |
| Uncertainty reported | Yes (with 95% CI or SE) / No |
| Risk of bias summary | Low / Moderate / High / Critical (from Phase 3b Item 10b) |
| Notes | Any flags (e.g., undefined baseline, <12 months data, currency conversion applied) |

#### Direction-of-Effect Summary

For each primary strand, a direction-of-effect count is reported as a structured summary row at the bottom of the evidence table:
- Number of studies showing substantial improvement (per strand-specific threshold)
- Number showing moderate improvement
- Number showing marginal improvement
- Number showing no improvement or worsening
- Number with insufficient data to classify

This vote-counting approach is used for orientation only; it does not constitute a formal vote-counting synthesis. The narrative synthesis discusses patterns, outliers, and contextual explanations rather than treating direction counts as the unit of evidence.

#### Subgroup Summary Rows

Within each primary strand table, shading and sub-headers separate the five grouping dimensions (intervention module, comparator family, company size, model family, publication type). Where a subgroup contains ≥2 studies, a subgroup narrative summary row is added beneath the group describing the pattern of effects, between-study differences, and any methodological features that may explain variation.

#### Secondary Evidence Map

Strand 4 (secondary outcomes) is presented as a separate flat-file evidence map with one row per study-outcome combination. No direction-of-effect summary is produced for secondary outcomes. Metrics are reported verbatim in original units; no cross-study comparison is implied by the map layout.

#### Visual Displays

No forest plot is produced (no pooled effect). An effect direction plot (aligned with SWiM guidance) is produced for each primary strand where ≥3 studies are available, displaying each study as a symbol positioned on an ordinal improvement scale (marginal / moderate / substantial), with symbol shape indicating risk of bias level and symbol fill indicating publication type (peer-reviewed vs. grey literature). If fewer than 3 studies are available in any strand, the visual display is omitted and results are described in text only.

---

### 13d: Statistical Synthesis Methods

**No meta-analysis is planned for this review.** The rationale is stated in Phase 1 (framing commitment) and is operationally grounded in three concurrent barriers: (1) measurement heterogeneity across primary outcomes, with no single standardised effect metric applicable across stockout, cost, and utilization measures; (2) heterogeneous baseline definitions across studies, including undefined or idiosyncratic baselines; and (3) proprietary data publication barriers preventing extraction of study-level variance data sufficient for pooling.

The absence of meta-analysis is not a limitation of this protocol but a pre-specified methodological decision aligned with the SWiM framework.

**Software:** All tabulation, direction-of-effect classification, and subgroup grouping are conducted in [SPECIFY: tabulation software, e.g., Microsoft Excel 365 / R version 4.x / Zotero-compatible reference manager]. No statistical computing software is required for primary synthesis given the absence of pooling. If any exploratory quantitative analysis (e.g., correlation between company size and effect magnitude across studies) is conducted post-hoc, it will be conducted in R version [SPECIFY] and clearly labelled as exploratory and not pre-specified.

**Statistical pooling for secondary outcomes:** Not planned. Forecast accuracy metrics (MAPE, RMSE) and maintenance prediction accuracy (F1, AUC-ROC) are reported individually per study without pooling, as stated in Phase 3b.

**Threshold for reconsidering meta-analysis:** If, upon completing data extraction, ≥5 studies are identified that: (a) share the same primary outcome operationalisation (e.g., all report percentage stockout reduction from pre-post operational records), (b) share the same comparator family, and (c) provide sufficient variance data (SE or 95% CI around their primary effect estimate), the review team will evaluate whether a limited exploratory meta-analysis for that specific cell is feasible. Any such analysis would be post-hoc and explicitly labelled as exploratory, not pre-specified. The decision and rationale would be transparently documented in the Results section.

---

### 13e: Methods for Exploring Heterogeneity

Because no meta-analysis is planned, heterogeneity is explored through pre-specified subgroup analyses within the narrative synthesis framework rather than through I² statistics or meta-regression. Heterogeneity is defined operationally as variation in the direction, magnitude, or consistency of effects across studies within a subgroup that cannot be explained by measurement differences alone.

#### Pre-Specified Moderator Variables

The following moderator variables are specified in advance of data extraction. All subgroup analyses listed below are pre-specified (not post-hoc):

| Moderator | Rationale | Analysis approach |
|---|---|---|
| Intervention module (demand forecasting / predictive maintenance / distribution optimization / integrated) | Different modules target different causal pathways to operational improvement; pooling across modules would obscure mechanism-specific effects | Separate subgroup tables within each strand; narrative comparison across module subgroups |
| Comparator family (current practice / rule-based heuristics / simple statistics / static allocation) | Comparator stringency affects magnitude of observed improvement; rule-based heuristics are more demanding comparators than static allocation | Subgroup rows within strand tables; narrative commentary on comparator-effect relationship |
| Company size (small 3–9 / medium 10–14 / large 15+ locations) | Multi-location coordination complexity scales with company size; effects may be larger in larger companies where distribution inefficiency is more costly | Subgroup rows where ≥2 studies per size category; narrative summary |
| Model family (time series / deep learning / ensemble ML / hybrid) | Model expressiveness and data requirements differ; deep learning models may outperform time series in high-volume, multi-feature contexts | Subgroup rows within strand tables; narrative summary noting model-outcome patterns |
| Publication type (peer-reviewed vs. grey literature) | Grey literature (industry case studies, consulting reports) may report systematically more favorable results due to publication bias toward internal success stories | Separate sub-tables per publication type; narrative commentary on direction differences |
| Risk of bias level (low / moderate / high / critical) | Higher-risk studies may overestimate intervention effects due to confounding (pre-post designs without controlling for concurrent operational changes) | Narrative stratification; high/critical risk studies described separately from low/moderate risk studies |
| Data duration (12–24 months vs. >24 months of operational data) | Longer data series may yield more stable models and more reliable outcome estimates | Narrative subgroup description; no formal test |

#### Post-Hoc Analyses

Any subgroup analysis not listed above is classified as post-hoc and will be explicitly labelled as such in the Results section. Post-hoc analyses are generated only in response to patterns observed during data extraction that were not anticipated at protocol development (e.g., unexpected clustering by geographic region). Post-hoc analyses are interpreted with caution and do not inform GRADE ratings.

#### Heterogeneity Decision Rule

Where direction-of-effect counts within a subgroup show ≥50% of studies in the same improvement category (marginal / moderate / substantial), the subgroup is characterised as directionally consistent. Where substantial variation in improvement category is observed within a subgroup (e.g., 2 studies showing substantial improvement and 2 showing marginal or no improvement in the same subgroup cell), this is flagged as unexplained heterogeneity and narratively discussed, with study-level characteristics (company size, data duration, comparator stringency) examined as potential explanatory factors.

No I² threshold is applied because no statistical pooling is conducted.

---

### 13f: Sensitivity Analyses

The following sensitivity analyses are pre-specified. All sensitivity analyses test a specific extraction or inclusion decision made in Phase 3a or Phase 1. Results of each sensitivity analysis are compared to the primary synthesis results for each affected strand; where results are materially different, findings are described as not robust to the tested decision.

#### SA-1: Data Duration Threshold (12 months → 6 months)

**Decision tested:** Phase 3a requires ≥12 months of continuous structured operational data for inclusion in primary synthesis. Studies with 6–12 months of data are excluded from primary synthesis but eligible for this sensitivity analysis.

**Analysis:** Include studies with 6–12 months of data alongside primary studies. Re-examine direction-of-effect distribution in each strand. If direction-of-effect pattern changes materially (i.e., improvement category shifts for ≥25% of studies relative to the primary result), findings are described as sensitive to the 12-month threshold.

**Rationale:** The 12-month threshold captures seasonal cycles and is theoretically grounded (Phase 0 Interpretation B), but may exclude valid studies from emerging-market operators with shorter available histories.

#### SA-2: Grey Literature Exclusion

**Decision tested:** Phase 3a includes grey literature (industry reports, consulting case studies, white papers) alongside peer-reviewed sources.

**Analysis:** Restrict synthesis to peer-reviewed sources only (journal articles, conference proceedings, theses). Re-examine direction-of-effect distribution in each strand using peer-reviewed studies only. If effect patterns are substantially different from the full-evidence synthesis, the difference is noted as a potential publication bias signal.

**Rationale:** Grey literature is expected to over-represent internal success cases; this analysis quantifies whether inclusion of grey literature inflates apparent benefit.

#### SA-3: Undefined Baseline Studies Excluded

**Decision tested:** Phase 3a includes studies with undefined or idiosyncratic baselines (flagged with a methodological quality flag) in the primary synthesis.

**Analysis:** Exclude flagged studies from each strand and re-examine direction-of-effect distribution. Findings from studies with defined baselines only are compared to the full-inclusion primary results.

**Rationale:** Tests whether inclusion of methodologically weaker studies (undefined comparator) drives observed effects or whether effects are consistent regardless.

#### SA-4: Integrated vs. Single-Module Studies Only

**Decision tested:** Phase 3a includes both single-module studies (demand forecasting only; predictive maintenance only; distribution optimization only) and integrated multi-module studies in the same strand.

**Analysis:** Restrict Strands 1–3 to single-module studies only; describe integrated studies separately. Then restrict to integrated studies only and describe single-module studies separately. Compare direction-of-effect distributions across the three variants (all studies; single-module only; integrated only).

**Rationale:** Integration may amplify operational benefits (complementary module effects) or introduce confounding (it is unclear which module drives observed outcomes in integrated evaluations). This analysis assesses whether synthesis conclusions depend on module integration scope.

#### SA-5: High-Risk-of-Bias Studies Excluded

**Decision tested:** Studies rated high or critical risk of bias (Phase 3b Item 10b) are included in the primary synthesis with a notation.

**Analysis:** Exclude studies rated high or critical risk of bias. Re-examine direction-of-effect distribution in each strand using low- and moderate-risk studies only.

**Rationale:** Pre-post designs without controlling for concurrent operational changes (seasonal variation, fleet size changes, external demand shocks) may overestimate intervention effects. This analysis tests whether the evidence base is robust to the exclusion of the most methodologically vulnerable studies.

#### Robustness Classification

A finding is classified as **robust** if the direction-of-effect pattern (improvement category distribution) does not materially change across SA-1 through SA-5. A finding is classified as **not robust** if ≥1 sensitivity analysis produces a materially different pattern (defined as the modal improvement category shifting by one category or more, or the majority direction reversing). Specific robustness ratings are reported for each strand in the Results section.

---

## Certainty of Evidence Assessment
*(PRISMA Item 15)*

Certainty of evidence will be assessed using the **GRADE (Grading of Recommendations Assessment, Development and Evaluation)** framework. GRADE ratings are applied at the outcome level, not the study level, and reflect confidence that the true effect of ML-based fleet management interventions is consistent with the observed synthesis findings for each primary outcome.

A full description of GRADE setup — including domain-level decision rules, rating thresholds, number of raters, and the Summary of Findings table structure — is provided in the **GRADE Setup** section below. That section is intended to serve as the operational prerequisite for Phase 4, Item 22 (Certainty of Evidence Reporting).

For each of the three primary outcomes (stockout reduction, unplanned maintenance cost reduction, fleet utilization rate improvement), a GRADE certainty rating (High / Moderate / Low / Very Low) is produced after synthesis. Secondary outcomes (demand forecast accuracy, maintenance prediction accuracy) are rated only where the evidence base for a given outcome is sufficient to warrant a GRADE assessment (≥3 studies per outcome); otherwise, certainty is described qualitatively.

---

## GRADE Setup

### Framework

The **GRADE** framework is used to assess certainty of evidence ([TRAINING-DATA CLAIM]; [TRAINING-DATA CLAIM]). Because this review uses non-randomised observational designs (pre-post operational comparisons, retrospective case studies with temporal split, prospective evaluation studies), all outcomes begin at **Low certainty** as the GRADE default starting point for non-randomised evidence. Evidence can be upgraded or downgraded from this starting point per domain assessments described below.

The GRADE-CERQual framework for qualitative evidence synthesis is not applied (no qualitative studies are included in this review).

### Downgrading Domains

| Domain | Rating criterion | Applied rule |
|---|---|---|
| **Risk of bias** | Methodological limitations in included studies affecting confidence in the effect estimate for a given outcome | Serious concerns (affecting ≥50% of studies contributing to a strand) = −1 level; Very serious concerns = −2 levels |
| **Inconsistency** | Unexplained heterogeneity in direction or magnitude of effects across studies | Serious inconsistency (majority of studies not in the same direction-of-effect category, no explanatory moderator identified) = −1 level; Very serious = −2 levels |
| **Indirectness** | Mismatch between the review population (multi-location rent-a-car operators, ≥3 locations, ≥12 months data) and the studies contributing to a strand | Serious indirectness (most studies use populations or outcomes not fully matching PICO) = −1 level; Very serious = −2 levels |
| **Imprecision** | Uncertainty in the effect estimate due to small sample sizes, wide variation, or absence of variance reporting | Serious imprecision (most studies in a strand do not report any measure of uncertainty; or reported estimates show wide spread without clear central tendency) = −1 level; Very serious = −2 levels |
| **Publication bias** | Suspected selective reporting of favourable results | Serious publication bias concern (grey literature dominates a strand; SA-2 sensitivity analysis shows materially different result in peer-reviewed-only synthesis) = −1 level |

Maximum downgrade: −2 levels per domain; total downgrade may not reduce certainty below Very Low.

### Upgrading Domains

| Domain | Rating criterion | Applied rule |
|---|---|---|
| **Large effect** | Substantial improvement (per Phase 3b thresholds) observed consistently across studies in a strand | All or nearly all studies in a strand show substantial improvement with no plausible confounding explanation = +1 level |
| **Dose-response gradient** | Larger interventions (e.g., integrated multi-module systems) consistently show larger effects than smaller interventions (e.g., single-module) | Clear and consistent dose-response pattern observed in SA-4 (integrated vs. single-module sensitivity analysis) = +1 level |
| **Opposing confounding** | Plausible confounders (e.g., seasonal demand increase during evaluation period) would be expected to attenuate the observed effect; observed effect nevertheless persists | Documented in study reporting and narratively confirmed = +1 level |

Upgrading is applied with caution given the non-randomised evidence base. No outcome may be upgraded beyond Moderate certainty from the non-randomised evidence starting point unless all three upgrading criteria are met simultaneously and no downgrading domain applies.

### Rating Decision Rules

| Starting certainty | Final certainty after adjustment | Label |
|---|---|---|
| Low (starting point for all non-RCT evidence) | No downgrade, any applicable upgrade | Moderate (maximum achievable from NRS base) |
| Low | −1 level | Very Low |
| Low | −2 or more levels | Very Low (floor) |
| Low | +1 level (if no downgrade) | Moderate |

Disagreements between raters on domain-level assessments are resolved by discussion; if consensus is not reached, a third reviewer adjudicates.

### Reviewer Process

GRADE assessments are performed by **two reviewers independently** for each primary outcome. Each reviewer completes a GRADE domain worksheet per outcome, specifying: (a) the body of evidence contributing to the rating (strand ID, study IDs included), (b) the domain rating (not serious / serious / very serious), and (c) the rationale with reference to specific studies. Worksheets are compared and disagreements discussed; the final agreed rating is recorded in the Summary of Findings table.

### Summary of Findings Table

A **Summary of Findings (SoF) table** following GRADE conventions is produced for the following outcomes:

1. Stockout reduction (primary outcome 1)
2. Unplanned maintenance cost reduction (primary outcome 2)
3. Fleet utilization rate improvement (primary outcome 3)
4. Demand forecast accuracy — MAPE reduction (secondary outcome 1, where ≥3 studies available)
5. Maintenance prediction accuracy — F1-score improvement (secondary outcome 2, where ≥3 studies available)

A maximum of 5 outcomes are included in the SoF table (within the GRADE-recommended maximum of 7). Vehicle replacement decision accuracy (secondary outcome 4) is excluded from the SoF table due to insufficient standardisation of the outcome measure across studies.

The SoF table will appear in the **Results** section of the completed systematic review report, following the synthesis strand tables for primary outcomes. It will include: outcome label, number of studies and companies (organisational unit of analysis in place of individual participants), effect estimate (narrative description given absence of meta-analysis), certainty rating (with GRADE icons), and footnotes explaining domain-level decisions.

**Absolute effects:** The conventional GRADE element of absolute effect per 1,000 participants is not applicable in this review because the unit of analysis is the company (operator), not the individual patient or participant. In place of absolute effects per 1,000, the SoF table will report: (a) the median and interquartile range of the effect estimate across studies in each strand (e.g., median percentage stockout reduction), and (b) the proportion of companies in the included evidence base showing improvement above the substantial threshold. These figures provide the operational equivalent of absolute effect reporting for organisational-level synthesis. Any baseline risk figures (e.g., modal pre-intervention stockout rate across included companies) are reported where derivable from extracted data; otherwise the field is left as "not poolable — see narrative synthesis."

The full GRADE evidence profile (domain-by-domain worksheets for each outcome) will be provided as a supplementary file.

---

*Phase 3c complete. Dependencies for Phase 4: Strands 1–3 (evidence tables), Strand 4 (secondary outcomes evidence map), Supplementary Evidence Map, SoF table structure, and GRADE domain worksheets.*
