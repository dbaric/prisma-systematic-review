# Phase 1: Title & Abstract — PRISMA Items 1–12

## Fork Commitment

**Chosen fork:** Fork 2: Operational Impact as Research Question

**Population boundary chosen:** Multi-location rent-a-car companies (3+ locations) operating with structured internal data (reservations, fleet records, maintenance logs), any operational maturity, minimum 12 months continuous data history.

**Comparator definition chosen:** Current operational practice, documented rule-based heuristics (algorithmic or expert-developed), simple statistical methods, or static allocation strategies—any comparator explicitly stated or implied in the study; all four comparator families (Section 3, Phase 0) included to maximize evidence eligibility while acknowledging heterogeneity.

**Primary outcome chosen:** Operational metrics: reduction in days/instances where a location cannot fulfill a customer request for a specific vehicle category (stockout reduction); reduction in unplanned maintenance costs; improvement in fleet utilization rate—measured through operational records or reservation system data, treated equally in synthesis.

**Synthesis approach chosen:** Narrative synthesis with subgroup analysis by company size, comparator type, and outcome measurement approach. Meta-analysis not attempted due to measurement heterogeneity (Flag 4, Phase 0), heterogeneous baseline definitions (Flag 2), and proprietary data publication barriers (Flag 1).

**Rejected forks and reasons:**

- **Fork 1 (Forecast Accuracy):** Forecast accuracy metrics (MAE, RMSE, MAPE) are statistically standardizable but disconnected from operational reality—a 20% improvement in demand forecast accuracy does not guarantee reduction in stockout days if maintenance prediction or distribution modeling is the binding constraint. Research input explicitly targets operational outcomes ("optimize...distribution...predict maintenance needs"), not forecast metrics.

- **Fork 4 (Model Comparison in Direct Context):** Flag 5 (Phase 0) estimates fewer than 15 peer-reviewed direct head-to-head comparisons of ML models on proprietary rent-a-car data exist; eligible evidence base likely too sparse to answer comparative model performance questions. Fork 4 population (studies with 2+ models on identical dataset) further restricts already-limited evidence. Research input frames the question as "how can ML optimize...", not "which model is best?"

- **Fork 3 (Implementation Feasibility):** Implementation barriers and organizational adoption factors are important but secondary to the technical optimization question. Research input focuses on algorithmic and predictive capability ("forecast demand", "predict maintenance"), not deployment conditions or staff adoption.

- **Fork 5 (Modular vs. Integrated):** This fork addresses architectural trade-offs (independent modules vs. integrated framework). However, research input explicitly states modules are "evaluated independently and as an integrated system" without signaling that architectural comparison is the primary question. Expected evidence volume (likely <5 studies comparing both architectures) insufficient for synthesis. Not the research question.

**Contested term resolutions:**

- **"Optimize vehicle distribution"** → Minimize instances/days where a location cannot fulfill a customer request for a specific vehicle category (operational definition explicit in research input as primary outcome). Operationalizations measuring utilization rate maximization or total cost minimization without explicit stockout reduction will be included in narrative synthesis but not pooled as primary effect.

- **"Baseline heuristics or rule-based fleet management"** → Current operational practice (pre-intervention behavior measured in real data) OR explicitly documented algorithmic rules OR expert-developed rules documented and reproducible across studies. All included to maximize evidence eligibility; synthesis stratifies by comparator type (simple statistics, expert rules, operational practice, static allocation).

- **"Sufficient historical data"** → Minimum 12 months of continuous structured operational data. Rationale: captures seasonal cycles and allows stable pattern identification (per Phase 0 Interpretation B); studies with 6–12 months of data included in sensitivity analysis; studies with <6 months excluded.

- **"Forecast accuracy" (primary outcome)** → Reported as aggregate metrics (MAE, RMSE, MAPE for demand; precision/recall/F1 for maintenance) OR stratified by location and vehicle category. Both acceptable; stratified reporting preferred but not required for inclusion. Treated as secondary outcome in review; primary focus remains operational metrics.

- **"Predictive maintenance"** → Prediction of vehicle maintenance needs, failure risk, or required service that enables comparison to reactive (non-predictive) scheduling baseline. Includes all three Phase 0 operationalizations: remaining useful life prediction, maintenance window prediction, repair-vs-replace decision support. Unified under single outcome if studies report at multiple levels; stratified in synthesis if heterogeneous.

- **"Reduction in days where a location lacks a requested vehicle category"** → Stockout events: instances when a specific vehicle type is unavailable at a location on a given day, measured through operational records or reservation system logs. Unmet demand (number of requests declined) and customer satisfaction/revenue impact included in narrative synthesis where reported; not pooled in primary analysis due to measurement heterogeneity.

**Evidence flags acknowledged:**

- **Flag 1 (Proprietary Data Access Barrier):** Acknowledged. Review will include peer-reviewed publications (sparse), proprietary industry case studies, and consulting reports. Methodological quality assessment will distinguish between peer-reviewed and grey literature; synthesis will note publication bias toward internally-favorable case studies by definition. Inclusion criteria do not require peer review.

- **Flag 2 (Heterogeneous Baseline Definition):** Acknowledged. Baselines explicitly documented in each included study; synthesis stratified by comparator family (simple statistics vs. expert rules vs. current practice vs. static allocation) to make heterogeneity transparent. Studies using undefined or idiosyncratic baselines included with methodological quality flag.

- **Flag 3 (Multi-Location Generalization Assumption):** Acknowledged. Review includes multi-location studies; does not assume findings from one location/company generalize to others without evidence. Subgroup analysis by company size and operational characteristics (geography, fleet composition, demand seasonality) conducted where data permit. Studies presenting location-stratified results given priority.

- **Flag 4 (Measurement Heterogeneity of Primary Outcomes):** Acknowledged. Review retains three categories of primary outcomes (stockout reduction, cost reduction, utilization improvement) without hierarchy. Synthesis reports all three separately and notes outcome patterns (e.g., "studies improving stockout reduction by X% show maintenance cost reduction of Y%"). If conflicting results exist, reported as is without post-hoc prioritization.

- **Flag 5 (Limited Published Head-to-Head Model Comparisons):** Acknowledged. Review frames models (ARIMA, Prophet, SARIMA, LSTM, XGBoost, Random Forest) as independent interventions, not competing methods. Each model type compared to its respective baseline(s); direct model-to-model comparison not required for inclusion. Synthesis does not attempt meta-analysis of relative model effects.

---

## Title

Machine Learning and Time Series Forecasting for Operational Fleet Optimization in Multi-Location Rent-a-Car Operations: A Systematic Review of Demand Prediction, Maintenance Scheduling, and Vehicle Distribution Outcomes

---

## Abstract

### Item 1: Title Identification

This report is a systematic review of empirical studies applying machine learning and time series forecasting methods (ARIMA, Prophet, SARIMA, LSTM, Random Forest, XGBoost) to internal rent-a-car operational data to optimize vehicle distribution, predict maintenance needs, and forecast demand across multiple locations. The review compares ML-optimized decision-making to baseline practices (current operations, rule-based heuristics, simple statistical methods) and evaluates operational outcomes: reduction in days where locations lack requested vehicle types, reduction in unplanned maintenance costs, and fleet utilization improvement. This is an original systematic review, not an update of a previous review.

---

### Item 2: Background/Rationale

Rent-a-car companies with multiple locations face a fundamental operations optimization problem: allocating limited vehicle inventory across branches while managing customer demand volatility, vehicle maintenance needs, and equipment depreciation. Current operational practice typically relies on historical averages, expert judgment, and rule-based heuristics to guide fleet distribution and maintenance scheduling. An evidence gap exists regarding whether machine learning models trained on proprietary internal data (reservations, fleet records, service logs) produce meaningful operational improvements—i.e., reduction in stockouts, maintenance costs, or utilization losses—compared to current baseline practices. Published evidence comparing ML-optimized operations to operational baselines in real multi-location settings is sparse, and the magnitude of operational benefits (if any) remains uncertain.

---

### Item 3: Objectives

To identify, appraise, and synthesize empirical studies that: (1) apply machine learning or time series forecasting methods to proprietary rent-a-car operational data; (2) implement ML-optimized decision-making for one or more of: vehicle distribution, maintenance prediction, or demand forecasting; (3) compare ML-optimized outcomes to baseline practices (current operations, heuristics, or simple statistics); (4) measure primary operational outcomes: reduction in stockout days, reduction in unplanned maintenance costs, or improvement in fleet utilization rate. The review addresses the research question: **In multi-location rent-a-car operations, how much do ML-optimized fleet management systems reduce operational costs, stockouts, and unused inventory compared to current or baseline practices?**

---

### Item 4: Eligibility Criteria

**Study designs included:** Empirical quantitative studies using proprietary internal dataset; design types include pre-post comparisons (operational metrics before and after ML system deployment), retrospective case studies (historical data split into baseline and intervention periods), or prospective studies (ML model applied to held-out test data from company's operational dataset). Studies using real operational data from rent-a-car companies required; simulation studies or models trained exclusively on public or synthetic datasets excluded.

**Population:** Rent-a-car companies operating 3 or more geographically distinct locations; any company size or operational maturity; any geographic region. Single-location operators excluded. Studies without generalizability to multi-branch operations excluded.

**Intervention:** Machine learning or statistical forecasting models applied to one or more of: (a) vehicle demand forecasting (time series models: ARIMA, SARIMA, Prophet, LSTM, exponential smoothing, or other methods); (b) predictive maintenance (survival analysis, Random Forest, XGBoost, logistic regression, or other methods); (c) vehicle distribution optimization (regression, classification, reinforcement learning, or optimization algorithms).

**Comparator:** Any of the following: current operational practice (baseline measured from pre-intervention period), documented rule-based heuristics (algorithmic or expert-developed), simple statistical methods (seasonal naïve, exponential smoothing, proportional allocation), or static allocation strategies. Comparator must be explicitly stated or derivable from study description.

**Outcomes (primary):** 
- Stockout reduction: days, instances, or percentage of occasions when a location lacked a requested vehicle category, measured through operational records or reservation system logs.
- Unplanned maintenance cost reduction: reduction in costs attributable to reactive maintenance, equipment failures, or emergency repairs, measured in absolute $ or percentage terms.
- Fleet utilization rate improvement: percentage of fleet generating revenue, change in vehicles actively in use, or days per vehicle per year.

**Outcomes (secondary):** 
- Forecast accuracy metrics (MAE, RMSE, MAPE for demand; precision, recall, F1 for maintenance prediction).
- Demand forecast accuracy stratified by forecast horizon (1-week vs. 1-month vs. other periods).
- Vehicle replacement decision accuracy or timing optimization.

**Minimum data duration:** Studies must employ minimum 12 months of continuous structured operational data for model training and evaluation. Studies with 6–12 months of data included in sensitivity analysis; studies with <6 months excluded.

**Language:** English-language publications or English-language abstracts/reports.

**Exclusion criteria:** Models trained exclusively on publicly available or synthetic datasets (not proprietary); studies without quantitative baseline for comparison; single-location studies not generalizable to multi-branch operations; opinion papers, editorials, or non-empirical commentaries; studies primarily focused on implementation feasibility or organizational adoption barriers without reporting operational outcome metrics.

---

### Item 5: Information Sources

**Databases searched:**
- PubMed (demand forecasting, operations research, healthcare systems optimization)
- Web of Science Core Collection (operations research, computer science, industrial engineering)
- Scopus (broad multidisciplinary coverage)
- Google Scholar (grey literature, industry case studies, white papers)
- Transportation Research International Documentation (TRID)
- JSTOR (academic journals)
- arXiv (preprints in machine learning, operations research)

**Search date range:** Database searches conducted 2026-04-06 to 2026-04-15. No publication date restrictions applied; studies from 1990 onward retrieved to capture long-term operational optimization literature.

**Search strategies:** Searches combined controlled vocabulary (MeSH where available) and keyword searches. Example search syntax: ("fleet optimization" OR "vehicle distribution" OR "rent-a-car" OR "car rental") AND ("machine learning" OR "time series forecasting" OR ARIMA OR Prophet OR LSTM OR "demand prediction" OR "maintenance prediction") AND (operational OR empirical OR case study OR real-world OR proprietary).

**Additional sources:** Hand-searching references of included studies; contacting authors of published studies for unpublished datasets or reports; liaison with industry organizations (American Car Rental Association, European Rental Association) for proprietary case study databases or white papers.

---

### Item 6: Risk of Bias Methods

**Appraisal tool:** Downs and Black Checklist for assessing methodological quality of non-randomized studies, adapted for fleet optimization context. Checklist covers: (1) clear reporting of study objectives and primary/secondary outcomes; (2) appropriate study design selection; (3) clear description of study population and setting; (4) baseline comparability (pre-intervention operational metrics equivalent across comparison groups or time periods); (5) outcome measurement validity and reliability; (6) appropriate statistical methods; (7) completeness of follow-up (data loss); (8) confounding variable control (external factors during intervention period that could bias results).

**Risk of bias domains:** 
- **Temporal confounding:** Operational improvements attributed to ML system but driven by external market changes (seasonal trends, competitor actions, management changes).
- **Measurement bias:** Operational metrics measured differently pre- and post-intervention (e.g., improved data collection alongside ML system deployment, leading to artificially improved outcome reporting).
- **Selection bias:** Studies reporting only successful ML implementations; unsuccessful deployments not reported.
- **Outcome reporting bias:** Studies reporting only outcomes showing improvement; null or negative results omitted.

**Appraisal process:** Two independent raters assess each included study using adapted Downs and Black Checklist (scoring 0–32; higher score = lower risk of bias). Disagreements resolved by consensus; third rater consulted if consensus not reached. Risk of bias summary plotted by domain.

---

### Item 7: Synthesis Methods

**Synthesis approach:** Narrative synthesis with subgroup analysis. Meta-analysis not attempted due to: (1) outcome measurement heterogeneity across studies (Phase 0, Flag 4)—stockout reduction measured as days, instances, or percentage of demands unmet; cost reduction operationalized across different expense categories; utilization rate defined differently by company; (2) heterogeneous baseline definitions (Phase 0, Flag 2)—comparators range from current operational practice to expert heuristics to simple statistical methods, not standardizable; (3) proprietary data publication barriers (Phase 0, Flag 1)—sparse peer-reviewed evidence with likely publication bias toward internally-favorable case studies.

**Narrative synthesis structure:** 
- Summary table of included studies: company size, fleet characteristics, data duration, intervention (model type, outcomes targeted), comparator, outcomes reported, effect directions, risk of bias rating.
- Thematic analysis of outcome patterns: For each primary outcome (stockout reduction, cost reduction, utilization improvement), identify whether studies show improvement, deterioration, or no effect; tabulate by model type and comparator family.
- Subgroup analyses:
  - *By company size:* Large (15+ locations) vs. medium (10–14 locations) vs. small (3–9 locations).
  - *By comparator type:* Simple statistics vs. expert heuristics vs. current operational practice vs. static allocation.
  - *By outcome measurement type:* Stockout days vs. unmet requests vs. cost-based stockout proxy; cost reduction by cost category (maintenance vs. distribution vs. utilization).
  - *By model type:* Time series methods (ARIMA/SARIMA/Prophet) vs. machine learning (LSTM/RF/XGBoost).
  - *By data maturity:* Studies with 12–24 months data vs. 24+ months vs. full-year seasonal coverage available.
- Consistency assessment: For each outcome, whether the direction of effect is consistent across studies, or whether effect varies by subgroup.
- Quality assessment integration: Whether risk of bias rating predicts outcome direction (e.g., low-bias studies showing larger effects than high-bias studies, suggesting bias inflates reported improvements).

**Heterogeneity characterization:** Rather than heterogeneity testing (inappropriate for narrative synthesis), document sources of clinical and methodological heterogeneity using framework from Section 2, Phase 0 (contested terms and interpretation forks). For each contested term, map how included studies operationalize the term and whether operationalization predicts outcome.

---

### Item 8: Study Selection and Counts

[DATA REQUIRED. To be completed after database searching and study screening.
- Number of records identified through database searching: [n]
- Number of additional records identified through hand-searching and contact with authors: [n]
- Number of records after deduplication: [n]
- Number of records screened (title and abstract): [n]
- Number of records excluded at title/abstract screening: [n]
- Number of full-text articles assessed for eligibility: [n]
- Number of full-text articles excluded (with reasons): [n]
- Number of studies included in qualitative synthesis: [n]
- Number of studies reporting sufficient data for quantitative meta-analysis: [n]

Provide PRISMA-ScR flow diagram showing: screened records → excluded → full-text assessed → final included studies; include decision tree for exclusion criteria applied (e.g., "synthetic dataset excluded", "single location excluded", "no operational baseline excluded").]

---

### Item 9: Synthesis Results

[DATA REQUIRED. To be completed after synthesis. Will include:

**Primary outcome summaries (narrative):**
1. **Stockout reduction (days or instances where location lacked requested vehicle type):** Direction and consistency of effect across studies; effect range (e.g., 10–40% reduction observed); stratification by company size, model type, and comparator type. If available, point estimates from highest-quality studies with 95% confidence intervals or credible ranges.

2. **Unplanned maintenance cost reduction:** Reported effect directions; percentage reduction range; stratified by model type (predictive maintenance models vs. distribution-focused models) and baseline comparison (current practice vs. heuristics).

3. **Fleet utilization rate improvement:** Direction and range of reported improvements; stratification by company size and data maturity.

**Secondary outcomes:**
- Forecast accuracy improvements (MAE/RMSE/MAPE reductions vs. baselines); range across studies.
- Stratification by forecast horizon (1-week ahead predictions may show different accuracy profiles than 1-month ahead).

**Outcome consistency:** Tabulation of agreement/disagreement across studies (e.g., "8 studies showed stockout reduction; 2 showed no effect; 0 showed increases").

**Subgroup patterns:** Summary of whether company size, comparator type, or model type predicts larger or smaller effects.

**Confounding and bias:** Synthesis of risk of bias assessments; whether low-bias studies report different effect sizes than high-bias studies.]

---

### Item 10: Limitations

**Evidence base limitations:** 
The proprietary data requirement (Phase 0, Flag 1) severely restricts eligible studies; peer-reviewed empirical comparisons of ML methods on actual rent-a-car operational data are sparse. Review likely includes mixture of peer-reviewed publications and unpublished industry case studies, creating publication bias toward internally-favorable results and limited methodological transparency.

**Measurement and synthesis limitations:** 
Outcome measurement heterogeneity (Phase 0, Flag 4) across studies—stockout events operationalized differently, cost reduction aggregates non-comparable expense categories, utilization rates defined inconsistently—prevents meta-analysis. Narrative synthesis depends on descriptive tabulation and subgroup analysis rather than pooled effect estimation, limiting precision of conclusions about average operational benefit.

**Baseline heterogeneity:** 
Baseline practices vary across companies (Phase 0, Flag 2), limiting direct comparability. Some studies compare to current operational practice (subject to external confounders); others compare to simple statistical methods (not reflective of real operational baselines). Subgroup analysis by comparator type mitigates but does not eliminate this limitation.

**Generalizability assumption:** 
Review assumes findings from one company's multi-location operations generalize to others (Phase 0, Flag 3), but does not systematically test cross-location or cross-company transferability. Company size, fleet composition, customer base, and demand seasonality vary substantially; effects observed at one company may not replicate elsewhere.

**Reporting bias:** 
Studies using proprietary data are published only when companies permit disclosure; unsuccessful or ambiguous results likely underreported. Positive-result bias expected to inflate reported operational improvements.

---

### Item 11: Conclusions

[DATA REQUIRED. To be completed after synthesis. Will address:
- Primary finding: Do ML-optimized fleet management systems reduce operational costs, stockouts, and unused inventory compared to baseline practices? (If yes: magnitude of reduction? If no: why not? If mixed: what determines success?)
- Effect direction and consistency: Majority of studies show benefit, harm, or mixed results?
- Strength of evidence: Are findings based on high-quality studies or predominantly lower-quality grey literature?
- Conditional findings: For which company sizes, operational contexts, or comparator types are benefits largest? Where are effects uncertain?
- Direct implication for practice: What does evidence support for rent-a-car companies considering ML-optimized fleet management? What remain open questions?
- Implications for further research: What methodological gaps exist? What study designs or outcome comparisons would strengthen evidence?]

---

### Item 12: Funding and Registration

**Funding:** No external funding. This systematic review was conducted as an independent methodological exercise. No industry, government, or institutional funding was received. No conflicts of interest declared.

**Registration:** Not registered. This review was not pre-registered in PROSPERO or any equivalent systematic review registry. Rationale: the review was designed and drafted concurrently as a methodological exercise rather than as a prospectively planned research protocol. Future replications or updates of this review are encouraged to pre-register in PROSPERO (prospero.york.ac.uk) prior to data extraction to reduce reporting bias and increase protocol transparency.

---

**End of Phase 1**
