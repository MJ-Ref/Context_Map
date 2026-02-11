# CLAUDE.md — Claude Code Entry Point

> **Purpose:** Configuration and routing for Claude Code sessions.
> Read this first, then follow the routing table to `docs/`.

## Project Overview

**Context_Map** is an agent-first repository template and guide. It demonstrates the patterns it teaches. When cloned as a template, it's a working example. When read as documentation, every file is a live demonstration.

## Routing Table

| I need to...                        | Go to                                  |
|-------------------------------------|----------------------------------------|
| Understand the architecture         | `docs/architecture/OVERVIEW.md`        |
| Learn the dependency rules          | `docs/architecture/DEPENDENCY_RULES.md`|
| See non-negotiable principles       | `docs/golden-rules/PRINCIPLES.md`      |
| Follow coding standards             | `docs/golden-rules/CODING_STANDARDS.md`|
| Check quality scorecard             | `docs/quality/QUALITY_SCORECARD.md`    |
| Follow development workflow         | `docs/workflows/DEVELOPMENT.md`        |
| Review a PR                         | `docs/workflows/PR_REVIEW.md`          |
| Update documentation                | `docs/workflows/DOC_GARDENING.md`      |
| Get onboarded                       | `docs/agent-guide/ONBOARDING.md`       |
| Do common tasks                     | `docs/agent-guide/COMMON_TASKS.md`     |
| Hand off session                    | `docs/session/SESSION_HANDOFF.md`      |
| Find all docs                       | `docs/_INDEX.md`                       |
| Create an execution plan            | `plans/_INDEX.md`                      |

## Skills Available

- `/context-map scaffold` — Scaffold the Context_Map structure in a new project
- `/context-map audit` — Audit an existing project against the Context_Map standard
- `/session-handoff` — Generate a session handoff document for continuity

## Session Protocol

1. **Start:** Read `docs/session/SESSION_HANDOFF.md` for prior context
2. **Work:** Follow `docs/workflows/DEVELOPMENT.md` for all changes
3. **Quality:** Check work against `docs/quality/QUALITY_SCORECARD.md`
4. **End:** Update `docs/session/SESSION_HANDOFF.md` before closing

## Commit Conventions

- Use conventional commits: `feat:`, `fix:`, `docs:`, `chore:`, `refactor:`, `test:`
- Run `scripts/check-structure.sh` before committing
- Update `<!-- reviewed: YYYY-MM-DD -->` tags on any modified docs

## Key Constraints

1. **Never duplicate content** from `docs/` into this file — route to it instead
2. **Never modify `guide/`** — it is read-only educational content
3. **Always update freshness dates** when modifying documentation
4. **Record architectural decisions** in `docs/architecture/ADR/`
5. **Plans are temporal** — use `plans/active/` and `plans/completed/`

---

*This file is a routing table. All operational truth lives in `docs/`.*
