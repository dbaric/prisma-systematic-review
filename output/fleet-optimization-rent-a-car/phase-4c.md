# Phase 4c: Evidence Quality
*(PRISMA Items 21, 22 — GRADE & Summary of Findings)*

---

> **Data mode notice:** No studies have been extracted at the time of protocol authoring. All GRADE domain ratings, certainty levels, effect estimates, and absolute effect figures are marked `[DATA REQUIRED: description]`. No ratings have been fabricated or simulated. This document presents the complete structural framework for Items 21 and 22; all fields must be completed after Phase 4a and Phase 4b are populated from real extracted data.

---

## Reporting Bias Assessment
*(PRISMA Item 21)*

### 21a: Assessment Approach

Because this review does not conduct meta-analysis, the standard funnel plot and formal asymmetry tests (Egger's test, Begg's test) are not applicable in the conventional sense — both methods require a pooled effect size and standard errors per study that are not computed here. Reporting bias is instead assessed through the following pre-specified approaches.

#### Approach 1: Sensitivity Analysis SA-2 (Grey Literature Exclusion)

The primary method for detecting potential publication bias is Sensitivity Analysis SA-2 (Phase 4b, Section 20d), which compares direction-of-effect distributions across all sources (peer-reviewed and grey literature combined) against peer-reviewed sources only. A systematic pattern of larger reported effects in grey literature studies — consistently observed across two or more synthesis strands — is interpreted as a potential positive-result publication bias signal.

**SA-2 result:**

| Strand | All-source modal effect category | Peer-reviewed-only modal effect category | Shift in modal category? | Publication bias signal? |
|---|---|---|---|---|
| Strand 1 — Stockout Reduction | [DATA REQUIRED] | [DATA REQUIRED] | [DATA REQUIRED: Yes / No] | [DATA REQUIRED: Suspected / Not suspected / Insufficient data to assess] |
| Strand 2 — Maintenance Cost Reduction | [DATA REQUIRED] | [DATA REQUIRED] | [DATA REQUIRED] | [DATA REQUIRED] |
| Strand 3 — Utilization Rate Improvement | [DATA REQUIRED] | [DATA REQUIRED] | [DATA REQUIRED] | [DATA REQUIRED] |

#### Approach 2: Selective Outcome Reporting Assessment

Selective outcome reporting within included studies was assessed during Phase 3b (Risk of Bias, Domain D5: Outcome Reporting). Studies that registered a protocol in advance but reported only a subset of pre-specified outcomes, or studies where the reported outcome differed materially from the one described in the methods section, were rated as having high reporting bias risk on Domain D5. The D5 ratings feed directly into GRADE's risk-of-bias domain.

**D5 (selective outcome reporting) summary across included studies:**

| D5 rating | n studies | Study IDs |
|---|---|---|
| Not detected (methods and results consistent) | [DATA REQUIRED] | [DATA REQUIRED] |
| Suspected (discrepancy between methods and results, or partial reporting without explanation) | [DATA REQUIRED] | [DATA REQUIRED] |
| Not assessable (insufficient methodological detail) | [DATA REQUIRED] | [DATA REQUIRED] |

#### Approach 3: Funnel Plot and Asymmetry Tests (Conditional)

Formal funnel plots and asymmetry tests are **not conducted** in this review because:

1. No meta-analytic pooled effect sizes are computed (no standard errors available for weighting).
2. The standard minimum threshold of **≥10 studies per meta-analysis** for meaningful asymmetry testing ([TRAINING-DATA CLAIM: Sterne et al., *BMJ* 2011 — recommend ≥10 studies per synthesis as minimum for funnel plot asymmetry testing to have adequate power]) is not met within any single synthesis strand. Even if the total included study count reaches or exceeds 10, the studies are distributed across multiple strands and subgroups; no single strand-subgroup cell contains ≥10 comparable studies.
3. Narrative synthesis does not produce the between-study variance estimate (τ²) required to distinguish asymmetry due to publication bias from asymmetry due to heterogeneity.

Should a future update of this review collect sufficient studies in a single strand to enable meta-analysis (≥10 studies with extractable effect sizes and standard errors), funnel plots and Egger's test ([TRAINING-DATA CLAIM: conventional significance threshold p < 0.10, two-tailed, for small-study effect detection]) should be conducted at that stage and reported with exact test statistics: t-statistic, degrees of freedom, and p-value. The current review does not produce these statistics.

#### Approach 4: Comparison of Registered vs. Unregistered Studies

[DATA REQUIRED: After extraction, identify whether any included studies were prospectively registered (e.g., PROSPERO, OSF, trial registry). For each registered study, compare pre-registered outcomes against reported outcomes. Summarise any discrepancies. If no included studies were prospectively registered, write: "No included studies were prospectively registered. Protocol-level outcome reporting cannot be assessed for the current evidence base."]

### 21b: Reporting Bias Assessment Verdict

[DATA REQUIRED: Based on SA-2 results and D5 ratings, write a 2–4 sentence overall assessment of reporting bias risk for each primary synthesis strand. Note whether the grey literature proportion of the evidence base raises concern about optimism bias in the body of evidence. If SA-2 is not evaluable (no grey literature included), state this explicitly and note that reporting bias risk cannot be fully assessed from the available evidence base.]

### 21c: Limitations of Reporting Bias Assessment

Regardless of method, the absence of a detected reporting bias signal does not prove the absence of reporting bias. Where SA-2 detects no modal category shift between all-source and peer-reviewed-only distributions, this may reflect genuine consistency across source types or may reflect insufficient grey literature representation to detect asymmetry. Funnel plot asymmetry, had it been assessable, can also arise from small-study effects, methodological heterogeneity, or true effect variability rather than selective publication. These limitations are acknowledged throughout the interpretation and are discussed in Phase 5 (Discussion, limitations).

---

## GRADE Ratings
*(PRISMA Item 22 — Certainty of Evidence)*

### Rationale and Framework

GRADE certainty of evidence ratings are produced for five outcomes that appear in the Summary of Findings (SoF) table: (1) Stockout reduction, (2) Unplanned maintenance cost reduction, (3) Fleet utilization rate improvement, (4) Demand forecast accuracy — MAPE reduction, and (5) Maintenance prediction accuracy — F1-score improvement. Outcomes 4 and 5 are included only if ≥3 studies contribute to each.

All outcomes begin at **Low certainty** as the GRADE default starting point for non-randomised evidence. Upgrading and downgrading are applied per the decision rules in Phase 3c (GRADE Setup). No outcome may be upgraded beyond **Moderate certainty** from the non-randomised evidence base.

GRADE assessments are performed by two reviewers independently. Disagreements are resolved by discussion; if consensus is not reached, a third reviewer adjudicates. Domain-level worksheets are filed as a supplementary appendix; the agreed ratings appear in the SoF table below.

---

### GRADE Domain Worksheets

#### Outcome 1: Stockout Reduction

**Body of evidence:** Strand 1 studies (see Phase 4b, Table 8, Strand 1)

| GRADE Domain | Rating | Rationale |
|---|---|---|
| **Risk of bias** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: e.g., "Serious: majority of Strand 1 studies rated High or Critical risk overall, predominantly driven by D3 (temporal confounding) and D1 (baseline documentation). Affects confidence that observed reductions reflect intervention rather than external demand trends."] |
| **Inconsistency** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: e.g., "Not serious: ≥50% of Strand 1 studies fall in the same direction-of-effect category (per Phase 4b heterogeneity decision rule). Remaining variation is explicable by comparator stringency (SA-2 subgroup). No unexplained heterogeneity flag triggered."] |
| **Indirectness** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: e.g., "Serious: majority of contributing studies use populations or data durations that do not fully match the PICO (multi-location operators, ≥12 months). Single-location companies or studies using partial data periods introduced."] |
| **Imprecision** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: e.g., "Serious: most Strand 1 studies do not report any measure of statistical uncertainty (CI, SE, p-value). Central tendency is observable but width of plausible range is unknown."] |
| **Publication bias** | [DATA REQUIRED: Not detected / Suspected (−1)] | [DATA REQUIRED: e.g., "Suspected: SA-2 shows modal category shifts when grey literature is excluded, consistent with a positive-result reporting signal. −1 level applied."] |
| **Large effect** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED: e.g., "Not present: not all or nearly all Strand 1 studies show substantial improvement; moderate improvement is more common."] |
| **Dose-response gradient** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED: e.g., "Not present: SA-4 does not show a clear and consistent dose-response pattern between single-module and integrated studies in Strand 1."] |
| **Opposing confounding** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED: e.g., "Not present: plausible confounders (seasonal demand cycles) are not systematically documented or addressed in included studies."] |

**Net adjustment:** [DATA REQUIRED: e.g., −2 levels (Risk of bias −1, Imprecision −1) / −1 level / No adjustment / +1 level]

**Starting certainty:** Low

**Final certainty:** [DATA REQUIRED: **Very Low** / **Low** / **Moderate**]

**Rationale summary:** [DATA REQUIRED: 1–2 sentence plain-language explanation of the final rating, e.g., "Certainty is downgraded to Very Low because of serious risk of bias from temporal confounding in the majority of studies and serious imprecision due to absent variance reporting. No upgrading criteria are met."]

---

#### Outcome 2: Unplanned Maintenance Cost Reduction

**Body of evidence:** Strand 2 studies (see Phase 4b, Table 8, Strand 2)

| GRADE Domain | Rating | Rationale |
|---|---|---|
| **Risk of bias** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: Describe the dominant RoB concerns in Strand 2 studies, referencing Phase 3b domain ratings. Note whether cost measurement quality (D4) is a particular concern.] |
| **Inconsistency** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: Apply heterogeneity decision rule: ≥50% in same improvement category = Not serious. Note whether currency heterogeneity or per-vehicle derivation differences contribute to apparent variability.] |
| **Indirectness** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: Note whether Strand 2 studies match the PICO; particularly whether companies have ≥3 locations and ≥12 months data. Note if cost outcomes are reported as total fleet cost without per-vehicle disaggregation, limiting PICO match.] |
| **Imprecision** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: Apply same rule as Outcome 1. Note whether currency differences compound imprecision.] |
| **Publication bias** | [DATA REQUIRED: Not detected / Suspected (−1)] | [DATA REQUIRED: Reference SA-2 result for Strand 2.] |
| **Large effect** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED] |
| **Dose-response gradient** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED: Reference SA-4 Strand 2 result.] |
| **Opposing confounding** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED] |

**Net adjustment:** [DATA REQUIRED]

**Starting certainty:** Low

**Final certainty:** [DATA REQUIRED: **Very Low** / **Low** / **Moderate**]

**Rationale summary:** [DATA REQUIRED]

---

#### Outcome 3: Fleet Utilization Rate Improvement

**Body of evidence:** Strand 3 studies (see Phase 4b, Table 8, Strand 3)

| GRADE Domain | Rating | Rationale |
|---|---|---|
| **Risk of bias** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: Note whether utilization measurement quality (D4) and temporal confounding (D3) are the primary concerns in Strand 3.] |
| **Inconsistency** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: Apply heterogeneity decision rule. Note measurement unit diversity (percentage-based vs. revenue-generating days vs. active vehicles per day) as a potential source of apparent inconsistency that may not reflect true effect heterogeneity.] |
| **Indirectness** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED] |
| **Imprecision** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED] |
| **Publication bias** | [DATA REQUIRED: Not detected / Suspected (−1)] | [DATA REQUIRED: Reference SA-2 result for Strand 3.] |
| **Large effect** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED] |
| **Dose-response gradient** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED: Reference SA-4 Strand 3 result.] |
| **Opposing confounding** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED] |

**Net adjustment:** [DATA REQUIRED]

**Starting certainty:** Low

**Final certainty:** [DATA REQUIRED: **Very Low** / **Low** / **Moderate**]

**Rationale summary:** [DATA REQUIRED]

---

#### Outcome 4: Demand Forecast Accuracy — MAPE Reduction
*(Included only if ≥3 studies contribute MAPE data to Strand 4)*

**Eligibility check:** [DATA REQUIRED: State whether ≥3 studies report MAPE in Strand 4. If yes, proceed with rating. If no, write: "Outcome 4 is excluded from the Summary of Findings table because fewer than 3 studies report a comparable MAPE metric. Results are described narratively in Phase 4b, Table 9."]

**Body of evidence:** Strand 4 studies reporting MAPE for demand forecasting

| GRADE Domain | Rating | Rationale |
|---|---|---|
| **Risk of bias** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: Note whether MAPE is reported without uncertainty measures, and whether the comparator model is clearly specified across contributing studies.] |
| **Inconsistency** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: Note metric scale heterogeneity (MAPE values are unit-dependent on demand volume; a 5% MAPE in a high-volume company is not directly comparable to 5% in a low-volume company). If this heterogeneity is substantial, rate Serious.] |
| **Indirectness** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: Note whether forecast horizon (1-week vs. 1-month) is consistent across contributing studies.] |
| **Imprecision** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED] |
| **Publication bias** | [DATA REQUIRED: Not detected / Suspected (−1)] | [DATA REQUIRED] |
| **Large effect** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED] |
| **Dose-response gradient** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED] |
| **Opposing confounding** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED] |

**Net adjustment:** [DATA REQUIRED]

**Starting certainty:** Low

**Final certainty:** [DATA REQUIRED: **Very Low** / **Low** / **Moderate**]

**Rationale summary:** [DATA REQUIRED]

---

#### Outcome 5: Maintenance Prediction Accuracy — F1-Score Improvement
*(Included only if ≥3 studies contribute F1-score data to Strand 4)*

**Eligibility check:** [DATA REQUIRED: State whether ≥3 studies report F1-score in Strand 4. If yes, proceed. If no, write: "Outcome 5 is excluded from the Summary of Findings table because fewer than 3 studies report a comparable F1-score metric. Results are described narratively in Phase 4b, Table 9."]

**Body of evidence:** Strand 4 studies reporting F1-score for maintenance prediction

| GRADE Domain | Rating | Rationale |
|---|---|---|
| **Risk of bias** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: Note whether class imbalance is addressed in reporting; F1-scores from imbalanced maintenance event datasets may be optimistic if the positive class threshold is not reported.] |
| **Inconsistency** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: F1 is threshold-dependent; variation across studies may reflect different threshold choices rather than true model performance differences.] |
| **Indirectness** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED: Note whether F1-score is derived from test-set holdout or cross-validation, and whether this is consistent across contributing studies.] |
| **Imprecision** | [DATA REQUIRED: Not serious / Serious (−1) / Very serious (−2)] | [DATA REQUIRED] |
| **Publication bias** | [DATA REQUIRED: Not detected / Suspected (−1)] | [DATA REQUIRED] |
| **Large effect** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED] |
| **Dose-response gradient** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED] |
| **Opposing confounding** | [DATA REQUIRED: Not present / Present (+1)] | [DATA REQUIRED] |

**Net adjustment:** [DATA REQUIRED]

**Starting certainty:** Low

**Final certainty:** [DATA REQUIRED: **Very Low** / **Low** / **Moderate**]

**Rationale summary:** [DATA REQUIRED]

---

## Summary of Findings Table
*(PRISMA Item 22 — SoF Table, GRADE conventions)*

> **Note on unit of analysis:** The conventional GRADE element of absolute effects per 1,000 participants is adapted here: the unit of analysis is the **company (operator)**, not the individual patient. The "Absolute effect per 100 companies" column reports the estimated number of companies per 100 expected to show the outcome, derived from the proportion showing improvement and the baseline rate where both are available. Where neither is calculable from extracted data, this cell is marked [DATA REQUIRED]. Median effect (IQR) and direction-of-effect proportion are additionally reported. Baseline rates are reported where derivable; otherwise "not poolable — see narrative synthesis." See footnote h.

---

### Table 10: Summary of Findings — Data-Driven Fleet Management Optimization in Rent-a-Car Operations

**Review question:** How can machine learning and time series forecasting methods be applied to internal rent-a-car operational data to optimize vehicle distribution, predict maintenance needs, and forecast demand across multiple locations?

**Population:** Multi-location rent-a-car operators (≥3 locations) with structured internal reservation and fleet management systems, ≥12 months continuous operational data.

**Intervention:** Integrated or modular ML/time series systems including demand forecasting (ARIMA, Prophet, SARIMA, LSTM), predictive maintenance (survival analysis, RF, XGBoost), and/or vehicle distribution optimization.

**Comparator:** Current operational practice, rule-based heuristics, static allocation, or reactive maintenance scheduling.

---

| Outcome | Studies (n) | Companies (n) | Baseline rate / value | Effect estimate (narrative) | Effect (95% CI) | Absolute effect per 100 companies (see footnote h) | Median effect (IQR) across studies | Proportion of companies showing substantial improvement | Certainty of evidence (GRADE) | Reasons for downgrading | Comments |
|---|---|---|---|---|---|---|---|---|---|---|---|
| **1. Stockout reduction** *(unfulfilled bookings, stockout events, or stockout days — as reported; see footnote a)* | [DATA REQUIRED] | [DATA REQUIRED] | [DATA REQUIRED: modal pre-intervention stockout rate across included companies, or "not poolable — see narrative synthesis"] | [DATA REQUIRED: e.g., "The majority of studies report a reduction in stockout frequency following implementation of demand forecasting or integrated systems. Direction of effect is consistent across [n] of [n] studies. Magnitude ranges from marginal (<10%) to substantial (>25%) relative reduction, with the modal category being [DATA REQUIRED]."] | [DATA REQUIRED: 95% CI for representative within-study effect, or "not calculable — no pooled estimate; narrative synthesis only"] | [DATA REQUIRED: estimated number of companies per 100 showing stockout reduction above substantial threshold; derived from proportion data and baseline rate, or "not calculable — see narrative synthesis"] | [DATA REQUIRED: e.g., median 18% reduction (IQR 11–27%); or "not calculable — see narrative synthesis"] | [DATA REQUIRED: e.g., [n]/[n] companies ([%]) above substantial threshold (>25% relative reduction)] | [DATA REQUIRED: ⊕⊕○○ **Low** / ⊕○○○ **Very Low** / ⊕⊕⊕○ **Moderate**] | [DATA REQUIRED: list applicable domains — e.g., Risk of bias (−1); Imprecision (−1)] | Footnotes a, f, g. |
| **2. Unplanned maintenance cost reduction** *(monetary cost reduction attributable to predictive vs. reactive maintenance — as reported; see footnote b)* | [DATA REQUIRED] | [DATA REQUIRED] | [DATA REQUIRED: modal baseline unplanned maintenance cost per vehicle per year, or "not poolable — heterogeneous currencies and fleet sizes"] | [DATA REQUIRED: e.g., "Studies consistently report cost reductions following introduction of predictive maintenance models. Absolute magnitude is heterogeneous across currencies and fleet sizes and is not poolable. Direction of effect favours intervention in [n] of [n] studies."] | [DATA REQUIRED: 95% CI for representative within-study cost effect, or "not calculable — currency heterogeneity precludes pooling"] | [DATA REQUIRED: estimated number of companies per 100 showing cost reduction above substantial threshold, or "not calculable — see narrative synthesis"] | [DATA REQUIRED: e.g., median [x]% cost reduction (IQR [y]–[z]%); or "not calculable due to currency heterogeneity"] | [DATA REQUIRED] | [DATA REQUIRED: ⊕⊕○○ **Low** / ⊕○○○ **Very Low** / ⊕⊕⊕○ **Moderate**] | [DATA REQUIRED: list applicable domains — e.g., Risk of bias (−1); Indirectness (−1)] | Footnotes b, f, g. |
| **3. Fleet utilization rate improvement** *(percentage of fleet generating revenue, or equivalent — as reported; see footnote c)* | [DATA REQUIRED] | [DATA REQUIRED] | [DATA REQUIRED: modal baseline fleet utilization rate across included companies, or "not poolable"] | [DATA REQUIRED: e.g., "Most studies report improved fleet utilization following implementation of distribution optimization or integrated systems. Absolute percentage point improvements range from marginal (<5 pp) to substantial (>10 pp). Measurement unit diversity (percentage-based vs. revenue-generating days) limits cross-study comparability."] | [DATA REQUIRED: 95% CI for representative within-study utilization effect (percentage points), or "not calculable — measurement unit heterogeneity"] | [DATA REQUIRED: estimated number of companies per 100 showing utilization improvement above substantial threshold, or "not calculable — see narrative synthesis"] | [DATA REQUIRED: e.g., median [x] pp improvement (IQR [y]–[z] pp); or "not calculable — measurement unit heterogeneity"] | [DATA REQUIRED] | [DATA REQUIRED: ⊕⊕○○ **Low** / ⊕○○○ **Very Low** / ⊕⊕⊕○ **Moderate**] | [DATA REQUIRED: list applicable domains — e.g., Risk of bias (−1); Inconsistency (−1)] | Footnotes c, f, g. |
| **4. Demand forecast accuracy — MAPE reduction** *(lower MAPE = better; included only if ≥3 studies; see footnote d)* | [DATA REQUIRED: or "Excluded — fewer than 3 studies"] | [DATA REQUIRED] | [DATA REQUIRED: modal baseline MAPE for comparator model across included studies, or "not poolable"] | [DATA REQUIRED] | [DATA REQUIRED: 95% CI for within-study MAPE improvement, or "not calculable — scale-dependent metric; no pooling performed"] | [DATA REQUIRED: estimated number of companies per 100 showing MAPE improvement ≥ threshold, or "Excluded"] | [DATA REQUIRED] | [DATA REQUIRED: proportion of companies showing ≥[x]% MAPE improvement, per threshold defined in Phase 3c] | [DATA REQUIRED: ⊕⊕○○ **Low** / ⊕○○○ **Very Low** / ⊕⊕⊕○ **Moderate** / **Excluded**] | [DATA REQUIRED: list applicable domains, or "Excluded"] | Footnotes d, f, g. |
| **5. Maintenance prediction accuracy — F1-score improvement** *(higher F1 = better; included only if ≥3 studies; see footnote e)* | [DATA REQUIRED: or "Excluded — fewer than 3 studies"] | [DATA REQUIRED] | [DATA REQUIRED: modal baseline F1-score for comparator approach, or "not poolable"] | [DATA REQUIRED] | [DATA REQUIRED: 95% CI for within-study F1 improvement, or "not calculable — threshold-dependent metric; no pooling performed"] | [DATA REQUIRED: estimated number of companies per 100 showing F1 improvement ≥ threshold, or "Excluded"] | [DATA REQUIRED] | [DATA REQUIRED: proportion of companies showing ≥[x] pp F1 improvement] | [DATA REQUIRED: ⊕⊕○○ **Low** / ⊕○○○ **Very Low** / ⊕⊕⊕○ **Moderate** / **Excluded**] | [DATA REQUIRED: list applicable domains, or "Excluded"] | Footnotes e, f, g. |

---

### GRADE Certainty Icons Key

| Symbol | Certainty level | Interpretation |
|---|---|---|
| ⊕⊕⊕⊕ | **High** | We are very confident that the true effect lies close to the estimate. (Not achievable from non-randomised evidence base in this review.) |
| ⊕⊕⊕○ | **Moderate** | We are moderately confident in the effect estimate. The true effect is likely close to the estimate but may be substantially different. (Maximum achievable from non-randomised evidence base in this review.) |
| ⊕⊕○○ | **Low** | Our confidence is limited. The true effect may be substantially different from the estimate. |
| ⊕○○○ | **Very Low** | We have very little confidence in the effect estimate. The true effect is likely substantially different from the estimate. |

---

### Footnotes

**a — Stockout outcome measurement heterogeneity:** Stockout is operationalized differently across Strand 1 studies (stockout events per month, stockout days, unfulfilled booking rate, declined reservations). No conversion between units was applied. Median and IQR figures are computed within the percentage-relative-reduction metric only; studies reporting other units contribute to direction-of-effect counts but not to the median effect calculation. See Phase 4b, Table 8, Strand 1 for full unit-level breakdown.

**b — Maintenance cost measurement heterogeneity:** Cost figures are reported in heterogeneous currencies across reporting years. No PPP conversion was applied at summary level. Per-vehicle cost per year is derivable for [DATA REQUIRED: n of n] Strand 2 studies only. The median effect figure (if reported) reflects percentage reduction only; absolute monetary figures are not pooled. See Phase 4b, Table 8, Strand 2.

**c — Utilization rate measurement heterogeneity:** Studies report utilization as percentage of fleet in active use, revenue-generating days per vehicle per year, or average active vehicles per day. Percentage-point improvement is computable only for studies reporting both baseline and intervention utilization as percentages ([DATA REQUIRED: n of n] Strand 3 studies). Studies reporting relative change without a baseline rate are included in direction-of-effect counts but not in the median pp calculation. See Phase 4b, Table 8, Strand 3.

**d — Demand forecast accuracy (MAPE):** MAPE is scale-dependent; a given MAPE value is not directly comparable across companies with different demand volumes. No cross-study MAPE pooling is performed. The median improvement reported reflects within-study comparisons (ML model vs. comparator) only. Multiple forecast horizons (1-week-ahead, 1-month-ahead) are tabulated separately in Phase 4b, Table 9; the value entered here reflects the primary horizon specified by each study.

**e — Maintenance prediction accuracy (F1-score):** F1-score is sensitive to the positive-class threshold chosen and to class imbalance in maintenance event datasets. Threshold choices and class balance are not consistently reported across included studies. Reported F1 values should be interpreted with caution in cross-study comparison. AUC-ROC is additionally extracted where available (Phase 4b, Table 9) as a threshold-independent complement.

**f — Risk of bias note for all outcomes:** All included studies are non-randomised empirical evaluations (pre-post operational comparisons, retrospective case studies with temporal split, prospective evaluation studies). Temporal confounding — whereby external demand cycles or fleet renewal events during the evaluation period coincide with the intervention — is the primary risk of bias concern and is the main driver of downgrading in the risk-of-bias domain for all outcomes.

**g — Upgrading note:** No outcome is upgraded from the Low certainty starting point unless all three GRADE upgrading criteria (large effect, dose-response gradient, opposing confounding) are simultaneously met and no downgrading domain applies. Per the Phase 3c rule, non-randomised evidence may not exceed Moderate certainty under any circumstances in this review.

**h — Absolute effect per 100 companies (unit of analysis adaptation):** Standard GRADE SoF tables report absolute effects per 1,000 participants. This review's unit of analysis is the company (operator), not the individual patient or reservation. The "absolute effect per 100 companies" column is the direct analogue: it reports the estimated number of companies per 100 expected to achieve improvement above the substantial threshold, derived from (a) the proportion of included companies showing substantial improvement and (b) the baseline rate where available. Where neither the proportion nor a usable baseline rate is derivable from extracted data, this cell is marked [DATA REQUIRED]. This adaptation follows the GRADE principle of reporting absolute effects in the natural unit of the review question's population.

---

### Excluded Outcomes

The following outcomes are excluded from the Summary of Findings table per the pre-specified protocol:

| Outcome | Reason for exclusion from SoF |
|---|---|
| Vehicle replacement decision accuracy (secondary outcome 4) | Insufficient standardisation of the outcome measure across studies — replacement decision accuracy is operationalized as precision, recall, cost saving per avoided premature replacement, and timing accuracy with no common metric. Reported narratively in Phase 4b, Table 9. |
| Demand forecast accuracy — RMSE / MAE | Not included as primary accuracy metric in SoF table. Scale-dependent; not comparable across companies. Reported in Phase 4b, Table 9 alongside MAPE. |

---

*Phase 4c complete. Items 21 and 22 are structurally complete. All `[DATA REQUIRED]` fields must be populated after primary data extraction and Phase 3b risk of bias assessment are finalized. The full GRADE evidence profile (domain-by-domain worksheets) will be provided as Supplementary File S3 in the completed review report.*
