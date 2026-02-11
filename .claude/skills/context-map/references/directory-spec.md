# Context Map -- Directory Specification

Complete directory tree for the Context_Map standard. Every repository that adopts
this standard should contain the entries listed below.

Legend: **(R)** = required, **(O)** = optional.

---

## Root Files

```
AGENTS.md            (R)  Agent router. Points all AI agents to docs/. Must not contain inline docs.
CLAUDE.md            (R)  Claude-specific entry point. Routes to docs/ with Claude-specific hints.
ARCHITECTURE.md      (R)  High-level architecture overview. May link to docs/architecture/ for detail.
.cursorrules         (R)  Cursor agent entry point. Routes to docs/ with Cursor-specific hints.
.gitignore           (R)  Standard gitignore for the project language/framework.
```

## `.github/`

```
.github/
  copilot-instructions.md   (R)  GitHub Copilot entry point. Routes to docs/.
  CODEOWNERS                 (O)  Code ownership mapping.
  workflows/                 (O)  CI/CD workflow definitions.
```

## `docs/`

```
docs/
  _INDEX.md                  (R)  Master index listing every doc with one-line summary.
  architecture/              (R)  Architecture documentation directory.
    ARCHITECTURE.md          (R)  Detailed architecture document. Freshness date required.
  onboarding/                (R)  Onboarding materials for new contributors.
    ONBOARDING.md            (R)  Getting-started guide. Freshness date required.
  runbooks/                  (R)  Operational runbooks directory.
    RUNBOOK_TEMPLATE.md      (R)  Template for new runbooks. Freshness date required.
  session/                   (R)  Session continuity documents.
    SESSION_HANDOFF.md       (R)  Active session handoff state. Updated each session.
  adr/                       (O)  Architecture Decision Records.
    _TEMPLATE.md             (O)  ADR template.
  quality/                   (R)  Quality tracking directory.
    QUALITY_SCORECARD.md     (R)  Scored quality checklist. Freshness date required.
    TECH_DEBT_REGISTER.md    (R)  Technical debt tracking. Freshness date required.
```

## `plans/`

```
plans/
  _INDEX.md                  (R)  Plan index listing all plans with status.
  _TEMPLATE.md               (R)  Template for new plans. Includes status field.
  *.md                       (O)  Individual plan documents. Each must have a status field.
```

Allowed plan statuses: `draft`, `active`, `completed`, `abandoned`.

## `guide/`

```
guide/
  CONTRIBUTING.md            (R)  Contribution guidelines. Freshness date required.
  STYLE_GUIDE.md             (R)  Code and documentation style guide. Freshness date required.
```

## `scripts/`

```
scripts/                     (R)  Automation and tooling scripts directory.
  *.sh / *.py / *.ts         (O)  Individual scripts. Each should have a header comment.
```

The `scripts/` directory must exist even if initially empty. It is the canonical
location for project automation including linting, scaffolding, and CI helpers.

## `.claude/`

```
.claude/
  skills/                    (O)  Claude Code skill definitions.
    context-map/             (O)  Context Map skill and references.
    session-handoff/         (O)  Session handoff skill and references.
  settings.json              (O)  Claude Code project settings.
```

## `.cursor/`

```
.cursor/
  rules/                     (O)  Cursor-specific rule files.
```

---

## Constraints

- **Freshness dates**: Every document under `docs/`, `guide/`, and `plans/` must include
  a `Last Updated: YYYY-MM-DD` line within the first 10 lines.
- **No inline duplication**: Agent entry points (`AGENTS.md`, `CLAUDE.md`, `.cursorrules`,
  `copilot-instructions.md`) must route to `docs/` and must not duplicate documentation
  content. Maximum length for these files is 40 lines.
- **Index completeness**: `docs/_INDEX.md` must reference every `.md` file under `docs/`.
  `plans/_INDEX.md` must reference every `.md` file under `plans/` (excluding itself and
  the template).
- **Plan status**: Every plan file in `plans/` (excluding `_INDEX.md` and `_TEMPLATE.md`)
  must contain a `Status:` line with a valid status value.
