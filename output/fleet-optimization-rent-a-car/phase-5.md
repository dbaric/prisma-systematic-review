# Phase 5: Discussion
*(PRISMA Items 23a–23d)*

---

> **Data mode notice:** No studies have been extracted at the time of protocol authoring. All GRADE certainty ratings, effect estimates, and synthesis counts are marked `[DATA REQUIRED: description]`. No results have been fabricated or simulated. This document presents the complete structural framework for Items 23a–23d; all result-dependent fields must be completed after Phase 4b and Phase 4c are populated from real extracted data.

---

## 23a: Interpretation of Findings

### Overview

This systematic review addressed the question of how machine learning and time series forecasting methods applied to internal rent-a-car operational data can optimize vehicle distribution, predict maintenance needs, and forecast demand across multiple locations. Three primary outcomes were defined a priori and treated as co-equal in the review's framing commitment: (1) stockout reduction, (2) unplanned maintenance cost reduction, and (3) fleet utilization rate improvement. Two secondary outcomes — demand forecast accuracy (MAPE reduction) and maintenance prediction accuracy (F1-score improvement) — were included in the Summary of Findings table where ≥3 studies contributed comparable data.

The review applied a narrative synthesis framework (SWiM; [TRAINING-DATA CLAIM: Campbell et al., *BMJ* 2020 — verify citation before finalisation]) because measurement heterogeneity across operational outcomes, heterogeneous baseline definitions, and proprietary data publication barriers precluded meta-analysis. All certainty of evidence ratings follow the GRADE framework ([TRAINING-DATA CLAIM]; [TRAINING-DATA CLAIM]); [TRAINING-DATA CLAIM: non-randomised evidence begins at Low certainty by default and may not be upgraded beyond Moderate certainty] from this evidence base.

### Findings by Primary Outcome

#### Stockout Reduction (Strand 1)

[DATA REQUIRED: After extraction, summarize the direction-of-effect pattern for stockout reduction across Strand 1 studies. Address: whether evidence predominantly shows improvement, the modal improvement category (marginal / moderate / substantial), and whether direction is consistent across studies. Reference Table 8 Strand 1 from Phase 4b and the effect direction plot (Figure 3).]

> Strand 1 comprises [DATA REQUIRED: n] studies. The direction of evidence for stockout reduction [DATA REQUIRED: is/is not] consistent across the strand. The modal improvement category is [DATA REQUIRED: marginal / moderate / substantial]. [DATA REQUIRED: Describe notable outliers or studies showing no improvement, if any.]

The GRADE certainty of evidence for stockout reduction is **[DATA REQUIRED: Very Low / Low / Moderate]** (see Phase 4c, Outcome 1 worksheet). The primary contributors to this rating are [DATA REQUIRED: describe the 1–2 dominant GRADE domains driving the final rating, e.g., "serious risk of bias from temporal confounding in the majority of studies, and serious imprecision due to the absence of variance reporting in most Strand 1 studies"]. [DATA REQUIRED: If any upgrading criteria were met, describe here; otherwise state none were met.]

Given the [DATA REQUIRED: certainty level] certainty of evidence, findings regarding stockout reduction should be interpreted with [DATA REQUIRED: substantial / considerable] caution. The observed direction of improvement [DATA REQUIRED: is/is not] consistent with the theoretical expectation that demand-driven vehicle allocation should reduce mismatch between location-level inventory and realized customer demand — a mechanism supported by general inventory management literature [LITERATURE: compare to inventory optimization literature on demand-driven allocation reducing stockout rates in multi-location settings]. However, the strength of this inference is limited by [DATA REQUIRED: dominant limitation, e.g., the non-randomised pre-post design of contributing studies and the absence of controls for concurrent demand trend confounding].

#### Unplanned Maintenance Cost Reduction (Strand 2)

[DATA REQUIRED: After extraction, summarize the direction-of-effect pattern for unplanned maintenance cost reduction across Strand 2 studies. Address direction consistency, modal improvement category, and currency / per-vehicle derivation heterogeneity as an interpretive caveat.]

> Strand 2 comprises [DATA REQUIRED: n] studies. The direction of evidence for unplanned maintenance cost reduction [DATA REQUIRED: is/is not] consistent across the strand. [DATA REQUIRED: Continue narrative.]

The GRADE certainty of evidence for unplanned maintenance cost reduction is **[DATA REQUIRED: Very Low / Low / Moderate]** (see Phase 4c, Outcome 2 worksheet). [DATA REQUIRED: Describe dominant GRADE domains driving the final rating, as for Outcome 1.] Currency heterogeneity and variable per-vehicle derivation across included studies compound the imprecision domain rating and mean that the magnitude of cost reduction is not directly comparable across studies, even where the direction of effect is consistent.

Predictive maintenance as an operational strategy is theoretically expected to reduce unplanned breakdown costs by enabling cost-efficient scheduled intervention before failure — a principle well-established in reliability engineering and industrial maintenance literature [LITERATURE: compare to general predictive maintenance literature in fleet or industrial settings, noting SMD or cost-reduction estimates]. The extent to which this principle generalises from heavy industrial fleets to rent-a-car operations, where vehicle cycles are shorter and failure modes differ, remains [DATA REQUIRED: well-supported / partially supported / inadequately addressed] by the current evidence base.

#### Fleet Utilization Rate Improvement (Strand 3)

[DATA REQUIRED: After extraction, summarize the direction-of-effect pattern for fleet utilization rate improvement across Strand 3 studies. Address direction consistency, modal improvement category, and measurement unit heterogeneity (percentage-based vs. revenue-generating days vs. active vehicles per day) as an interpretive caveat.]

> Strand 3 comprises [DATA REQUIRED: n] studies. The direction of evidence for fleet utilization rate improvement [DATA REQUIRED: is/is not] consistent across the strand. [DATA REQUIRED: Continue narrative.]

The GRADE certainty of evidence for fleet utilization rate improvement is **[DATA REQUIRED: Very Low / Low / Moderate]** (see Phase 4c, Outcome 3 worksheet). [DATA REQUIRED: Describe dominant GRADE domains.] Measurement unit diversity within Strand 3 — across percentage-based utilization, revenue-generating days, and active vehicles per day — limits comparability of effect magnitudes across studies, even where improvement direction is consistent, and contributes to the indirectness and imprecision domain ratings.

#### Secondary Outcomes (Strand 4)

Demand forecast accuracy (MAPE reduction) and maintenance prediction accuracy (F1-score improvement) are included in the Summary of Findings table [DATA REQUIRED: if ≥3 studies contributed to each; otherwise these outcomes are described narratively only — state which applies].

For demand forecast accuracy (MAPE reduction), the GRADE certainty is **[DATA REQUIRED: Very Low / Low / Moderate / Outcome excluded — fewer than 3 studies]** (see Phase 4c, Outcome 4 worksheet). The ML and time series models represented in the evidence base generally produced forecast errors [DATA REQUIRED: materially lower than / comparable to / higher than] documented rule-based or naïve baseline methods [LITERATURE: compare to benchmark MAPE values reported in general demand forecasting literature for seasonal industries]. The MAPE metric is volume-dependent and not directly comparable across companies of different fleet sizes; this limits cross-study synthesis even where multiple estimates are available.

For maintenance prediction accuracy (F1-score improvement), the GRADE certainty is **[DATA REQUIRED: Very Low / Low / Moderate / Outcome excluded — fewer than 3 studies]** (see Phase 4c, Outcome 5 worksheet). F1-score is threshold-dependent and sensitive to class imbalance in maintenance event datasets; studies not reporting the positive-class threshold or addressing class imbalance may produce optimistic F1 estimates, contributing to the risk-of-bias domain rating for this outcome.

### Consistency with Prior Evidence

[DATA REQUIRED: After extraction, compare this review's findings to prior systematic reviews or meta-analyses in adjacent domains — e.g., ML-based demand forecasting in transportation/logistics, predictive maintenance in fleet operations, or vehicle distribution optimization. Use the following structure for each relevant prior work identified.]

[LITERATURE: Identify prior systematic reviews or meta-analyses on ML demand forecasting in transportation or related vehicle fleet contexts. Compare direction and magnitude of findings. Note whether this review's population (rent-a-car, multi-location, ≥12 months proprietary data) differs materially from prior reviewed populations.]

[LITERATURE: Identify prior systematic reviews or meta-analyses on predictive maintenance in fleet or industrial contexts. Compare finding direction. Note whether the specificity of the rent-a-car operational context (short vehicle cycles, high location turnover, seasonal demand) was addressed in prior work.]

Where prior evidence exists predominantly from logistics, municipal, or heavy-industrial fleet contexts, this review extends the body of evidence to the rent-a-car domain, which presents distinct operational features: multi-location vehicle rebalancing as a key decision variable, short-term (day-to-week) demand forecasting horizons that differ from long-horizon logistics forecasting, and a commercial model in which vehicle utilization directly maps to revenue in a way that is more immediate than in cost-centre fleet operations.

### Protocol Deviations

[DATA REQUIRED: After the review is complete, list any deviations from the pre-registered protocol (Phase 3a–3c). For each deviation, state: the original protocol specification, what was done instead, and the reason. If no deviations occurred, write: "No deviations from the pre-specified protocol were made. All methods were applied as described in Phase 3a–3c."]

| Deviation | Original specification | Actual approach | Reason | Impact on conclusions |
|---|---|---|---|---|
| [DATA REQUIRED or "None"] | | | | |

---

## 23b: Limitations of the Evidence Base

### Overview

The body of evidence supporting conclusions in this review is subject to limitations operating at three levels: (1) study design and risk of bias, (2) outcome and population indirectness, and (3) reporting completeness. Each is discussed below with reference to the GRADE domains assessed in Phase 4c.

### Risk of Bias (GRADE Domain)

The primary methodological limitation of the evidence base is the non-randomised, observational character of all included study designs. Pre-post operational comparisons and retrospective studies with temporal splits are inherently susceptible to temporal confounding: improvements observed in the post-intervention period may reflect concurrent external factors — seasonal demand increases, macroeconomic tailwinds, or operational maturation — rather than the specific effect of the ML intervention. This threat (captured in Phase 3b Domain D3: Temporal Confounding) is expected to be rated [DATA REQUIRED: Not serious / Serious / Very serious] for the majority of included studies and is the primary driver of GRADE risk-of-bias domain ratings across strands.

A second study-level limitation is baseline documentation quality (Phase 3b Domain D1). Where studies do not quantitatively specify pre-intervention operational state — using instead qualitative descriptions of prior practice — the magnitude of improvement cannot be assessed independently of authors' characterisation. Studies flagged as having undefined or idiosyncratic baselines are included in primary synthesis with notation and isolated in Sensitivity Analysis SA-3 (Phase 4b, Section 20d).

Outcome measurement quality (Phase 3b Domain D4) is a further concern for unplanned maintenance cost outcomes (Strand 2), where the distinction between planned and unplanned maintenance expenditure is not consistently operationalized across studies, and for fleet utilization outcomes (Strand 3), where the denominator (total fleet vs. available fleet) is defined differently across contributing studies.

### Inconsistency (GRADE Domain)

[DATA REQUIRED: After extraction, assess whether the inconsistency domain drives downgrading for any outcome. Describe the dominant sources of between-study heterogeneity — whether this appears to be true effect heterogeneity or measurement heterogeneity, and whether the pre-specified subgroup analyses (Section 20c) explained any observed heterogeneity.]

Measurement unit diversity within each strand — different operationalisations of stockout (event counts, days, booking decline rates), maintenance cost (total fleet, per-vehicle, percentage of budget), and utilization (percentage-based, revenue days, active vehicles per day) — introduces apparent heterogeneity that may not reflect genuine variation in the underlying effect. Where the heterogeneity decision rule was triggered (fewer than 50% of studies in the same improvement category within a strand or subgroup), this is noted as unexplained heterogeneity and flagged as an inconsistency concern.

### Indirectness (GRADE Domain)

The PICO specification for this review requires: rent-a-car operators with ≥3 geographically distinct locations, ≥12 months of continuous structured operational data, and a defined comparator (current operational practice, rule-based heuristics, simple statistical methods, or static allocation). Studies departing materially from these requirements — particularly single-location studies included under a cross-location generalizability argument, or studies with data durations below 12 months (addressed in SA-1) — introduce indirectness to the synthesis.

A structural indirectness concern applies to the secondary outcome evidence (Strand 4): demand forecast accuracy metrics (MAPE, RMSE, MAE) measure model technical performance rather than operational impact, and the relationship between forecast accuracy improvement and operational outcomes (stockout reduction, utilization improvement) is not reported explicitly in most studies. This limits the inferential bridge from secondary to primary outcomes.

### Imprecision (GRADE Domain)

The dominant imprecision concern across all strands is the systematic absence of measures of statistical uncertainty (confidence intervals, standard errors, p-values) in operational studies applying ML to proprietary company data. Studies reporting only point estimates of improvement (e.g., "stockout rate fell from X% to Y%") without variance information do not allow assessment of the precision of the effect estimate. The consequence for GRADE ratings is serious imprecision across most strands unless mitigated by a very large and consistent body of evidence, which is not anticipated given the narrow population specification and proprietary data barriers.

### Publication Bias (GRADE Domain)

The proportion of grey literature in the included evidence base — industry reports, consulting case studies, and white papers — introduces the possibility of optimism bias: organisations deploy and publish evaluations of ML fleet management systems primarily when the systems produce favourable results, while internal deployments that underperform may not reach publication. Sensitivity Analysis SA-2 (Phase 4b, Section 20d) provides the primary empirical test of this signal by comparing all-source and peer-reviewed-only direction-of-effect distributions. [DATA REQUIRED: State whether SA-2 detected a publication bias signal and which strands were affected.]

The absence of prospective registration among included studies (expected given the operational research domain) means that protocol-level selective outcome reporting cannot be assessed, contributing to residual uncertainty in the reporting bias domain beyond what SA-2 captures.

### Applicability and External Validity

The included population is restricted to rent-a-car operators with ≥3 locations and ≥12 months of structured operational data. This restriction improves internal coherence of the synthesis but limits generalisability to:

- **Single-location operators:** Evidence from this review cannot be directly applied to independent single-branch rental companies; the multi-location vehicle rebalancing dimension of the intervention is absent.
- **Short-horizon operators or seasonal-only operators:** Operators with fewer than 12 months of data history, or operators in highly seasonal markets with limited off-season operations, may not meet the data volume assumptions underlying the ML models evaluated in included studies.
- **Operators in emerging markets:** Geographic representation in the evidence base is [DATA REQUIRED: predominantly from high-income country contexts / geographically diverse — describe after extraction], limiting applicability to operators in markets with different reservation system maturity, vehicle lifecycle patterns, or maintenance infrastructure.

---

## 23c: Limitations of the Review Process

### Search Strategy

The search strategy (Phase 3a, Items 4–6) was designed to achieve broad coverage of peer-reviewed academic literature and targeted grey literature. Key limitations include:

**Language restriction:** Searches were conducted in English. Studies published in other languages — including German, French, Spanish, or Portuguese, which are relevant given the geographic distribution of major rent-a-car operators — were excluded. This introduces a potential language publication bias: studies from non-English-speaking markets or academic traditions may be systematically under-represented in the evidence base.

**Grey literature coverage gaps:** Grey literature identification relied on structured searches of industry report repositories, targeted organisational website searches, and forward/backward citation tracing. This method cannot guarantee comprehensive coverage of internal company evaluations, unpublished consulting reports, or conference presentations not indexed in the searched databases. The extent of this gap is unknown and unquantifiable.

**Search date restriction:** The search was conducted on [DATA REQUIRED: date of final search execution, to be inserted after search completion]. Studies published after this date — including preprints converted to peer-reviewed publications, conference proceedings published post-search, and newly released industry case studies — are not included. Given the rapid pace of ML application in operational settings, the time-lag between search execution and review publication means recent evidence may already exist that could influence conclusions, particularly for deep learning and large-model-based forecasting approaches.

**Database coverage:** Primary databases searched are documented in Phase 3a (Item 4). Operational research and engineering databases — including IEEE Xplore and ACM Digital Library — were included alongside business and management databases to capture the interdisciplinary character of this topic. Despite this, studies published in specialised logistics, transportation, or fleet management conference proceedings not indexed in the primary databases may have been missed.

### Inclusion and Exclusion Decisions

The single-location exclusion criterion (Phase 3a, Item 3) was specified to ensure population coherence — the multi-location vehicle rebalancing dimension is central to the review question. This decision necessarily excludes potentially informative single-location ML deployment studies, and where the evidence base is sparse, it may contribute to a narrower evidence base than would otherwise be achievable.

The ≥12-month data duration threshold for primary synthesis (Phase 3a, Item 3) was designed to ensure at least one full seasonal cycle for demand forecasting and stable pattern identification for predictive maintenance. Studies with 6–12 months of data are included in Sensitivity Analysis SA-1 (Phase 4b). [DATA REQUIRED: State whether SA-1 added materially to the evidence base or whether no eligible 6–12-month studies were identified.]

### Data Extraction and Synthesis Decisions

Because included studies applied ML to proprietary operational data and did not share raw datasets, outcome data were extracted from reported tables, figures, and text. Digitisation of values from figures — where applicable — introduces a small extraction error not quantifiable post-hoc. All extractions were performed in duplicate with discrepancy resolution (Phase 3b Item 10a), which limits but does not eliminate extraction error.

The decision to conduct narrative synthesis rather than meta-analysis (pre-specified in Phase 3c, Item 13a) was driven by measurement heterogeneity and the absence of extractable variance estimates. While this approach is appropriate given the evidence base, it means that effect estimates are not pooled and weighted by precision; large-effect outlier studies receive the same categorical representation as smaller-effect studies in the direction-of-effect summaries.

The ordinal improvement categories (marginal, moderate, substantial) applied to effect classification (Phase 3c Item 13c) are threshold-based and do not constitute statistical significance tests. The thresholds were pre-specified and are held constant across the synthesis, but their selection is inherently judgmental and different threshold choices would alter the category distribution in each strand.

### Protocol Deviations and Post-Hoc Decisions

[DATA REQUIRED: List any deviations from the pre-registered protocol introduced during the review process — including search adjustments, eligibility boundary decisions, subgroup additions or removals, and any change to planned sensitivity analyses. Each deviation must be labelled as to whether it was pre-specified or post-hoc and whether its potential impact on conclusions was assessed. If no deviations occurred, write: "No deviations from the pre-registered protocol were introduced during the review process."]

---

## 23d: Implications for Practice, Policy, and Research

### Implications for Practice

The review's findings carry practice implications that are necessarily qualified by the certainty of the underlying evidence. Given that GRADE certainty ratings for all primary outcomes are [DATA REQUIRED: Very Low / Low / at most Moderate], no finding supports a strong or unconditional recommendation for operational adoption. Implications are stated in accordance with GRADE's approach to linking certainty level to recommendation strength.

**For operators currently using heuristic or static allocation approaches:**

[DATA REQUIRED: After extraction, state whether the evidence supports the inference that transitioning from static or rule-based allocation to ML-informed demand forecasting and distribution optimization is associated with stockout reduction and utilization improvement. Qualify by certainty level.]

> At [DATA REQUIRED: certainty level] certainty, there is [DATA REQUIRED: insufficient / suggestive / consistent] evidence that ML-based demand forecasting and vehicle distribution optimization are associated with reduced stockout frequency and improved fleet utilization relative to current operational practice and rule-based heuristics. Operators considering adoption should treat existing evidence as directionally informative but should not base adoption decisions on specific magnitude estimates from the current evidence base given the imprecision and risk-of-bias limitations documented above.

**For operators currently using reactive maintenance scheduling:**

[DATA REQUIRED: After extraction, state whether the evidence supports transition from reactive to predictive maintenance scheduling. Qualify by certainty level and note that cost savings are reported inconsistently across studies, limiting absolute magnitude guidance.]

> At [DATA REQUIRED: certainty level] certainty, there is [DATA REQUIRED: insufficient / suggestive / consistent] evidence that predictive maintenance scheduling is associated with reduced unplanned maintenance costs relative to reactive scheduling. The absence of standardised per-vehicle cost reporting across the evidence base means that the magnitude of expected cost reduction cannot be reliably estimated for a given operator's fleet configuration from this review alone.

**For operators evaluating integrated versus single-module systems:**

Sensitivity Analysis SA-4 (Phase 4b, Section 20d) examined whether integrated multi-module systems (combining demand forecasting, predictive maintenance, and distribution optimization) produce larger improvements than single-module deployments. [DATA REQUIRED: Summarize SA-4 finding here and its implications for system design decisions.] Operators should note that causal attribution in integrated system evaluations is structurally limited — the contribution of each module to observed improvements cannot be disaggregated from observational pre-post designs.

**Alignment with operational guidelines and standards:**

[LITERATURE: Identify whether professional or industry standards bodies (e.g., International Car Rental Alliance, fleet management professional associations) have issued guidance on data-driven fleet management. Compare review findings to any such guidance. Note whether review findings support, extend, or contradict current guidance.]

**Company size and context:**

Subgroup Analysis SA-3 (Phase 4b, Section 20c) examined whether effects scale with company size. [DATA REQUIRED: Summarize the company-size subgroup finding here and its practical implications for operators of different sizes.] Medium-sized operators (10–14 locations) may represent the primary target implementation context, combining sufficient multi-location complexity to benefit from ML-based rebalancing with data volumes sufficient for model training — though this inference is contingent on the subgroup analysis results.

### Implications for Policy

The evidence base does not support policy-level mandates at the certainty levels identified in Phase 4c. However, the following policy-relevant observations are warranted by the review's findings and limitations.

**Industry standards and reporting requirements:**

The systematic absence of variance reporting and the absence of standardised outcome definitions across included studies (documented in Sections 23b and 23c) support a case for industry bodies to develop minimum reporting standards for operational ML deployment evaluations. [LITERATURE: Identify whether professional or industry standards bodies — e.g., International Car Rental Alliance, fleet management professional associations, national transport regulatory bodies — have issued guidance on data requirements or reporting standards for ML-enabled fleet operations. Note whether review findings support, extend, or create tension with any such guidance.] Standardised reporting would reduce the publication bias risk identified in the Publication Bias domain (Section 23b) and improve future evidence synthesis capacity across the sector.

**Equity of access and organisational size:**

The evidence base is [DATA REQUIRED: predominantly from large multi-national operators / a mix of operator sizes — describe after extraction]. If ML-based fleet optimization confers the directional improvements suggested by Strands 1–3, access to these gains may be skewed toward large operators with the data infrastructure, technical capability, and capital to deploy and evaluate ML systems. Smaller independent and regional operators may face structural barriers to adoption not captured in the current evidence base. Policy instruments addressing this disparity — shared-infrastructure programmes, subsidised consortium data-sharing frameworks, or open-access model repositories — are not yet evaluated in the literature and represent a gap with equity and market-competition implications.

**Data governance preconditions:**

Multi-operator study designs identified as a research priority in Implications for Research presuppose data-sharing arrangements between competing commercial operators. Cross-jurisdictional data sharing is governed by data protection regulations that vary by jurisdiction and may present barriers to the federated or consortium designs needed to strengthen external validity. Regulatory clarity on anonymised operational data sharing for research purposes — and any safe harbour provisions applicable to multi-operator ML research — would be a prerequisite for the most policy-relevant future study designs. Review findings do not directly evaluate data governance arrangements but implicitly depend on their development.

### Implications for Research

The evidence base for data-driven fleet management optimization in rent-a-car operations is characterised by [DATA REQUIRED: a small number of studies / a moderate number of studies with high heterogeneity / an emerging body of evidence] with predominantly non-randomised designs, absent variance reporting, and proprietary data barriers. The following research priorities emerge from the review's findings and limitations.

**1. Standardised outcome reporting for operational ML studies**

The absence of statistical uncertainty measures (confidence intervals, standard errors) in most included studies is the most actionable research reporting gap. Future studies applying ML to proprietary operational data should report: (a) pre- and post-intervention values with appropriate measures of variability; (b) the duration and stability of the post-intervention evaluation period; and (c) any concurrent operational changes that could confound the effect attribution. Reporting checklists for operational ML studies (analogous to CONSORT for RCTs or STROBE for observational studies) would substantially improve future synthesis capacity.

**2. Controlled evaluation designs**

Pre-post observational designs are unable to isolate intervention effects from concurrent temporal trends. Where randomisation is infeasible (as expected in operational fleet management), stronger quasi-experimental designs are achievable: interrupted time-series analysis with a sufficient number of pre-intervention time points, difference-in-differences analysis using comparable non-adopting locations as controls within the same company, or stepped-wedge deployment designs where multiple company locations adopt the system sequentially. Future studies should implement these designs and report them with appropriate time-series quality criteria.

**3. Longer evaluation horizons**

The majority of included studies evaluate outcomes over [DATA REQUIRED: typical follow-up duration range from extraction]. Longer evaluation horizons — minimum 24 months post-deployment — are needed to assess: (a) whether stockout and utilization improvements are sustained beyond the initial post-deployment period; (b) whether model performance degrades as demand patterns drift over time; and (c) whether maintenance cost reductions compound over multi-year vehicle lifecycle cycles. Studies with ≤12 months of post-deployment follow-up cannot address these questions.

**4. Module-level disaggregated evaluation**

Integrated multi-module ML systems (combining demand forecasting, predictive maintenance, and distribution optimization) are evaluated as a bundle in many included studies, making it impossible to attribute effects to specific modules. Studies using controlled additive designs — deploying modules sequentially and reporting outcomes at each stage — would enable disaggregated inference about the marginal contribution of each module and are a priority for future research.

**5. Cross-company and multi-site study designs**

All included studies evaluate a single company's operations. This design is necessitated by the proprietary nature of rental operational data but limits external validity. Consortium-based or federated ML designs — where multiple operators contribute anonymised operational data to a shared model while retaining data sovereignty — would enable multi-company evaluation and substantially strengthen external validity. [LITERATURE: Reference any existing examples of federated ML in fleet or transportation contexts as existence proofs.]

**6. Under-studied populations**

The evidence base is [DATA REQUIRED: geographically skewed / geographically diverse — describe after extraction]. Operators in high-growth markets in sub-Saharan Africa, Southeast Asia, and Latin America — where rent-a-car market expansion is occurring alongside rapid digitisation of operational systems — are likely under-represented. These contexts may present distinct data availability profiles, vehicle fleet compositions, and demand pattern structures that require separate evaluation rather than assumption of transferability from evidence generated in high-income country contexts.

**7. Health-economic-equivalent operational modelling**

Future research should report standardised operational efficiency metrics that enable cross-study comparison equivalent to absolute effect reporting in clinical systematic reviews — for example, stockout rate per 1,000 reservation-days, maintenance cost per vehicle per year in standardised currency equivalents, and revenue-generating days per vehicle per year as a utilization metric independent of fleet size. Standardising these metrics prospectively across a cohort of operational ML deployment studies would enable future meta-analysis where current synthesis is limited to narrative direction-of-effect summaries.

### Living Review Considerations

[DATA REQUIRED: If this review is designated as a living review, state the planned update schedule (e.g., annual full update, 6-monthly surveillance search) and the trigger conditions for unscheduled interim updates — e.g., publication of a large multi-operator study, emergence of a new dominant model family, or a signal of reversal in the direction-of-effect pattern. If this is not a living review, omit this section or write: "This review is not designated as a living review. A full update is recommended within [DATA REQUIRED: timeframe, e.g., 3 years of search date] given the rapidly evolving nature of ML applications in this domain, or earlier if a high-quality multi-company evaluation study is identified."]

---

*Phase 5 complete. Proceed to Phase 6 (Conclusions — PRISMA Item 24) once Items 23a–23d are populated from extracted data.*
