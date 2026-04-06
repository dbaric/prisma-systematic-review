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

# Copy all template files (including new sub-phases)
for phase in 1 2 3a 3b 3c 4a 4b 4c 5 6; do
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

echo "Setup complete. Starting PRISMA workflow (9 isolated sessions)..."
echo ""

# =============================================================================
# PHASE 1: Title & Abstract
# =============================================================================

echo "[Phase 1/9] Generating Title & Abstract..."

PHASE_1_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 1 of the PRISMA workflow: Title & Abstract (PRISMA Items 1–12).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Input research file: $INPUT_FILE
- Output file: $OUTPUT_DIR/phase-1.md

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
  echo "Error: Phase 1 failed"
  exit 1
fi

echo "✓ Phase 1 complete"

# =============================================================================
# PHASE 2: Introduction
# =============================================================================

echo "[Phase 2/9] Generating Introduction..."

# Extract Phase 1 title as dependency
PHASE_1_TITLE=$(sed -n '/^## Title$/,/^## /p' "$OUTPUT_DIR/phase-1.md" | sed '1d;$d')

PHASE_2_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 2 of the PRISMA workflow: Introduction (PRISMA Items 13–14).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Input research file: $INPUT_FILE
- Output file: $OUTPUT_DIR/phase-2.md

## Prior Output (Phase 1 dependency)

### Phase 1 Title
\`\`\`
$PHASE_1_TITLE
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

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-2.md\` in the specified sections.
- Use the Phase 1 title provided above to ground your rationale and objectives.
- Follow PRISMA 2020 requirements exactly.
- This is an isolated session: generate a complete, self-contained Introduction.
"

claude --dangerously-skip-permissions "$PHASE_2_PROMPT" > /dev/null

if [ $? -ne 0 ]; then
  echo "Error: Phase 2 failed"
  exit 1
fi

echo "✓ Phase 2 complete"

# =============================================================================
# PHASE 3a: Search Protocol
# =============================================================================

echo "[Phase 3a/9] Generating Search Protocol..."

PHASE_3A_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 3a of the PRISMA workflow: Search Protocol (PRISMA Items 3–6).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Input research file: $INPUT_FILE
- Output file: $OUTPUT_DIR/phase-3a.md

## Phase Instructions

Read the contents of the phase file carefully:

\`\`\`
$(cat phases/phase-3a-search-protocol.md)
\`\`\`

## Research Input

\`\`\`
$(cat "$INPUT_FILE")
\`\`\`

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-3a.md\` in the specified sections.
- Follow PRISMA 2020 requirements exactly.
- This is an isolated session: generate a complete, self-contained Search Protocol section.
- Remember: no real data exists. Use [SPECIFY: ...] placeholders for concrete values.
"

claude --dangerously-skip-permissions "$PHASE_3A_PROMPT" > /dev/null

if [ $? -ne 0 ]; then
  echo "Error: Phase 3a failed"
  exit 1
fi

echo "✓ Phase 3a complete"

# =============================================================================
# PHASE 3b: Extraction & Assessment
# =============================================================================

echo "[Phase 3b/9] Generating Extraction & Assessment..."

# Extract Phase 3a dependency: Eligibility Criteria
PHASE_3A_ELIGIBILITY=$(sed -n '/^## Eligibility Criteria$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3a.md" | sed '1d;$d')

PHASE_3B_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 3b of the PRISMA workflow: Extraction & Assessment (PRISMA Items 7, 8, 10a, 10b, 11).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Output file: $OUTPUT_DIR/phase-3b.md

## Prior Output (Phase 3a dependency)

### Eligibility Criteria
\`\`\`
$PHASE_3A_ELIGIBILITY
\`\`\`

## Phase Instructions

Read the contents of the phase file carefully:

\`\`\`
$(cat phases/phase-3b-extraction-assessment.md)
\`\`\`

## Research Input

\`\`\`
$(cat "$INPUT_FILE")
\`\`\`

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-3b.md\` in the specified sections.
- Reference the Eligibility Criteria from Phase 3a to ground your data extraction strategy.
- Follow PRISMA 2020 requirements exactly.
- This is an isolated session: generate a complete, self-contained Extraction & Assessment section.
- Remember: no real data exists. Use [SPECIFY: ...] placeholders for concrete values.
"

claude --dangerously-skip-permissions "$PHASE_3B_PROMPT" > /dev/null

if [ $? -ne 0 ]; then
  echo "Error: Phase 3b failed"
  exit 1
fi

echo "✓ Phase 3b complete"

# =============================================================================
# PHASE 3c: Synthesis Methods & GRADE
# =============================================================================

echo "[Phase 3c/9] Generating Synthesis Methods & GRADE Setup..."

# Extract Phase 3a and 3b dependencies
PHASE_3A_ELIGIBILITY=$(sed -n '/^## Eligibility Criteria$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3a.md" | sed '1d;$d')
PHASE_3B_EFFECT_MEASURES=$(sed -n '/^## Effect Measures$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3b.md" | sed '1d;$d')

PHASE_3C_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 3c of the PRISMA workflow: Synthesis Methods & GRADE Setup (PRISMA Items 13a–13f, 15).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Output file: $OUTPUT_DIR/phase-3c.md

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

Read the contents of the phase file carefully:

\`\`\`
$(cat phases/phase-3c-synthesis-grade.md)
\`\`\`

## Research Input

\`\`\`
$(cat "$INPUT_FILE")
\`\`\`

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-3c.md\` in the specified sections.
- Include all synthesis methods sub-items (13a–13f) clearly labeled within the Synthesis Methods section.
- Follow PRISMA 2020 requirements exactly.
- This is an isolated session: generate a complete, self-contained Synthesis Methods, Evidence Assessment, and GRADE Setup section.
- Remember: no real data exists. Use [SPECIFY: ...] placeholders for concrete values.
"

claude --dangerously-skip-permissions "$PHASE_3C_PROMPT" > /dev/null

if [ $? -ne 0 ]; then
  echo "Error: Phase 3c failed"
  exit 1
fi

echo "✓ Phase 3c complete"

# =============================================================================
# PHASE 4a: Study Inventory
# =============================================================================

echo "[Phase 4a/9] Generating Study Inventory..."

# Extract Phase 3a, 3c dependencies
PHASE_3A_ELIGIBILITY=$(sed -n '/^## Eligibility Criteria$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3a.md" | sed '1d;$d')
PHASE_3C_SYNTHESIS=$(sed -n '/^## Synthesis Methods$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3c.md" | sed '1d;$d')
PHASE_3C_GRADE=$(sed -n '/^## GRADE Setup$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3c.md" | sed '1d;$d')

PHASE_4A_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 4a of the PRISMA workflow: Study Inventory (PRISMA Items 16a, 16b, 17, 18).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Output file: $OUTPUT_DIR/phase-4a.md

## Prior Outputs (Phase 3 dependencies)

### Eligibility Criteria (from Phase 3a)
\`\`\`
$PHASE_3A_ELIGIBILITY
\`\`\`

### Synthesis Methods (from Phase 3c)
\`\`\`
$PHASE_3C_SYNTHESIS
\`\`\`

### GRADE Setup (from Phase 3c)
\`\`\`
$PHASE_3C_GRADE
\`\`\`

## Phase Instructions

Read the contents of the phase file:

\`\`\`
$(cat phases/phase-4a-study-inventory.md)
\`\`\`

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-4a.md\` in the specified sections.
- Reference the Eligibility Criteria, Synthesis Methods, and GRADE Setup provided above.
- Follow PRISMA 2020 requirements exactly.
- This is an isolated session: generate a complete, self-contained Study Inventory section.
- Remember: no real studies exist. Use [DATA REQUIRED: ...] placeholders for numeric values.
"

claude --dangerously-skip-permissions "$PHASE_4A_PROMPT" > /dev/null

if [ $? -ne 0 ]; then
  echo "Error: Phase 4a failed"
  exit 1
fi

echo "✓ Phase 4a complete"

# =============================================================================
# PHASE 4b: Statistical Results
# =============================================================================

echo "[Phase 4b/9] Generating Statistical Results..."

# Extract Phase 3c and 4a dependencies
PHASE_3C_SYNTHESIS=$(sed -n '/^## Synthesis Methods$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3c.md" | sed '1d;$d')
PHASE_4A_CHARACTERISTICS=$(sed -n '/^## Study Characteristics$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-4a.md" | sed '1d;$d')

PHASE_4B_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 4b of the PRISMA workflow: Statistical Results (PRISMA Items 19, 20a–20d).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Output file: $OUTPUT_DIR/phase-4b.md

## Prior Outputs (Phase 3 & 4a dependencies)

### Synthesis Methods (from Phase 3c)
\`\`\`
$PHASE_3C_SYNTHESIS
\`\`\`

### Study Characteristics (from Phase 4a)
\`\`\`
$PHASE_4A_CHARACTERISTICS
\`\`\`

## Phase Instructions

Read the contents of the phase file:

\`\`\`
$(cat phases/phase-4b-statistical-results.md)
\`\`\`

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-4b.md\` in the specified sections.
- Include all 4 Synthesis Results sub-items (20a–20d) clearly labeled.
- Reference the Synthesis Methods and Study Characteristics provided above.
- Follow PRISMA 2020 requirements exactly.
- This is an isolated session: generate a complete, self-contained Statistical Results section.
- Remember: no real data exist. Use [DATA REQUIRED: ...] placeholders for numeric values and effect estimates.
"

claude --dangerously-skip-permissions "$PHASE_4B_PROMPT" > /dev/null

if [ $? -ne 0 ]; then
  echo "Error: Phase 4b failed"
  exit 1
fi

echo "✓ Phase 4b complete"

# =============================================================================
# PHASE 4c: Evidence Quality
# =============================================================================

echo "[Phase 4c/9] Generating Evidence Quality Assessment..."

# Extract Phase 3c and 4b dependencies
PHASE_3C_GRADE=$(sed -n '/^## GRADE Setup$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3c.md" | sed '1d;$d')
PHASE_4B_SYNTHESIS=$(sed -n '/^## Synthesis Results$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-4b.md" | sed '1d;$d')

PHASE_4C_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 4c of the PRISMA workflow: Evidence Quality (PRISMA Items 21, 22).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Output file: $OUTPUT_DIR/phase-4c.md

## Prior Outputs (Phase 3 & 4b dependencies)

### GRADE Setup (from Phase 3c)
\`\`\`
$PHASE_3C_GRADE
\`\`\`

### Synthesis Results (from Phase 4b)
\`\`\`
$PHASE_4B_SYNTHESIS
\`\`\`

## Phase Instructions

Read the contents of the phase file:

\`\`\`
$(cat phases/phase-4c-evidence-quality.md)
\`\`\`

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-4c.md\` in the specified sections.
- Reference the GRADE Setup and Synthesis Results provided above.
- Follow PRISMA 2020 requirements exactly.
- This is an isolated session: generate a complete, self-contained Evidence Quality section.
- Remember: no real data exist. Use [DATA REQUIRED: ...] placeholders for all numeric certainty judgments and SoF table entries.
"

claude --dangerously-skip-permissions "$PHASE_4C_PROMPT" > /dev/null

if [ $? -ne 0 ]; then
  echo "Error: Phase 4c failed"
  exit 1
fi

echo "✓ Phase 4c complete"

# =============================================================================
# PHASE 5: Discussion
# =============================================================================

echo "[Phase 5/9] Generating Discussion..."

# Extract Phase 4c dependencies: GRADE Ratings and Synthesis Results
PHASE_4C_GRADE=$(sed -n '/^## GRADE Ratings$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-4c.md" | sed '1d;$d')
PHASE_4B_SYNTHESIS=$(sed -n '/^## Synthesis Results$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-4b.md" | sed '1d;$d')

# Also extract Phase 3c GRADE Setup for Phase 5 context
PHASE_3C_GRADE=$(sed -n '/^## GRADE Setup$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3c.md" | sed '1d;$d')

PHASE_5_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 5 of the PRISMA workflow: Discussion (PRISMA Items 23a–23d).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Output file: $OUTPUT_DIR/phase-5.md

## Prior Outputs (Phase 3 & 4 dependencies)

### GRADE Setup (from Phase 3c)
\`\`\`
$PHASE_3C_GRADE
\`\`\`

### GRADE Ratings (from Phase 4c)
\`\`\`
$PHASE_4C_GRADE
\`\`\`

### Synthesis Results (from Phase 4b)
\`\`\`
$PHASE_4B_SYNTHESIS
\`\`\`

## Phase Instructions

Read the contents of the phase file:

\`\`\`
$(cat phases/phase-5-discussion.md)
\`\`\`

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-5.md\` in the specified sections.
- Reference the GRADE Ratings and Synthesis Results provided above.
- Follow PRISMA 2020 requirements exactly.
- This is an isolated session: generate a complete, self-contained Discussion section.
"

claude --dangerously-skip-permissions "$PHASE_5_PROMPT" > /dev/null

if [ $? -ne 0 ]; then
  echo "Error: Phase 5 failed"
  exit 1
fi

echo "✓ Phase 5 complete"

# =============================================================================
# PHASE 6: Other Information
# =============================================================================

echo "[Phase 6/9] Generating Other Information..."

PHASE_6_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 6 of the PRISMA workflow: Other Information (PRISMA Items 24a–27).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Output file: $OUTPUT_DIR/phase-6.md

## Phase Instructions

Read the contents of the phase file:

\`\`\`
$(cat phases/phase-6-other.md)
\`\`\`

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-6.md\` in the specified sections.
- Follow PRISMA 2020 requirements exactly.
- This is an isolated session: generate a complete, self-contained Other Information section.
"

claude --dangerously-skip-permissions "$PHASE_6_PROMPT" > /dev/null

if [ $? -ne 0 ]; then
  echo "Error: Phase 6 failed"
  exit 1
fi

echo "✓ Phase 6 complete"

# =============================================================================
# Completion
# =============================================================================

echo ""
echo "✅ PRISMA systematic review complete!"
echo ""
echo "Output location: $OUTPUT_DIR"
echo ""
echo "Generated files:"
echo "  - phase-1.md (Title & Abstract)"
echo "  - phase-2.md (Introduction)"
echo "  - phase-3a.md (Search Protocol)"
echo "  - phase-3b.md (Extraction & Assessment)"
echo "  - phase-3c.md (Synthesis Methods & GRADE)"
echo "  - phase-4a.md (Study Inventory)"
echo "  - phase-4b.md (Statistical Results)"
echo "  - phase-4c.md (Evidence Quality)"
echo "  - phase-5.md (Discussion)"
echo "  - phase-6.md (Other Information)"
echo ""
echo "Review the files and fill in any [DATA REQUIRED] or [SPECIFY: ...] placeholders with real study data."
