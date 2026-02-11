# Agent Onboarding Guide

<!-- reviewed: 2026-02-11 -->

Welcome to **Context_Map** — an agent-first repository template that demonstrates every pattern it teaches. This repo serves as both a working template you can fork and a living guide for agent-led development. Everything here is designed so that an AI agent can orient itself, do meaningful work, and hand off cleanly to the next session.

## First Steps

1. **Read the root agent file.** Open `AGENTS.md` or `CLAUDE.md` at the repository root. That file contains the top-level routing table and ground rules. It is the single entry point for every session.
2. **Read this document.** You are here. This guide fills in the context you need beyond the root agent file.
3. **Check the session handoff.** Open `docs/session/SESSION_HANDOFF.md` to see what the previous session accomplished, what is in progress, and what to do next.

Do not skip any of these steps. The sequence matters: root agent file first, then onboarding, then handoff.

## Repository Structure

```
Context_Map/
├── AGENTS.md / CLAUDE.md    # Root agent file — start here every session
├── docs/
│   ├── agent-guide/         # Orientation and task recipes (you are here)
│   │   ├── ONBOARDING.md
│   │   └── COMMON_TASKS.md
│   ├── session/             # Live session state
│   │   └── SESSION_HANDOFF.md
│   ├── plans/               # Execution plans (active/, completed/, templates/)
│   │   └── _INDEX.md
│   └── decisions/           # Architecture Decision Records
│       └── _INDEX.md
├── guide/                   # Static reference — the methodology itself
│   └── ...                  # DO NOT modify these files
├── scripts/                 # Validation and maintenance utilities
│   └── ...
└── src/                     # Application source code
```

### What lives where

| Directory | Purpose | Mutability |
|---|---|---|
| `docs/agent-guide/` | Agent orientation and task recipes | Rarely changes |
| `docs/session/` | Session handoff, scratch state | Updated every session |
| `docs/plans/` | Execution plans for current work | Updated as work progresses |
| `docs/decisions/` | Architecture Decision Records | Append-only |
| `guide/` | The methodology reference | **Read-only for agents** |
| `scripts/` | Validation, linting, maintenance | Changed only when tooling evolves |
| `src/` | Application source code | Changed during feature/fix work |

## Key Principles

These principles govern how this repository works. Internalize them before making changes.

### Progressive Disclosure
Not everything needs to be read up front. The root agent file gives you a routing table. Follow the pointers to the specific doc you need. Do not read every file in the repo at session start — read only what is relevant to the current task.

### Single Source of Truth
Every fact lives in exactly one place. If a process is documented in `COMMON_TASKS.md`, other files should link to it rather than restate it. When you find duplicated content, consolidate it and replace the duplicate with a pointer.

### Docs as System of Record
Documentation is not an afterthought — it is the system itself. Plans, decisions, and handoffs are tracked in Markdown files under version control. If it is not written down, it did not happen.

### Freshness Dates
Every document carries a `<!-- reviewed: YYYY-MM-DD -->` tag near the top. When you edit a document, update this tag to today's date. When you read a document and the tag is more than 90 days old, flag it for review.

## How to Navigate

Follow this path to find any information in the repo:

1. **Start at the root agent file** (`AGENTS.md` or `CLAUDE.md`). It contains the master routing table.
2. **Find the right section** in the routing table. Each entry points to an `_INDEX.md` or a specific document.
3. **Open the `_INDEX.md`** for that section. Index files list every document in their directory with a one-line description.
4. **Open the specific document** you need.

If you cannot find something after following this path, it probably does not exist yet. Create it in the appropriate location following the templates in `docs/plans/templates/`.

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
- **Do not create files outside the established structure.** New docs go in `docs/`. New plans go in `docs/plans/`. New decisions go in `docs/decisions/`. Do not invent new top-level directories.
- **Do not make architectural decisions without recording them.** If you choose between two approaches, write an ADR. Future agents need to know why, not just what.

## Quick Reference

| I need to... | Go to... |
|---|---|
| Start a new session | `docs/session/SESSION_HANDOFF.md` |
| Find a task recipe | `docs/agent-guide/COMMON_TASKS.md` |
| Understand the methodology | `guide/` (read-only) |
| Create an execution plan | `docs/plans/templates/` |
| Record a decision | `docs/decisions/` |
| Run validation checks | `scripts/` |
| Find anything else | Root agent file routing table |

---

*This document is part of the Context_Map agent-first repository template.*
