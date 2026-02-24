# Execution Plan: PLAN-002 Repository Hardening Audit

<!-- reviewed: 2026-02-24 -->

## Metadata

| Field | Value |
|-------|-------|
| **Plan ID** | PLAN-002 |
| **Title** | Repository hardening and deep quality audit |
| **Status** | Completed |
| **Author** | Codex |
| **Created** | 2026-02-24 |
| **Updated** | 2026-02-24 |

## Objective

**What:** Perform a deep repository audit and harden enforcement so Context_Map remains reliable as a reusable agent-first template.

**Why:** The existing baseline was strong, but critical quality checks (local link integrity and CI enforcement) were still manual and therefore prone to drift.

## Context

**Background:** Core scripts and documentation were present and passing, but quality control depended on local execution and did not verify local Markdown links.

**Constraints:**
- Keep `guide/` unchanged (read-only zone).
- Keep agent entry files as routing tables (no policy duplication).
- Ensure every modified doc updates its freshness tag.

**Dependencies:**
- `docs/workflows/DEVELOPMENT.md`
- `docs/quality/QUALITY_SCORECARD.md`
- Existing validation scripts in `scripts/`

## Approach

Add missing automation first (new link check + CI workflow), then align documentation and skill references with the actual validation suite. Finalize with quality artifacts and handoff updates, followed by a full validation run.

## Phases / Steps

### Phase 1: Audit

- [x] **Step 1.1:** Baseline all repository health checks
  - *Acceptance:* Existing scripts run clean and gaps are identified.
- [x] **Step 1.2:** Review operational docs and entry files for drift
  - *Acceptance:* Inconsistencies are documented and remediation targets are clear.

### Phase 2: Hardening

- [x] **Step 2.1:** Add `scripts/check-doc-links.sh`
  - *Acceptance:* Script validates local Markdown links and fails on broken references.
- [x] **Step 2.2:** Add CI workflow for validation
  - *Acceptance:* `.github/workflows/validate.yml` runs the full suite on push/PR.
- [x] **Step 2.3:** Update references to validation suite
  - *Acceptance:* Docs, entry files, and skill references consistently list all checks.

### Phase 3: Verification and Continuity

- [x] **Step 3.1:** Update quality tracking artifacts
  - *Acceptance:* Scorecard and debt register reflect current state.
- [x] **Step 3.2:** Run full validation and refresh handoff
  - *Acceptance:* All checks pass and session handoff is current.

## Risks and Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Link checker flags template examples as failures | Medium | Low | Ignore known placeholders and skip fenced code examples. |
| CI/docs drift after adding a new script | Medium | Medium | Update all operational references in one pass and re-run validation. |
| Over-updating routing files with policy detail | Low | Medium | Keep changes limited to check command references only. |

## Success Criteria

- [x] New local link validation script exists and passes.
- [x] CI workflow enforces validation on pull requests and `main` pushes.
- [x] Operational docs and agent entry files consistently reference the full validation suite.
- [x] Tech debt and quality scorecard reflect the completed hardening work.

## References

- [Development Workflow](../../docs/workflows/DEVELOPMENT.md)
- [Testing Strategy](../../docs/workflows/TESTING.md)
- [Quality Scorecard](../../docs/quality/QUALITY_SCORECARD.md)
- [Tech Debt Register](../../docs/quality/TECH_DEBT_REGISTER.md)

---

*Plans are temporal artifacts. This plan is archived in `plans/completed/` with status `Completed`.*
