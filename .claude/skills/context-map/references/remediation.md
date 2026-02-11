# Context Map -- Remediation Guide

Step-by-step fixes for common audit failures, organized by category.

---

## Missing Structure

**Problem:** Required directories or files do not exist.

**Fix:**

1. Create all missing directories:
   ```bash
   mkdir -p docs/{architecture/ADR,golden-rules,quality,workflows,agent-guide,session} plans/{active,completed} guide scripts .github .codex
   ```
2. Create each missing file with a title heading, `<!-- reviewed: YYYY-MM-DD -->` tag
   set to today, and a one-line placeholder.
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
   - [Architecture](docs/architecture/OVERVIEW.md)
   - [Onboarding](docs/agent-guide/ONBOARDING.md)
   ```
3. Keep each file to 150 lines or fewer.
4. Move displaced content to the appropriate file under `docs/`.
5. Ensure all five entry points exist: `AGENTS.md`, `CLAUDE.md`, `CODEX.md`,
   `.cursorrules`, `.github/copilot-instructions.md`.

---

## Stale Documentation

**Problem:** Documents have a `<!-- reviewed: -->` date older than 30 days.

**Fix:**

1. Review each stale document for accuracy against current project state.
2. Update content as needed.
3. Set the `<!-- reviewed: YYYY-MM-DD -->` tag to today's date.
4. If a document is no longer relevant, delete it and remove its `_INDEX.md` entry.

---

## Missing Freshness Tags

**Problem:** Documents lack a `<!-- reviewed: YYYY-MM-DD -->` tag in their first five lines.

**Fix:**

1. Add `<!-- reviewed: YYYY-MM-DD -->` immediately after the title heading (within the
   first five lines).
2. Use today's date if the content is current. Otherwise use the last git commit date:
   ```bash
   git log -1 --format="%as" -- path/to/file.md
   ```

---

## Missing Quality Documents

**Problem:** `QUALITY_SCORECARD.md` or `TECH_DEBT_REGISTER.md` is missing or empty.

**Fix:**

1. Create the file under `docs/quality/` with a `<!-- reviewed: YYYY-MM-DD -->` tag.
2. For the scorecard, add at least one scored dimension:
   ```markdown
   | Dimension      | Score | Notes             |
   |----------------|-------|-------------------|
   | Documentation  | 4     | Two docs aging    |
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

1. Ensure `plans/_TEMPLATE.md` includes `Status: Draft` and section headings
   for Objective, Approach, Tasks, and Success Criteria.
2. Add or correct the `Status:` line in each plan file. Valid values:
   `Draft`, `Active`, `Completed`, `Abandoned`.
3. Update `plans/_INDEX.md` to list every plan file with its current status.
4. Active plans live in `plans/active/`. Completed plans move to `plans/completed/`.

---

## Session Handoff Issues

**Problem:** `SESSION_HANDOFF.md` is missing, outdated, or incomplete.

**Fix:**

1. If missing, create it at `docs/session/SESSION_HANDOFF.md` using the
   session-handoff skill template.
2. If outdated, run `/session-handoff` to regenerate from current context.
3. Ensure it contains at minimum: summary, next steps, and files modified.
4. Update the `<!-- reviewed: YYYY-MM-DD -->` tag to today's date.
