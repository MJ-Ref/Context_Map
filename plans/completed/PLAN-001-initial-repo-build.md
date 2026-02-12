# Execution Plan: [PLAN-001] Initial Repository Build

<!-- reviewed: 2026-02-11 -->

## Metadata

| Field        | Value                          |
|--------------|--------------------------------|
| **Plan ID**  | PLAN-001                       |
| **Title**    | Initial repository build       |
| **Status**   | Completed                      |
| **Author**   | Claude Opus 4.6 + MJ           |
| **Created**  | 2026-02-11                     |
| **Updated**  | 2026-02-11                     |

## Objective

**What:** Build the complete Context_Map repository — all docs, entry points, skills, guide chapters, enforcement scripts, and supporting infrastructure.

**Why:** Agent-led development needs a reference template that demonstrates every pattern it teaches. No such template existed; this plan creates one from scratch.

## Context

**Background:** Inspired by the shift toward agent-led development (OpenAI's "Harness Engineering" approach, Claude Code workflows). Documentation management is the #1 bottleneck in agent workflows — this repo directly addresses that with progressive disclosure, docs-as-system-of-record, and automated enforcement.

**Constraints:**
- The repo must follow its own rules (Principle 1: "The Repo IS the Guide")
- All agent entry files must route to `docs/`, never duplicate content
- Every doc must carry a `<!-- reviewed: YYYY-MM-DD -->` freshness tag
- All validation scripts must pass before shipping

**Dependencies:**
- None — greenfield build

## Approach

Build in 8 phases, progressing from foundation (git init, core entry files) through documentation, infrastructure, educational content, and enforcement. Parallelize independent phases where possible. Validate at the end with the repo's own enforcement scripts, then perform an internal consistency audit to catch drift between what the docs describe and what the repo actually implements.

## Phases / Steps

### Phase 1: Foundation

- [x] **Step 1.1:** Init git repo, create full directory tree
  - *Acceptance:* All required directories exist
- [x] **Step 1.2:** Write `AGENTS.md`, `CLAUDE.md`, `ARCHITECTURE.md`
  - *Acceptance:* Entry files route to `docs/`, no inline policy
- [x] **Step 1.3:** Write `docs/_INDEX.md` and `docs/golden-rules/PRINCIPLES.md`
  - *Acceptance:* Index lists all docs; principles define 10 non-negotiables

### Phase 2: Documentation Core

- [x] **Step 2.1:** Architecture docs — `OVERVIEW.md`, `DEPENDENCY_RULES.md`, `ADR/000-template.md`
  - *Acceptance:* Architecture narrative matches actual repo structure
- [x] **Step 2.2:** Golden rules — `CODING_STANDARDS.md`
  - *Acceptance:* Standards are machine-readable and unambiguous
- [x] **Step 2.3:** Quality docs — `QUALITY_SCORECARD.md`, `TECH_DEBT_REGISTER.md`
  - *Acceptance:* Scorecard weights sum to 100%, register has tracking structure
- [x] **Step 2.4:** Workflow docs — `DEVELOPMENT.md`, `PR_REVIEW.md`, `TESTING.md`, `DOC_GARDENING.md`
  - *Acceptance:* Each workflow is self-contained and references correct script names
- [x] **Step 2.5:** Agent guide — `ONBOARDING.md`, `COMMON_TASKS.md`
  - *Acceptance:* All paths reference actual repo structure
- [x] **Step 2.6:** Session — `SESSION_HANDOFF.md`
  - *Acceptance:* Handoff template has all required sections

### Phase 3: Plans Infrastructure

- [x] **Step 3.1:** Write `plans/_TEMPLATE.md` and `plans/_INDEX.md`
  - *Acceptance:* Template covers metadata, objective, phases, risks, success criteria

### Phase 4: Multi-Agent Entry Points

- [x] **Step 4.1:** Write `.cursorrules`, `.cursor/rules/global.mdc`
  - *Acceptance:* Routes to `docs/`
- [x] **Step 4.2:** Write `.github/copilot-instructions.md`
  - *Acceptance:* Routes to `docs/`
- [x] **Step 4.3:** Write `CODEX.md`, `.codex/setup.sh`
  - *Acceptance:* Routes to `docs/`, setup script is functional

### Phase 5: Claude Code Skills

- [x] **Step 5.1:** Write `/context-map` skill — `SKILL.md` + 3 reference files
  - *Acceptance:* Scaffold and audit subcommands documented with correct paths
- [x] **Step 5.2:** Write `/session-handoff` skill — `SKILL.md` + template
  - *Acceptance:* Handoff template matches SESSION_HANDOFF.md structure

### Phase 6: Guide Chapters

- [x] **Step 6.1:** Write 7 chapters (01 through 07) + `guide/README.md`
  - *Acceptance:* Each chapter follows Problem → Principle → Implementation → Adaptation structure

### Phase 7: Enforcement Scripts

- [x] **Step 7.1:** `scripts/check-structure.sh` — validates 63 required files/dirs
  - *Acceptance:* Passes on the repo itself
- [x] **Step 7.2:** `scripts/check-doc-freshness.sh` — 30-day default threshold
  - *Acceptance:* Detects stale docs, works on macOS (no GNU grep dependency)
- [x] **Step 7.3:** `scripts/check-agent-files.sh` — validates routing and line limits
  - *Acceptance:* All 6 agent files pass

### Phase 8: Polish and Validation

- [x] **Step 8.1:** Write `README.md`, `LICENSE`, `.gitignore`, `.claude/settings.json`
  - *Acceptance:* README structure matches actual repo
- [x] **Step 8.2:** Run all 3 validation scripts — 63/63, 6/6, 15/15
  - *Acceptance:* Zero failures
- [x] **Step 8.3:** Internal consistency audit — fix all drift between docs and reality
  - *Acceptance:* No wrong paths, no fake script names, consistent thresholds
- [x] **Step 8.4:** Write ADRs for key architectural decisions
  - *Acceptance:* ADR-001 through ADR-003 recorded and indexed

## Risks and Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Internal drift between docs and actual structure | High | High | Ran full consistency audit; fixed 14 files in one pass |
| Background agents produce inconsistent content | Medium | Medium | Validated all output against canonical structure (check-structure.sh) |
| macOS compatibility issues in scripts | Medium | Low | Replaced GNU grep with sed for freshness parsing |
| set -e bug in scripts with conditional echo | Medium | Low | Changed `[ ] && echo` to `if/fi` pattern |

## Success Criteria

- [x] All 3 validation scripts pass with zero failures
- [x] All docs have `<!-- reviewed: YYYY-MM-DD -->` tags
- [x] All agent entry files route to `docs/` and are under 150 lines
- [x] No document references a path that doesn't exist
- [x] Freshness threshold is 30 days everywhere (no conflicting 90-day references)
- [x] Scorecard weights sum to 100%
- [x] Key architectural decisions recorded as ADRs
- [x] Pushed to GitHub and rendering correctly

## References

- [docs/architecture/OVERVIEW.md](../../docs/architecture/OVERVIEW.md)
- [docs/golden-rules/PRINCIPLES.md](../../docs/golden-rules/PRINCIPLES.md)
- [ADR-001: Five Agent Entry Points](../../docs/architecture/ADR/001-five-agent-entry-points.md)
- [ADR-002: 30-Day Freshness Default](../../docs/architecture/ADR/002-thirty-day-freshness-default.md)
- [ADR-003: Plans at Top Level](../../docs/architecture/ADR/003-plans-at-top-level.md)

---

*Plans are temporal artifacts. When completed, move to `plans/completed/` and update `plans/_INDEX.md`.*
