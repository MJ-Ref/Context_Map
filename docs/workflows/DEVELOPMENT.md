# Development Workflow

<!-- reviewed: 2026-02-11 -->

> **Purpose:** The end-to-end workflow for making changes in a Context_Map project.
> Every change follows this cycle: plan, implement, test, document, review.
> This workflow applies to agents and humans alike.

## Branch Strategy

| Branch | Purpose | Lifetime |
|--------|---------|----------|
| `main` | Stable, validated state of the project | Permanent |
| `feat/<name>` | New feature or capability | Until merged |
| `fix/<name>` | Bug fix or correction | Until merged |
| `docs/<name>` | Documentation-only changes | Until merged |
| `chore/<name>` | Maintenance, refactoring, or tooling | Until merged |
| `plan/<name>` | Execution plan work spanning multiple sessions | Until plan completed |

**Rules:**
- Never commit directly to `main`. Always use a branch and PR.
- Branch names must be lowercase, hyphen-separated (e.g., `feat/add-validation-script`).
- One logical change per branch. Do not bundle unrelated work.
- Delete branches after merge.

---

## Development Cycle

Every change moves through five stages. Do not skip stages.

### 1. Plan

- Check `plans/active/` for an existing execution plan that covers your work.
- If no plan exists and the work is non-trivial (more than a quick fix), create one. See [Execution Plan Workflow](#execution-plan-workflow) below.
- For small changes, the plan is your commit message. For large changes, it's a document in `plans/active/`.

### 2. Implement

- Create a branch from `main` using the naming convention above.
- Follow `docs/golden-rules/CODING_STANDARDS.md` for all code changes.
- Follow existing patterns in the repo — the repo demonstrates what it teaches.
- Keep changes focused. If you discover adjacent work, note it for a separate branch.

### 3. Test

- Run all validation scripts before considering implementation complete:
  ```bash
  scripts/check-structure.sh        # Directory and file layout
  scripts/check-doc-freshness.sh    # Documentation freshness
  scripts/check-agent-files.sh      # Routing table integrity
  ```
- Run any project-specific tests (linters, unit tests, integration tests).
- See `docs/workflows/TESTING.md` for the full testing strategy.

### 4. Document

- Update any docs affected by the change.
- Update `<!-- reviewed: YYYY-MM-DD -->` tags on every modified doc.
- If you added a new doc, add it to `docs/_INDEX.md`.
- If you added new routing targets, update the routing tables in `AGENTS.md` and `CLAUDE.md`.
- If you made an architectural decision, create an ADR in `docs/architecture/ADR/`.

### 5. Review

- Open a pull request following `docs/workflows/PR_REVIEW.md`.
- Ensure all automated checks pass.
- Address review feedback in additional commits (do not force-push over review history).

---

## Commit Conventions

This project uses **Conventional Commits**: `<type>(<scope>): <short description>`

### Types

| Type | When to use |
|------|-------------|
| `feat` | New feature or capability |
| `fix` | Bug fix or correction |
| `docs` | Documentation-only change |
| `chore` | Maintenance, tooling, CI changes |
| `refactor` | Code restructuring with no behavior change |
| `test` | Adding or updating tests |

### Rules

- Keep the first line under 72 characters.
- Use imperative mood ("add", not "added" or "adds").
- Reference execution plan IDs or tech debt IDs when applicable (e.g., `fix: resolve TD-003`).

---

## Pre-Commit Checklist

Run through this before every commit:

- [ ] All validation scripts pass (`scripts/check-structure.sh`, `scripts/check-doc-freshness.sh`, `scripts/check-agent-files.sh`)
- [ ] Changed docs have updated `<!-- reviewed: YYYY-MM-DD -->` tags
- [ ] New docs are registered in `docs/_INDEX.md`
- [ ] New routing targets are added to `AGENTS.md` and `CLAUDE.md`
- [ ] Commit message follows conventional commit format
- [ ] No content duplicated between agent entry files and `docs/`
- [ ] No modifications to `guide/` (read-only educational content)

---

## Doc Update Requirements

Documentation changes are mandatory, not optional, when:

- A new file or directory is added to the repo
- A routing target changes (file renamed, moved, or deleted)
- Behavior described in docs changes
- An architectural decision is made
- An execution plan changes state

When in doubt, update the doc. Stale docs are worse than missing docs because they create false confidence.

---

## Execution Plan Workflow

Execution plans are temporal documents that track multi-step or multi-session work.

### When to create a plan

Create a plan when work spans multiple sessions, involves coordinated changes across files, has sequencing constraints, or when a quality audit scored below 3.5.

### Lifecycle

```
draft → active → completed
```

| State | Location | Meaning |
|-------|----------|---------|
| `draft` | `plans/active/` | Plan is being written; not yet approved for execution |
| `active` | `plans/active/` | Plan is approved and work is in progress |
| `completed` | `plans/completed/` | All tasks done; plan moved to archive |

### Plan lifecycle rules

1. Create the plan in `plans/active/` with a clear filename (e.g., `add-validation-scripts.md`).
2. Mark the plan `active` when work begins. Update it as tasks are completed.
3. When all tasks are done, move the file to `plans/completed/`.
4. Reference the plan in commit messages and PRs.

---

*This workflow exists to make agent-led development reliable and predictable. Follow it consistently.*
