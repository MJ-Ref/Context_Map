# Pull Request Review Process

<!-- reviewed: 2026-02-11 -->

> **Purpose:** Define how pull requests are reviewed in a Context_Map project.
> Reviews enforce quality, consistency, and architectural integrity.
> Both agent-authored and human-authored PRs follow the same process.

## Review Checklist

Every reviewer must verify the following before approving a PR.

### Code Quality

- [ ] Code follows `docs/golden-rules/CODING_STANDARDS.md`
- [ ] No unnecessary complexity or duplication introduced
- [ ] Changes are focused — one logical change per PR
- [ ] Commit messages follow conventional commit format (see `docs/workflows/DEVELOPMENT.md`)
- [ ] No secrets, credentials, or sensitive data included

### Tests

- [ ] All existing validation scripts pass:
  - `scripts/check-structure.sh`
  - `scripts/check-doc-freshness.sh`
  - `scripts/check-agent-files.sh`
- [ ] New validation or tests added for new functionality where appropriate
- [ ] No previously passing tests are now failing

### Documentation

- [ ] All docs affected by the change have been updated
- [ ] `<!-- reviewed: YYYY-MM-DD -->` tags updated on every modified doc
- [ ] New docs are registered in `docs/_INDEX.md`
- [ ] No content duplication between agent entry files and `docs/`
- [ ] Routing tables updated if file paths changed

### Freshness and Accuracy

- [ ] No doc touched in this PR has a stale freshness date
- [ ] Doc content matches the actual behavior introduced by the PR
- [ ] Cross-references between docs are still valid after this change

---

## Agent-Specific Review Items

PRs authored by or involving agent-generated changes require additional scrutiny.

### Routing Integrity

- [ ] All routing-table entries in `AGENTS.md`, `CLAUDE.md`, and any other agent entry files point to files that exist
- [ ] No new routing-table entries point to stubs or empty files
- [ ] Routing tables across all entry files are consistent (same targets for the same tasks)

### guide/ Protection

- [ ] No files in `guide/` have been modified, added, or deleted
- [ ] `guide/` remains read-only educational content

### Principle Compliance

- [ ] Changes do not violate any principle in `docs/golden-rules/PRINCIPLES.md`
- [ ] If a principle seems to conflict with the change, the principle wins — or an ADR is required explaining why

### Plan Alignment

- [ ] If the work is covered by an execution plan, the plan has been updated to reflect progress
- [ ] Plan state is correct (still `active` if work remains, moved to `completed` if done)

---

## Approval Criteria

A PR may be approved when:

1. **All checklist items pass.** No exceptions for "we'll fix it later" — that is tech debt and must be recorded in `docs/quality/TECH_DEBT_REGISTER.md` before merge if truly deferred.
2. **All automated checks pass.** CI scripts must be green.
3. **At least one reviewer** has verified the checklist. For agent-only work, the human operator serves as reviewer.

A PR must be **blocked** when:

- Any validation script fails
- `guide/` has been modified
- Content is duplicated between entry files and `docs/`
- A routing-table link is broken
- Docs affected by the change were not updated

---

## Review Workflow

1. **Author** opens PR with a clear title and description referencing the execution plan (if any)
2. **Author** self-reviews using the checklist above before requesting review
3. **Reviewer** works through the full checklist, prefixing comments with `blocking` or `non-blocking`
4. **Author** addresses all blocking comments; acknowledges non-blocking ones
5. **Reviewer** approves once all blocking items are resolved; **Author** merges and deletes the branch

If reviewer and author disagree, check `docs/golden-rules/PRINCIPLES.md` (principles win) or existing ADRs. If neither resolves it, create an ADR. Never merge with unresolved blocking comments.

---

*Reviews are not gatekeeping — they are quality assurance. A well-reviewed PR protects the entire system of record.*
