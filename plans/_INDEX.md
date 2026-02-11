# plans/ — Execution Plans Index

<!-- reviewed: 2026-02-11 -->

> **Purpose:** Execution plans are first-class artifacts in Context_Map.
> They capture the what, why, and how of multi-step work — giving agents
> a clear path to follow and humans a clear record of what happened.

## Lifecycle

Plans move through a defined lifecycle:

```
Draft  ──>  Active  ──>  Completed
                    ──>  Abandoned
```

| State         | Meaning                                        | Location            |
|---------------|------------------------------------------------|---------------------|
| **Draft**     | Plan is being designed, not yet approved        | `plans/active/`     |
| **Active**    | Work is underway against this plan              | `plans/active/`     |
| **Completed** | All success criteria met, work is done          | `plans/completed/`  |
| **Abandoned** | Plan was cancelled — reason recorded in plan    | `plans/completed/`  |

## Active Plans

| ID | Title | Status | Owner | Last Updated |
|----|-------|--------|-------|--------------|
| *No active plans* | | | | |

## Completed Plans

| ID | Title | Final Status | Owner | Completed |
|----|-------|--------------|-------|-----------|
| *No completed plans yet* | | | | |

## How to Create a New Plan

1. Copy the template: `cp plans/_TEMPLATE.md plans/active/PLAN-XXX-short-title.md`
2. Assign the next sequential Plan ID (e.g., `PLAN-001`, `PLAN-002`)
3. Fill in all sections — leave no placeholder text in an Active plan
4. Set status to **Draft** while designing, **Active** when work begins
5. Add an entry to the **Active Plans** table above
6. Commit with message: `docs: add execution plan PLAN-XXX`

## How to Complete a Plan

1. Verify all success criteria checkboxes are checked
2. Update the plan status to **Completed** (or **Abandoned** with reason)
3. Update the plan's `Last Updated` date
4. Move the file: `mv plans/active/PLAN-XXX-*.md plans/completed/`
5. Move the row from **Active Plans** to **Completed Plans** above
6. Commit with message: `docs: complete execution plan PLAN-XXX`

## Conventions

- **Plans are temporal.** They have a beginning and an end. Lasting knowledge
  extracted from a plan belongs in `docs/`, not in the plan itself.
- **One plan per initiative.** Don't combine unrelated work streams.
- **Reference, don't duplicate.** Link to docs and ADRs rather than copying content.
- **Update as you go.** Check off steps and update the status as work progresses.

---

*For the plan template, see [_TEMPLATE.md](./_TEMPLATE.md). For project documentation, see [docs/_INDEX.md](../docs/_INDEX.md).*
