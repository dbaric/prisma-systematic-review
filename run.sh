#!/bin/bash

# PRISMA Systematic Review — Per-Phase Isolated Claude Sessions
# Usage: ./run.sh <input-file>
# Example: ./run.sh depression-cbt-adults.txt
#
# This version executes each of the 6 phases in isolated Claude sessions,
# reducing context window bloat and improving token efficiency.

set -e

if [ -z "$1" ]; then
  echo "Error: Input file required"
  echo ""
  echo "Usage: ./run.sh <input-file>"
  echo ""
  echo "Example:"
  echo "  ./run.sh depression-cbt-adults.txt"
  echo "  ./run.sh covid-vaccine-efficacy.txt"
  echo ""
  echo "Input files should be in the inputs/ directory."
  exit 1
fi

INPUT_FILE="inputs/$1"

if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: File not found: $INPUT_FILE"
  exit 1
fi

# Extract theme from filename (strip extension)
# From: depression-cbt-adults.txt → depression-cbt-adults
THEME="${1%.txt}"
OUTPUT_DIR="output/$THEME"
TEMPLATE_DIR="output/_template"

# Validate theme name (alphanumeric and hyphens only)
if ! [[ "$THEME" =~ ^[a-z0-9\-]+$ ]]; then
  echo "Error: Theme name must contain only lowercase letters, numbers, and hyphens"
  exit 1
fi

# Check if theme already exists
if [ -d "$OUTPUT_DIR" ]; then
  echo "Error: Review '$THEME' already exists at $OUTPUT_DIR"
  exit 1
fi

echo "Setting up PRISMA review: $THEME"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Copy all template files (including new sub-phases and Phase 0)
for phase in 0 1 2 3a 3b 3c 4a 4b 4c 5 6; do
  src="$TEMPLATE_DIR/phase-$phase.md"
  dst="$OUTPUT_DIR/phase-$phase.md"
  if [ ! -f "$src" ]; then
    echo "Error: Missing template: $src"
    exit 1
  fi
  cp "$src" "$dst"
done

# Prepare variables
START_DATE=$(date +"%Y-%m-%d")

echo "Setup complete. Starting PRISMA workflow (Phase 0 + 9 draft phases + multi-round judge loops)..."
echo "(1 exploration + 9 drafts + up to 28 review rounds = worst case 38 sessions; average ~28)"
echo ""

# =============================================================================
# VALIDATION FUNCTIONS
# =============================================================================

validate_extraction() {
  local var_name="$1"
  local var_value="$2"
  local section_name="$3"

  if [ -z "$var_value" ]; then
    echo "Error: Could not extract '$section_name' from phase file"
    echo "Check that the section header is exactly: ## $section_name"
    exit 1
  fi
}

detect_fabrication() {
  local file="$1"
  local phase_num="$2"
  local mode="${3:-warn}"   # "warn" or "block"

  # Pattern group 1: numeric fabrications (original patterns)
  local numeric_pattern='SMD\s*=\s*[-−]?[0-9]+\.[0-9]+|n\s*=\s*[0-9]{3,}|kappa\s*=\s*0\.[0-9]|NNT\s*=\s*[0-9]+|[0-9]{1,2}%.*(?:remission|response|recovery)'

  # Pattern group 2: prose author-year citations
  local prose_pattern1='[A-Z][a-z]+ et al\.?,?\s*(19|20)[0-9]{2}'

  # Pattern group 3: vague consensus claims
  local prose_pattern2='(most|many|several|numerous|the majority of)\s+studies\s+(showed|demonstrated|found|reported|suggest)'

  # Pattern group 4: approximate statistics
  local prose_pattern3='approximately\s+[0-9]+\s*(%|percent|studies|trials|participants)'

  # Pattern group 5: causal attribution without placeholder
  local prose_pattern4='(has been shown|have demonstrated|evidence suggests)\s+(that\s+)?[A-Z]'

  # Pattern group 6: named prevalence/incidence claims
  local prose_pattern5='affects?\s+[0-9]+(\.[0-9]+)?\s*(%|percent|million|billion)'

  if grep -qE "$numeric_pattern" "$file" || \
     grep -qE "$prose_pattern1" "$file" || \
     grep -qE "$prose_pattern2" "$file" || \
     grep -qE "$prose_pattern3" "$file" || \
     grep -qE "$prose_pattern4" "$file" || \
     grep -qE "$prose_pattern5" "$file"; then
    echo "⚠️ Potential fabricated claim in $file (phase $phase_num)."
    if [ "$mode" = "block" ]; then
      echo "ERROR: Halting pipeline. Replace fabricated claims with appropriate placeholders ([DATA REQUIRED], [SPECIFY], [PLACEHOLDER], [TRAINING-DATA CLAIM])."
      exit 1
    fi
  fi
}

# =============================================================================
# PHASE 0: Landscape & Forks (exploration before formal commitment)
# =============================================================================

echo "[Phase 0: Landscape] Generating Landscape & Forks..."

PHASE_0_MAX_ROUNDS=2

for round in $(seq 1 $PHASE_0_MAX_ROUNDS); do
  echo "  [Draft/Review $round/$PHASE_0_MAX_ROUNDS]"

  PREV_HASH=$(md5 -q "$OUTPUT_DIR/phase-0.md" 2>/dev/null || echo "")

  PHASE_0_PROMPT="You are a methodologist mapping the interpretive space of a research question before it is committed to a formal protocol.

## Your Task

Execute Phase 0 of the PRISMA workflow: Landscape & Forks (exploration, not formal protocol).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Input research file: $INPUT_FILE
- Output file: $OUTPUT_DIR/phase-0.md
- Review start date: $START_DATE

## Phase Instructions

Read the contents of the phase file carefully:

\`\`\`
$(cat phases/phase-0-landscape.md)
\`\`\`

## Research Input

\`\`\`
$(cat "$INPUT_FILE")
\`\`\`

## Training-Data Contamination Rule

You will be tempted to draw on your pre-training knowledge about this topic. You MUST NOT make any of the following statements without wrapping them in \`[TRAINING-DATA CLAIM: ...]\`:

- Any statement that cites or implies a body of empirical research (\"studies have shown\", \"evidence suggests\", \"the literature demonstrates\")
- Any statement attributing a finding to named researchers, trials, or reviews
- Any statement of field-level consensus (\"it is widely accepted\", \"most researchers agree\")
- Any prevalence or incidence statistic not present verbatim in the research input
- Any comparative claim about intervention effectiveness

The \`[TRAINING-DATA CLAIM: ...]\` wrapper signals that this claim requires verification before the protocol is finalized. It is not a placeholder for data — it is a flag for human review.

Acceptable untagged content: statements of definitional or logical form, structural descriptions of fork differences, and the contents of the research input itself quoted verbatim.

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-0.md\` in the specified sections.
- Do not resolve ambiguities; that is Phase 1's job.
- Do not recommend a fork; map the space.
- Forks must be substantively different (not surface variations).
- This is an isolated session: generate a complete, self-contained landscape.
"

  claude --dangerously-skip-permissions "$PHASE_0_PROMPT" > /dev/null

  if [ $? -ne 0 ]; then
    echo "Error: Phase 0 draft failed"
    exit 1
  fi

  if [ $round -lt $PHASE_0_MAX_ROUNDS ]; then
    detect_fabrication "$OUTPUT_DIR/phase-0.md" "0" "block"

    JUDGE_0_PROMPT="You are a peer reviewer auditing a methodological landscape for genuine divergence.

## Phase Output to Review

\`\`\`
$(cat "$OUTPUT_DIR/phase-0.md")
\`\`\`

## Research Input (for context)

\`\`\`
$(cat "$INPUT_FILE")
\`\`\`

## Judge Instructions

Read the Phase 0 divergence audit requirements carefully:

\`\`\`
$(cat phases/judge-phase-0.md)
\`\`\`

## Action Required

- Output file: $OUTPUT_DIR/phase-0.md
- If all 5 checks pass (Inclusion Test, Distinguishing Assumption Test, Synthesis Implication Test, Contested Terms Coverage, Evidence Flags Specificity) AND min 3 forks AND min 2 contested terms AND min 2 flags: confirm PASS (no changes to file).
- If any check fails: write a targeted critique to $OUTPUT_DIR/phase-0-judge-notes.md and do NOT modify the phase-0.md file yet. The critique will be prepended to the revision prompt.
- If the topic is low-ambiguity, add a '## Landscape Note: Low Ambiguity Topic' section with justification.
"

    claude --dangerously-skip-permissions "$JUDGE_0_PROMPT" > /dev/null

    if [ $? -ne 0 ]; then
      echo "Error: Phase 0 judge failed"
      exit 1
    fi

    # Check if judge issued a critique (phase-0-judge-notes.md exists)
    if [ -f "$OUTPUT_DIR/phase-0-judge-notes.md" ]; then
      echo "  → Targeted revision needed — revising with critique"

      # Revision pass: prepend critique to prompt and re-draft
      REVISION_PROMPT="You previously drafted a Phase 0 Landscape & Forks. The reviewer issued this targeted critique:

\`\`\`
$(cat "$OUTPUT_DIR/phase-0-judge-notes.md")
\`\`\`

## Your Task

Address this critique by revising \`$OUTPUT_DIR/phase-0.md\`. Do not rewrite the entire file — focus on the specific gaps flagged.

## Phase Instructions (for reference)

\`\`\`
$(cat phases/phase-0-landscape.md)
\`\`\`

## Research Input (for reference)

\`\`\`
$(cat "$INPUT_FILE")
\`\`\`

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-0.md\`.
- Do not remove content that was correct; only improve the flagged sections.
"

      claude --dangerously-skip-permissions "$REVISION_PROMPT" > /dev/null
      if [ $? -ne 0 ]; then
        echo "Error: Phase 0 revision failed"
        exit 1
      fi

      rm "$OUTPUT_DIR/phase-0-judge-notes.md"
    else
      NEW_HASH=$(md5 -q "$OUTPUT_DIR/phase-0.md" 2>/dev/null || echo "")

      if [ "$PREV_HASH" = "$NEW_HASH" ]; then
        echo "  ✓ Quality confirmed (no changes needed)"
        break
      else
        echo "  → Improvements applied — re-reviewing"
      fi
    fi
  fi
done

echo "✓ Phase 0 complete"

# =============================================================================
# PHASE 1: Title & Abstract (with iterative judge loop)
# =============================================================================

echo "[Phase 1/10] Generating Title & Abstract..."

PHASE_1_MAX_ROUNDS=3

for round in $(seq 1 $PHASE_1_MAX_ROUNDS); do
  echo "  [Draft/Review $round/$PHASE_1_MAX_ROUNDS]"

  PREV_HASH=$(md5 -q "$OUTPUT_DIR/phase-1.md" 2>/dev/null || echo "")

  # Extract Phase 0 output for Phase 1 dependency
  PHASE_0_OUTPUT=$(cat "$OUTPUT_DIR/phase-0.md")

  PHASE_1_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 1 of the PRISMA workflow: Title & Abstract (PRISMA Items 1–12).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Input research file: $INPUT_FILE
- Output file: $OUTPUT_DIR/phase-1.md
- Review start date: $START_DATE

## Phase 0: Landscape & Forks (read before writing anything)

\`\`\`
$PHASE_0_OUTPUT
\`\`\`

## Phase Instructions

Read the contents of the phase file carefully:

\`\`\`
$(cat phases/phase-1-title-abstract.md)
\`\`\`

## Research Input

\`\`\`
$(cat "$INPUT_FILE")
\`\`\`

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-1.md\` in the specified sections.
- Follow PRISMA 2020 requirements exactly.
- This is an isolated session: do not expect prior context. Generate a complete, self-contained title and abstract.
"

  claude --dangerously-skip-permissions "$PHASE_1_PROMPT" > /dev/null

  if [ $? -ne 0 ]; then
    echo "Error: Phase 1 draft failed"
    exit 1
  fi

  if [ $round -lt $PHASE_1_MAX_ROUNDS ]; then
    detect_fabrication "$OUTPUT_DIR/phase-1.md" "1" "block"

    JUDGE_1_PROMPT="You are a peer reviewer for a high-impact medical journal performing a PRISMA 2020 compliance audit.

## Phase Output to Review

\`\`\`
$(cat "$OUTPUT_DIR/phase-1.md")
\`\`\`

## Research Input (for context)

\`\`\`
$(cat "$INPUT_FILE")
\`\`\`

## Judge Instructions

Read the PRISMA 2020 audit requirements carefully:

\`\`\`
$(cat phases/judge-phase-1.md)
\`\`\`

## Action Required

- Output file: $OUTPUT_DIR/phase-1.md
- If all 12 abstract items are present, labeled, substantive, and consistent: confirm PASS (no changes to file).
- If any item is missing, unlabeled, generic, or contains fabricated data: **rewrite the file in-place** with improvements.
- Preserve all [DATA REQUIRED] and [PLACEHOLDER: ...] markers — do not fill them in.
- Do not remove or lose any content that was already correct; only improve deficient sections.
"

    claude --dangerously-skip-permissions "$JUDGE_1_PROMPT" > /dev/null

    if [ $? -ne 0 ]; then
      echo "Error: Phase 1 judge failed"
      exit 1
    fi

    NEW_HASH=$(md5 -q "$OUTPUT_DIR/phase-1.md" 2>/dev/null || echo "")

    if [ "$PREV_HASH" = "$NEW_HASH" ]; then
      echo "  ✓ Quality confirmed (no changes needed)"
      break
    else
      echo "  → Improvements applied — re-reviewing"
    fi
  fi
done

echo "✓ Phase 1 complete"

# =============================================================================
# PHASE 2: Introduction (with iterative judge loop)
# =============================================================================

echo "[Phase 2/18] Generating Introduction..."

PHASE_2_MAX_ROUNDS=2

for round in $(seq 1 $PHASE_2_MAX_ROUNDS); do
  echo "  [Draft/Review $round/$PHASE_2_MAX_ROUNDS]"

  PREV_HASH=$(md5 -q "$OUTPUT_DIR/phase-2.md" 2>/dev/null || echo "")

  # Extract Phase 1 full output as dependency for context
  PHASE_1_OUTPUT=$(cat "$OUTPUT_DIR/phase-1.md")

  # Extract Fork Commitment from Phase 1
  PHASE_1_FORK_COMMITMENT=$(sed -n '/^## Fork Commitment$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-1.md" | sed '1d;$d')
  validate_extraction "PHASE_1_FORK_COMMITMENT" "$PHASE_1_FORK_COMMITMENT" "Fork Commitment"

  PHASE_2_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 2 of the PRISMA workflow: Introduction (PRISMA Items 3–4: Rationale and Objectives).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Input research file: $INPUT_FILE
- Output file: $OUTPUT_DIR/phase-2.md

## Framing Commitment (from Phase 1)

\`\`\`
$PHASE_1_FORK_COMMITMENT
\`\`\`

Use this as the authoritative resolution of all ambiguous terms and comparator definitions. Do not re-open these choices.

## Prior Output (Phase 1 dependency)

### Phase 1: Title & Abstract
\`\`\`
$PHASE_1_OUTPUT
\`\`\`

## Phase Instructions

Read the contents of the phase file carefully:

\`\`\`
$(cat phases/phase-2-introduction.md)
\`\`\`

## Research Input

\`\`\`
$(cat "$INPUT_FILE")
\`\`\`

## Training-Data Contamination Rule

You will be tempted to draw on your pre-training knowledge about this topic. You MUST NOT make any of the following statements without wrapping them in \`[TRAINING-DATA CLAIM: ...]\`:

- Any statement that cites or implies a body of empirical research (\"studies have shown\", \"evidence suggests\", \"the literature demonstrates\")
- Any statement attributing a finding to named researchers, trials, or reviews
- Any statement of field-level consensus (\"it is widely accepted\", \"most researchers agree\")
- Any prevalence or incidence statistic not present verbatim in the research input
- Any comparative claim about intervention effectiveness

The \`[TRAINING-DATA CLAIM: ...]\` wrapper signals that this claim requires verification before the protocol is finalized. It is not a placeholder for data — it is a flag for human review.

Acceptable untagged content: statements of definitional or logical form, structural descriptions of fork differences, and the contents of the research input itself quoted verbatim.

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-2.md\` in the specified sections.
- Use the Phase 1 Title and Abstract provided above to ground your rationale and objectives.
- Follow PRISMA 2020 requirements exactly.
- This is an isolated session: generate a complete, self-contained Introduction.
"

  claude --dangerously-skip-permissions "$PHASE_2_PROMPT" > /dev/null

  if [ $? -ne 0 ]; then
    echo "Error: Phase 2 draft failed"
    exit 1
  fi

  if [ $round -lt $PHASE_2_MAX_ROUNDS ]; then
    detect_fabrication "$OUTPUT_DIR/phase-2.md" "2" "block"

    JUDGE_2_PROMPT="You are a peer reviewer for a high-impact medical journal performing a PRISMA 2020 compliance audit.

## Phase Output to Review

\`\`\`
$(cat "$OUTPUT_DIR/phase-2.md")
\`\`\`

## Phase 1 Context (for consistency checking)

\`\`\`
$PHASE_1_OUTPUT
\`\`\`

## Research Input (for context)

\`\`\`
$(cat "$INPUT_FILE")
\`\`\`

## Judge Instructions

Read the PRISMA 2020 audit requirements carefully:

\`\`\`
$(cat phases/judge-phase-2.md)
\`\`\`

## Action Required

- Output file: $OUTPUT_DIR/phase-2.md
- If both Item 13 and Item 14 are present, labeled, substantive, and consistent with Phase 1 PICO: confirm PASS (no changes).
- If any item is missing, unlabeled, generic, or inconsistent: **rewrite the file in-place**.
- Preserve all content that is correct; only improve deficient sections.
"

    claude --dangerously-skip-permissions "$JUDGE_2_PROMPT" > /dev/null

    if [ $? -ne 0 ]; then
      echo "Error: Phase 2 judge failed"
      exit 1
    fi

    NEW_HASH=$(md5 -q "$OUTPUT_DIR/phase-2.md" 2>/dev/null || echo "")

    if [ "$PREV_HASH" = "$NEW_HASH" ]; then
      echo "  ✓ Quality confirmed (no changes needed)"
      break
    else
      echo "  → Improvements applied — re-reviewing"
    fi
  fi
done

# Red-Team Pass: Phase 2 (adversarial review for unsourced claims)
echo "  [Red-Team Pass] Running adversarial review of Phase 2..."

RED_TEAM_2_PROMPT="You are a scientific adversary. Your ONLY job: find claims not traceable to the research input and not wrapped in a placeholder tag ([DATA REQUIRED], [SPECIFY], [PLACEHOLDER], [TRAINING-DATA CLAIM], [CHOICE]).

Do NOT reward structure or PRISMA compliance. Only find unsourced factual claims.

For each suspect claim: quote it verbatim (≤25 words), classify as Category A (cites/implies empirical literature), Category B (states methodological norm), or Category C (causal/comparative assertion), and verdict FLAGGED (unsourced) or ACCEPTABLE (structure/logic only).

Write findings to \`$OUTPUT_DIR/phase-2-redteam.md\`. If zero FLAGGED claims: write exactly 'REDTEAM PASS: No unsourced claims found.' and nothing else.

## Text Under Review

\`\`\`
$(cat "$OUTPUT_DIR/phase-2.md")
\`\`\`

## Research Input (ground truth)

\`\`\`
$(cat "$INPUT_FILE")
\`\`\`"

claude --dangerously-skip-permissions "$RED_TEAM_2_PROMPT" > /dev/null

if [ -f "$OUTPUT_DIR/phase-2-redteam.md" ]; then
  if ! grep -q "^REDTEAM PASS:" "$OUTPUT_DIR/phase-2-redteam.md"; then
    echo "  ⚠️  Red-team flagged unsourced claims in phase-2.md — running remediation"
    REMEDIATE_2_PROMPT="You are fixing unsourced claims in a systematic review protocol.

Read the phase-2.md file and the red-team findings. For each FLAGGED claim, convert it to an appropriate placeholder:
- [TRAINING-DATA CLAIM: ...] if it's a training-data assertion
- [SPECIFY: ...] if it's a methodological choice
- Keep unchanged any ACCEPTABLE claims

Rewrite \`$OUTPUT_DIR/phase-2.md\` in-place with these conversions.

## Phase 2 Output
\`\`\`
$(cat "$OUTPUT_DIR/phase-2.md")
\`\`\`

## Red-Team Findings
\`\`\`
$(cat "$OUTPUT_DIR/phase-2-redteam.md")
\`\`\`"
    claude --dangerously-skip-permissions "$REMEDIATE_2_PROMPT" > /dev/null
  fi
  rm -f "$OUTPUT_DIR/phase-2-redteam.md"
fi

echo "✓ Phase 2 complete"

# =============================================================================
# PHASE 3a: Search Protocol (with iterative judge loop — 3 rounds max)
# =============================================================================

echo "[Phase 3a/18] Generating Search Protocol..."

PHASE_3A_MAX_ROUNDS=3

for round in $(seq 1 $PHASE_3A_MAX_ROUNDS); do
  echo "  [Round $round/$PHASE_3A_MAX_ROUNDS]"
  PREV_HASH=$(md5 -q "$OUTPUT_DIR/phase-3a.md" 2>/dev/null || echo "")

  # Extract Fork Commitment from Phase 1 for consistency
  PHASE_1_FORK_COMMITMENT=$(sed -n '/^## Fork Commitment$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-1.md" | sed '1d;$d')

  PHASE_3A_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task
Execute Phase 3a of the PRISMA workflow: Search Protocol (PRISMA Items 3–6).

## Working Directory & Output
- Work in: $OUTPUT_DIR
- Input research file: $INPUT_FILE
- Output file: $OUTPUT_DIR/phase-3a.md

## Framing Commitment (from Phase 1)

\`\`\`
$PHASE_1_FORK_COMMITMENT
\`\`\`

Use this as the authoritative resolution of all ambiguous terms and comparator definitions. Do not re-open these choices.

## Phase Instructions
$(cat phases/phase-3a-search-protocol.md)

## Research Input
$(cat "$INPUT_FILE")

## Important Notes
- Write all output to \`$OUTPUT_DIR/phase-3a.md\`.
- Follow PRISMA 2020 requirements exactly.
- Use [SPECIFY: ...] placeholders for concrete values.
"

  claude --dangerously-skip-permissions "$PHASE_3A_PROMPT" > /dev/null
  if [ $? -ne 0 ]; then echo "Error: Phase 3a draft failed"; exit 1; fi

  if [ $round -lt $PHASE_3A_MAX_ROUNDS ]; then
    detect_fabrication "$OUTPUT_DIR/phase-3a.md" "3a" "block"

    JUDGE_3A_PROMPT="You are a peer reviewer performing a PRISMA 2020 compliance audit.

## Phase Output to Review
$(cat "$OUTPUT_DIR/phase-3a.md")

## Judge Instructions
$(cat phases/judge-phase-3a.md)

## Action Required
- Output file: $OUTPUT_DIR/phase-3a.md
- If all 4 items (3, 4, 5, 6) are present, labeled, detailed, grounded in PICO: confirm PASS (no changes).
- Else: rewrite the file in-place with improvements.
- Preserve all [SPECIFY: ...] markers.
"

    claude --dangerously-skip-permissions "$JUDGE_3A_PROMPT" > /dev/null
    if [ $? -ne 0 ]; then echo "Error: Phase 3a judge failed"; exit 1; fi

    NEW_HASH=$(md5 -q "$OUTPUT_DIR/phase-3a.md" 2>/dev/null || echo "")
    if [ "$PREV_HASH" = "$NEW_HASH" ]; then
      echo "  ✓ Quality confirmed"
      break
    else
      echo "  → Improvements applied"
    fi
  fi
done

# Red-Team Pass: Phase 3a (adversarial review for unsourced claims)
echo "  [Red-Team Pass] Running adversarial review of Phase 3a..."

RED_TEAM_3A_PROMPT="You are a scientific adversary. Your ONLY job: find claims not traceable to the research input and not wrapped in a placeholder tag ([DATA REQUIRED], [SPECIFY], [PLACEHOLDER], [TRAINING-DATA CLAIM], [CHOICE]).

Do NOT reward structure or PRISMA compliance. Only find unsourced factual claims.

For each suspect claim: quote it verbatim (≤25 words), classify as Category A (cites/implies empirical literature), Category B (states methodological norm), or Category C (causal/comparative assertion), and verdict FLAGGED (unsourced) or ACCEPTABLE (structure/logic only).

Write findings to \`$OUTPUT_DIR/phase-3a-redteam.md\`. If zero FLAGGED claims: write exactly 'REDTEAM PASS: No unsourced claims found.' and nothing else.

## Text Under Review

\`\`\`
$(cat "$OUTPUT_DIR/phase-3a.md")
\`\`\`

## Research Input (ground truth)

\`\`\`
$(cat "$INPUT_FILE")
\`\`\`"

claude --dangerously-skip-permissions "$RED_TEAM_3A_PROMPT" > /dev/null

if [ -f "$OUTPUT_DIR/phase-3a-redteam.md" ]; then
  if ! grep -q "^REDTEAM PASS:" "$OUTPUT_DIR/phase-3a-redteam.md"; then
    echo "  ⚠️  Red-team flagged unsourced claims in phase-3a.md — running remediation"
    REMEDIATE_3A_PROMPT="You are fixing unsourced claims in a systematic review protocol.

Read the phase-3a.md file and the red-team findings. For each FLAGGED claim, convert it to an appropriate placeholder:
- [TRAINING-DATA CLAIM: ...] if it's a training-data assertion
- [SPECIFY: ...] if it's a methodological choice
- Keep unchanged any ACCEPTABLE claims

Rewrite \`$OUTPUT_DIR/phase-3a.md\` in-place with these conversions.

## Phase 3a Output
\`\`\`
$(cat "$OUTPUT_DIR/phase-3a.md")
\`\`\`

## Red-Team Findings
\`\`\`
$(cat "$OUTPUT_DIR/phase-3a-redteam.md")
\`\`\`"
    claude --dangerously-skip-permissions "$REMEDIATE_3A_PROMPT" > /dev/null
  fi
  rm -f "$OUTPUT_DIR/phase-3a-redteam.md"
fi

echo "✓ Phase 3a complete"

# =============================================================================
# PHASE 3b: Extraction & Assessment (with iterative judge loop — 2 rounds max)
# =============================================================================

echo "[Phase 3b/18] Generating Extraction & Assessment..."

PHASE_3B_MAX_ROUNDS=2

for round in $(seq 1 $PHASE_3B_MAX_ROUNDS); do
  echo "  [Round $round/$PHASE_3B_MAX_ROUNDS]"
  PREV_HASH=$(md5 -q "$OUTPUT_DIR/phase-3b.md" 2>/dev/null || echo "")

  PHASE_3A_ELIGIBILITY=$(sed -n '/^## Eligibility Criteria$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3a.md" | sed '1d;$d')
  validate_extraction "PHASE_3A_ELIGIBILITY" "$PHASE_3A_ELIGIBILITY" "Eligibility Criteria"

  # Extract Fork Commitment from Phase 1 for consistency
  PHASE_1_FORK_COMMITMENT=$(sed -n '/^## Fork Commitment$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-1.md" | sed '1d;$d')

  PHASE_3B_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task
Execute Phase 3b of the PRISMA workflow: Extraction & Assessment (PRISMA Items 7, 8, 10a, 10b, 11).

## Working Directory & Output
- Work in: $OUTPUT_DIR
- Output file: $OUTPUT_DIR/phase-3b.md

## Framing Commitment (from Phase 1)

\`\`\`
$PHASE_1_FORK_COMMITMENT
\`\`\`

Use this as the authoritative resolution of all ambiguous terms and comparator definitions. Do not re-open these choices.

## Prior Output (Phase 3a dependency)
### Eligibility Criteria
\`\`\`
$PHASE_3A_ELIGIBILITY
\`\`\`

## Phase Instructions
$(cat phases/phase-3b-extraction-assessment.md)

## Research Input
$(cat "$INPUT_FILE")

## Important Notes
- Write all output to \`$OUTPUT_DIR/phase-3b.md\`.
- Reference the Eligibility Criteria from Phase 3a.
- Use [SPECIFY: ...] placeholders for concrete values.
"

  claude --dangerously-skip-permissions "$PHASE_3B_PROMPT" > /dev/null
  if [ $? -ne 0 ]; then echo "Error: Phase 3b draft failed"; exit 1; fi

  if [ $round -lt $PHASE_3B_MAX_ROUNDS ]; then
    detect_fabrication "$OUTPUT_DIR/phase-3b.md" "3b" "block"

    JUDGE_3B_PROMPT="You are a peer reviewer performing a PRISMA 2020 compliance audit.

## Phase Output to Review
$(cat "$OUTPUT_DIR/phase-3b.md")

## Phase 3a Context (for consistency)
### Eligibility Criteria
\`\`\`
$PHASE_3A_ELIGIBILITY
\`\`\`

## Judge Instructions
$(cat phases/judge-phase-3b.md)

## Action Required
- Output file: $OUTPUT_DIR/phase-3b.md
- If all 5 items (7, 8, 10a, 10b, 11) are present, labeled, detailed, consistent with 3a: confirm PASS (no changes).
- Else: rewrite the file in-place.
- Preserve all [SPECIFY: ...] markers.
"

    claude --dangerously-skip-permissions "$JUDGE_3B_PROMPT" > /dev/null
    if [ $? -ne 0 ]; then echo "Error: Phase 3b judge failed"; exit 1; fi

    NEW_HASH=$(md5 -q "$OUTPUT_DIR/phase-3b.md" 2>/dev/null || echo "")
    if [ "$PREV_HASH" = "$NEW_HASH" ]; then
      echo "  ✓ Quality confirmed"
      break
    else
      echo "  → Improvements applied"
    fi
  fi
done

echo "✓ Phase 3b complete"

# =============================================================================
# PHASE 3c: Synthesis Methods & GRADE (with iterative judge loop — 3 rounds max)
# =============================================================================

echo "[Phase 3c/18] Generating Synthesis Methods & GRADE Setup..."

PHASE_3C_MAX_ROUNDS=3

for round in $(seq 1 $PHASE_3C_MAX_ROUNDS); do
  echo "  [Round $round/$PHASE_3C_MAX_ROUNDS]"
  PREV_HASH=$(md5 -q "$OUTPUT_DIR/phase-3c.md" 2>/dev/null || echo "")

  # Extract Phase 3a and 3b dependencies
  PHASE_3A_ELIGIBILITY=$(sed -n '/^## Eligibility Criteria$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3a.md" | sed '1d;$d')
  validate_extraction "PHASE_3A_ELIGIBILITY" "$PHASE_3A_ELIGIBILITY" "Eligibility Criteria"
  PHASE_3B_EFFECT_MEASURES=$(sed -n '/^## Effect Measures$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3b.md" | sed '1d;$d')
  validate_extraction "PHASE_3B_EFFECT_MEASURES" "$PHASE_3B_EFFECT_MEASURES" "Effect Measures"

  # Extract Fork Commitment from Phase 1 for consistency
  PHASE_1_FORK_COMMITMENT=$(sed -n '/^## Fork Commitment$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-1.md" | sed '1d;$d')

  PHASE_3C_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task
Execute Phase 3c of the PRISMA workflow: Synthesis Methods & GRADE Setup (PRISMA Items 13a–13f, 15).

## Working Directory & Output
- Work in: $OUTPUT_DIR
- Output file: $OUTPUT_DIR/phase-3c.md

## Framing Commitment (from Phase 1)

\`\`\`
$PHASE_1_FORK_COMMITMENT
\`\`\`

Use this as the authoritative resolution of all ambiguous terms and comparator definitions. Do not re-open these choices.

## Prior Outputs (Phase 3a & 3b dependencies)
### Eligibility Criteria (from Phase 3a)
\`\`\`
$PHASE_3A_ELIGIBILITY
\`\`\`

### Effect Measures (from Phase 3b)
\`\`\`
$PHASE_3B_EFFECT_MEASURES
\`\`\`

## Phase Instructions
$(cat phases/phase-3c-synthesis-grade.md)

## Research Input
$(cat "$INPUT_FILE")

## Important Notes
- Write all output to \`$OUTPUT_DIR/phase-3c.md\`.
- Include all sub-items (13a–13f) clearly labeled.
- Use [SPECIFY: ...] placeholders for concrete values.
"

  claude --dangerously-skip-permissions "$PHASE_3C_PROMPT" > /dev/null
  if [ $? -ne 0 ]; then echo "Error: Phase 3c draft failed"; exit 1; fi

  if [ $round -lt $PHASE_3C_MAX_ROUNDS ]; then
    detect_fabrication "$OUTPUT_DIR/phase-3c.md" "3c" "block"

    JUDGE_3C_PROMPT="You are a peer reviewer performing a PRISMA 2020 compliance audit.

## Phase Output to Review
$(cat "$OUTPUT_DIR/phase-3c.md")

## Phase 3a & 3b Context
### Eligibility Criteria
\`\`\`
$PHASE_3A_ELIGIBILITY
\`\`\`

### Effect Measures
\`\`\`
$PHASE_3B_EFFECT_MEASURES
\`\`\`

## Judge Instructions
$(cat phases/judge-phase-3c.md)

## Action Required
- Output file: $OUTPUT_DIR/phase-3c.md
- If all 7 items (13a–13f, 15) present, labeled, detailed, consistent: PASS (no changes).
- Else: rewrite the file.
- Preserve all [SPECIFY: ...] markers.
"

    claude --dangerously-skip-permissions "$JUDGE_3C_PROMPT" > /dev/null
    if [ $? -ne 0 ]; then echo "Error: Phase 3c judge failed"; exit 1; fi

    NEW_HASH=$(md5 -q "$OUTPUT_DIR/phase-3c.md" 2>/dev/null || echo "")
    if [ "$PREV_HASH" = "$NEW_HASH" ]; then
      echo "  ✓ Quality confirmed"
      break
    else
      echo "  → Improvements applied"
    fi
  fi
done

echo "✓ Phase 3c complete"

# =============================================================================
# PHASE 4a: Study Inventory (2 rounds max)
# =============================================================================

echo "[Phase 4a/18] Generating Study Inventory..."
PHASE_4A_MAX_ROUNDS=2
for round in $(seq 1 $PHASE_4A_MAX_ROUNDS); do
  echo "  [Round $round/$PHASE_4A_MAX_ROUNDS]"
  PREV_HASH=$(md5 -q "$OUTPUT_DIR/phase-4a.md" 2>/dev/null || echo "")

  PHASE_3A_ELIGIBILITY=$(sed -n '/^## Eligibility Criteria$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3a.md" | sed '1d;$d')
  PHASE_3C_SYNTHESIS=$(sed -n '/^## Synthesis Methods$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3c.md" | sed '1d;$d')
  PHASE_3C_GRADE=$(sed -n '/^## GRADE Setup$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3c.md" | sed '1d;$d')

  PHASE_4A_PROMPT="You are an expert systematic review author.
## Task: Execute Phase 4a: Study Inventory (PRISMA Items 16a–18)
## Output: $OUTPUT_DIR/phase-4a.md
## Context
### Eligibility Criteria
\`\`\`
$PHASE_3A_ELIGIBILITY
\`\`\`
### Synthesis Methods
\`\`\`
$PHASE_3C_SYNTHESIS
\`\`\`
### GRADE Setup
\`\`\`
$PHASE_3C_GRADE
\`\`\`
## Instructions
$(cat phases/phase-4a-study-inventory.md)
## Input
$(cat "$INPUT_FILE")
## Notes: Use [DATA REQUIRED: ...] placeholders."

  claude --dangerously-skip-permissions "$PHASE_4A_PROMPT" > /dev/null
  if [ $? -ne 0 ]; then echo "Error: Phase 4a draft failed"; exit 1; fi

  if [ $round -lt $PHASE_4A_MAX_ROUNDS ]; then
    detect_fabrication "$OUTPUT_DIR/phase-4a.md" "4a" "block"

    JUDGE_4A_PROMPT="You are a peer reviewer auditing PRISMA compliance.
## Phase Output
$(cat "$OUTPUT_DIR/phase-4a.md")
## Judge Instructions
$(cat phases/judge-phase-4a.md)
## Action Required
- Output: $OUTPUT_DIR/phase-4a.md
- If all 4 items present, labeled, detailed: PASS (no changes).
- Else: rewrite. Preserve [DATA REQUIRED: ...] markers."

    claude --dangerously-skip-permissions "$JUDGE_4A_PROMPT" > /dev/null
    if [ $? -ne 0 ]; then echo "Error: Phase 4a judge failed"; exit 1; fi

    NEW_HASH=$(md5 -q "$OUTPUT_DIR/phase-4a.md" 2>/dev/null || echo "")
    if [ "$PREV_HASH" = "$NEW_HASH" ]; then echo "  ✓ Quality confirmed"; break; else echo "  → Improvements applied"; fi
  fi
done
echo "✓ Phase 4a complete"

# =============================================================================
# PHASE 4b: Statistical Results (2 rounds max)
# =============================================================================

echo "[Phase 4b/18] Generating Statistical Results..."
PHASE_4B_MAX_ROUNDS=2
for round in $(seq 1 $PHASE_4B_MAX_ROUNDS); do
  echo "  [Round $round/$PHASE_4B_MAX_ROUNDS]"
  PREV_HASH=$(md5 -q "$OUTPUT_DIR/phase-4b.md" 2>/dev/null || echo "")

  PHASE_3C_SYNTHESIS=$(sed -n '/^## Synthesis Methods$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3c.md" | sed '1d;$d')
  PHASE_4A_CHARACTERISTICS=$(sed -n '/^## Study Characteristics$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-4a.md" | sed '1d;$d')

  PHASE_4B_PROMPT="You are an expert systematic review author.
## Task: Execute Phase 4b: Statistical Results (PRISMA Items 19, 20a–20d)
## Output: $OUTPUT_DIR/phase-4b.md
## Context
### Synthesis Methods
\`\`\`
$PHASE_3C_SYNTHESIS
\`\`\`
### Study Characteristics
\`\`\`
$PHASE_4A_CHARACTERISTICS
\`\`\`
## Instructions
$(cat phases/phase-4b-statistical-results.md)
## Input
$(cat "$INPUT_FILE")
## Notes: Include items 20a–20d labeled. Use [DATA REQUIRED: ...] for numeric values."

  claude --dangerously-skip-permissions "$PHASE_4B_PROMPT" > /dev/null
  if [ $? -ne 0 ]; then echo "Error: Phase 4b draft failed"; exit 1; fi

  if [ $round -lt $PHASE_4B_MAX_ROUNDS ]; then
    detect_fabrication "$OUTPUT_DIR/phase-4b.md" "4b" "block"

    JUDGE_4B_PROMPT="You are a peer reviewer auditing PRISMA compliance.
## Phase Output
$(cat "$OUTPUT_DIR/phase-4b.md")
## Judge Instructions
$(cat phases/judge-phase-4b.md)
## Action Required
- Output: $OUTPUT_DIR/phase-4b.md
- If all 5 items (19, 20a–20d) present, labeled, detailed: PASS.
- Else: rewrite. Preserve [DATA REQUIRED: ...] markers."

    claude --dangerously-skip-permissions "$JUDGE_4B_PROMPT" > /dev/null
    if [ $? -ne 0 ]; then echo "Error: Phase 4b judge failed"; exit 1; fi

    NEW_HASH=$(md5 -q "$OUTPUT_DIR/phase-4b.md" 2>/dev/null || echo "")
    if [ "$PREV_HASH" = "$NEW_HASH" ]; then echo "  ✓ Quality confirmed"; break; else echo "  → Improvements applied"; fi
  fi
done
echo "✓ Phase 4b complete"

# =============================================================================
# PHASE 4c: Evidence Quality (2 rounds max)
# =============================================================================

echo "[Phase 4c/18] Generating Evidence Quality Assessment..."
PHASE_4C_MAX_ROUNDS=2
for round in $(seq 1 $PHASE_4C_MAX_ROUNDS); do
  echo "  [Round $round/$PHASE_4C_MAX_ROUNDS]"
  PREV_HASH=$(md5 -q "$OUTPUT_DIR/phase-4c.md" 2>/dev/null || echo "")

  PHASE_3C_GRADE=$(sed -n '/^## GRADE Setup$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3c.md" | sed '1d;$d')
  PHASE_4B_SYNTHESIS=$(awk '/^## Synthesis Results$/{found=1;next} found && /^## /{exit} found{print}' "$OUTPUT_DIR/phase-4b.md")

  PHASE_4C_PROMPT="You are an expert systematic review author.
## Task: Execute Phase 4c: Evidence Quality (PRISMA Items 21, 22 — GRADE & SoF)
## Output: $OUTPUT_DIR/phase-4c.md
## Context
### GRADE Setup
\`\`\`
$PHASE_3C_GRADE
\`\`\`
### Synthesis Results
\`\`\`
$PHASE_4B_SYNTHESIS
\`\`\`
## Instructions
$(cat phases/phase-4c-evidence-quality.md)
## Input
$(cat "$INPUT_FILE")
## Notes: Include SoF table structure. Use [DATA REQUIRED: ...] for GRADE ratings and absolute effects."

  claude --dangerously-skip-permissions "$PHASE_4C_PROMPT" > /dev/null
  if [ $? -ne 0 ]; then echo "Error: Phase 4c draft failed"; exit 1; fi

  if [ $round -lt $PHASE_4C_MAX_ROUNDS ]; then
    detect_fabrication "$OUTPUT_DIR/phase-4c.md" "4c" "block"

    JUDGE_4C_PROMPT="You are a peer reviewer auditing PRISMA compliance.
## Phase Output
$(cat "$OUTPUT_DIR/phase-4c.md")
## Judge Instructions
$(cat phases/judge-phase-4c.md)
## Action Required
- Output: $OUTPUT_DIR/phase-4c.md
- If both items (21, 22) present, labeled, detailed, includes SoF table: PASS.
- Else: rewrite. Preserve [DATA REQUIRED: ...] markers."

    claude --dangerously-skip-permissions "$JUDGE_4C_PROMPT" > /dev/null
    if [ $? -ne 0 ]; then echo "Error: Phase 4c judge failed"; exit 1; fi

    NEW_HASH=$(md5 -q "$OUTPUT_DIR/phase-4c.md" 2>/dev/null || echo "")
    if [ "$PREV_HASH" = "$NEW_HASH" ]; then echo "  ✓ Quality confirmed"; break; else echo "  → Improvements applied"; fi
  fi
done
echo "✓ Phase 4c complete"

# =============================================================================
# PHASE 5: Discussion (2 rounds max)
# =============================================================================

echo "[Phase 5/18] Generating Discussion..."
PHASE_5_MAX_ROUNDS=2
for round in $(seq 1 $PHASE_5_MAX_ROUNDS); do
  echo "  [Round $round/$PHASE_5_MAX_ROUNDS]"
  PREV_HASH=$(md5 -q "$OUTPUT_DIR/phase-5.md" 2>/dev/null || echo "")

  PHASE_3C_GRADE=$(sed -n '/^## GRADE Setup$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3c.md" | sed '1d;$d')
  PHASE_4C_GRADE=$(sed -n '/^## GRADE Ratings$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-4c.md" | sed '1d;$d')
  PHASE_4B_SYNTHESIS=$(awk '/^## Synthesis Results$/{found=1;next} found && /^## /{exit} found{print}' "$OUTPUT_DIR/phase-4b.md")

  PHASE_5_PROMPT="You are an expert systematic review author.
## Task: Execute Phase 5: Discussion (PRISMA Items 23a–23d)
## Output: $OUTPUT_DIR/phase-5.md
## Context
### GRADE Setup
\`\`\`
$PHASE_3C_GRADE
\`\`\`
### GRADE Ratings
\`\`\`
$PHASE_4C_GRADE
\`\`\`
### Synthesis Results
\`\`\`
$PHASE_4B_SYNTHESIS
\`\`\`
## Instructions
$(cat phases/phase-5-discussion.md)
## Input
$(cat "$INPUT_FILE")
## Notes: Items 23a–23d labeled. Use GRADE certainty language. Use [DATA REQUIRED: ...] for results."

  claude --dangerously-skip-permissions "$PHASE_5_PROMPT" > /dev/null
  if [ $? -ne 0 ]; then echo "Error: Phase 5 draft failed"; exit 1; fi

  if [ $round -lt $PHASE_5_MAX_ROUNDS ]; then
    detect_fabrication "$OUTPUT_DIR/phase-5.md" "5" "block"

    JUDGE_5_PROMPT="You are a peer reviewer auditing PRISMA compliance.
## Phase Output
$(cat "$OUTPUT_DIR/phase-5.md")
## Judge Instructions
$(cat phases/judge-phase-5.md)
## Action Required
- Output: $OUTPUT_DIR/phase-5.md
- If all 4 items (23a–23d) present, labeled, grounded in GRADE, no fabricated data: PASS.
- Else: rewrite."

    claude --dangerously-skip-permissions "$JUDGE_5_PROMPT" > /dev/null
    if [ $? -ne 0 ]; then echo "Error: Phase 5 judge failed"; exit 1; fi

    NEW_HASH=$(md5 -q "$OUTPUT_DIR/phase-5.md" 2>/dev/null || echo "")
    if [ "$PREV_HASH" = "$NEW_HASH" ]; then echo "  ✓ Quality confirmed"; break; else echo "  → Improvements applied"; fi
  fi
done
echo "✓ Phase 5 complete"

# Detect potential fabrication in Phase 5
detect_fabrication "$OUTPUT_DIR/phase-5.md" "5"

# =============================================================================
# PHASE 6: Other Information (2 rounds max)
# =============================================================================

echo "[Phase 6/18] Generating Other Information..."
PHASE_6_MAX_ROUNDS=2
for round in $(seq 1 $PHASE_6_MAX_ROUNDS); do
  echo "  [Round $round/$PHASE_6_MAX_ROUNDS]"
  PREV_HASH=$(md5 -q "$OUTPUT_DIR/phase-6.md" 2>/dev/null || echo "")

  PHASE_6_PROMPT="You are an expert systematic review author.
## Task: Execute Phase 6: Other Information (PRISMA Items 24a–27)
## Output: $OUTPUT_DIR/phase-6.md
## Date: $START_DATE
## Instructions
$(cat phases/phase-6-other.md)
## Input
$(cat "$INPUT_FILE")
## Notes: Items 24a–27 labeled. Use [PLACEHOLDER: ...] for URLs, DOIs, registration numbers — do NOT invent them."

  claude --dangerously-skip-permissions "$PHASE_6_PROMPT" > /dev/null
  if [ $? -ne 0 ]; then echo "Error: Phase 6 draft failed"; exit 1; fi

  if [ $round -lt $PHASE_6_MAX_ROUNDS ]; then
    detect_fabrication "$OUTPUT_DIR/phase-6.md" "6" "block"

    JUDGE_6_PROMPT="You are a peer reviewer auditing PRISMA compliance.
## Phase Output
$(cat "$OUTPUT_DIR/phase-6.md")
## Judge Instructions
$(cat phases/judge-phase-6.md)
## Action Required
- Output: $OUTPUT_DIR/phase-6.md
- If all items labeled, placeholders used for URLs/DOIs/reg numbers: PASS.
- Else: rewrite. Check for fabricated URLs, DOIs, author names."

    claude --dangerously-skip-permissions "$JUDGE_6_PROMPT" > /dev/null
    if [ $? -ne 0 ]; then echo "Error: Phase 6 judge failed"; exit 1; fi

    NEW_HASH=$(md5 -q "$OUTPUT_DIR/phase-6.md" 2>/dev/null || echo "")
    if [ "$PREV_HASH" = "$NEW_HASH" ]; then echo "  ✓ Quality confirmed"; break; else echo "  → Improvements applied"; fi
  fi
done
echo "✓ Phase 6 complete"

# Check Phase 6 for potentially fabricated URLs/DOIs
if grep -E 'https?://|doi\.org' "$OUTPUT_DIR/phase-6.md" | grep -v PLACEHOLDER > /dev/null; then
  echo "⚠️ Warning: Potential generated URLs or DOIs detected in phase-6.md. Review before use."
fi

# =============================================================================
# Completion
# =============================================================================

echo ""
echo "✅ PRISMA systematic review complete (with iterative quality review)!"
echo ""
echo "Architecture: 9 draft phases + multi-round judge loops"
echo "  - Phases 1, 3a, 3c: 3 review rounds each (critical upstream phases)"
echo "  - Phases 2, 3b, 4a–6: 2 review rounds each"
echo "  - Early exit when judge confirms quality (hash-detected)"
echo "  - Average: ~24 sessions; worst case: ~32 sessions"
echo ""
echo "Output location: $OUTPUT_DIR"
echo ""
echo "Generated files (all PRISMA 2020 compliant):"
echo "  - phase-1.md (Title & Abstract — Items 1–12)"
echo "  - phase-2.md (Introduction — Items 13–14)"
echo "  - phase-3a.md (Search Protocol — Items 3–6)"
echo "  - phase-3b.md (Extraction & Assessment — Items 7, 8, 10a, 10b, 11)"
echo "  - phase-3c.md (Synthesis Methods & GRADE — Items 13a–13f, 15)"
echo "  - phase-4a.md (Study Inventory — Items 16a–18)"
echo "  - phase-4b.md (Statistical Results — Items 19, 20a–20d)"
echo "  - phase-4c.md (Evidence Quality — Items 21–22)"
echo "  - phase-5.md (Discussion — Items 23a–23d)"
echo "  - phase-6.md (Other Information — Items 24a–27)"
echo ""
echo "Review the files and fill in any [DATA REQUIRED], [SPECIFY: ...], or [PLACEHOLDER: ...] markers with real data."
echo "All 27 PRISMA 2020 checklist items are addressed."
