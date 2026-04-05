# PRISMA 2020 Systematic Review — Workflow Index

## Start Here

The workflow is auto-configured via `run.sh`. Your review metadata is already set:

- ✅ **Theme** is set to: {{THEME}}
- ✅ **Output directory** created: {{OUTPUT_DIR}}/
- ✅ **All 6 phase templates** copied and ready
- ✅ **Research input** loaded

**Proceed directly to Phase 1.**

---

## Data Availability Notice

The research input is a **review protocol** — it contains the PICO question and eligibility criteria only. **No searches have been run. No studies have been screened. No analyses have been performed.**

Rules for all phases:
- **Methods (Phase 3):** Write in planned/conditional tense ("will be searched", "will be assessed"). State your planned approach as if designing the review prospectively.
- **Results (Phase 4):** Do NOT invent statistics. Use `[DATA REQUIRED: ...]` for every field requiring real data (study counts, effect sizes, I², p-values, etc.).
- **Abstract items 8–9 (Phase 1):** Use `[DATA REQUIRED]` placeholders — do not fabricate counts or estimates.

---

## Active Review

**Theme:** {{THEME}}  
**Output path:** {{OUTPUT_DIR}}/  
**Start date:** {{START_DATE}}  
**Status:** in progress

---

## How to Use This Workflow

1. Open the phase instruction file listed below
2. Execute all numbered steps in order, following the `→ Write to:` paths exactly
3. Write outputs to the specified file at the exact section listed in each step
4. When a phase needs prior results, read the listed output file + section (dependencies are listed at the top of each phase file)

**Critical rule:** Load only what you need. Open one phase file at a time. Read only the dependencies it lists. Never re-read instruction files or the entire index while executing a phase.

---

## Tasks

- [ ] **Phase 1** — Title & Abstract (Items 1–12)  
  → `phases/phase-1-title-abstract.md`  
  → Output: `{{OUTPUT_DIR}}/phase-1.md`

- [ ] **Phase 2** — Introduction (Items 13–14)  
  → `phases/phase-2-introduction.md`  
  → Output: `{{OUTPUT_DIR}}/phase-2.md`

- [ ] **Phase 3** — Methods (Items 5–15)  
  → `phases/phase-3-methods.md` + `phases/phase-3-synthesis-methods.md`  
  → Output: `{{OUTPUT_DIR}}/phase-3.md`

- [ ] **Phase 4** — Results (Items 16–22)  
  → `phases/phase-4-results.md`  
  → Output: `{{OUTPUT_DIR}}/phase-4.md`

- [ ] **Phase 5** — Discussion (Items 23a–23d)  
  → `phases/phase-5-discussion.md`  
  → Output: `{{OUTPUT_DIR}}/phase-5.md`

- [ ] **Phase 6** — Other Information (Items 24a–27)  
  → `phases/phase-6-other.md`  
  → Output: `{{OUTPUT_DIR}}/phase-6.md`

---

## Output Cross-Reference

Use this table to find where prior results are stored. When a phase instruction says "read X from Phase N", look up the section in the table below:

| Phase | Output file | Sections other phases depend on |
|---|---|---|
| 1 | `{{OUTPUT_DIR}}/phase-1.md` | `## Abstract` → Item 3: Objectives — confirms PICO framing |
| 2 | `{{OUTPUT_DIR}}/phase-2.md` | `## Objectives` — confirms research question |
| 3 | `{{OUTPUT_DIR}}/phase-3.md` | `## GRADE Setup` — framework for Phase 4 ratings; `## Synthesis Methods` — all sub-items 13a–13f for Phase 4 |
| 4 | `{{OUTPUT_DIR}}/phase-4.md` | `## GRADE Ratings` — Phase 5 references these; `## Study Counts` — summary numbers; `## Effect Sizes` — summary estimates |
| 5 | `{{OUTPUT_DIR}}/phase-5.md` | — |
| 6 | `{{OUTPUT_DIR}}/phase-6.md` | — |

---

## Compliance

To verify your review meets all 27 PRISMA 2020 checklist items, open `phases/output-format.md` at any time.

All 27 items are mandatory. If a section is not applicable, write "**Not applicable**" with a brief (1–2 sentence) justification.

---

## Special Review Types

### Updated Reviews
Your review updates a previous systematic review. Ensure these are addressed:
- Phase 1, Item 1: title identifies update status
- Phase 2, Item 14: cite original, specify what is updated, explain rationale
- Phase 4, Item 17: distinguish newly included studies from carried-forward ones
- Phase 5, Item 23a: compare key findings with previous version
- Phase 6, Item 24c: note any amendments to protocol

### Living Reviews
Your review will be updated regularly as new evidence emerges. Ensure these are addressed:
- Phase 1, Item 12 (abstract): note living review status
- Phase 5, Item 23d (implications): state planned update schedule and interim update triggers
- Phase 6, Item 24c: amendments will be documented at each update cycle

---

## Tips for Working Efficiently

1. **Stay focused**: Open one phase file at a time. Follow exact write-to paths specified in each step.
2. **Follow dependencies**: Read listed dependency sections before executing a phase.
3. **Use the checklist**: Open `phases/output-format.md` at any time to verify progress.

---

## Questions or Issues?

- Refer to `phases/output-format.md` for PRISMA 2020 compliance rules
- Refer to the individual phase file for detailed guidance on any section
- All 27 PRISMA 2020 checklist items are covered; none can be omitted without justification
