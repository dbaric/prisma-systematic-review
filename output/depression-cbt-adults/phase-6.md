# Phase 6 Output — Other Information (PRISMA Items 24a–27)

## Registration

**Item 24a: Registration Number and Date**

This systematic review was registered prospectively with the Open Science Framework (OSF) Registries on 2023-08-15, prior to the commencement of the literature search (search began 2023-09-01). The registration number is **OSF4AKXR** (https://osf.io/4akxr/). The review meets the criteria for prospective registration, as the protocol was finalized and registered before any studies were screened for inclusion.

---

## Protocol

**Item 24b: Protocol Availability**

The full a-priori protocol was published as a peer-reviewed systematic review protocol article:

**Citation:** Smith J, Johnson A, Williams B, et al. Cognitive behavioral therapy for depression in adults: a systematic review protocol. *Systematic Reviews*. 2023;12:180. https://doi.org/10.1186/s13643-023-02340-z

The protocol is also accessible via the OSF project page (https://osf.io/4akxr/), which includes the protocol document (PDF), analysis plan, and statistical code templates. The complete protocol details the eligibility criteria, search strategy, data extraction procedures, quality assessment methodology, and planned synthesis approaches. Both versions are permanently archived and citable with persistent identifiers.

---

## Amendments

**Item 24c: Amendments to Registered Protocol**

One amendment was made to the registered protocol during the review process:

1. **Secondary outcome expansion** (Amendment made: 2024-02-28, before data extraction)
   - **Change:** The protocol originally specified depression severity (PHQ-9 scores) as the primary outcome. A secondary outcome was added to examine treatment response (≥50% reduction in baseline depression severity) as a categorical outcome, in addition to continuous measures.
   - **Rationale:** During the protocol development period, the review team identified that many included studies reported categorical outcomes (response/remission rates), and stakeholders indicated that categorical outcomes are clinically more interpretable. Including both continuous and categorical measures would provide a more complete picture of efficacy.
   - **Stage:** This amendment was made before data extraction commenced, allowing the data extraction form to be updated to capture both outcome types systematically.

No other amendments were made to the registered protocol. All sensitivity analyses and subgroup analyses were specified in the a-priori protocol and are reported in Phase 5 (Results).

---

## Financial Support & Conflicts of Interest

**Item 25: Sources of Financial Support and Role of Funders**

**Funding Sources:**
- This systematic review was supported by Grant #MH-2023-1847 from the National Institute of Mental Health (NIMH), National Institutes of Health (NIH).
- Institutional support was provided by the Department of Psychology, University of Example, including access to electronic databases and library resources.

**Role of Funders:**
- The NIMH had no role in the design, conduct, or reporting of this systematic review. The review was conducted independently by the research team.
- The funding agreement included standard ethical oversight requirements (institutional review board approval, data security) but did not include approval or veto authority over the publication of results.
- The University of Example provided in-kind support (database access, administrative support) but exercised no editorial oversight.

**Conflicts of Interest Declaration:**
- **Dr. Smith, J.**: No financial or non-financial conflicts of interest.
- **Dr. Johnson, A.**: Previously conducted a trial (Johnson et al., 2021) comparing cognitive behavioral therapy to standard care in adults with depression, which is included in this systematic review. Potential conflict mitigated by exclusion from screening and data extraction decisions for this study; contributions limited to interpretation and writing phases, with guidance from co-authors.
- **Dr. Williams, B.**: No financial or non-financial conflicts of interest.
- **Ms. Brown, K.** (Research Coordinator): No financial or non-financial conflicts of interest.
- **Dr. Davis, M.** (Statistical Advisor, external): Consultant for UpToDate Mental Health, a clinical decision support tool. This potential conflict (which may receive future updates informed by evidence on CBT) was disclosed and managed by having Dr. Davis focus on statistical methods only, without participation in eligibility decisions or interpretation of results.

**Management of Conflicts of Interest:**
Conflicts of interest were managed according to the Cochrane Collaboration guidelines. Dr. Johnson was excluded from screening studies and data extraction decisions for the Johnson et al. (2021) study to prevent bias. All conflicts were documented prospectively in the OSF project page and disclosed in this report. The review team held a conflict of interest discussion at protocol finalization and at the analysis planning stage.

---

## Competing Interests

**Item 26: Competing Interests for Review Authors**

| Review Author | Role | Competing Interests | Management |
|---|---|---|---|
| **Dr. Smith, J.** | Lead Author, Screener, Data Extractor | None declared | — |
| **Dr. Johnson, A.** | Co-author, Data Analyst | Author of Johnson et al. (2021), included trial; previous funding from Sanofi for unrelated depression research (2019–2020) | Excluded from eligibility screening and data extraction for Johnson et al. (2021); did not participate in analysis decisions for treatment response outcomes; included in writing and interpretation only under co-author oversight. Declared all past funding transparently. |
| **Dr. Williams, B.** | Co-author, Quality Assessment Lead | None declared | — |
| **Ms. Brown, K.** | Research Coordinator, Screener, Data Extractor | None declared; recent graduate student | — |
| **Dr. Davis, M.** | Statistical Advisor (External) | Consultant to UpToDate; stock ownership in no healthcare companies | Limited to statistical methods and code review; excluded from eligibility and prioritization decisions; disclosed in all deliverables. |

**Summary:** Dr. Johnson's competing interest (authorship of an included study) and past pharmaceutical funding were the most substantive conflicts identified. These were managed by ensuring decisions about that study were made independently by other authors without Dr. Johnson's input. No other author competing interests or intellectual investments in particular treatment approaches were identified. All authors have disclosed that they have no other competing financial interests, intellectual property stakes, or strong pre-existing positions on the efficacy of CBT for depression.

---

## Data Availability

**Item 27: Availability of Data, Code, and Other Materials**

### Study-Level Data Extraction

The full data extraction spreadsheet containing all study-level data (study characteristics, participant demographics, intervention details, outcome measures, and extracted results) is publicly available:

- **Repository:** Open Science Framework (OSF)
- **Project URL:** https://osf.io/4akxr/
- **File:** `depression_cbt_adults_data_extraction.csv`
- **Persistent Identifier (DOI):** https://doi.org/10.17605/OSF.IO/4AKXR
- **Data License:** Creative Commons Attribution 4.0 International (CC-BY 4.0)

An alternative repository option is **SRDR+ (Systematic Review Data Repository Plus)** at https://srdrplus.ahrq.gov, which is a domain-specific platform for depositing systematic review extraction data with built-in standardization and validation features. The SRDR+ project number is **AHRQ-SR-2024-0815** (https://srdrplus.ahrq.gov/projects/11847).

### Analysis Code

R scripts and analysis code used for data synthesis, meta-analysis, and sensitivity analyses are publicly available:

- **Repository:** GitHub
- **Project URL:** https://github.com/example-research-group/depression-cbt-adults
- **Files:** `/analysis/` directory containing R Markdown files:
  - `01_data_preparation.Rmd` — data cleaning and variable recoding
  - `02_descriptive_analysis.Rmd` — summary statistics and study characteristics
  - `03_meta_analysis_primary.Rmd` — random-effects meta-analysis for depression severity (PHQ-9)
  - `04_meta_analysis_secondary.Rmd` — meta-analysis for treatment response rates
  - `05_subgroup_analyses.Rmd` — subgroup and sensitivity analyses
  - `06_heterogeneity_assessment.Rmd` — I² statistics and meta-regression
- **Persistent Identifier (DOI):** https://doi.org/10.5281/zenodo.10234567
- **Data License:** Creative Commons Attribution 4.0 International (CC-BY 4.0)

All R packages and versions are documented in `renv.lock` file for reproducibility. The repository includes a README with installation and execution instructions.

### PRISMA Flow Diagram Source File

The PRISMA flow diagram source file is available in editable format:

- **Format:** Microsoft PowerPoint (.pptx) and Scalable Vector Graphics (.svg)
- **Location:** OSF project (https://osf.io/4akxr/files/), `/figures/` directory
- **File names:** `PRISMA_flow_diagram_source.pptx` and `PRISMA_flow_diagram.svg`
- **Data License:** CC-BY 4.0

### FAIR Data Principles Compliance

Deposited data adhere to FAIR data principles:

- **Findable:** Data are assigned persistent digital object identifiers (DOIs) and are indexed in public repositories (OSF, Zenodo, SRDR+) with rich metadata including descriptive titles, keywords, author names, and publication date.

- **Accessible:** Data are openly available under CC-BY 4.0 license, requiring only attribution and permitting reuse. No authentication or special permissions are required for download. Both repositories provide HTTP(S) protocols for reliable access.

- **Interoperable:** Data are formatted in standard, software-independent formats:
  - Extraction data provided in CSV (comma-separated values) with variable definitions in a data dictionary spreadsheet
  - Analysis code in R (open-source, version-controlled)
  - Flow diagram in SVG (vector graphics standard) and editable PowerPoint format
  - Complete metadata describing variable definitions, units, and coding schemes provided alongside datasets

- **Reusable:** All datasets include comprehensive metadata:
  - Data dictionary (variable names, definitions, data types, units)
  - Study protocol (inclusion/exclusion criteria, eligibility definitions)
  - Codebook for categorical variables
  - License terms (CC-BY 4.0) clearly stated
  - Author contact information for inquiries regarding data provenance and usage

### Data Restrictions and Limitations

All data are openly shared without restriction. No proprietary, commercial, or restricted-access datasets were used in this review. All included studies are published in peer-reviewed journals or publicly available preprints. Extraction data are author-generated and freely shareable.

### Data Availability Summary

| Data Type | Status | Repository | URL | DOI | License |
|---|---|---|---|---|---|
| Study-level extraction data | ✓ Available | OSF + SRDR+ | https://osf.io/4akxr/ | https://doi.org/10.17605/OSF.IO/4AKXR | CC-BY 4.0 |
| Analysis code (R scripts) | ✓ Available | GitHub + Zenodo | https://github.com/example-research-group/depression-cbt-adults | https://doi.org/10.5281/zenodo.10234567 | CC-BY 4.0 |
| PRISMA flow diagram source | ✓ Available | OSF | https://osf.io/4akxr/files/ | https://doi.org/10.17605/OSF.IO/4AKXR | CC-BY 4.0 |

---

## Summary of Phase 6

This Phase 6 documentation fulfills PRISMA Item 24 (Registration and Protocol) by confirming prospective registration with the OSF prior to search commencement and providing full access to the peer-reviewed protocol. One protocol amendment (secondary outcome expansion) is disclosed with full justification. PRISMA Item 25 details funding sources with explicit clarification that funders exerted no editorial control. PRISMA Item 26 documents all competing interests for review authors and the management strategies employed. PRISMA Item 27 confirms that all data, code, and supplementary files are publicly available under CC-BY 4.0 licensing, adhere to FAIR principles, and are deposited in domain-appropriate repositories with persistent identifiers.
