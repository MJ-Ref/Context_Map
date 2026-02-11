# Architecture Overview

<!-- reviewed: 2026-02-11 -->

This document describes the architecture of Context_Map — a repository template
designed for agent-first development. The repo is both a working template and a
living guide: every pattern it teaches is demonstrated by its own structure.

---

## Core Principle: Progressive Disclosure

Agents and humans arrive with different questions at different times. The
architecture addresses this with **progressive disclosure** — a layered
information model where each level reveals more detail only when needed.

```
Entry Files          Index              Docs               Code
(CLAUDE.md,       (docs/INDEX.md)    (docs/*/*.md)       (scripts/, src/)
 README.md, ...)
      │                 │                  │                   │
      │  route to       │  enumerates      │  defines          │
      ├────────────────>├─────────────────>├──────────────────>│
      │                 │                  │                   │
    ~20 lines        ~80 lines        ~100-200 lines     implementation
```

An agent reading `CLAUDE.md` gets orientation in seconds. If it needs detail, it
follows a pointer to `docs/INDEX.md`. From there it navigates to the specific
document that answers its question. Code is the last resort, not the first stop.

This is not a convenience — it is a **load-bearing design decision**. Agents
operate under context-window constraints. Every unnecessary token reduces the
space available for reasoning. Progressive disclosure keeps early layers small
so agents can reserve context for the work that matters.

---

## Five Agent Entry Points

Multiple files sit at the repository root (or in agent-specific directories).
Each serves a different arrival context, but all route to the **same**
authoritative content in `docs/`.

| Entry Point | Audience | Purpose |
|---|---|---|
| `AGENTS.md` | Any AI agent (universal) | Universal routing table for all agents |
| `CLAUDE.md` | Claude Code agent | Orientation, constraints, pointers to docs/ |
| `CODEX.md` | OpenAI Codex agent | Orientation, constraints, pointers to docs/ |
| `.cursorrules` | Cursor agent | Quick constraints, routes to `.cursor/rules/global.mdc` |
| `.github/copilot-instructions.md` | GitHub Copilot | Code generation guidance, routes to docs/ |

The critical invariant: **entry files never define policy**. They summarize and
route. The single source of truth for any rule, standard, or process lives in
`docs/`. This prevents drift between what an agent reads at the root and what a
human reads in the documentation.

---

## Three Content Zones

All written content lives in one of three zones. Each zone has a distinct
purpose, mutability model, and audience.

### 1. `docs/` — Operational, Mutable

```
docs/
  INDEX.md                  # Master navigation file
  architecture/             # System design and ADRs
  golden-rules/             # Standards, conventions, policies
  how-to/                   # Procedural guides for common tasks
  reference/                # Lookup tables, glossaries, config docs
```

This is the **operational core**. Content here governs how the project is built,
reviewed, and maintained. It is mutable — it changes as the project evolves —
but changes are controlled through review and freshness tags.

Every document in `docs/` carries a `<!-- reviewed: YYYY-MM-DD -->` tag. This
tag is machine-readable. Enforcement scripts flag documents whose review date
has drifted beyond a configurable threshold. Staleness is a bug.

### 2. `guide/` — Educational, Immutable

```
guide/
  PHILOSOPHY.md             # Why agent-first development matters
  GETTING_STARTED.md        # First-time walkthrough
  PATTERNS.md               # Reusable patterns with examples
  ANTI_PATTERNS.md          # Common mistakes and why they fail
  FAQ.md                    # Frequently asked questions
```

This is the **teaching layer**. Content here explains the ideas behind the
template. It is immutable in the sense that adopters do not need to modify it
for their project — it describes the methodology, not the project.

Guide content is deliberately separated from `docs/` so that project-specific
operational docs are never tangled with educational material. An agent working
on the project reads `docs/`. A human learning the methodology reads `guide/`.

### 3. `plans/` — Temporal, Lifecycle-Bound

```
plans/
  active/                   # Plans currently being executed
  completed/                # Archived plans for reference
  templates/                # Blank plan templates
```

Plans are **execution artifacts** with a lifecycle: draft, active, completed.
They reference `docs/` for standards (e.g., "follow CODING_STANDARDS.md for
naming") but are otherwise self-contained. Each plan carries enough context for
an agent to execute it without reading the entire repository.

When a plan is completed, it moves to `completed/`. This keeps `active/` small
and scannable — an agent listing active plans gets only what is in flight.

---

## Directory Structure

```
Context_Map/
├── CLAUDE.md                    # Agent entry point
├── README.md                    # Human entry point
├── .claude/
│   ├── settings.json            # Runtime configuration
│   └── skills/                  # Task-specific agent playbooks
├── docs/
│   ├── INDEX.md                 # Master navigation
│   ├── architecture/            # Design docs, ADRs
│   │   ├── OVERVIEW.md          # This file
│   │   ├── DEPENDENCY_RULES.md  # Layering constraints
│   │   └── ADR/                 # Architecture Decision Records
│   ├── golden-rules/            # Standards and conventions
│   ├── how-to/                  # Step-by-step procedures
│   └── reference/               # Lookup material
├── guide/
│   ├── PHILOSOPHY.md            # Methodology explanation
│   ├── GETTING_STARTED.md       # First-time walkthrough
│   ├── PATTERNS.md              # Reusable patterns
│   ├── ANTI_PATTERNS.md         # What to avoid
│   └── FAQ.md                   # Common questions
├── plans/
│   ├── active/                  # In-flight execution plans
│   ├── completed/               # Archived plans
│   └── templates/               # Plan templates
└── scripts/
    └── validate-structure.sh    # Architecture enforcement
```

Each area has a single responsibility:

- **Root entry files** — orientation and routing only.
- **`.claude/`** — agent runtime configuration and skill definitions.
- **`docs/`** — authoritative operational content. If a rule exists, it lives here.
- **`guide/`** — educational content. Explains the "why" behind the template.
- **`plans/`** — time-bound execution artifacts. Work in progress lives here.
- **`scripts/`** — automated enforcement. Validates structure, never modifies content.

---

## Enforcement Scripts

Architecture without enforcement decays. The `scripts/` directory contains
validation tools that verify structural invariants.

### What they check

- **Freshness tags**: Every `.md` file in `docs/` must contain a
  `<!-- reviewed: YYYY-MM-DD -->` tag. The script flags files where the review
  date exceeds a configurable staleness threshold (default: 90 days).
- **Broken links**: Internal cross-references between documents must resolve.
  A link to `CODING_STANDARDS.md` must point to an existing file.
- **Entry-point consistency**: `CLAUDE.md` and `README.md` must not define
  rules that contradict `docs/`. The script checks for known anti-patterns
  (inline policy, duplicated constraints).
- **Directory structure**: Required directories and files must exist. The
  template's skeleton is verified against an expected manifest.
- **ADR numbering**: ADR files must follow sequential numbering with no gaps.

### What they do not do

Enforcement scripts are **read-only validators**. They report violations but
never modify files. This is deliberate — automated fixes mask structural
problems that deserve human (or agent) judgment.

### Running validation

```bash
./scripts/validate-structure.sh
```

The script returns exit code 0 when all checks pass and non-zero when any
check fails. It is designed to run in CI and as a pre-commit hook.

---

## Design Rationale

This architecture optimizes for a specific workflow: an AI agent arrives at the
repository, needs to understand the project quickly, and then executes a task
with minimal supervision. Every design choice traces back to that workflow.

- **Progressive disclosure** reduces token waste in agent context windows.
- **Single source of truth in `docs/`** prevents agents from finding
  contradictory instructions in different files.
- **Separated content zones** let agents ignore educational content during
  task execution and ignore operational content during onboarding.
- **Freshness enforcement** ensures agents never act on stale guidance.
- **Self-contained plans** let agents execute without loading the full repo
  context.

The architecture is the product. If the structure breaks, the template fails.
That is why enforcement is automated, not aspirational.
