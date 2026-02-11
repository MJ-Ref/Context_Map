# AGENTS.md — Universal Agent Entry Point

> **Purpose:** Single entry point for any AI agent working in this repository.
> Route to the right doc fast, then get out of the way.

## Quick Orientation

This is **Context_Map** — an agent-first repository template and guide.
It demonstrates the patterns it teaches: progressive disclosure, docs-as-system-of-record, execution plans, quality scoring, and architectural enforcement.

## Repository Layout

```
docs/           → Operational docs (system of record — agents read AND update)
guide/          → Educational content (read-only reference — never modify)
plans/          → Execution plans with lifecycle states
scripts/        → Enforcement and validation scripts
.claude/skills/ → Claude Code slash-command skills
```

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

## Key Rules

1. **docs/ is the system of record.** All operational truth lives there. Never duplicate content into agent entry files.
2. **guide/ is read-only.** It explains the patterns. Agents never modify it.
3. **Five agent entry points** (AGENTS.md, CLAUDE.md, CODEX.md, .cursorrules, copilot-instructions.md) all route to `docs/`.
4. **plans/ are temporal.** They move from `active/` to `completed/`. Docs are evergreen.
5. **Update freshness dates** when you modify any doc (format: `<!-- reviewed: YYYY-MM-DD -->`).
6. **Run validation** before committing: `scripts/check-structure.sh`, `scripts/check-agent-files.sh`.

## How to Start

1. Read `docs/agent-guide/ONBOARDING.md` for full orientation
2. Check `plans/active/` for any in-progress execution plans
3. Consult the routing table above for your specific task
4. When done, update `docs/session/SESSION_HANDOFF.md` for the next agent

## Architecture Decision Records

New architectural decisions must be recorded in `docs/architecture/ADR/` using the template at `docs/architecture/ADR/000-template.md`. Never make significant structural changes without an ADR.

---

*This file is a routing table, not a knowledge base. All content lives in `docs/`.*
