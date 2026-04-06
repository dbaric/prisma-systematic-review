# Phase 3a: Search Protocol — PRISMA Items 3–6

---

## Eligibility Criteria
*(PRISMA Item 3)*

### Study Designs Included

The following study designs will be eligible for inclusion:

- **Pre-post operational comparisons:** Studies measuring primary operational outcomes (stockout reduction, unplanned maintenance cost reduction, fleet utilization improvement) before and after deployment or activation of an ML/forecasting system using the same company's operational records.
- **Retrospective case studies with temporal split:** Studies partitioning a historical proprietary dataset into a baseline period (operations without ML-informed decisions) and an intervention or evaluation period (operations or simulated decisions using ML model outputs), provided the split is documented and the baseline is quantitatively defined.
- **Prospective evaluation studies:** Studies where an ML model is applied to prospectively collected held-out operational data from a real company and outcomes are compared to a documented operational baseline from the same company.
- **Multi-arm observational studies:** Studies comparing two or more intervention configurations (e.g., demand-only ML vs. integrated demand-maintenance ML) against a shared baseline; all arms included.

The following will be **excluded**:

- Simulation-only studies that do not involve real proprietary company data at any stage (i.e., all training, validation, and evaluation data are synthetic or generated).
- Studies using exclusively publicly available datasets (e.g., Kaggle car rental datasets, OpenStreetMap data, publicly released reservation exports) without augmentation with proprietary operational records.
- Randomized controlled trials (RCTs): considered extremely unlikely in this domain due to operational infeasibility of random assignment of fleet allocation rules; if identified, assessed using appropriate RCT quality tools and included.
- Systematic reviews, scoping reviews, meta-analyses, and narrative reviews: reference lists hand-searched; not included as primary studies.
- Opinion papers, editorials, commentaries, and non-empirical white papers.
- Studies primarily reporting implementation feasibility, organizational adoption barriers, or change management outcomes without reporting quantitative operational outcome metrics.
- Conference abstracts where no full-text manuscript is identifiable and extractable outcome data cannot be obtained from authors.

### Population Characteristics

**Included:**

- Rent-a-car companies (vehicle rental operators) operating **3 or more geographically distinct locations** (branches, depots, or zones) from which vehicles are dispatched or collected.
- Any company size in terms of fleet volume, revenue, or employee count; any geographic region globally.
- Any operational maturity (incumbent operator with legacy systems, start-up with digital-first operations).
- Studies must use a minimum of **12 months of continuous structured operational data** for model training and evaluation. [TRAINING-DATA CLAIM: this threshold is required to capture at least one full seasonal cycle for demand forecasting and allows stable pattern identification for predictive maintenance]
  - Studies using **6–12 months** of data are included in a **sensitivity analysis** but excluded from primary synthesis.
  - Studies using **fewer than 6 months** of data are excluded.

**Excluded:**

- Single-location operators: studies where ML models are trained and evaluated exclusively on a single branch without stated applicability to multi-location distribution decisions.
- Studies involving non-rental vehicle fleets (e.g., logistics delivery fleets, municipal bus fleets, ride-hailing dispatch) unless the study explicitly models multi-location vehicle allocation decisions equivalent to rent-a-car operations and the population boundary is met.
- Studies in which the population is entirely synthetic (no real company data used at any stage).

### Intervention

Studies must apply at least one of the following intervention types to proprietary internal operational data:

1. **Vehicle demand forecasting:** Time series or machine learning models predicting vehicle rental demand at location or category level. Eligible methods include (but are not limited to): ARIMA, SARIMA, SARIMAX, Prophet, exponential smoothing (Holt-Winters, ETS), LSTM, GRU, Transformer-based forecasting, regression models (linear, ridge, LASSO), ensemble methods (Random Forest, XGBoost, gradient boosting), and hybrid approaches.

2. **Predictive maintenance scheduling:** Models predicting vehicle maintenance needs, failure risk, remaining useful life, or optimal service intervals enabling comparison to reactive (non-predictive) scheduling. Eligible methods include: survival analysis (Cox proportional hazards, Kaplan-Meier), Random Forest, XGBoost, logistic regression, neural networks (feedforward, LSTM for sensor sequences), or rule-based threshold models trained on failure data.

3. **Vehicle distribution optimization:** Models generating vehicle reallocation, relocation, or redistribution recommendations across locations to minimize stockout probability or maximize utilization. Eligible methods include: regression or classification models for allocation decisions, reinforcement learning agents, mathematical programming (LP, MIP) with ML-generated demand inputs, and heuristic algorithms validated against data-driven benchmarks.

Studies applying two or three of the above modules (integrated systems) are eligible; all modules and corresponding outcomes reported.

### Comparator Definition

Studies must include at least one of the following comparator types, explicitly stated or derivable from study description:

| Comparator Family | Definition |
|---|---|
| **Current operational practice** | Baseline measured from pre-intervention operational period using the same company's records; reflects actual decisions made without ML assistance. |
| **Documented rule-based heuristics** | Explicitly documented algorithmic or expert-developed rules (e.g., "send 2 compact vehicles to location X when reservations exceed Y") applied consistently and reproducibly. |
| **Simple statistical methods** | Seasonal naïve forecasting, historical mean allocation, proportional fleet distribution, or exponential smoothing without ML optimization. |
| **Static allocation strategies** | Fixed fleet assignment per location (e.g., fixed number of vehicles per category permanently assigned to each branch regardless of demand state). |

Studies using undefined or idiosyncratic baselines are included with a **methodological quality flag** (see Phase 3b risk of bias assessment) and synthesized in a separate stratum.

### Outcome Measures

**Primary outcomes** (all three treated as co-equal per Phase 1 framing commitment; reported separately in synthesis):

1. **Stockout reduction:** Days, instances, or percentage of occasions when a specific vehicle category was unavailable at a location to fulfill a customer request, measured through operational records or reservation system logs. Proxy measures (e.g., revenue lost due to unavailability, declined bookings) included in narrative synthesis where stockout-day measurement is unavailable.

2. **Unplanned maintenance cost reduction:** Reduction in costs attributable to reactive (non-predictive) maintenance, emergency repairs, or unscheduled vehicle downtime, measured in absolute monetary terms or percentage of total maintenance budget. Studies reporting cost per vehicle per year or total annual fleet maintenance expenditure eligible if baseline period is documented.

3. **Fleet utilization rate improvement:** Change in percentage of fleet generating revenue, average vehicles in active use per day, or revenue-generating days per vehicle per year. Operationalizations must distinguish available fleet from total fleet (excluding vehicles in maintenance or transfer).

**Secondary outcomes:**

- Demand forecast accuracy metrics: MAE, RMSE, MAPE, or SMAPE computed on held-out operational data; reported as aggregate or stratified by location and vehicle category.
- Maintenance prediction accuracy: Precision, recall, F1-score, AUC-ROC for binary failure/no-failure classification; MAE/RMSE for remaining-useful-life regression.
- Forecast accuracy stratified by horizon: 1-week-ahead vs. 1-month-ahead vs. other forecast windows.
- Vehicle replacement decision accuracy: Optimal sell/replace timing measured against actual vehicle failure or residual value data.

**Outcome reporting requirement:** Studies reporting only forecast accuracy metrics (MAE, RMSE, MAPE) without any of the three primary operational outcomes are **excluded from primary synthesis** but are recorded in a supplementary evidence map. This operationalizes the Fork 2 commitment from Phase 1: forecast accuracy is a secondary, not primary, outcome.

### Study Characteristics

| Characteristic | Criterion |
|---|---|
| Language | English. Non-English publications with English-language abstracts are screened at abstract stage; full-text retrieval requires English translation or English full text. |
| Publication year | No lower bound. Studies from 1990 onward retrieved; [TRAINING-DATA CLAIM: pre-2000 studies expected to be few given ML method maturity timelines]. |
| Publication status | Peer-reviewed journal articles, conference proceedings, theses and dissertations, industry reports, consulting case studies, and white papers all eligible. Peer-reviewed status recorded as a covariate; synthesis distinguishes peer-reviewed from grey literature strands. |
| Minimum data duration | 12 months continuous structured operational data (training + evaluation combined). |
| Minimum geographic scope | 3 or more distinct locations (branches or depots). |
| Comparator requirement | Explicitly stated or derivable quantitative baseline required. |

### Grouping for Synthesis

Studies will be grouped for synthesis along the following dimensions (details in Phase 3c):

1. **By intervention module:** Demand forecasting only; predictive maintenance only; vehicle distribution only; integrated (2+ modules).
2. **By comparator family:** Current operational practice; rule-based heuristics; simple statistical methods; static allocation.
3. **By company size:** Large (15+ locations); medium (10–14 locations); small (3–9 locations).
4. **By primary outcome reported:** Stockout reduction; maintenance cost reduction; utilization improvement; multiple outcomes.
5. **By model family:** Time series (ARIMA/SARIMA/Prophet/ETS); deep learning (LSTM/GRU/Transformer); ensemble ML (RF/XGBoost/GBM); hybrid or integrated.
6. **By publication type:** Peer-reviewed; grey literature.

---

## Information Sources
*(PRISMA Item 4)*

### Bibliographic Databases

The following databases will be searched. Coverage dates and expected search dates are indicated; actual search dates will be recorded at execution.

| Database | Platform | Coverage Start | Planned Search Date |
|---|---|---|---|
| MEDLINE | PubMed (NLM) | 1966 | [SPECIFY: actual date] |
| Web of Science Core Collection (SCI-EXPANDED, SSCI, CPCI-S, ESCI) | Clarivate | 1900 (varies by index) | [SPECIFY: actual date] |
| Scopus | Elsevier | 1970 | [SPECIFY: actual date] |
| Inspec | Engineering Village / IET | 1969 | [SPECIFY: actual date] |
| Transportation Research International Documentation (TRID) | TRB / OECD iLibrary | 1968 | [SPECIFY: actual date] |
| ACM Digital Library | ACM | 1951 | [SPECIFY: actual date] |
| IEEE Xplore | IEEE | 1872 (varies) | [SPECIFY: actual date] |
| arXiv | arXiv.org (cs.LG, cs.AI, stat.ML, math.OC sections) | 1991 | [SPECIFY: actual date] |
| Google Scholar | Google | [No fixed start] | [SPECIFY: actual date] |

**Rationale for database selection:** The topic spans operations research, machine learning, and transportation/logistics domains. MEDLINE is included [TRAINING-DATA CLAIM: for any health-adjacent fleet safety publications]. Web of Science, Scopus, and Inspec provide broad multidisciplinary and engineering coverage. TRID provides transport-specific coverage. ACM Digital Library and IEEE Xplore capture computing and systems engineering conference proceedings [TRAINING-DATA CLAIM: where applied ML case studies are frequently published]. arXiv captures preprints that may precede formal publication of proprietary-data studies. Google Scholar provides broad supplementary coverage including grey literature that may not appear in structured databases.

### Grey Literature Sources

The following grey literature sources will be searched:

| Source | Coverage / Scope | Planned Search Date |
|---|---|---|
| ProQuest Dissertations & Theses Global | PhD and master's theses | [SPECIFY: actual date] |
| EThOS (British Library Electronic Theses Online Service) | UK doctoral theses | [SPECIFY: actual date] |
| DART-Europe (European Theses Portal) | European doctoral theses | [SPECIFY: actual date] |
| OpenDOAR repositories (via BASE – Bielefeld Academic Search Engine) | Open access institutional repositories | [SPECIFY: actual date] |
| Google Scholar (targeted grey literature queries) | Industry reports, white papers, case studies | [SPECIFY: actual date] |
| ResearchGate (targeted author searches) | Preprints and unpublished manuscripts | [SPECIFY: actual date] |
| American Car Rental Association (ACRA) publications | Industry white papers, operational case studies | [SPECIFY: actual date] |
| European Car Rental Association (ECRA) / European Rental Association (ERA) publications | Industry reports | [SPECIFY: actual date] |
| Consulting firm report repositories (McKinsey Global Institute, Deloitte Insights, Gartner, Oliver Wyman) | Industry case studies on fleet optimization | [SPECIFY: actual date] |

**Note on grey literature inclusion:** Grey literature is included because Flag 1 (Phase 0) identifies proprietary data access barriers as a structural feature of this evidence domain. [TRAINING-DATA CLAIM: peer-reviewed publications on company-specific ML deployments may represent a minority of total evidence]; [TRAINING-DATA CLAIM: excluding grey literature would systematically bias the review toward forecast-accuracy-only studies (which use public datasets) and away from operational-outcome studies (which require proprietary data)]. Methodological quality assessment distinguishes peer-reviewed from grey literature throughout synthesis.

### Citation Searching

**Backward citation searching:** Reference lists of all studies meeting full-text eligibility criteria will be hand-searched for additional potentially eligible citations. Reference lists of relevant systematic reviews and scoping reviews (if identified during searching) will also be searched, even if those reviews themselves are not eligible as primary studies.

**Forward citation searching:** Studies meeting full-text eligibility criteria will be searched for forward citations using:
- Google Scholar "Cited by" function
- Web of Science "Times Cited" function
- Semantic Scholar related-papers feature

Forward citation searching will be conducted [SPECIFY: at time of database search OR after primary screening is complete — select one and document rationale].

### Author and Expert Contact

- Corresponding authors of included studies will be contacted by email to: (a) confirm data period and operational context; (b) request unpublished results, companion reports, or updated analyses not available in the published version; (c) identify other eligible studies from the same organization or dataset.
- Industry contacts at [SPECIFY: relevant professional organizations or networks] will be approached to identify unpublished or restricted-access case studies meeting eligibility criteria.
- Contact attempts will be documented; non-response within [SPECIFY: e.g., 4 weeks] treated as no additional data available.

### Conference Proceedings

The following conference proceedings will be hand-searched for eligible studies not captured by database searching:

| Conference Series | Years to Search |
|---|---|
| INFORMS Annual Meeting (Operations Research) | [SPECIFY: e.g., 2015–2025] |
| Transportation Science and Logistics (TSL) Society Conference | [SPECIFY: years] |
| International Conference on Machine Learning (ICML) | [SPECIFY: years] |
| NeurIPS (Neural Information Processing Systems) | [SPECIFY: years] |
| KDD (ACM SIGKDD Knowledge Discovery and Data Mining) | [SPECIFY: years] |
| IEEE International Conference on Data Mining (ICDM) | [SPECIFY: years] |
| European Conference on Operational Research (EURO) | [SPECIFY: years] |
| Annual AGIFORS (Airline Group of the International Federation of OR Societies) Symposium | [SPECIFY: years] — included because [TRAINING-DATA CLAIM: revenue management and fleet optimization methods from aviation transfer to car rental] |

### Search Dates

Each database will be searched on [SPECIFY: a single search date or a narrow window, e.g., within 5 business days]. The search date will be recorded for each source individually. No search will be treated as current beyond [SPECIFY: update search date] for the final version of the review.

---

## Search Strategy
*(PRISMA Item 5)*

### Search Term Development

Search terms were developed through the following process:

1. **Seed terms from research input:** The research question (Phase 1 framing commitment) was parsed to extract core population, intervention, and comparator terms: *rent-a-car*, *vehicle rental*, *fleet management*, *machine learning*, *demand forecasting*, *predictive maintenance*, *vehicle distribution*, *ARIMA*, *LSTM*, *Random Forest*, *XGBoost*, *stockout*, *utilization*, *baseline*, *operational data*.

2. **Synonym expansion:** Domain synonyms were added for each core term (e.g., *car rental* / *vehicle hire* / *fleet rental*; *fleet optimization* / *vehicle allocation* / *fleet distribution*; *time series forecasting* / *demand prediction* / *demand modelling*).

3. **MeSH and controlled vocabulary mapping:** Where applicable, MeSH and database-specific thesaurus terms were mapped for MEDLINE and Inspec. (Note: [TRAINING-DATA CLAIM: MeSH coverage of operations research and ML applications in transportation is limited; free-text searching dominates])

4. **NLP/AI search development tools:** [SPECIFY: whether Semantic Scholar related-papers feature, Rayyan AI, or PubMed Best Match were used to expand or validate the search string; if not used, state "none used"].

5. **Cross-database translation:** [SPECIFY: whether Polyglot Search Translator, Yale MeSH Analyzer, or equivalent tools were used to adapt syntax across databases; if not used, state "manual adaptation"]. Database-specific syntax differences (Boolean operators, wildcard characters, field tag availability) handled by manual adaptation; see per-database notes below.

6. **Search peer review:** The search strategy will be [SPECIFY: peer-reviewed by an information specialist using the Peer Review of Electronic Search Strategies (PRESS) checklist / not formally peer-reviewed — state which and document rationale]. [SPECIFY: If peer-reviewed, state reviewer role, e.g., "research librarian at [institution]"].

### Core Search String

The following search string represents the primary structure. It will be adapted for each database according to platform-specific syntax (Boolean operators, proximity operators, field tags, wildcard conventions).

**Conceptual block structure:**

```
Block A (Population): rent-a-car OR car rental OR vehicle rental OR fleet rental OR vehicle hire OR car hire

Block B (Intervention): 
  machine learning OR deep learning OR neural network OR LSTM OR time series forecast* OR demand forecast* OR demand predict* OR ARIMA OR SARIMA OR Prophet OR random forest OR XGBoost OR gradient boost* OR predictive maintenance OR survival analysis OR reinforcement learning OR vehicle distribution OR fleet optimiz*

Block C (Outcome/Domain anchor — optional; used where required to control result volume):
  fleet utilization OR stockout OR vehicle availability OR maintenance cost* OR operational efficiency OR fleet management OR vehicle allocation

Combined: (Block A) AND (Block B) [AND (Block C) where needed for precision]
```

**Rationale for omitting Block C from primary string:** Block C terms (outcome and domain anchor) are used only where initial retrieval volume is unmanageably large. In databases where the population × intervention intersection is already restrictive (e.g., TRID, ACM DL), Block C is dropped from the primary string to maximize sensitivity.

### Full Database-Specific Search Strings

#### PubMed (MEDLINE)

```
("rent-a-car"[tiab] OR "car rental"[tiab] OR "vehicle rental"[tiab] OR "fleet rental"[tiab] OR "vehicle hire"[tiab] OR "car hire"[tiab])
AND
("machine learning"[tiab] OR "deep learning"[tiab] OR "neural network"[tiab] OR "LSTM"[tiab] OR "time series"[tiab] OR "demand forecast"[tiab] OR "demand predict"[tiab] OR "ARIMA"[tiab] OR "SARIMA"[tiab] OR "Prophet"[tiab] OR "random forest"[tiab] OR "XGBoost"[tiab] OR "gradient boosting"[tiab] OR "predictive maintenance"[tiab] OR "survival analysis"[tiab] OR "fleet optim*"[tiab] OR "vehicle distribution"[tiab] OR "vehicle allocation"[tiab])
```

*Field tags:* `[tiab]` = title and abstract. No MeSH terms added; MeSH coverage of this domain is limited.  
*Limits:* No date limits applied; English language limit [SPECIFY: applied / not applied — state decision].  
*Expected result volume:* [SPECIFY: to be recorded after search execution].

#### Web of Science Core Collection

```
TS=("rent-a-car" OR "car rental" OR "vehicle rental" OR "fleet rental" OR "vehicle hire" OR "car hire")
AND
TS=("machine learning" OR "deep learning" OR "neural network" OR "LSTM" OR "time series forecast*" OR "demand forecast*" OR "demand predict*" OR "ARIMA" OR "SARIMA" OR "Prophet" OR "random forest" OR "XGBoost" OR "gradient boost*" OR "predictive maintenance" OR "survival analysis" OR "fleet optim*" OR "vehicle distribution" OR "vehicle allocation")
```

*Field tags:* `TS` = topic (title, abstract, author keywords, KeyWords Plus).  
*Indexes searched:* SCI-EXPANDED, SSCI, CPCI-S, ESCI.  
*Limits:* No date limits.

#### Scopus

```
TITLE-ABS-KEY("rent-a-car" OR "car rental" OR "vehicle rental" OR "fleet rental" OR "vehicle hire" OR "car hire")
AND
TITLE-ABS-KEY("machine learning" OR "deep learning" OR "neural network" OR "LSTM" OR "time series forecast*" OR "demand forecast*" OR "demand predict*" OR "ARIMA" OR "SARIMA" OR "Prophet" OR "random forest" OR "XGBoost" OR "gradient boost*" OR "predictive maintenance" OR "survival analysis" OR "fleet optim*" OR "vehicle distribution" OR "vehicle allocation")
```

*Limits:* No date limits.

#### IEEE Xplore

```
("rent-a-car" OR "car rental" OR "vehicle rental" OR "fleet rental")
AND
("machine learning" OR "deep learning" OR "LSTM" OR "demand forecast*" OR "demand predict*" OR "ARIMA" OR "random forest" OR "XGBoost" OR "predictive maintenance" OR "fleet optim*" OR "vehicle allocation" OR "vehicle distribution")
```

*Search field:* Full text and metadata. IEEE Xplore does not support `*` wildcard in all configurations; adapt as needed using platform interface.

#### ACM Digital Library

```
[[All: "car rental"] OR [All: "vehicle rental"] OR [All: "fleet rental"] OR [All: "rent-a-car"]]
AND
[[All: "machine learning"] OR [All: "deep learning"] OR [All: "LSTM"] OR [All: "demand forecasting"] OR [All: "predictive maintenance"] OR [All: "fleet optimization"] OR [All: "vehicle allocation"] OR [All: "ARIMA"] OR [All: "XGBoost"] OR [All: "random forest"]]
```

#### Inspec (Engineering Village)

```
(("rent-a-car" OR "car rental" OR "vehicle rental" OR "fleet rental") WN ALL)
AND
(("machine learning" OR "deep learning" OR "LSTM" OR "demand forecast*" OR "ARIMA" OR "SARIMA" OR "predictive maintenance" OR "fleet optim*" OR "vehicle allocation" OR "XGBoost" OR "random forest") WN ALL)
```

*Proximity operator:* `WN ALL` = within all fields (title, abstract, controlled terms).

#### TRID (Transportation Research International Documentation)

```
("car rental" OR "vehicle rental" OR "rent-a-car" OR "fleet management")
AND
("machine learning" OR "demand forecast*" OR "predictive maintenance" OR "time series" OR "neural network" OR "ARIMA" OR "fleet optim*")
```

*Note:* TRID has limited Boolean operator support in some interface versions; adapt to available syntax.

#### arXiv

Search via arXiv search interface (search.arxiv.org) with primary categories cs.LG, cs.AI, stat.ML, math.OC:

```
ti:"car rental" OR ti:"vehicle rental" OR ti:"fleet management" OR ti:"rent-a-car"
OR
abs:"car rental" AND abs:("machine learning" OR "demand forecast" OR "fleet optim")
```

*Supplementary arXiv search via Semantic Scholar:* Related-paper feature applied to seed papers identified in initial database searches. [SPECIFY: whether Semantic Scholar API used or manual related-paper exploration].

#### Google Scholar

Google Scholar does not support fielded searching. The following query strings will be used in a series of targeted searches:

```
"car rental" "machine learning" "fleet optimization" operational
"vehicle rental" "demand forecasting" ARIMA LSTM OR Prophet
"rent-a-car" "predictive maintenance" XGBoost OR "random forest"
"vehicle distribution" "fleet management" "machine learning" stockout
"car rental" "fleet utilization" "time series" operational data
```

First [SPECIFY: e.g., 200] results per query exported for deduplication and screening.

### Limits Applied

| Limit | Applied | Rationale |
|---|---|---|
| Date range | None (1990 onward retrieved) | Maximizes sensitivity; pre-2000 studies unlikely but possible |
| Language | English [SPECIFY: confirm application] | Review team reads English; non-English studies flagged during screening |
| Study design | None at search stage | Design filters applied at screening; no pre-filtering to avoid excluding non-standard empirical designs |
| Publication type | None at search stage | Grey literature included; no document type exclusion at search stage |

### Database-Specific Syntax Adaptations

Wildcard conventions vary: `*` (PubMed, Scopus, Web of Science), `$` (Embase if added), `?` (some EBSCO platforms). Proximity operators unavailable in PubMed and Google Scholar; proximity searching used in Web of Science (`NEAR/n`) and Inspec (`WN`) where precision requires it. All adaptations documented in the search log [SPECIFY: location of search log file].

---

## Study Selection Process
*(PRISMA Item 6)*

### Overview

Study selection will proceed in two stages: (1) title and abstract screening, and (2) full-text eligibility assessment. Each stage uses the eligibility criteria defined in the Eligibility Criteria section above.

### Stage 1: Title and Abstract Screening

**Reviewers:** Two independent reviewers will screen all titles and abstracts retrieved from database searches. Both reviewers apply the eligibility criteria independently; neither reviewer is blinded to author, journal, or institution.

**Number of reviewers:** 2 (independent, parallel review).

**Screening tool:** [SPECIFY: Rayyan, Covidence, Distiller SR, or equivalent systematic review management software]. Each title and abstract is marked Included / Excluded / Uncertain by each reviewer independently.

**Automation tools:** [SPECIFY: whether AI-assisted pre-screening (e.g., Rayyan AI relevance ranking, ASReview, or equivalent active learning classifier) is used to prioritize records before human screening. If used, document: (a) whether classifier is external pre-trained or trained on internal seed set; (b) training dataset composition; (c) sensitivity and specificity on a held-out validation set of manually screened records; (d) whether human screeners are blinded to classifier predictions. If not used, state "no AI pre-screening applied"].

**Uncertainty rule:** Any record marked Uncertain by either reviewer proceeds to full-text retrieval. Any record marked Excluded by both reviewers is excluded at this stage.

**Disagreement resolution:** Disagreements between the two reviewers on Included vs. Excluded determinations (i.e., one marks Included and the other marks Excluded without an Uncertain classification) are resolved by discussion between the two reviewers. If consensus is not reached within [SPECIFY: e.g., 10 minutes of discussion or 2 days of asynchronous review], a third reviewer makes the final determination.

**Crowdsourcing tools:** Not used. [SPECIFY: If Cochrane Crowd or equivalent is used, document platform, task configuration, and how crowdsourced assessments are reconciled with primary reviewer decisions.]

### Stage 2: Full-Text Eligibility Assessment

**Reviewers:** The same two reviewers independently assess full-text eligibility for all records advancing from Stage 1.

**Number of reviewers:** 2 (independent, parallel review).

**Full-text retrieval:** Full-text PDFs retrieved for all records advancing from Stage 1. Where full text is unavailable through institutional access, interlibrary loan will be used. Where no full text is obtainable, the corresponding author will be contacted. Records where full text cannot be obtained after [SPECIFY: e.g., 3 attempts] are listed as "full text not retrieved" in the PRISMA flow diagram.

**Exclusion reason documentation:** Each full-text record assessed and excluded at Stage 2 is assigned a primary exclusion reason from the following list (applied in hierarchical order — first reason that applies is recorded):

1. Not a primary empirical study (review, editorial, commentary)
2. Population not eligible: single location only
3. Population not eligible: no real proprietary operational data (simulation/synthetic/public data only)
4. Insufficient data duration: < 6 months (excluded); 6–12 months (flagged for sensitivity analysis only)
5. Intervention not eligible: no ML or forecasting model applied to operational data
6. Comparator not eligible: no quantitative baseline stated or derivable
7. Outcome not eligible: reports forecast accuracy metrics only (no primary operational outcome)
8. Language: non-English full text, no translation available

**Disagreement resolution:** Same process as Stage 1.

### Handling Multiple Reports of the Same Study

Multiple publications derived from the same underlying dataset and company will be identified and linked using the following procedure:

- Author names and affiliation overlap checked at title/abstract stage and flagged for verification at full-text stage.
- Dataset characteristics (company name where disclosed, number of locations, data period, fleet size) cross-referenced across all included studies.
- Conference paper and journal article versions of the same study linked; the most complete or most recent version used as the primary data source for extraction; supplementary data from companion reports retained.
- Studies sharing a dataset but reporting different outcomes or model configurations treated as separate analysis units; noted in the evidence table as "same dataset — different analysis."

This procedure will be applied prior to finalizing the included study list; linked study sets will be noted in the PRISMA flow diagram.

### Previously Screened Citation Sets

No previously screened citation sets from prior systematic reviews are reused in this review. [SPECIFY: If a prior scoping search or related review exists from which a citation list is inherited, cite that prior review and document: (a) date of original search; (b) databases searched; (c) how the prior set was supplemented with new searches for the current review.]

### Pilot Calibration

Before beginning full independent screening, the two reviewers will conduct a pilot calibration exercise on a random sample of [SPECIFY: e.g., 50–100] records from the title/abstract set. Inter-rater agreement will be calculated (Cohen's kappa or percentage agreement). If agreement is below [SPECIFY: e.g., kappa < 0.70], the eligibility criteria will be reviewed and ambiguous cases discussed before proceeding to full independent screening. Results of the pilot calibration exercise will be documented in the supplementary screening log.

---

## Methodological Decisions

**Grey literature coverage:** Decision: searched across all eligible source types (theses, industry reports, consulting case studies, white papers). Why not restrict to peer-reviewed only: the evidence domain is structurally biased toward proprietary-data case studies that companies publish selectively through grey literature channels rather than peer-reviewed journals (Flag 1, Phase 0); restricting to peer-reviewed publications would likely reduce the eligible set to forecast-accuracy-only studies using public datasets, which do not address the primary operational outcome question.

**Database selection:** Decision: 9 bibliographic databases selected including MEDLINE, Web of Science, Scopus, Inspec, TRID, ACM Digital Library, IEEE Xplore, arXiv, and Google Scholar. Why not restrict to 3–4 general databases (e.g., Web of Science + Scopus only): the topic spans operations research, machine learning, and transportation engineering across peer-reviewed and conference-proceedings literature; using only general databases would miss domain-specific coverage from TRID (transportation literature) and ACM/IEEE (applied computing and systems engineering conference proceedings where ML case studies are frequently first published).

**NLP/AI tools in search:** Decision: [SPECIFY: used / not used]. Why not [the alternative]: [SPECIFY: if used — "manual search alone risks missing semantically related terms in an interdisciplinary domain where controlled vocabulary is sparse"; if not used — "AI-assisted search prioritization tools require a training set of confirmed relevant papers, which does not exist prior to initial screening; manual search with comprehensive Boolean strings achieves equivalent sensitivity in a domain with limited evidence volume"].

---

**End of Phase 3a**
