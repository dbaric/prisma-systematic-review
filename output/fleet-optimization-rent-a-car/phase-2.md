# Phase 2: Introduction — PRISMA Items 13–14

## Rationale

Rent-a-car companies operating multiple locations face a continuous operational challenge: allocating a finite and heterogeneous vehicle fleet across geographically dispersed branches to satisfy demand that [TRAINING-DATA CLAIM: is volatile by day, season, vehicle category, and location]. Each location must simultaneously avoid stockouts—instances when a customer's requested vehicle category is unavailable—while avoiding overstock that ties up capital in idle vehicles. Maintenance scheduling introduces a competing constraint: vehicles removed from service for unplanned repairs reduce available fleet at the moment of withdrawal and [TRAINING-DATA CLAIM: generate disproportionately higher costs than proactive maintenance]. These pressures compound across locations, where distribution decisions at one branch directly affect availability at others, and where [TRAINING-DATA CLAIM: no single branch manager has visibility into system-wide fleet state].

Current operational responses to this problem typically rely on historical booking averages, manager experience, and fixed allocation rules—methods that are [TRAINING-DATA CLAIM: well-understood and auditable] but structurally limited in their ability to anticipate demand shifts and maintenance timing simultaneously. Machine learning and time series forecasting methods (including ARIMA, SARIMA, Prophet, LSTM, Random Forest, and XGBoost) offer an alternative: models trained on proprietary internal data—reservation records, fleet utilization histories, and vehicle service logs—that could, in principle, generate decision support that reduces both stockout incidence and unplanned maintenance cost compared to rule-based baselines.

However, the evidence base for this proposition is poorly characterized. [TRAINING-DATA CLAIM: Published peer-reviewed studies applying ML methods to proprietary rent-a-car operational data and comparing outcomes to operational baselines are sparse compared to ML applications in adjacent domains such as airline revenue management or hotel occupancy forecasting.] The proportion of published cases that include a quantitative operational baseline comparison—rather than reporting forecast accuracy metrics alone—is unknown. Without a systematic assessment of this evidence, multi-location rent-a-car operators cannot determine whether the operational improvement case for ML investment is well-supported, limited to specific contexts, or primarily based on non-peer-reviewed industry reporting.

## Objectives

This systematic review addresses the following research question, stated in PICO format:

**In multi-location rent-a-car operations (P), how much do machine learning or time series forecasting systems applied to proprietary operational data (I) reduce stockout days, unplanned maintenance costs, and fleet utilization losses (O) compared to current operational practice, rule-based heuristics, simple statistical methods, or static allocation strategies (C)?**

The specific objectives are to:

1. Identify empirical quantitative studies that apply machine learning or time series forecasting models to proprietary internal rent-a-car data (reservations, fleet records, service logs) for any combination of: vehicle demand forecasting, predictive maintenance scheduling, or vehicle distribution optimization.

2. Assess the operational outcomes reported in identified studies, distinguishing between primary operational outcomes (stockout reduction, unplanned maintenance cost reduction, fleet utilization improvement) and secondary outcomes (forecast accuracy metrics, demand forecast stratified by horizon, vehicle replacement decision accuracy).

3. Evaluate methodological quality and risk of bias in included studies, with attention to temporal confounding, measurement bias, selection bias, and outcome reporting bias that are structurally prevalent in proprietary-data case studies.

4. Synthesize findings narratively, stratifying by company size, comparator type (simple statistics, expert heuristics, current operational practice, static allocation), model type (time series methods vs. machine learning methods), and outcome measurement approach, to identify conditions under which reported operational improvements are consistent or inconsistent.

5. Characterize the boundaries of the current evidence base—including the degree to which findings rest on peer-reviewed vs. grey literature, on studies with explicit operational baselines vs. forecast-accuracy-only reporting, and on multi-location vs. single-location designs—to inform the strength of any operational recommendations that can be derived from available evidence.

This is an original systematic review, not an update of a previous review. [SPECIFY: confirm whether pre-search scoping was conducted and document its results, or replace with: "No equivalent systematic review was identified during protocol development."] The review protocol was designed concurrently with drafting rather than pre-registered in PROSPERO; this limitation is acknowledged in the Limitations section.

---

**End of Phase 2**
