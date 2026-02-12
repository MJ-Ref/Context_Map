# Context Map

Scaffold and audit agent-first repository structures using the Context_Map standard.

This skill provides two subcommands for managing the Context_Map directory layout,
documentation routing, and quality standards in any project repository.

## Subcommands

### `/context-map scaffold`

Scaffolds the full Context_Map directory structure into the current project.
Creates all required directories, agent entry-point files, documentation indexes,
plan templates, and quality tracking documents.

**Usage:**

```
/context-map scaffold
```

**What it creates:**

- Root agent entry points: `AGENTS.md`, `CLAUDE.md`, `CODEX.md`, `.cursorrules`, `.github/copilot-instructions.md`
- Documentation directory: `docs/` with `_INDEX.md` and subdirectories for architecture,
  golden-rules, quality, workflows, agent-guide, and session
- Plans directory: `plans/` with `_INDEX.md`, `_TEMPLATE.md`, `active/`, `completed/`
- Guide directory: `guide/` with `README.md` and 7 educational chapters
- Scripts directory: `scripts/` with validation scripts (`check-structure.sh`, `check-doc-freshness.sh`, `check-agent-files.sh`)
- Quality files: `docs/quality/QUALITY_SCORECARD.md` and `docs/quality/TECH_DEBT_REGISTER.md`
- Claude skill definitions: `.claude/` directory with skill configurations
- Additional agent configs: `.codex/setup.sh`, `.cursor/rules/global.mdc`

See `references/directory-spec.md` for the complete directory specification including
which entries are required vs optional and the purpose of each file.

**Instructions for Claude:**

1. Read `references/directory-spec.md` to load the full directory tree.
2. Check which directories and files already exist in the project.
3. Create only the missing directories and files. Never overwrite existing content.
4. For each created file, insert the appropriate boilerplate from the spec.
5. Set freshness dates on all new documentation files to today's date.
6. After scaffolding, run a quick audit to confirm completeness.
7. Report what was created and what already existed.

---

### `/context-map audit`

Audits an existing project against the Context_Map standard and produces a
compliance report with a score and remediation suggestions.

**Usage:**

```
/context-map audit
```

**What it checks:**

- **Structure compliance** -- Verifies all required directories and files exist.
- **Agent routing** -- Confirms each agent entry point (`AGENTS.md`, `CLAUDE.md`,
  `CODEX.md`, `.cursorrules`, `copilot-instructions.md`) routes to `docs/` rather
  than duplicating content inline.
- **Documentation freshness** -- Checks that every doc has a freshness date and
  that no document is older than 30 days.
- **Quality tracking** -- Validates that `QUALITY_SCORECARD.md` and
  `TECH_DEBT_REGISTER.md` exist and contain scored entries.
- **Plan hygiene** -- Confirms plan templates, indexes, and status fields are present.
- **Session continuity** -- Checks that `SESSION_HANDOFF.md` exists and has been
  updated within the current working window.

See `references/checklist.md` for the full list of audit criteria.
See `references/remediation.md` for step-by-step fixes for common failures.

**Instructions for Claude:**

1. Read `references/checklist.md` to load all audit criteria.
2. Walk the project directory tree, checking each criterion.
3. For each check, record pass or fail with a brief reason.
4. Calculate an overall score: (passed checks / total checks) as a percentage.
5. For every failed check, look up the matching remediation in `references/remediation.md`.
6. Present results as a markdown report with three sections:
   - **Score summary** -- overall percentage and letter grade (A >= 90, B >= 75, C >= 60, F < 60)
   - **Detailed results** -- each check with its pass/fail status
   - **Remediation plan** -- ordered list of fixes, highest impact first
7. If the score is A-grade, congratulate the user. Otherwise, offer to auto-fix
   any issues that can be resolved non-destructively.

---

## Notes

- Scaffold is non-destructive. It never overwrites existing files.
- Audit is read-only. It never modifies the project.
- Both subcommands work in any repository, not just ones created from the Context_Map template.
- When in doubt, prefer creating thin routing files that point to `docs/` over
  embedding documentation directly in agent entry points.
