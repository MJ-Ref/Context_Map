# Context Map -- Directory Specification

Complete directory tree for the Context_Map standard. Every repository that adopts
this standard should contain the entries listed below.

Legend: **(R)** = required, **(O)** = optional.

---

## Root Files

```
AGENTS.md            (R)  Universal agent router. Points all AI agents to docs/. Must not contain inline docs.
CLAUDE.md            (R)  Claude Code entry point. Routes to docs/ with Claude-specific hints.
CODEX.md             (R)  OpenAI Codex entry point. Routes to docs/ with Codex-specific hints.
ARCHITECTURE.md      (R)  High-level architecture overview. Links to docs/architecture/ for detail.
README.md            (R)  Human-facing project overview.
LICENSE              (R)  Project license.
.gitignore           (R)  Standard gitignore for the project language/framework.
.cursorrules         (R)  Cursor agent entry point. Routes to .cursor/rules/global.mdc and docs/.
```

## `.github/`

```
.github/
  copilot-instructions.md   (R)  GitHub Copilot entry point. Routes to docs/.
```

## `.codex/`

```
.codex/
  setup.sh                  (R)  Codex sandbox setup script.
```

## `docs/`

```
docs/
  _INDEX.md                  (R)  Master index listing every doc with one-line summary.
  architecture/              (R)  Architecture documentation directory.
    OVERVIEW.md              (R)  Detailed architecture document. Freshness tag required.
    DEPENDENCY_RULES.md      (R)  Layering and dependency constraints. Freshness tag required.
    ADR/                     (R)  Architecture Decision Records.
      000-template.md        (R)  ADR template.
  golden-rules/              (R)  Standards and conventions directory.
    PRINCIPLES.md            (R)  Non-negotiable design principles. Freshness tag required.
    CODING_STANDARDS.md      (R)  Coding and documentation standards. Freshness tag required.
  quality/                   (R)  Quality tracking directory.
    QUALITY_SCORECARD.md     (R)  Scored quality checklist. Freshness tag required.
    TECH_DEBT_REGISTER.md    (R)  Technical debt tracking. Freshness tag required.
  workflows/                 (R)  Process documentation directory.
    DEVELOPMENT.md           (R)  Development workflow. Freshness tag required.
    PR_REVIEW.md             (R)  PR review process. Freshness tag required.
    TESTING.md               (R)  Testing strategy. Freshness tag required.
    DOC_GARDENING.md         (R)  Doc maintenance process. Freshness tag required.
  agent-guide/               (R)  Agent orientation directory.
    ONBOARDING.md            (R)  Agent onboarding guide. Freshness tag required.
    COMMON_TASKS.md          (R)  Step-by-step task recipes. Freshness tag required.
  session/                   (R)  Session continuity directory.
    SESSION_HANDOFF.md       (R)  Active session handoff state. Updated each session.
```

## `plans/`

```
plans/
  _INDEX.md                  (R)  Plan index listing all plans with status.
  _TEMPLATE.md               (R)  Template for new plans. Includes status field.
  active/                    (R)  Plans currently being executed.
  completed/                 (R)  Archived completed plans.
```

Allowed plan statuses: `Draft`, `Active`, `Completed`, `Abandoned`.

## `guide/`

```
guide/
  README.md                  (R)  Guide introduction and chapter listing.
  01-why-agent-legibility.md (R)  Why agent legibility matters.
  02-progressive-disclosure.md (R)  Progressive disclosure pattern.
  03-multi-agent-setup.md    (R)  Multi-agent entry point setup.
  04-execution-plans.md      (R)  Execution plans as artifacts.
  05-quality-and-enforcement.md (R)  Quality scoring and enforcement.
  06-doc-gardening.md        (R)  Documentation maintenance.
  07-session-handoffs.md     (R)  Session continuity pattern.
```

The `guide/` directory is **educational and isolated**. Agents never modify it.
Nothing in `docs/` or `plans/` depends on `guide/`.

## `scripts/`

```
scripts/
  check-structure.sh         (R)  Validates all required files and directories exist.
  check-doc-freshness.sh     (R)  Checks freshness tags on all docs.
  check-agent-files.sh       (R)  Verifies agent entry points route to docs/.
```

Scripts are **read-only validators**. They report violations but never modify files.

## `.claude/`

```
.claude/
  settings.json              (R)  Claude Code project settings.
  skills/                    (O)  Claude Code skill definitions.
    context-map/             (O)  Context Map scaffold and audit skill.
      SKILL.md               (O)  Skill definition.
      references/            (O)  Skill reference files.
    session-handoff/         (O)  Session handoff skill.
      SKILL.md               (O)  Skill definition.
      references/            (O)  Skill reference files.
```

## `.cursor/`

```
.cursor/
  rules/                     (O)  Cursor-specific rule files.
    global.mdc               (O)  Global Cursor rules.
```

---

## Constraints

- **Freshness tags**: Every document under `docs/` must include a
  `<!-- reviewed: YYYY-MM-DD -->` tag within the first five lines.
- **No inline duplication**: Agent entry points (`AGENTS.md`, `CLAUDE.md`, `CODEX.md`,
  `.cursorrules`, `.github/copilot-instructions.md`) must route to `docs/` and must not
  duplicate documentation content. Maximum recommended length for these files is 150 lines.
- **Index completeness**: `docs/_INDEX.md` must reference every `.md` file under `docs/`.
  `plans/_INDEX.md` must reference every plan file under `plans/` (excluding itself and
  the template).
- **Plan status**: Every plan file in `plans/active/` and `plans/completed/` must contain
  a `Status:` line with a valid status value.
