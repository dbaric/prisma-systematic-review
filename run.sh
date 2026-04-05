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

# Copy all template files
for phase in {1..6}; do
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

echo "Setup complete. Starting PRISMA workflow (per-phase isolated sessions)..."
echo ""

# =============================================================================
# PHASE 1: Title & Abstract
# =============================================================================

echo "[Phase 1/6] Generating Title & Abstract..."

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

echo "[Phase 2/6] Generating Introduction..."

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
# PHASE 3: Methods
# =============================================================================

echo "[Phase 3/6] Generating Methods..."

PHASE_3_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 3 of the PRISMA workflow: Methods (PRISMA Items 3–15).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Input research file: $INPUT_FILE
- Output file: $OUTPUT_DIR/phase-3.md

## Phase Instructions

Read the contents of the main phase file:

\`\`\`
$(cat phases/phase-3-methods.md)
\`\`\`

### Synthesis Methods Sub-guidance

For items 13a–13f (Synthesis Methods), also read this sub-phase guidance:

\`\`\`
$(cat phases/phase-3-synthesis-methods.md)
\`\`\`

## Research Input

\`\`\`
$(cat "$INPUT_FILE")
\`\`\`

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-3.md\` in the specified sections.
- Include all synthesis methods sub-items (13a–13f) clearly labeled within the Synthesis Methods section.
- Follow PRISMA 2020 requirements exactly.
- This is an isolated session: generate a complete, self-contained Methods section.
- Remember: no real data exists. Use [SPECIFY: ...] placeholders for concrete values.
"

claude --dangerously-skip-permissions "$PHASE_3_PROMPT" > /dev/null

if [ $? -ne 0 ]; then
  echo "Error: Phase 3 failed"
  exit 1
fi

echo "✓ Phase 3 complete"

# =============================================================================
# PHASE 4: Results
# =============================================================================

echo "[Phase 4/6] Generating Results..."

# Extract Phase 3 dependencies: Eligibility Criteria, Synthesis Methods, and GRADE Setup
PHASE_3_ELIGIBILITY=$(sed -n '/^## Eligibility Criteria$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3.md" | sed '1d;$d')
PHASE_3_SYNTHESIS=$(sed -n '/^## Synthesis Methods$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3.md" | sed '1d;$d')
PHASE_3_GRADE=$(sed -n '/^## GRADE Setup$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3.md" | sed '1d;$d')

PHASE_4_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 4 of the PRISMA workflow: Results (PRISMA Items 16–22).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Output file: $OUTPUT_DIR/phase-4.md

## Prior Outputs (Phase 3 dependencies)

### Eligibility Criteria
\`\`\`
$PHASE_3_ELIGIBILITY
\`\`\`

### Synthesis Methods
\`\`\`
$PHASE_3_SYNTHESIS
\`\`\`

### GRADE Setup
\`\`\`
$PHASE_3_GRADE
\`\`\`

## Phase Instructions

Read the contents of the phase file:

\`\`\`
$(cat phases/phase-4-results.md)
\`\`\`

## Important Notes

- Write all output to \`$OUTPUT_DIR/phase-4.md\` in the specified sections.
- Reference the Eligibility Criteria, Synthesis Methods, and GRADE Setup provided above.
- Follow PRISMA 2020 requirements exactly.
- This is an isolated session: generate a complete, self-contained Results section.
- Remember: no real studies exist. Use [DATA REQUIRED: ...] placeholders for numeric values.
"

claude --dangerously-skip-permissions "$PHASE_4_PROMPT" > /dev/null

if [ $? -ne 0 ]; then
  echo "Error: Phase 4 failed"
  exit 1
fi

echo "✓ Phase 4 complete"

# =============================================================================
# PHASE 5: Discussion
# =============================================================================

echo "[Phase 5/6] Generating Discussion..."

# Extract Phase 4 dependencies: GRADE Ratings and Synthesis Results
PHASE_4_GRADE=$(sed -n '/^## GRADE Ratings$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-4.md" | sed '1d;$d')
PHASE_4_SYNTHESIS=$(sed -n '/^## Synthesis Results$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-4.md" | sed '1d;$d')

# Also extract Phase 3 GRADE Setup for Phase 5 context
PHASE_3_GRADE=$(sed -n '/^## GRADE Setup$/,/^## [^[:space:]]/p' "$OUTPUT_DIR/phase-3.md" | sed '1d;$d')

PHASE_5_PROMPT="You are an expert systematic review author working with PRISMA 2020 guidelines.

## Your Task

Execute Phase 5 of the PRISMA workflow: Discussion (PRISMA Items 23a–23d).

## Working Directory & Output

- Work in: $OUTPUT_DIR
- Output file: $OUTPUT_DIR/phase-5.md

## Prior Outputs (Phase 3 & 4 dependencies)

### GRADE Setup (from Phase 3)
\`\`\`
$PHASE_3_GRADE
\`\`\`

### GRADE Ratings (from Phase 4)
\`\`\`
$PHASE_4_GRADE
\`\`\`

### Synthesis Results (from Phase 4)
\`\`\`
$PHASE_4_SYNTHESIS
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

echo "[Phase 6/6] Generating Other Information..."

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
echo "  - phase-3.md (Methods)"
echo "  - phase-4.md (Results)"
echo "  - phase-5.md (Discussion)"
echo "  - phase-6.md (Other Information)"
echo ""
echo "Review the files and fill in any [DATA REQUIRED] or [SPECIFY: ...] placeholders with real study data."
