# Agent Onboarding Guide

<!-- reviewed: 2026-02-13 -->

Welcome to **Context_Map** — an agent-first repository template that demonstrates every pattern it teaches. This repo serves as both a working template you can fork and a living guide for agent-led development. Everything here is designed so that an AI agent can orient itself, do meaningful work, and hand off cleanly to the next session.

## First Steps

1. **Read your agent entry file.** Open your dedicated entry file at the repository root (`CLAUDE.md`, `CODEX.md`, `.cursorrules`, `.github/copilot-instructions.md`, or `AGENTS.md` for any other agent). It contains the routing table and key constraints. If you arrived via `README.md`, the "AI Agents" section there will point you to the right file.
2. **Read this document.** You are here. This guide fills in the context you need beyond the entry file.
3. **Check the session handoff.** Open `docs/session/SESSION_HANDOFF.md` to see what the previous session accomplished, what is in progress, and what to do next.

Do not skip any of these steps. The sequence matters: entry file first, then onboarding, then handoff.

## Repository Structure

```
Context_Map/
├── AGENTS.md / CLAUDE.md /  # Agent entry files — start here every session
│   CODEX.md / .cursorrules  # (see your specific file)
├── docs/
│   ├── _INDEX.md            # Master navigation with freshness dates
│   ├── architecture/        # System design and ADRs
│   │   └── ADR/             # Architecture Decision Records
│   ├── golden-rules/        # Principles and coding standards
│   ├── quality/             # Scorecard and tech debt
│   ├── workflows/           # Development, PR, testing, doc processes
│   ├── agent-guide/         # Orientation and task recipes (you are here)
│   │   ├── ONBOARDING.md
│   │   └── COMMON_TASKS.md
│   └── session/             # Live session state
│       └── SESSION_HANDOFF.md
├── plans/                   # Execution plans (active/, completed/)
│   ├── _INDEX.md
│   └── _TEMPLATE.md
├── guide/                   # Static reference — the methodology itself
│   └── ...                  # DO NOT modify these files
└── scripts/                 # Validation and maintenance utilities
    └── ...
```

### What lives where

| Directory | Purpose | Mutability |
|---|---|---|
| `docs/` | Operational truth (system of record) | Updated as project evolves |
| `docs/agent-guide/` | Agent orientation and task recipes | Rarely changes |
| `docs/session/` | Session handoff, scratch state | Updated every session |
| `docs/architecture/ADR/` | Architecture Decision Records | Append-only |
| `plans/` | Execution plans for current work | Updated as work progresses |
| `guide/` | The methodology reference | **Read-only for agents** |
| `scripts/` | Validation and enforcement | Changed only when tooling evolves |

## Key Principles

These principles govern how this repository works. Internalize them before making changes.

### Progressive Disclosure
Not everything needs to be read up front. Your agent entry file gives you a routing table. Follow the pointers to the specific doc you need. Do not read every file in the repo at session start — read only what is relevant to the current task.

### Single Source of Truth
Every fact lives in exactly one place. If a process is documented in `COMMON_TASKS.md`, other files should link to it rather than restate it. When you find duplicated content, consolidate it and replace the duplicate with a pointer.

### Docs as System of Record
Documentation is not an afterthought — it is the system itself. Plans, decisions, and handoffs are tracked in Markdown files under version control. If it is not written down, it did not happen.

### Freshness Dates
Every document carries a `<!-- reviewed: YYYY-MM-DD -->` tag near the top. When you edit a document, update this tag to today's date. When you read a document and the tag is more than 30 days old, flag it for review.

## How to Navigate

Follow this path to find any information in the repo:

1. **Start at your agent entry file** (`CLAUDE.md`, `CODEX.md`, `.cursorrules`, `.github/copilot-instructions.md`, or `AGENTS.md`). It contains the routing table.
2. **Find the right section** in the routing table. Each entry points to an `_INDEX.md` or a specific document.
3. **Open the `_INDEX.md`** for that section. Index files list every document in their directory with a one-line description.
4. **Open the specific document** you need.

If you cannot find something after following this path, it probably does not exist yet. Create it in the appropriate location following the template in `plans/_TEMPLATE.md`.

## Session Protocol

Every agent session follows this cycle:

1. **Check in.** Read `docs/session/SESSION_HANDOFF.md`. Understand what was done, what is in progress, and what is blocked.
2. **Plan.** Decide what to work on based on the handoff's Next Steps and any new instructions from the user.
3. **Work.** Execute tasks following the recipes in `COMMON_TASKS.md`. Commit early, commit often.
4. **Hand off.** Update `docs/session/SESSION_HANDOFF.md` with what you accomplished, what remains, and what the next agent should do.

The handoff update is not optional. A session without a handoff update is a session that never happened.

## What NOT to Do

These are hard rules. Violating them creates drift, confusion, and broken workflows.

- **Do not modify files in `guide/`.** That directory contains the static methodology reference. It is read-only for agents. If you believe it needs a change, note it in the handoff as an open question.
- **Do not duplicate content across documents.** If information exists in one file, link to it from others. Do not copy-paste explanations between docs.
- **Do not skip freshness dates.** Every document you create or edit must have an up-to-date `<!-- reviewed: YYYY-MM-DD -->` tag. No exceptions.
- **Do not skip the handoff.** Even if your session was short or you hit a dead end, update the handoff document.
- **Do not read the entire repo at session start.** Follow progressive disclosure. Read the root file, the handoff, and then only the docs relevant to your current task.
- **Do not create files outside the established structure.** New docs go in `docs/`. New plans go in `plans/active/`. New decisions go in `docs/architecture/ADR/`. Do not invent new top-level directories.
- **Do not make architectural decisions without recording them.** If you choose between two approaches, write an ADR. Future agents need to know why, not just what.

## Quick Reference

| I need to... | Go to... |
|---|---|
| Start a new session | `docs/session/SESSION_HANDOFF.md` |
| Find a task recipe | `docs/agent-guide/COMMON_TASKS.md` |
| Understand the methodology | `guide/` (read-only) |
| Create an execution plan | `plans/_TEMPLATE.md` → `plans/active/` |
| Record a decision | `docs/architecture/ADR/` |
| Run validation checks | `scripts/` |
| Find anything else | Your agent entry file routing table |

---

*This document is part of the Context_Map agent-first repository template.*
