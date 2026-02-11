# Context Map -- Remediation Guide

Step-by-step fixes for common audit failures, organized by category.

---

## Missing Structure

**Problem:** Required directories or files do not exist.

**Fix:**

1. Create all missing directories:
   ```bash
   mkdir -p docs/{architecture,onboarding,runbooks,session,quality} plans guide scripts .github
   ```
2. Create each missing file with a title heading, `Last Updated: YYYY-MM-DD` set
   to today, and a one-line placeholder.
3. Re-run `/context-map audit` to confirm.

---

## Broken Agent Routing

**Problem:** Agent entry points are missing, lack links to `docs/`, or inline
documentation that should live in `docs/`.

**Fix:**

1. Create any missing entry-point file at its correct path.
2. Replace inline content with a routing block. Example:
   ```markdown
   # Agent Entry Point
   All project documentation lives under `docs/`. Start with:
   - [Index](docs/_INDEX.md)
   - [Architecture](docs/architecture/ARCHITECTURE.md)
   - [Onboarding](docs/onboarding/ONBOARDING.md)
   ```
3. Keep each file to 40 lines or fewer.
4. Move displaced content to the appropriate file under `docs/`.

---

## Stale Documentation

**Problem:** Documents have a `Last Updated` date older than 30 days.

**Fix:**

1. Review each stale document for accuracy against current project state.
2. Update content as needed.
3. Set the `Last Updated:` line to today's date.
4. If a document is no longer relevant, delete it and remove its `_INDEX.md` entry.

---

## Missing Freshness Dates

**Problem:** Documents lack a `Last Updated:` line in their first 10 lines.

**Fix:**

1. Add `Last Updated: YYYY-MM-DD` immediately after the title heading.
2. Use today's date if the content is current. Otherwise use the last git commit date:
   ```bash
   git log -1 --format="%as" -- path/to/file.md
   ```

---

## Missing Quality Documents

**Problem:** `QUALITY_SCORECARD.md` or `TECH_DEBT_REGISTER.md` is missing or empty.

**Fix:**

1. Create the file under `docs/quality/` with a `Last Updated:` date.
2. For the scorecard, add at least one scored row:
   ```markdown
   | Category       | Score | Notes             |
   |----------------|-------|-------------------|
   | Test Coverage  | 7/10  | Unit tests at 72% |
   ```
3. For the debt register, add at least one tracked item:
   ```markdown
   | Item               | Severity | Owner | Status |
   |--------------------|----------|-------|--------|
   | Legacy auth module | High     | TBD   | Open   |
   ```

---

## Plan Issues

**Problem:** Plan files lack required fields, have invalid statuses, or the
index is incomplete.

**Fix:**

1. Ensure `plans/_TEMPLATE.md` includes `Status: draft` and section headings
   for Objective, Approach, Tasks, and Success Criteria.
2. Add or correct the `Status:` line in each plan file. Valid values:
   `draft`, `active`, `completed`, `abandoned`.
3. Update `plans/_INDEX.md` to list every plan file with its current status.

---

## Session Handoff Issues

**Problem:** `SESSION_HANDOFF.md` is missing, outdated, or incomplete.

**Fix:**

1. If missing, create it at `docs/session/SESSION_HANDOFF.md` using the
   session-handoff skill template.
2. If outdated, run `/session-handoff` to regenerate from current context.
3. Ensure it contains at minimum: summary, next steps, and files modified.
4. Set `Last Updated:` to today's date.
