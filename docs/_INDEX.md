# docs/ — Master Index

<!-- reviewed: 2026-02-13 -->

> **Purpose:** Master navigation for all operational documentation.
> This is the system of record. Agents read AND update these docs as the project evolves.

## Architecture

| Document | Purpose | Last Reviewed |
|----------|---------|---------------|
| [OVERVIEW.md](architecture/OVERVIEW.md) | System architecture narrative | 2026-02-11 |
| [DEPENDENCY_RULES.md](architecture/DEPENDENCY_RULES.md) | Module and layer dependency constraints | 2026-02-11 |
| [ADR/000-template.md](architecture/ADR/000-template.md) | Architecture Decision Record template | 2026-02-11 |
| [ADR/001-five-agent-entry-points.md](architecture/ADR/001-five-agent-entry-points.md) | Why five routing files instead of one or duplicated content | 2026-02-11 |
| [ADR/002-thirty-day-freshness-default.md](architecture/ADR/002-thirty-day-freshness-default.md) | Why 30 days is the default freshness threshold | 2026-02-11 |
| [ADR/003-plans-at-top-level.md](architecture/ADR/003-plans-at-top-level.md) | Why plans/ is top-level, not under docs/ | 2026-02-11 |

## Golden Rules

| Document | Purpose | Last Reviewed |
|----------|---------|---------------|
| [PRINCIPLES.md](golden-rules/PRINCIPLES.md) | Non-negotiable design principles | 2026-02-11 |
| [CODING_STANDARDS.md](golden-rules/CODING_STANDARDS.md) | Coding conventions and standards | 2026-02-11 |

## Quality

| Document | Purpose | Last Reviewed |
|----------|---------|---------------|
| [QUALITY_SCORECARD.md](quality/QUALITY_SCORECARD.md) | Quality scoring rubric | 2026-02-11 |
| [TECH_DEBT_REGISTER.md](quality/TECH_DEBT_REGISTER.md) | Known tech debt tracking | 2026-02-11 |

## Workflows

| Document | Purpose | Last Reviewed |
|----------|---------|---------------|
| [DEVELOPMENT.md](workflows/DEVELOPMENT.md) | Development workflow and conventions | 2026-02-13 |
| [PR_REVIEW.md](workflows/PR_REVIEW.md) | Pull request review process | 2026-02-11 |
| [TESTING.md](workflows/TESTING.md) | Testing strategy and guidelines | 2026-02-13 |
| [DOC_GARDENING.md](workflows/DOC_GARDENING.md) | Documentation maintenance process | 2026-02-11 |

## Agent Guide

| Document | Purpose | Last Reviewed |
|----------|---------|---------------|
| [ONBOARDING.md](agent-guide/ONBOARDING.md) | New agent orientation | 2026-02-13 |
| [COMMON_TASKS.md](agent-guide/COMMON_TASKS.md) | Recipes for frequent operations | 2026-02-13 |

## Session

| Document | Purpose | Last Reviewed |
|----------|---------|---------------|
| [SESSION_HANDOFF.md](session/SESSION_HANDOFF.md) | Current session state for continuity | 2026-02-11 |

---

## Freshness Policy

- Every doc carries a `<!-- reviewed: YYYY-MM-DD -->` comment
- Docs older than **30 days** are flagged by `scripts/check-doc-freshness.sh`
- When modifying a doc, always update its reviewed date
- Run freshness checks before major releases
