# Context Map -- Audit Checklist

Each item below is a pass/fail check. A check passes only when the stated
criterion is fully met. Partial compliance counts as a failure.

---

## Structure Checks

- [ ] `docs/` directory exists
- [ ] `docs/_INDEX.md` exists
- [ ] `docs/architecture/` directory exists
- [ ] `docs/architecture/ARCHITECTURE.md` exists
- [ ] `docs/onboarding/` directory exists
- [ ] `docs/onboarding/ONBOARDING.md` exists
- [ ] `docs/runbooks/` directory exists
- [ ] `docs/runbooks/RUNBOOK_TEMPLATE.md` exists
- [ ] `docs/session/` directory exists
- [ ] `docs/session/SESSION_HANDOFF.md` exists
- [ ] `docs/quality/` directory exists
- [ ] `docs/quality/QUALITY_SCORECARD.md` exists
- [ ] `docs/quality/TECH_DEBT_REGISTER.md` exists
- [ ] `plans/` directory exists
- [ ] `plans/_INDEX.md` exists
- [ ] `plans/_TEMPLATE.md` exists
- [ ] `guide/` directory exists
- [ ] `guide/CONTRIBUTING.md` exists
- [ ] `guide/STYLE_GUIDE.md` exists
- [ ] `scripts/` directory exists
- [ ] `ARCHITECTURE.md` exists at project root
- [ ] `.github/` directory exists

## Agent Entry-Point Checks

- [ ] `AGENTS.md` exists at project root
- [ ] `AGENTS.md` contains a route or link to `docs/`
- [ ] `AGENTS.md` is 40 lines or fewer (no inline duplication)
- [ ] `CLAUDE.md` exists at project root
- [ ] `CLAUDE.md` contains a route or link to `docs/`
- [ ] `CLAUDE.md` is 40 lines or fewer (no inline duplication)
- [ ] `.cursorrules` exists at project root
- [ ] `.cursorrules` contains a route or link to `docs/`
- [ ] `.cursorrules` is 40 lines or fewer (no inline duplication)
- [ ] `.github/copilot-instructions.md` exists
- [ ] `.github/copilot-instructions.md` contains a route or link to `docs/`
- [ ] `.github/copilot-instructions.md` is 40 lines or fewer (no inline duplication)
- [ ] No agent entry point duplicates substantial content from `docs/`

## Documentation Checks

- [ ] `docs/_INDEX.md` lists every `.md` file under `docs/` (recursive)
- [ ] `docs/_INDEX.md` includes a one-line summary for each listed document
- [ ] Every `.md` file under `docs/` has a `Last Updated:` date in the first 10 lines
- [ ] No `.md` file under `docs/` has a freshness date older than 30 days
- [ ] Every `.md` file under `guide/` has a `Last Updated:` date in the first 10 lines
- [ ] No `.md` file under `guide/` has a freshness date older than 30 days
- [ ] No orphaned docs exist (files under `docs/` not listed in `_INDEX.md`)

## Quality Checks

- [ ] `docs/quality/QUALITY_SCORECARD.md` contains at least one scored item
- [ ] `docs/quality/QUALITY_SCORECARD.md` uses a consistent scoring format
- [ ] `docs/quality/TECH_DEBT_REGISTER.md` contains at least one tracked item
- [ ] `docs/quality/TECH_DEBT_REGISTER.md` includes severity and status for each item
- [ ] `docs/quality/QUALITY_SCORECARD.md` has a `Last Updated:` date within 30 days
- [ ] `docs/quality/TECH_DEBT_REGISTER.md` has a `Last Updated:` date within 30 days

## Plan Checks

- [ ] `plans/_TEMPLATE.md` contains a `Status:` field
- [ ] `plans/_INDEX.md` lists all plan files in `plans/`
- [ ] Every plan file (excluding `_INDEX.md`, `_TEMPLATE.md`) has a `Status:` field
- [ ] Every plan `Status:` value is one of: `draft`, `active`, `completed`, `abandoned`
- [ ] Every plan file has a `Last Updated:` date in the first 10 lines

## Session Checks

- [ ] `docs/session/SESSION_HANDOFF.md` exists
- [ ] `docs/session/SESSION_HANDOFF.md` has a `Last Updated:` date
- [ ] `docs/session/SESSION_HANDOFF.md` was updated within the last 7 days
- [ ] `docs/session/SESSION_HANDOFF.md` contains a session summary section
- [ ] `docs/session/SESSION_HANDOFF.md` contains a next steps section
- [ ] `docs/session/SESSION_HANDOFF.md` contains a files modified section

---

## Scoring

- **Total checks**: Count all checked items above.
- **Score**: (passed / total) * 100, rounded to nearest integer.
- **Grade**: A >= 90%, B >= 75%, C >= 60%, F < 60%.
- When reporting, list every failed check with its section name for easy lookup
  in the remediation guide.
