# Phase 0: Landscape & Forks
## Fleet Optimization in Rent-a-Car Operations: Interpretive Space

**Review Date:** 2026-04-06  
**Input Source:** inputs/fleet-optimization-rent-a-car.txt

---

## 1. Interpretive Forks

Five substantively different framings of the research question are identified. Each would yield a meaningfully different set of included studies and evidence base.

### Fork 1: Forecast Accuracy as Research Question
**Framing:** "Which machine learning approaches achieve the highest forecast accuracy for vehicle demand and maintenance needs in multi-location rental operations?"

**Population boundary:** Any company with multi-location rent-a-car operations and sufficient data (no lower bound specified in input).

**Core comparison:** Forecasting models (ARIMA, Prophet, SARIMA, LSTM) vs. baseline statistical methods or simple heuristics.

**Primary outcome:** Forecast accuracy metrics (MAE, RMSE, MAPE for demand; precision, recall, F1 for maintenance prediction). Evaluated on held-out test sets or validation partitions.

**Implied synthesis approach:** Meta-analysis of effect sizes comparing each ML method to its respective baseline(s). Standardized through common accuracy metrics. Feasible if sufficient studies report comparable metrics.

**Distinguishing assumption:** Forecast accuracy improvements are comparable in magnitude and direction across different operational contexts (fleet sizes, geographies, seasonal patterns). A model achieving 15% MAPE reduction in one setting should achieve similar reductions in another.

---

### Fork 2: Operational Impact as Research Question
**Framing:** "How do ML-optimized fleet management systems reduce operational costs, stockouts, and unused inventory compared to current or baseline practices?"

**Population boundary:** Multi-location rent-a-car operations actively managing inventory and maintenance at scale.

**Core comparison:** ML-optimized decision-making (distribution, maintenance timing, replacement scheduling) vs. current operational practice or baseline heuristics applied in real operations.

**Primary outcome:** Operational metrics: days without requested vehicle category, unplanned breakdown costs, fleet utilization rate (%), revenue per vehicle, customer satisfaction with vehicle availability.

**Implied synthesis approach:** Narrative synthesis. Heterogeneous operational contexts (fleet sizes, geographies, customer bases, existing operational maturity) make standardization difficult. Meta-analysis would require post-hoc operationalization of "cost" and "stockout" across non-comparable measurement systems.

**Distinguishing assumption:** Operational improvements documented in one company's operations are implementable and will produce similar improvements in structurally different companies. A 20% cost reduction observed at Company A should be achievable at Company B given similar models and data.

---

### Fork 3: Implementation Feasibility as Research Question
**Framing:** "What are the data requirements, computational infrastructure, organizational adoption barriers, and success factors for deploying ML-based fleet optimization in rent-a-car operations?"

**Population boundary:** Rent-a-car companies that have attempted, completed, or abandoned ML-based fleet optimization projects.

**Core comparison:** Successful implementations vs. failed implementations; or successful implementations vs. organizations that never attempted adoption.

**Primary outcome:** Implementation success/failure; data quality requirements met/unmet; system adoption (automated decisions vs. staff override rate); staff training requirements; computational infrastructure requirements; time-to-value.

**Implied synthesis approach:** Narrative synthesis with qualitative components. Success factors are context-specific (company culture, existing systems, data maturity). Synthesis would focus on identifying common barriers and enabling conditions.

**Distinguishing assumption:** Implementation success factors identified in one operational or organizational context transfer to others. If large companies struggle with staff adoption, so do small ones; or conversely, that adoption factors are company-size-specific.

---

### Fork 4: Model Comparison in Direct Context
**Framing:** "In head-to-head comparisons within the same operational dataset, how do ARIMA, Prophet, SARIMA, LSTM, and other methods perform relative to each other?"

**Population boundary:** Studies presenting direct within-study comparisons of 2+ model families on the same rental company's dataset.

**Core comparison:** ARIMA vs. Prophet vs. SARIMA vs. LSTM vs. Random Forest vs. XGBoost, tested on identical train/test splits from the same company's data.

**Primary outcome:** Relative forecast accuracy (differences in MAE/RMSE/MAPE); computational cost (training time, inference latency); implementation complexity.

**Implied synthesis approach:** Meta-analysis of relative effects if sufficient direct comparisons exist; otherwise, tabulation of head-to-head results. Requires studies to report metrics on identical problem scopes.

**Distinguishing assumption:** Relative model performance is stable across operational contexts. If LSTM outperforms ARIMA in Company A's demand data, it will outperform in Company B's demand data under similar conditions.

---

### Fork 5: Modular vs. Integrated Optimization Architecture
**Framing:** "Is a three-module optimization system (demand forecast → distribution model, maintenance prediction → timing model, utilization → replacement timing) more effective as independent modules or as an integrated optimization framework?"

**Population boundary:** Multi-location operations where all three problems (demand, maintenance, distribution) are material; companies with sufficient data to test both architectures.

**Core comparison:** Modular (three separate models, decisions made independently) vs. integrated (unified optimization across all three objectives).

**Primary outcome:** System-level performance: total operational cost, stockout rate, fleet utilization, average forecast accuracy across all three components. Measured on the same dataset under both architectural approaches.

**Implied synthesis approach:** Narrative synthesis comparing architectural trade-offs. Integration creates dependencies (e.g., distributing vehicles to prevent stockouts may increase maintenance costs if vehicles are over-utilized). Studies would need to report on all three outcomes simultaneously to be comparable.

**Distinguishing assumption:** Integration benefits (or costs) are independent of company size, fleet composition, and existing operational practices. A 10-location operator experiences the same integration trade-offs as a 50-location operator.

---

## 2. Contested Terms

The following terms in the research input are operationalized differently by reasonable practitioners, with material consequences for study eligibility and comparability.

| Term | Interpretation A | Interpretation B | Interpretation C | Stakes |
|------|-----------------|-----------------|-----------------|--------|
| **"Optimize vehicle distribution"** | Maximize average fleet utilization rate (vehicles generating revenue) across locations | Minimize days/hours where a location cannot fulfill a customer request for a requested vehicle category | Minimize total cost (inventory carrying cost + stockout cost + distribution/repositioning cost) | Differs fundamentally in objective function; optimizing for one goal may degrade the others (e.g., maximizing utilization may increase stockouts). Review must specify which optimization goal is primary. |
| **"Baseline heuristics or rule-based fleet management"** | Simple statistical methods applied algorithmically with no human intervention (e.g., "allocate vehicles proportional to historical demand") | Rules developed and applied by operations staff or domain experts (e.g., "double standard allocation on holiday weekends") | Current actual operational practice of the company under existing management (measured in real data) | Different baselines answer different questions. Comparison to simple statistics tests whether ML adds value over statistical thinking. Comparison to expert rules tests whether ML can encode expertise. Comparison to status quo tests whether ML changes decisions in practice. |
| **"Sufficient historical data"** | Any amount of structured data adequate for model training and validation splits (weeks to months) | Data sufficient to capture full seasonal cycles and allow stable pattern identification (1–2 years) | Data spanning multiple business/operational regimes with enough stability to assume future resembles past (2–3+ years) | Affects which companies are eligible. Inadequate historical data leads to models that fit training noise rather than stable patterns. Different data horizons support different forecasting horizons (weeks vs. months). |
| **"Forecast accuracy" (primary outcome)** | Aggregate accuracy metrics (MAE, RMSE, MAPE) computed across all locations, all vehicle categories, and all time points combined | Location-stratified and category-stratified accuracy (does the model perform equally well for economy vehicles at high-demand airport location vs. premium vehicles at secondary location?) | Consistency of prediction (does the best-performing model always win, or do winning models vary by location, season, or forecast horizon?) | Review must specify whether it aggregates accuracy globally (average effect size) or requires stratified reporting. Stratified reporting better captures whether a model is universally better or context-specific. |
| **"Predictive maintenance"** | Prediction of vehicle breakdown/failure before it occurs, enabling preventive maintenance (remaining useful life estimation) | Prediction of vehicles needing service or inspection within a scheduled maintenance window (next week, next month) | Prediction of failure risk as input to repair-vs-replace decision (should this vehicle be replaced or repaired?) | Different predictions support different operational decisions. Remaining useful life supports proactive maintenance. Maintenance window prediction supports scheduling. Repair-vs-replace supports fleet turnover decisions. Studies may operationalize "maintenance" differently. |
| **"Reduction in days where a location lacks a requested vehicle category"** | Stockout events (unavailability of a specific vehicle type at a location on a given day) | Unmet demand (number of customer requests declined, in units) | Customer-facing impact (revenue lost, customer dissatisfaction, repeat rental rate impact) | Stockout events are observable in operations data; unmet demand and customer impact require additional data collection. Different operationalizations have different practical implications and may not correlate (one location might have many small stockouts; another might have fewer but longer stockouts). |

---

## 3. Comparator Families

Distinct classes of comparators that could reasonably be used in this review. Each family isolates different aspects of "added value" from ML.

### Family 1: Simple Statistical Baselines
**What it controls for:** Whether the ML model adds value beyond statistical pattern recognition. Simple methods (seasonal naive, exponential smoothing, last-value-forward) require no complex implementation.

**What it leaves uncontrolled:** Whether human operational knowledge or domain expertise improves on simple statistics. The specific design of the intervention (which features, which algorithm, how it was tuned) is confounded with the comparison.

**Example studies:** Model trained on 2 years of historical data, compared to seasonal naïve forecast on same data.

---

### Family 2: Rule-Based Expert Heuristics
**What it controls for:** Whether machine-learned patterns outperform human expert judgment embedded in decision rules (e.g., "allocate 20% more vehicles before holidays").

**What it leaves uncontrolled:** Whether expert rules are stable across companies or represent idiosyncratic operational practices. Heterogeneous rule implementations across studies impede synthesis.

**Example studies:** Company's existing allocation heuristics applied to forecasted demand, compared to ML-optimized allocation.

---

### Family 3: Current Operational Practice
**What it controls for:** Real-world organizational constraints, staff behavior, and practical implementability. Tests whether the model changes decisions and outcomes in actual operations.

**What it leaves uncontrolled:** Whether improvements are due to the model or due to Hawthorne effects (staff perform better when monitored), measurement improvements (better data collection introduced alongside the system), or external changes in market conditions.

**Example studies:** Pre-intervention operational metrics (fleet utilization, stockout days, maintenance costs) vs. post-intervention after ML system deployment.

---

### Family 4: Static/Fixed Allocation Strategies
**What it controls for:** The value of dynamic, demand-responsive reallocation. Static strategies assign vehicles once and do not adapt.

**What it leaves uncontrolled:** Whether static strategies represent a reasonable baseline or a deliberately weak straw man. Some companies may use defensible static rules (e.g., "allocate 15% more capacity to high-demand locations").

**Example studies:** ML dynamic reallocation vs. "allocate vehicles proportional to historical average demand" without adaptation.

---

## 4. Population Boundary Options

### Narrow Frame: Data-Rich, Mature Multi-Location Operators
**Definition:** Companies operating 10–15+ locations with 2+ years of daily structured data (reservations, fleet records, service logs); existing centralized fleet management systems.

**Consequence:**
- *Inclusions:* Large national rent-a-car chains; regional operators with established systems.
- *Exclusions:* Small operators (3–9 locations); companies with sparse, unstructured, or short-duration data.
- *Trade-off:* Higher homogeneity in operational context and data maturity. Models are likely to be more comparable and generalizable within this population. Conclusions apply to established, tech-mature companies only; limited relevance for small or informal operators.

---

### Broad Frame: Any Multi-Location Operator
**Definition:** Companies operating 3+ locations with any amount of structured data (minimum not specified); any company size or operational maturity.

**Consequence:**
- *Inclusions:* Small regional operators; companies with months of data; organizations with limited system integration.
- *Exclusions:* Single-location operations (per exclusion criteria).
- *Trade-off:* Wider applicability and real-world relevance. Includes diverse operational contexts. Models trained on different data volumes and time horizons will have heterogeneous performance; synthesis becomes more challenging. Conclusions are broadly applicable but less precise.

---

### Stakes of This Boundary

The narrow frame isolates a homogeneous, data-rich population where ML models are likely to show consistent improvements. The broad frame includes variability in data maturity and operational scale, which may interact with model performance in unpredictable ways (e.g., a model trained on 2 years of data may perform poorly at a company where only 3 months of data are available). The choice determines generalizability vs. precision: narrow boundaries enable stronger conclusions for a smaller population; broad boundaries enable weaker conclusions that apply more widely.

---

## 5. Outcome Architecture Options

### Option A: Forecast Accuracy Metrics as Primary
**Metrics:** MAE, RMSE, MAPE for demand forecasting per location and category; precision, recall, F1 for maintenance prediction; accuracy stratified by forecast horizon (1-week vs. 1-month).

**Consequences for synthesis:**
- *Standardization:* High. All studies using common accuracy metrics enables direct meta-analysis.
- *Study volume:* High. Forecast accuracy is routinely reported in academic and proprietary case studies.
- *Interpretability:* Medium. MAE/RMSE are statistically precise but divorced from business impact (a 10% MAPE reduction may or may not reduce actual stockouts).
- *Scope of synthesis:* Could produce meta-analysis of effect sizes for each model type vs. baseline.

---

### Option B: Operational Reduction Metrics as Primary
**Metrics:** Stockout reduction (days or % of requests unfulfilled); reduction in unplanned maintenance costs ($ or %); fleet utilization rate (%).

**Consequences for synthesis:**
- *Standardization:* Low to medium. "Stockout" is defined differently across companies (some count unavailable days; others count unmet requests). "Cost" aggregates different expense categories. Requires post-hoc harmonization or stratified synthesis.
- *Study volume:* Medium to low. Operational metrics are not routinely published in academic studies. Proprietary case studies may report these, but inconsistently.
- *Interpretability:* High. Directly answers the decision-maker's question: does the model reduce actual operational problems?
- *Scope of synthesis:* Likely forces narrative synthesis with subgroup analysis by company size/type.

---

### Option C: System-Level Impact as Primary
**Metrics:** Revenue impact per vehicle; customer satisfaction with vehicle availability; customer retention rate; profit or cost per vehicle-day.

**Consequences for synthesis:**
- *Standardization:* Very low. System-level outcomes are heterogeneous and context-specific (a 5% revenue increase for an airport location is not comparable to a 10% reduction in costs for a secondary location).
- *Study volume:* Very low. These outcomes are rarely published, even in proprietary studies. Most papers focus on operational or forecast metrics, not business impact.
- *Interpretability:* Highest. Directly translates to business decision-making (did the model improve the bottom line?).
- *Scope of synthesis:* Forced narrative synthesis with case-study approach. Meta-analysis infeasible.

---

### Stakes of This Choice

**Option A** enables formal meta-analysis but leaves an evidence gap between statistical improvement and operational benefit. **Option B** closes that gap but at the cost of standardization challenges. **Option C** directly answers the business question but yields sparse evidence. The choice of primary outcome determines both the scope of evidence eligible for review and the confidence with which findings can be aggregated.

---

## 6. Methodological Tension Points

### Tension 1: Synthesis Type (Meta-analysis vs. Narrative)
**The Fork:** Will there be sufficient direct, comparable evidence to pool results statistically, or will the review be limited to narrative synthesis of heterogeneous case studies?

**What hinges on this:**
- If meta-analysis is feasible: effect size estimation, confidence intervals, heterogeneity testing.
- If narrative synthesis only: descriptive synthesis, thematic analysis of success factors/barriers, but no pooled effect estimates.

**Decision factors:**
- How many studies report the same outcome metrics?
- Do studies use identical or comparable operational contexts (fleet size, geography, customer base)?
- Do proprietary case studies exist in sufficient number and with sufficient methodological detail?

(Based on pre-training knowledge: [TRAINING-DATA CLAIM: Published empirical comparisons of ML forecasting methods in proprietary fleet/inventory datasets are not common; most academic fleet optimization work uses synthetic or public datasets, which are excluded by this review's criteria]—REQUIRES VERIFICATION through database scoping.)

---

### Tension 2: Model Comparison Structure
**The Fork:** Are the models (ARIMA, Prophet, SARIMA, LSTM, XGBoost, Random Forest) studied as independent interventions, or as competing methods within direct head-to-head comparisons?

**What hinges on this:**
- Independent: Review includes studies of each model type separately; synthesis compares each to baselines; cannot directly compare LSTM to ARIMA unless studies are stratified.
- Head-to-head: Review only includes studies that pit multiple models against each other on identical data; can directly estimate relative performance but reduces eligible studies.

**Decision factors:**
- Do studies report results for one model, or multiple models on the same dataset?
- If mostly single-model studies, is a narrative comparison sufficient, or does the research question require direct comparison?

---

### Tension 3: Offline Evaluation vs. Deployed Implementation
**The Fork:** Does the review include only models evaluated in simulation/post-hoc analysis (test set accuracy), or does it include real deployments where models made actual operational decisions?

**What hinges on this:**
- Offline: Tests "could this model work?" Focuses on forecast accuracy. Many studies report this. But disconnected from actual operational impact and organizational context.
- Deployed: Tests "did this model help in practice?" Captures organizational constraints, staff behavior, and external factors. Fewer studies report this rigorously. More relevant to decision-makers but harder to attribute causality.

**Decision factors:**
- What is the research question trying to answer—technical feasibility or operational impact?
- Are deployed implementations more likely to report operational metrics, or are they less likely to be published?

---

### Tension 4: Integration of Three Modular Systems
**The Fork:** Are the three modular approaches (demand forecast, maintenance prediction, distribution optimization) reviewed as three separate research questions, or as components of an integrated system?

**What hinges on this:**
- Three separate reviews: Each module is optimized independently; conclusions about demand forecasting accuracy are separate from conclusions about maintenance prediction. Easier to synthesize each component but misses interaction effects.
- Integrated review: Studies must show how the three modules interact (e.g., how demand predictions feed into distribution decisions feed into maintenance impact). Harder to find; reflects the research input's specification that modules are "evaluated independently and as an integrated system," but integration is explicitly listed as an alternative approach.

**Decision factors:**
- Do most eligible studies report on all three modules, or do many focus on one (e.g., demand forecasting only)?
- Is the research question asking whether ML improves demand forecasting, or whether ML-optimized operations improve overall performance?

---

### Tension 5: Generalizability Across Operational Contexts
**The Fork:** Does the review assume that models/improvements documented in one operational context (e.g., large urban fleet) transfer to others (small regional fleet), or does it require evidence of context-specific effects?

**What hinges on this:**
- Transferability assumption: Conclusions generalize; a model effective at Company A should work at Company B. Enables pooling evidence. But may gloss over real context-specific interactions.
- Context-specificity: Models must be adapted or validated for each operational context. Requires stratified analysis by fleet size, geography, vehicle mix, seasonality, etc. Reduces pooled effect size estimates but provides more actionable guidance.

**Decision factors:**
- Do demand patterns, seasonality, and vehicle mix vary substantially across locations within the same company or across companies?
- What does methodological evidence suggest about model transportability in demand forecasting? (based on pre-training knowledge: [TRAINING-DATA CLAIM: Studies in demand forecasting suggest that models trained in one geographic or seasonal context sometimes perform poorly when deployed in different contexts, indicating context-specific effects]—REQUIRES VERIFICATION)

---

## 7. Evidence Landscape Flags

### Flag 1: Proprietary Data Access Barrier
**Source:** Stated in PICO (explicit requirement: "empirical study using private internal dataset"; exclusion: "models trained exclusively on publicly available or synthetic datasets").

**Specific concern:** The research input mandates proprietary data and excludes public datasets. Rent-a-car companies rarely publish detailed operational data for academic scrutiny. Studies meeting this criterion will be either (1) proprietary industry case studies not peer-reviewed, (2) confidential consulting reports, or (3) rare academic publications with company partnerships. This severely limits the eligible evidence base.

**Implication:** Review will likely include a mixture of peer-reviewed publications (sparse) and non-peer-reviewed industry case studies or reports (limited methodological transparency). Synthesis will require standards for assessing quality/bias in proprietary studies, which may be contested.

**Provenance:** Based on stated PICO characteristics.

---

### Flag 2: Heterogeneous Baseline Definition
**Source:** PICO lists "baseline heuristics or rule-based fleet management" and "static allocation strategies" without operationalizing these terms.

**Specific concern:** Different companies implement baselines differently. One company's "rule-based fleet management" might be simple proportional allocation to historical demand; another might use complex expert rules adjusted seasonally by staff. Without explicit baseline definition in the review protocol, this heterogeneity will create post-hoc operationalization decisions that affect comparability.

**Implication:** Synthesis will require either (1) restrictive inclusion criteria specifying which baselines count (e.g., "only algorithmic baselines, no expert rules"), or (2) narrative synthesis acknowledging that different studies compare to different baselines.

**Provenance:** Based on stated PICO characteristics; stakeholder interpretation required.

---

### Flag 3: Multi-Location Generalization Assumption
**Source:** PICO excludes "single-location studies not generalizable to multi-branch operations."

**Specific concern:** This exclusion assumes that findings at one location do generalize to others, but does not test this assumption. The review does not include studies explicitly comparing within-location vs. across-location model performance. [TRAINING-DATA CLAIM: Demand forecasting and inventory research suggests that geographic, seasonal, and customer-base differences can substantially alter demand patterns and model performance; a model trained on high-volume urban location may not perform equally well at secondary locations]—REQUIRES VERIFICATION whether the research question will test or assume this.

**Implication:** If the assumption is wrong (models don't generalize across locations), the review's conclusions about multi-location deployment will be overstated. Recommend protocol include subgroup analysis by location heterogeneity or require studies to explicitly test cross-location generalization.

**Provenance:** Extrapolated from training data—requires verification.

---

### Flag 4: Measurement Heterogeneity of Primary Outcomes
**Source:** PICO lists three categories of PRIMARY outcomes (forecast accuracy, stockout reduction, maintenance accuracy) with no hierarchy or trade-off guidance.

**Specific concern:** A study might achieve 20% improvement in forecast accuracy but only 5% reduction in stockouts (if demand forecasting is not the binding constraint on stockout reduction). Different studies will report different outcome profiles. Without explicit guidance on which outcome takes precedence or how to trade off conflicting improvements, synthesis will require post-hoc judgment about which outcomes matter most.

**Implication:** Meta-analysis of a single effect size is infeasible; must either (1) require all three outcomes reported in every study (sharply reduces eligible studies), or (2) conduct separate meta-analyses for each outcome, which fragments the evidence base and makes integrated conclusions difficult.

**Provenance:** Based on stated PICO characteristics.

---

### Flag 5: Limited Published Head-to-Head Model Comparisons
**Source:** Implicit in PICO listing multiple models (ARIMA, Prophet, SARIMA, LSTM, XGBoost, Random Forest) without specifying how they should be compared.

**Specific concern:** [TRAINING-DATA ESTIMATE: Published peer-reviewed studies directly comparing multiple forecasting methods (e.g., ARIMA vs. LSTM vs. Prophet) on the same proprietary rent-a-car fleet dataset are sparse. Fewer than 15 peer-reviewed direct comparisons likely exist in the accessible literature. Most academic demand forecasting work compares models on public or synthetic datasets (excluded by this review), or on single datasets reported in a single paper]—REQUIRES VERIFICATION through database scoping.

**Implication:** If Fork 4 (model comparison in direct context) is chosen as the research question, the eligible evidence base may be too small for meta-analysis. Review would be limited to narrative synthesis or single-study case reports.

**Provenance:** Training-data estimate—requires verification.

---

## 8. Epistemic Provenance

This section documents the source and confidence level of all claims in Sections 6–7 above.

### For Methodological Tension Points (Section 6)

**Tension 1 (Synthesis Type):**
- Claim that published comparisons of ML methods on proprietary fleet datasets are uncommon: [TRAINING-DATA CLAIM: Based on general knowledge of demand forecasting and fleet optimization literature; requires verification through systematic database search.]

**Tension 2 (Model Comparison Structure):**
- No flagged training-data claim; framing is purely structural (derivable from PICO characteristics).

**Tension 3 (Offline vs. Deployed):**
- No flagged training-data claim; framing is purely logical.

**Tension 4 (Integration):**
- No flagged training-data claim; framing is structural to the PICO.

**Tension 5 (Generalizability Across Contexts):**
- Claim that demand models show context-specific effects: [TRAINING-DATA CLAIM: Based on general knowledge of demand forecasting research; the existence of context-specific effects is established in the broader forecasting literature but requires verification that it applies to rent-a-car fleet data specifically.]

---

### For Evidence Landscape Flags (Section 7)

**Flag 1 (Proprietary Data Access Barrier):**
- Provenance: **This flag is based on stated PICO characteristics** (explicit requirement for proprietary data; exclusion of public/synthetic datasets). The claim that companies rarely publish operational data is [TRAINING-DATA CLAIM: based on general knowledge of industry publication practices]—not directly derivable from PICO.

**Flag 2 (Heterogeneous Baseline Definition):**
- Provenance: **This flag is based on stated PICO characteristics** (baselines listed without explicit operationalization). The claim that baselines vary across companies is [TRAINING-DATA CLAIM: based on general knowledge of fleet management practice]—requires verification that this heterogeneity will actually affect the review.

**Flag 3 (Multi-Location Generalization Assumption):**
- Provenance: **This flag is extrapolated from training data—REQUIRES VERIFICATION.** The research input excludes single-location studies but does not specify whether the review will test cross-location generalization or assume it. The claim about context-specific effects in demand forecasting is [TRAINING-DATA CLAIM: based on general knowledge of demand forecasting and inventory management research]—NOT directly from the PICO. Human judgment required before protocol approval.

**Flag 4 (Measurement Heterogeneity of Primary Outcomes):**
- Provenance: **This flag is based on stated PICO characteristics** (three categories of primary outcomes listed without hierarchy). The implication that synthesis will require trade-off decisions is structural logic.

**Flag 5 (Limited Published Comparisons):**
- Provenance: **This flag is extrapolated from training data—REQUIRES VERIFICATION.** The estimate of "fewer than 15 peer-reviewed direct comparisons" is [TRAINING-DATA ESTIMATE: based on pre-training knowledge of demand forecasting and fleet optimization literature]. This estimate is approximate and subject to substantial uncertainty. **Database scoping (PubMed, Google Scholar, specialized OR/ML venues) required before finalizing the protocol.** Estimate accounts for: (a) proprietary data exclusion (removes most industry case studies), (b) specificity of rent-a-car context (removes general fleet optimization studies), (c) requirement for direct comparison (removes single-model studies).

---

### Summary of Human Verification Required

Before finalizing the protocol, the methodologist must:

1. **Database scoping for Flag 5:** Verify the estimate of eligible direct model-comparison studies through systematic search of academic databases (Web of Science, Scopus) and preprint servers (arXiv). Determine whether meta-analysis or narrative synthesis is feasible for model comparison.

2. **Baseline definition operationalization (Flag 2):** Clarify whether "baseline heuristics" will be restricted to algorithmic methods, or will include expert-developed rules. Decision affects which studies are eligible.

3. **Multi-location generalization assumption (Flag 3):** Clarify whether the review will assume models generalize across locations within a company, or will require studies to explicitly test and report cross-location performance. Decision affects population eligibility.

4. **Primary outcome hierarchy (Flag 4):** If multiple primary outcomes are retained, specify a priori which outcome (or combination) takes precedence if studies show conflicting results (e.g., improved forecast accuracy but unchanged stockout reduction).

5. **Context-specific effects (Tension 5):** Decide a priori whether the review will assume models trained in one operational context transfer to others, or will require stratified analysis by context characteristics (fleet size, geography, seasonality, etc.).

---

**End of Phase 0**
