# PRISMA Systematic Review Workflow

Execute systematic reviews following **PRISMA 2020** guidelines.

## Quick Start

```bash
./run.sh theme-name.txt
```

Examples:
- `./run.sh depression-cbt-adults.txt`
- `./run.sh covid-vaccine-efficacy.txt`

The script parses your input, generates output in `output/{theme}/`, and runs the PRISMA workflow.

## What's Included

- **prisma-workflow.md** — PRISMA 2020 workflow with all 27 reporting items
- **run.sh** — Execution script
- **inputs/** — Research input files directory

## Requirements

- Claude CLI
- Bash shell
