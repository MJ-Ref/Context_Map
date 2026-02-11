# Documentation Gardening

<!-- reviewed: 2026-02-11 -->

> **Purpose:** Define the process for maintaining documentation health over time.
> Docs are the system of record in Context_Map projects (Principle 4).
> Gardening is not optional — it is as critical as writing code.

## Freshness Policy

Every document carries a machine-readable freshness tag:

```html
<!-- reviewed: YYYY-MM-DD -->
```

This tag records when the document was last verified to be accurate — not just edited. A review means someone confirmed the entire document still reflects reality.

### Thresholds

| Age | Status | Action Required |
|-----|--------|-----------------|
| 0-30 days | Fresh | No action needed |
| 31-60 days | Aging | Review during next gardening session |
| 61-90 days | Stale | Review urgently; flag in standup or handoff |
| 90+ days | Critical | Review immediately; doc cannot be trusted until reviewed |

### The 30-day rule

No doc should go more than 30 days without a review. This does not mean every doc changes monthly — it means every doc is *confirmed accurate* monthly. If nothing changed, simply update the freshness date.

---

## How to Update Freshness Dates

1. Read the document fully
2. Verify every claim, path, and reference is still accurate
3. If changes are needed, make them
4. Update the `<!-- reviewed: YYYY-MM-DD -->` tag to today's date
5. Commit with a `docs:` conventional commit (e.g., `docs(quality): review and update scorecard`)

**Important:** Do not update the freshness date without actually reviewing the content. Rubber-stamping destroys trust.

---

## What Triggers a Doc Review

A doc should be reviewed when:

- Its freshness date exceeds 30 days (routine gardening)
- Code it describes has changed
- A PR modifies files that the doc references
- A routing-table target has been renamed, moved, or deleted
- A quality scorecard audit flags the Documentation dimension below 4
- A new agent reports confusion traceable to a specific doc
- An execution plan touches systems described in the doc

---

## Staleness Detection

The automated detector at `scripts/check-doc-freshness.sh` scans all Markdown files under `docs/` for the `<!-- reviewed: -->` tag and flags any that are missing or older than 30 days.

```bash
scripts/check-doc-freshness.sh
```

Run in CI as a warning (not a hard failure) unless the project has opted into strict freshness enforcement.

---

## Gardening Workflow

Documentation gardening follows a four-step cycle.

### 1. Triage

Run `scripts/check-doc-freshness.sh` to identify which docs need attention. Sort by severity:
- **Critical** (90+ days): handle first
- **Stale** (61-90 days): handle second
- **Aging** (31-60 days): handle if time permits

### 2. Update

For each flagged doc:
- Read the full document
- Verify accuracy against the current state of the repo and any referenced systems
- Make necessary corrections
- Update the freshness tag

### 3. Verify

After updating, run validation to confirm you have not broken anything:

```bash
scripts/check-structure.sh
scripts/check-doc-freshness.sh
scripts/check-agent-files.sh
```

### 4. Commit

Commit all gardening changes in a single focused commit:

```
docs: routine gardening — review and update stale docs
```

If individual docs required substantial changes, consider separate commits per doc for clarity.

---

## Role in Agent-Led Development

Agents follow docs literally. A stale doc does not just confuse — it causes wrong actions taken with full confidence. Routing tables, freshness tags, and the index are the interface contract. Breaking them is like breaking a public API.

### The agent-gardening loop

1. At session start, run `scripts/check-doc-freshness.sh`
2. If stale docs are found, triage and update before starting feature work
3. At session end, update freshness dates on any docs touched during the session
4. Record docs needing deeper review in `docs/session/SESSION_HANDOFF.md`

---

*A garden left untended becomes a wilderness. Documentation is no different. Tend it regularly, and it serves everyone — agents and humans alike.*
