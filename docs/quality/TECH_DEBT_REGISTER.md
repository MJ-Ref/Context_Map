# Tech Debt Register

<!-- reviewed: 2026-02-11 -->

> **Purpose:** Track known technical debt so it can be prioritized and resolved.
> This register is the single source of truth for all acknowledged debt in the project.
> Every agent should check this before starting work and update it when debt is discovered or resolved.

## Register

| ID | Description | Impact | Effort | Owner | Status | Date Added |
|----|-------------|--------|--------|-------|--------|------------|
| _TD-001_ | _Example: Missing validation for X_ | _M_ | _L_ | _unassigned_ | _open_ | _2026-02-11_ |
| | | | | | | |

> **Impact:** H = High (blocks progress or causes failures), M = Medium (degrades quality or velocity), L = Low (cosmetic or minor inconvenience)
>
> **Effort:** H = High (multi-session work), M = Medium (single focused session), L = Low (quick fix, under an hour)
>
> **Status:** `open` | `in-progress` | `resolved` | `wont-fix`

---

## Adding New Entries

1. Assign the next sequential ID (e.g., `TD-002`, `TD-003`)
2. Write a clear, one-line description of the debt
3. Assess **Impact** (H/M/L) based on how it affects the project if left unresolved
4. Assess **Effort** (H/M/L) based on how much work is needed to resolve it
5. Set **Owner** to `unassigned` unless someone is picking it up immediately
6. Set **Status** to `open`
7. Set **Date Added** to today's date
8. Update the `<!-- reviewed: -->` tag at the top of this file

---

## Prioritization Guidance

Use the impact-vs-effort matrix to decide what to tackle first:

```
              │  Low Effort  │  Med Effort  │  High Effort  │
──────────────┼──────────────┼──────────────┼───────────────┤
 High Impact  │  DO FIRST    │  PLAN NEXT   │  PLAN NEXT    │
 Med Impact   │  DO FIRST    │  SCHEDULE    │  BACKLOG      │
 Low Impact   │  OPPORTUNISTIC│ BACKLOG     │  RECONSIDER   │
```

- **DO FIRST:** High value, low cost. Resolve these immediately.
- **PLAN NEXT:** High value, moderate-to-high cost. Create an execution plan in `plans/active/`.
- **SCHEDULE:** Medium value and effort. Pick these up when capacity allows.
- **BACKLOG:** Worth doing eventually. Keep tracked but do not prioritize.
- **OPPORTUNISTIC:** Resolve if you happen to be working in the area.
- **RECONSIDER:** Low impact, high effort. Ask whether this is really debt or an acceptable trade-off. Mark `wont-fix` if the cost is not justified.

---

## Review Cadence

- **Every session:** Check for new debt encountered during work. Add entries as discovered.
- **Weekly (or equivalent):** Review open items. Update statuses. Re-assess priorities.
- **Monthly audit:** As part of the quality scorecard audit (see `QUALITY_SCORECARD.md`), verify that the register is current, no items are stale, and resolved items are marked.

---

## Resolving Debt

When resolving an entry:

1. Set **Status** to `resolved`
2. Note the resolution in the commit message (e.g., `fix: resolve TD-003 — add input validation`)
3. Do not delete the row — resolved entries serve as a historical record
4. Update the `<!-- reviewed: -->` tag at the top of this file

---

*This register is a living document. An empty register is healthy. A register with only stale entries is not.*
