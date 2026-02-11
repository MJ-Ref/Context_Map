# Non-Negotiable Design Principles

<!-- reviewed: 2026-02-11 -->

> **Purpose:** Core beliefs that govern every decision in Context_Map projects.
> These are non-negotiable. If a change conflicts with a principle, the principle wins.

## 1. The Repo IS the Guide

Every pattern this project teaches is demonstrated in the repo itself. When cloned as a template, it's a working example. When read as documentation, every file is a live demonstration. There is no separate "reference implementation" — you're standing in it.

**Implication:** Never create a pattern in docs that isn't practiced in the repo structure.

## 2. Single Source of Truth

Content exists in exactly one place. Agent entry files (AGENTS.md, CLAUDE.md, .cursorrules, copilot-instructions.md) are routing tables — they point to `docs/`, they never duplicate it.

**Implication:** If you find the same information in two places, delete one and replace it with a pointer.

## 3. Progressive Disclosure

Information flows from general to specific: entry file (~100 lines) → index → detailed doc → code. An agent should find the right information in ≤3 hops. Never front-load detail that only matters in specific contexts.

**Implication:** Keep entry files under 150 lines. Push detail into dedicated docs.

## 4. Docs Are the System of Record

`docs/` is the operational truth. Code is the implementation. When they diverge, update whichever is wrong — but never silently let them drift. Documentation is not an afterthought; it's the first-class artifact that enables agent-led development.

**Implication:** Every significant change requires a corresponding doc update.

## 5. Separate the Temporal from the Evergreen

Execution plans (`plans/`) have lifecycle states (draft → active → completed). Documentation (`docs/`) is evergreen and continuously maintained. Educational content (`guide/`) is immutable reference material. Never conflate these.

**Implication:** Plans go in `plans/`. Lasting knowledge goes in `docs/`. Explanations go in `guide/`.

## 6. Enforce What Matters

If a rule is important enough to state, it's important enough to check automatically. Validation scripts exist for structure, freshness, and routing. Manual discipline is insufficient for agent-led development at scale.

**Implication:** Every principle that can be checked by script should be.

## 7. Architectural Decisions Are Recorded

Significant structural choices are captured in Architecture Decision Records (ADRs). The decision, context, options considered, and rationale are all preserved. Future agents need to understand not just what was decided, but why.

**Implication:** No significant architectural change without an ADR in `docs/architecture/ADR/`.

## 8. Freshness Is Measurable

Every document carries a review date. Staleness is detected automatically. A document without a freshness date is assumed stale. Trust in documentation degrades over time — freshness dates make that degradation visible.

**Implication:** Every doc has `<!-- reviewed: YYYY-MM-DD -->`. Update it on every modification.

## 9. Agent Ergonomics Over Human Aesthetics

Structure files for parseability over visual elegance. Use consistent headings, routing tables, and metadata tags. Agents work better with predictable structure than with creative formatting.

**Implication:** Prefer tables over prose for navigation. Use machine-readable metadata comments.

## 10. Minimize Coordination Cost

Each session should be self-contained via handoff documents. Agents shouldn't need to ask "what happened last time?" — the repo should tell them. Session handoffs, clear plans, and up-to-date docs eliminate coordination overhead.

**Implication:** Always update `docs/session/SESSION_HANDOFF.md` at session end.
