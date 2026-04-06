# Phase 3b: Extraction & Assessment — PRISMA Items 7, 8, 10a, 10b, 11

---

## Data Extraction
*(PRISMA Item 7)*

### Data Items Extracted

A standardised data extraction form will be used for all included studies. The form covers the following categories:

#### Study Characteristics
| Field | Detail |
|---|---|
| Study ID | Unique identifier assigned at full-text screening |
| Citation | Author(s), year, title, journal/conference/report, DOI or URL |
| Publication type | Peer-reviewed journal article; conference proceedings; thesis/dissertation; industry report; consulting case study; white paper |
| Language | Language of original text; translation method if applicable |
| Funding source | Industry-funded; government/public grant; non-profit; self-funded/unclear; mixed |
| Conflict of interest disclosure | Declared; not declared; stated as none |
| Study design | Pre-post operational comparison; retrospective case study with temporal split; prospective evaluation; multi-arm observational |
| Country/region of company | ISO country code; region (Europe, North America, Asia-Pacific, other) |
| Study period | Calendar dates of operational data used (start–end); total duration in months |

#### Company (Population) Characteristics
| Field | Detail |
|---|---|
| Number of locations | Integer count of geographically distinct branches/depots/zones |
| Company size proxy | Fleet size (total vehicles); revenue category if reported; employee count if reported |
| Geographic scope | National; multinational; single metropolitan area |
| Operational maturity | Legacy system; digital-first; hybrid (if described) |
| Reservation system | [SPECIFY: system name if reported, e.g., proprietary, third-party platform] |
| Data types available | Reservation records; fleet records; maintenance/service logs; sensor data; other |
| Total data duration | Months of continuous structured operational data used (training + evaluation combined) |
| Training data duration | Months used for model training |
| Evaluation data duration | Months used for held-out evaluation |

#### Intervention Characteristics
| Field | Detail |
|---|---|
| Intervention module(s) | Demand forecasting; predictive maintenance; vehicle distribution optimization; integrated (specify which modules combined) |
| Model family | Time series (ARIMA/SARIMA/Prophet/ETS); deep learning (LSTM/GRU/Transformer); ensemble ML (RF/XGBoost/GBM); regression/classification; mathematical programming with ML inputs; hybrid; other |
| Specific algorithm(s) | Named algorithm(s) as reported in study |
| Input features | Variables used as model inputs (e.g., historical demand, seasonality indicators, vehicle age, mileage, service history) |
| Forecast horizon | Where applicable: 1-week-ahead; 1-month-ahead; other [SPECIFY] |
| Granularity of prediction | Location-level; vehicle-category-level; location-by-category; fleet-level |
| Implementation context | Retrospective simulation; prospective deployment; both |
| Integration with operational decisions | Directly linked to allocation/maintenance scheduling; advisory output only; unclear |
| Software/platform | [SPECIFY: named if reported] |

#### Comparator Characteristics
| Field | Detail |
|---|---|
| Comparator family | Current operational practice; documented rule-based heuristics; simple statistical methods; static allocation strategies; undefined/idiosyncratic |
| Comparator description | Verbatim or paraphrased description of comparator as stated in study |
| Baseline measurement period | Calendar dates; duration in months |
| Baseline quantitatively defined | Yes (explicit figures reported); partially (some figures derivable); no (baseline described only qualitatively — flag for methodological quality) |

#### Primary Outcome Data
For each of the three co-equal primary outcomes, the following fields are extracted where reported:

**Stockout reduction:**
- Metric operationalization (stockout days; stockout instances; percentage of requests unfulfilled; declined bookings; proxy revenue measure)
- Numerical value in intervention period
- Numerical value in comparator/baseline period
- Percentage change or absolute difference reported
- Measurement time point(s) (see Section: Outcome Data Items)
- Level of aggregation (fleet-level; per-location; per-vehicle-category; stratified)

**Unplanned maintenance cost reduction:**
- Metric operationalization (absolute monetary value; percentage of total maintenance budget; cost per vehicle per year; total annual fleet expenditure)
- Currency and reporting year (for cost comparability notation)
- Numerical value in intervention and comparator periods
- Percentage change or absolute difference reported
- Measurement time point(s)

**Fleet utilization rate improvement:**
- Metric operationalization (percentage of fleet generating revenue; average vehicles in active use per day; revenue-generating days per vehicle per year)
- Numerical value in intervention and comparator periods
- Percentage change reported
- Measurement time point(s)
- Whether available fleet is distinguished from total fleet (yes/no — flag where not)

#### Secondary Outcome Data
- Demand forecast accuracy: MAE, RMSE, MAPE, or SMAPE on held-out data; aggregate or stratified
- Maintenance prediction accuracy: precision, recall, F1, AUC-ROC (binary); MAE/RMSE (regression/remaining useful life)
- Forecast accuracy by horizon: 1-week-ahead vs. 1-month-ahead vs. other
- Vehicle replacement decision accuracy: metric and measurement approach as reported

### Extraction Process

**Dual extraction:** All included studies will be independently extracted by two reviewers using the standardised form. Discrepancies will be resolved by discussion; a third reviewer will adjudicate if consensus is not reached within [SPECIFY: one working day or agreed protocol].

**Extraction tool:** [SPECIFY: software platform, e.g., Rayyan, Covidence, DistillerSR, REDCap-based form, or custom spreadsheet — name and version]. A pilot extraction on [SPECIFY: 5 studies or 10% of included studies, whichever is larger] will be completed by both reviewers before full extraction begins; inter-rater agreement (Cohen's kappa) will be computed and any systematic discrepancies resolved by protocol clarification before proceeding.

**Missing data from authors:** For studies with incomplete outcome reporting or ambiguous baseline definitions, the corresponding author will be contacted by email. A standardised request template will be used identifying specifically which data items are missing. A maximum of [SPECIFY: two contact attempts at two-week intervals] will be made. If no response is received within [SPECIFY: 6 weeks], the study will be included with available data and the missing items flagged in the extraction record.

**Data from figures:** Where outcome data are reported only in figures (bar charts, line graphs, box plots), numerical values will be extracted using WebPlotDigitizer (version [SPECIFY: 4.6 or current version at time of extraction]). Two independent extractions from figures will be compared; if values differ by more than [SPECIFY: 5% relative tolerance], a third extractor adjudicates.

**Non-English studies:** Studies with English-language abstracts passing title/abstract screening that have non-English full texts will be translated using DeepL Pro (or Google Translate as backup) for initial data extraction. A bilingual reviewer fluent in the study language will verify extracted data items for accuracy before entry into the extraction database. If no bilingual reviewer is available for a given language, the study will be flagged and excluded from primary synthesis pending verification, with this decision documented in the PRISMA flow diagram.

**Multiple publications of the same study:** When multiple publications report on the same study (identified by overlapping company, data period, and intervention), data items will be sourced as follows: sample/data characteristics from the most comprehensive publication; primary outcome data from the publication reporting the longest evaluation period; model specifications from the original publication; any discrepancies across publications will be noted. The study will be counted once in the PRISMA flow diagram with all associated publications listed.

**Grey literature quality annotation:** Industry reports, consulting case studies, and white papers will undergo the same extraction process but will additionally have their methodological transparency rated (see Risk of Bias Assessment); synthesis will present grey literature and peer-reviewed evidence strands separately.

---

## Risk of Bias Assessment
*(PRISMA Item 8)*

### Assessment Tool

[TRAINING-DATA CLAIM: no validated risk of bias tool exists specifically for retrospective operational case studies with temporal data splits — the dominant design in this evidence base]. An adapted assessment framework will be used, drawing from three source instruments:

1. **Newcastle-Ottawa Scale (NOS)** for observational studies (cohort variant): selection, comparability, and outcome domains adapted for operational data context.
2. **ROBINS-I (Risk of Bias in Non-Randomized Studies of Interventions)**: bias domains for confounding, selection of participants, classification of interventions, deviations from intended interventions, missing data, measurement of outcomes, and selection of the reported result.
3. **Systematic review-specific quality criteria for ML studies** (drawing from PROBAST — Prediction model Risk Of Bias Assessment Tool): where studies focus on prediction model development and validation.

The adapted tool will be finalised before full-text screening begins. The following domains will be assessed for every included study:

### Assessment Domains

| Domain | Judgment options | Key questions |
|---|---|---|
| **D1: Baseline documentation** | Low / Unclear / High risk | Is the comparator period quantitatively defined with explicit start/end dates and numeric baseline values for each primary outcome? |
| **D2: Data source integrity** | Low / Unclear / High risk | Are operational data sourced from internal company systems (reservation system, fleet management system, maintenance logs) with documented extraction procedures? Is there evidence of data cleaning, imputation, or transformation that could systematically bias outcomes? |
| **D3: Temporal confounding** | Low / Unclear / High risk | Could secular trends (fleet size change, market conditions, pricing policy change, competitor entry/exit) plausibly explain the observed improvement independent of the ML intervention? Is any attempt made to adjust for or rule out temporal confounders? |
| **D4: Selection of locations/vehicles** | Low / Unclear / High risk | Are all qualifying locations/vehicle categories included in the analysis, or is there evidence of selection of "best-performing" or "easiest" locations that may inflate apparent benefit? |
| **D5: Outcome measurement consistency** | Low / Unclear / High risk | Are outcomes measured using the same operational records and definitions in both the baseline and intervention periods? Are outcome definitions pre-specified or selected post-hoc from available metrics? |
| **D6: Comparator validity** | Low / Unclear / High risk | Is the comparator the actual operations-as-practiced, or is it a reconstructed or simulated baseline? Simulated baselines are flagged; actual pre-intervention operations are preferred. |
| **D7: Outcome reporting completeness** | Low / Unclear / High risk | Are all three primary outcome domains reported, or only those favourable to the intervention? Is the PRISMA Item 10a outcome selection pre-specified? |
| **D8: Funding/commercial interest** | Present / Not present / Unclear | Is the study funded by the company operating the fleet or by a vendor of the ML system evaluated? Does the study team include employees of the company or vendor? |
| **D9: Proprietary data publication bias** | Flagged / Not flagged | Grey literature or industry case studies where the company controls publication decision; flagged without automatic exclusion per Flag 1 (Phase 1 framing commitment). |

### Overall Risk of Bias Judgment

Each study will receive an overall rating:
- **Low risk:** Domains D1–D7 all rated Low risk.
- **Moderate risk:** One or two domains D1–D7 rated Unclear risk; none rated High risk.
- **High risk:** One or more domains D1–D7 rated High risk; OR domain D8 present AND at least one domain rated Unclear risk.
- **Critical risk:** Three or more domains rated High risk, OR outcome data interpretable only with unverifiable assumptions.

Studies rated Critical risk will be included in the evidence map but excluded from the primary narrative synthesis; their exclusion will be reported and discussed.

### Number of Reviewers

Two reviewers will independently assess risk of bias for all included studies. Disagreements will be resolved through discussion; unresolved disagreements will be adjudicated by a third reviewer. Inter-rater agreement (Cohen's kappa) will be reported for each domain and overall.

### Adaptations to Standard Tools

The Newcastle-Ottawa Scale comparability domain (normally assessing whether most important confounders are controlled) is adapted as follows: for temporal split designs, the most important confounder is secular operational trend; studies that acknowledge and attempt to control for or rule out secular trends receive maximum comparability points; studies that ignore this threat are penalised.

ROBINS-I's "deviations from intended interventions" domain is adapted to assess whether the ML model outputs were actually used in operational decisions (prospective deployment) versus simulated retrospectively; retrospective simulation designs are not penalised but the distinction is recorded as it affects external validity.

PROBAST's predictive model domains (outcome measurement, analysis) are applied only to studies where the primary contribution is a predictive model (demand forecasting or maintenance prediction); they are not applied to distribution optimization studies where the intervention is a decision-support rule rather than a prognostic model.

---

## Outcome Data Items
*(PRISMA Item 10a)*

### Primary Outcome Domains and Definitions

The three primary outcomes are co-equal per the Phase 1 framing commitment and will be reported in parallel throughout synthesis. No post-hoc prioritization will be applied.

**Primary Outcome 1 — Stockout Reduction**

*Definition:* Change in the frequency of occasions when a specific vehicle category was unavailable at a location to fulfill a customer request, measured through reservation system or operational records. Unit of measurement: stockout days per location per month; stockout instances per location per month; percentage of customer requests unfulfilled; or proxy measures (declined bookings, revenue lost to unavailability) where direct stockout measurement is unavailable.

*Extraction rule:* Extract the most direct operational measure available (stockout days/instances preferred over revenue proxy). Where multiple operationalizations are reported for the same construct, extract all and record separately; primary synthesis uses the most direct measure.

*Time points:* Extract outcome values for (a) the defined baseline period and (b) the intervention or evaluation period. If multiple evaluation time points are reported (e.g., 3-month, 6-month, 12-month post-deployment), extract all; primary synthesis uses the longest reported evaluation period. If only cumulative or averaged figures are reported, extract as-is and note the averaging period.

*Rule for multiple time points:* Use the longest follow-up with a documented evaluation period. If the longest follow-up uses a different metric than shorter follow-ups (e.g., revenue proxy at 12 months, stockout days at 3 months), extract both and flag the metric inconsistency.

**Primary Outcome 2 — Unplanned Maintenance Cost Reduction**

*Definition:* Reduction in costs attributable to reactive (non-predictive) maintenance, emergency repairs, or unscheduled vehicle downtime. Unit: absolute monetary terms (specify currency and reporting year); percentage of total maintenance budget; cost per vehicle per year; total annual fleet maintenance expenditure.

*Extraction rule:* Where monetary values are reported, extract nominal figure and note currency and year for future purchasing power parity annotation if cross-country comparison is warranted. If only percentage reduction is reported, extract percentage; if only absolute value is reported, extract absolute value. Do not calculate percentage from absolute if denominator (total budget) is not reported.

*Time points:* Same rule as Primary Outcome 1: extract all reported time points; primary synthesis uses longest evaluation period.

**Primary Outcome 3 — Fleet Utilization Rate Improvement**

*Definition:* Change in the percentage of the fleet generating revenue, or equivalent metric distinguishing active revenue-generating vehicles from total fleet (including vehicles in maintenance, transfer, or idle). Unit: percentage of fleet in active use per day (averaged over evaluation period); revenue-generating days per vehicle per year; average vehicles in active use per day (absolute count).

*Extraction rule:* Record whether the metric distinguishes available fleet from total fleet. If the study conflates vehicles in maintenance with the denominator (inflating apparent utilization), flag for methodological quality annotation and extract as reported. Do not adjust reported figures.

*Time points:* Same rule as Primary Outcomes 1 and 2.

### Secondary Outcome Domains

**Secondary Outcome 1 — Demand Forecast Accuracy**
- Metrics: MAE, RMSE, MAPE, or SMAPE on held-out operational data; reported as aggregate over evaluation period or stratified by location and vehicle category.
- Time points: Extract for all reported forecast horizons (1-week-ahead, 1-month-ahead, and any other stated horizon). Record horizon alongside metric.
- Rule for multiple metrics: Extract all reported; do not select or prioritize post-hoc.

**Secondary Outcome 2 — Maintenance Prediction Accuracy**
- Metrics: Precision, recall, F1-score, AUC-ROC (binary failure/no-failure classification); MAE or RMSE (remaining useful life regression).
- Time points: Extract for evaluation period as defined in study; if cross-validation is used rather than a held-out temporal split, extract cross-validation performance and note the evaluation approach.

**Secondary Outcome 3 — Forecast Accuracy by Horizon**
- Extracted as a sub-item of Secondary Outcome 1 where disaggregated data are available; treated as a separate row in extraction form.

**Secondary Outcome 4 — Vehicle Replacement Decision Accuracy**
- Metric and measurement approach as defined in study; extract verbatim definition and numerical result; no standardised metric is assumed.

### Post-Protocol Outcome Additions

Any outcome domain added after protocol registration must be documented with the date added, the reason for addition, and an indication of whether the addition was prospective (before any included study was analysed) or retrospective. Retrospective additions will be clearly marked in the synthesis tables and discussed as a potential source of reporting bias.

---

## Other Variable Data Items
*(PRISMA Item 10b)*

### Company (Population) Characteristics

| Variable | Extraction detail |
|---|---|
| Number of locations | Integer; exact if stated, range if only a range is given |
| Fleet size | Total number of vehicles; or range if exact figure not available |
| Geographic region | Country (ISO code); regional aggregate (Europe, North America, Asia-Pacific, Middle East/Africa, Latin America, other) |
| Operational maturity | Described classification (legacy, digital-first, hybrid) or inferred from system description |
| Reservation/fleet system | Named system if reported; "proprietary" if described but unnamed; "not reported" |
| Data source types | Reservation records; fleet records; maintenance/service logs; telematics/sensor data; other (specify) |
| Total data duration | Months; source: explicitly stated or calculated from reported start/end dates |
| Training/evaluation split | Ratio or absolute durations; temporal split (earlier = train, later = eval) or other (specify) |
| Seasonal pattern | Whether study acknowledges seasonality in demand data; whether seasonal adjustment is applied |

### Intervention Characteristics

| Variable | Extraction detail |
|---|---|
| Module(s) applied | Demand forecasting; predictive maintenance; vehicle distribution; integrated (specify which) |
| Model family | As classified in eligibility criteria (time series; deep learning; ensemble ML; regression/classification; mathematical programming with ML; hybrid; other) |
| Named algorithm(s) | As stated in study |
| Input feature categories | Temporal features (time of year, day of week, holiday indicators); demand history; vehicle characteristics (age, make, category, mileage); maintenance history; pricing data; external data (weather, events); other |
| Hyperparameter tuning | Method reported (grid search, random search, Bayesian optimization, none, not reported) |
| Forecast horizon | Days; range if multiple horizons tested |
| Prediction granularity | Fleet-level; location-level; vehicle-category-level; location-by-category |
| Validation approach | Temporal hold-out split; rolling-window cross-validation; k-fold cross-validation (flag as unsuitable for time series if applied without temporal ordering); other |
| Deployment context | Retrospective simulation only; prospective operational deployment; hybrid |
| Integration with decisions | ML output directly linked to operational decision (allocation, scheduling); advisory/dashboard output; not specified |

### Comparator Characteristics

| Variable | Extraction detail |
|---|---|
| Comparator family | Current operational practice; documented rule-based heuristics; simple statistical methods; static allocation; undefined/idiosyncratic |
| Comparator description | Verbatim or close paraphrase as stated in study |
| Baseline measurement period | Calendar dates if reported; duration in months |
| Baseline quantitatively defined | Yes; partially; no — with flag if partially or no |
| Baseline source | Same operational records as intervention data; reconstructed/estimated; described only qualitatively |

### Funding Source and Conflict of Interest

| Variable | Extraction detail |
|---|---|
| Primary funder | Industry (name company or vendor if reported); government grant (name programme if reported); academic institution; non-profit; self-funded; not reported |
| Commercial conflict of interest | Study team includes employees of the company operating the fleet; employees of the ML vendor; neither; not reported |
| Data access arrangement | Proprietary data provided by company under NDA; researcher employed by company; academic collaboration with data access agreement; not reported |

These variables are extracted to support subgroup analyses by funding source and to flag potential commercial bias in synthesis tables (per Phase 1 Flag 1 acknowledgment).

### Assumptions for Missing Participant/Company-Level Data

Where primary outcome data are missing for a subset of locations within a multi-location study (e.g., only aggregate fleet-level results reported, not per-location breakdown), the following assumptions apply:

- **Missing = not improved** will not be assumed; instead, studies will be included with available aggregate data and the absence of location-level disaggregation flagged.
- **Last observation carried forward** will not be applied; only reported figures will be extracted.
- Where a study reports a percentage change without reporting both baseline and post-intervention absolute values, only the percentage change will be extracted; back-calculation of absolute values will not be performed unless the denominator (e.g., total fleet size) is explicitly stated elsewhere in the study.

All assumptions and imputation decisions will be documented in the extraction form on a per-study basis.

---

## Effect Measures
*(PRISMA Item 11)*

### Rationale for Effect Measure Selection

Because meta-analysis is not planned (per Phase 1 framing commitment, due to measurement heterogeneity, heterogeneous baseline definitions, and proprietary data publication barriers), formal pooled effect measures will not be computed. Instead, effect measures are standardised to facilitate narrative comparison across studies and transparent reporting in synthesis tables.

### Primary Outcome Effect Measures

**Primary Outcome 1 — Stockout Reduction**

*Effect measure:* Percentage change in stockout frequency from baseline to intervention period.

*Calculation rule:* `(Baseline stockout rate − Intervention stockout rate) / Baseline stockout rate × 100`. Positive values indicate improvement (reduction in stockouts). Where absolute values are not reported and only percentage change is given, the reported figure is extracted as-is. Where stockout rate is expressed as stockout days per location per month, the effect measure is the absolute difference (days/location/month) alongside the percentage change.

*Thresholds for interpretation (for narrative characterization only):*
- < 10% relative reduction: Marginal improvement
- 10–25% relative reduction: Moderate improvement
- > 25% relative reduction: Substantial improvement

These thresholds are operational approximations based on [TRAINING-DATA CLAIM: the magnitude of inefficiency typical in fleet rental operations, where pre-ML stockout rates, maintenance cost overruns, and utilization gaps vary substantially across operators but improvements below 10% are commonly within normal seasonal or measurement variation] and are applied consistently across all included studies. They are not derived from clinical minimally important difference conventions, which are not applicable here.

**Primary Outcome 2 — Unplanned Maintenance Cost Reduction**

*Effect measure:* Percentage reduction in unplanned maintenance costs from baseline to intervention period, or absolute cost difference per vehicle per year (where percentage is not calculable from reported data).

*Calculation rule:* `(Baseline cost − Intervention cost) / Baseline cost × 100`. Positive values indicate improvement. Where currencies differ across studies, costs will be noted in original currency; purchasing power parity conversion will be applied if a cross-country cost comparison table is constructed (currency and year recorded for this purpose).

*Thresholds for interpretation:*
- < 10% cost reduction: Marginal improvement
- 10–30% cost reduction: Moderate improvement
- > 30% cost reduction: Substantial improvement

**Primary Outcome 3 — Fleet Utilization Rate Improvement**

*Effect measure:* Absolute percentage point change in fleet utilization rate (e.g., from 72% to 81% utilization = +9 percentage points). Relative change (percentage change in utilization rate) will additionally be reported where baseline utilization is explicitly stated.

*Thresholds for interpretation:*
- < 3 percentage point improvement: Marginal
- 3–8 percentage point improvement: Moderate
- > 8 percentage point improvement: Substantial

### Secondary Outcome Effect Measures

**Secondary Outcome 1 — Demand Forecast Accuracy**

*Effect measure:* Absolute reduction in MAPE (percentage points) or RMSE (original demand units) comparing the ML model to the comparator on the same held-out dataset. Where MAPE is reported: `Comparator MAPE − ML MAPE` (positive = improvement). Where only RMSE or MAE is reported, the same difference-in-metric approach applies; units retained from study.

*Note:* Forecast accuracy metrics are not standardised across studies because demand volumes differ in scale; no standardised mean difference or cross-study pooling will be attempted for these metrics. Studies will be described individually in an evidence map table.

**Secondary Outcome 2 — Maintenance Prediction Accuracy**

*Effect measure:* For binary classification (failure/no-failure), the primary reported metric is F1-score (balancing precision and recall, appropriate given [TRAINING-DATA CLAIM: class imbalance typical in predictive maintenance datasets, where failure events are far less frequent than non-failure periods]); AUC-ROC reported as supplementary. For remaining useful life regression, MAE in days or mileage units.

*Comparison:* ML model vs. comparator (reactive scheduling baseline or simple rule-based threshold); absolute difference in F1-score or AUC-ROC where both are reported.

**Secondary Outcome 4 — Vehicle Replacement Decision Accuracy**

*Effect measure:* As defined and reported in each study; no standardised measure is assumed. The metric and its unit will be extracted verbatim and catalogued in the evidence map without cross-study aggregation.

### Effect Measure Summary Table

| Outcome | Effect measure | Direction of benefit | Interpretation thresholds |
|---|---|---|---|
| Stockout reduction | % relative reduction; absolute days/location/month | Positive = fewer stockouts | <10% marginal; 10–25% moderate; >25% substantial |
| Unplanned maintenance cost reduction | % cost reduction; absolute cost/vehicle/year | Positive = lower costs | <10% marginal; 10–30% moderate; >30% substantial |
| Fleet utilization improvement | Absolute percentage point change | Positive = higher utilization | <3pp marginal; 3–8pp moderate; >8pp substantial |
| Demand forecast accuracy | Absolute MAPE reduction (pp); RMSE difference | Positive = lower error | No cross-study pooling; reported individually |
| Maintenance prediction accuracy | Absolute F1-score difference; AUC-ROC difference | Positive = higher accuracy | No cross-study pooling; reported individually |
| Vehicle replacement accuracy | As reported | As defined in study | Not standardised |

---
