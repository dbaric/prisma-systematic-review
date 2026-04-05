# (Vibe) PRISMA Systematic Review Workflow

A tool for executing systematic reviews following **PRISMA 2020** guidelines.

## About PRISMA

PRISMA (Preferred Reporting Items for Systematic reviews and Meta-Analyses) is a guideline designed to improve the reporting of systematic reviews. PRISMA 2020 provides authors with guidance and examples for completely reporting:

- Why a systematic review was done
- What methods were used
- What results were found

This tool helps structure the entire systematic review process according to PRISMA 2020 standards, including abstract, introduction, methods, results, and more.

## Repository Contents

- **prisma-workflow.md** — Comprehensive PRISMA 2020 workflow with all 27 reporting items
- **run.sh** — Script to execute the PRISMA workflow on research inputs
- **inputs/** — Directory for research input files

## How to Use

```bash
./run.sh <input-file>
```

**Example:**
```bash
./run.sh depression-cbt-adults.txt
```

This single command will:
- ✓ Parse theme from filename
- ✓ Validate the input file exists
- ✓ Create `output/{theme}/` directory
- ✓ Copy all 6 phase templates
- ✓ Update the workflow index
- ✓ Read research input from `inputs/`
- ✓ Trigger the PRISMA 2020 workflow with Claude

**Input file format:** `theme-name.txt`

Examples:
- `depression-cbt-adults.txt`
- `covid-vaccine-efficacy.txt`
- `mindfulness-anxiety-elderly.txt`

## Requirements

- Claude CLI installed (`claude` command available)
- Bash shell
- Input files in the `inputs/` directory

## Example

```bash
./run.sh 20260405_mindfulness-anxiety.txt
```

This runs your research input through the PRISMA 2020 systematic review framework, producing output that covers all required sections and reporting items.
