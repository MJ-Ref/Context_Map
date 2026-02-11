# GitHub Copilot Instructions — Context_Map

> **Purpose:** Configuration and routing for GitHub Copilot sessions.
> Read this first, then follow the routing table to `docs/`.

## Project Overview

**Context_Map** is an agent-first repository template and guide. It demonstrates
the patterns it teaches: progressive disclosure, docs-as-system-of-record,
execution plans, quality scoring, and architectural enforcement.

When cloned as a template, it's a working example. When read as documentation,
every file is a live demonstration.

## Routing Table

| I need to...                        | Go to                                  |
|-------------------------------------|----------------------------------------|
| Understand the architecture         | `docs/architecture/OVERVIEW.md`        |
| Learn the dependency rules          | `docs/architecture/DEPENDENCY_RULES.md`|
| See non-negotiable principles       | `docs/golden-rules/PRINCIPLES.md`      |
| Follow coding standards             | `docs/golden-rules/CODING_STANDARDS.md`|
| Check quality scorecard             | `docs/quality/QUALITY_SCORECARD.md`    |
| Review tech debt                    | `docs/quality/TECH_DEBT_REGISTER.md`   |
| Follow development workflow         | `docs/workflows/DEVELOPMENT.md`        |
| Review a PR                         | `docs/workflows/PR_REVIEW.md`          |
| Write or run tests                  | `docs/workflows/TESTING.md`            |
| Update documentation                | `docs/workflows/DOC_GARDENING.md`      |
| Get onboarded as a new agent        | `docs/agent-guide/ONBOARDING.md`       |
| Do common tasks                     | `docs/agent-guide/COMMON_TASKS.md`     |
| Hand off a session                  | `docs/session/SESSION_HANDOFF.md`      |
| Find all docs (master index)        | `docs/_INDEX.md`                       |
| Create or review an execution plan  | `plans/_INDEX.md`                      |
| Record an architecture decision     | `docs/architecture/ADR/000-template.md`|

## Key Constraints

1. **Single source of truth.** `docs/` is the system of record. All agent entry
   files (AGENTS.md, CLAUDE.md, .cursorrules, this file) are routing tables.
   Never duplicate content from `docs/` into any entry file.
2. **`guide/` is read-only.** Educational content is immutable reference material.
   Agents never modify files in `guide/`.
3. **Update freshness dates.** Every doc carries a `<!-- reviewed: YYYY-MM-DD -->`
   comment. Update it whenever you modify the document.
4. **Plans are temporal.** Execution plans in `plans/` have lifecycle states
   (Draft, Active, Completed, Abandoned). Documentation in `docs/` is evergreen.
5. **Architecture decisions are recorded.** Significant structural changes require
   an ADR in `docs/architecture/ADR/`.

## Development Conventions

- **Conventional commits:** `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`
- **Validation before commit:** Run `scripts/check-structure.sh` and
  `scripts/check-agent-files.sh` before committing changes
- **Session handoffs:** Update `docs/session/SESSION_HANDOFF.md` at session end
- **Quality checks:** Validate against `docs/quality/QUALITY_SCORECARD.md`

## Repository Layout

```
docs/           -> Operational docs (system of record -- agents read AND update)
guide/          -> Educational content (read-only reference -- never modify)
plans/          -> Execution plans with lifecycle states
scripts/        -> Enforcement and validation scripts
.claude/skills/ -> Claude Code slash-command skills
```

## Session Protocol

1. **Start:** Read `docs/session/SESSION_HANDOFF.md` for prior context
2. **Work:** Follow `docs/workflows/DEVELOPMENT.md` for all changes
3. **Quality:** Check work against `docs/quality/QUALITY_SCORECARD.md`
4. **End:** Update `docs/session/SESSION_HANDOFF.md` before closing

---

*This file is a routing table. All operational truth lives in `docs/`.*
