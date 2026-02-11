# Common Agent Tasks

<!-- reviewed: 2026-02-11 -->

Step-by-step recipes for frequent agent operations. Each recipe is self-contained. Follow the steps in order.

> **Prerequisite for all tasks:** You have already read the root agent file and checked `docs/session/SESSION_HANDOFF.md` for current context.

---

## Adding a New Feature

1. **Check for an existing plan.** Look in `docs/plans/active/` for a plan covering this feature. If none exists, create one first (see "Creating an Execution Plan" below).
2. **Review the plan.** Understand the scope, acceptance criteria, and any dependencies listed.
3. **Implement.** Write the code in `src/`. Follow existing patterns and conventions visible in the codebase.
4. **Write tests.** Add tests that cover the acceptance criteria from the plan. Run the full test suite to confirm nothing is broken.
5. **Update documentation.** If the feature changes any behavior described in `docs/`, update those docs. Update the freshness date on every file you touch.
6. **Move the plan.** Move the plan from `docs/plans/active/` to `docs/plans/completed/`. Update `docs/plans/_INDEX.md`.
7. **Update the handoff.** Record the completed feature in `docs/session/SESSION_HANDOFF.md` under Work Completed.
8. **Commit and PR.** Write a clear commit message. If working in a branch, open a pull request with a summary that references the plan.

## Fixing a Bug

1. **Reproduce the bug.** Confirm the issue exists. Write down the steps to reproduce, the expected behavior, and the actual behavior.
2. **Locate the cause.** Search the codebase for the relevant code. Use grep, file search, and test output to narrow down the root cause.
3. **Write a failing test.** Before fixing anything, write a test that demonstrates the bug. Confirm it fails.
4. **Fix the code.** Make the smallest change that resolves the issue without breaking existing behavior.
5. **Run all tests.** Confirm the new test passes and no existing tests have broken.
6. **Update documentation.** If the bug exposed a misunderstanding documented elsewhere, correct that documentation. Update freshness dates.
7. **Update the handoff.** Record the fix in `docs/session/SESSION_HANDOFF.md`.
8. **Commit.** Reference the bug or issue number in the commit message.

## Creating an Execution Plan

1. **Copy the template.** Copy `docs/plans/templates/execution-plan-template.md` to `docs/plans/active/` with a descriptive filename (e.g., `add-auth-module.md`).
2. **Fill in every section.** Complete the objective, scope, phases, tasks, acceptance criteria, risks, and dependencies. Do not leave placeholder text.
3. **Set the status.** Mark the plan status as `draft` or `active`.
4. **Update the index.** Add an entry to `docs/plans/_INDEX.md` with the plan name, status, and one-line description.
5. **Commit.** Commit the new plan with a message like `plan: add execution plan for [feature name]`.

## Recording an Architecture Decision

1. **Create the ADR file.** Use the next sequential number: `docs/decisions/ADR-NNNN-short-title.md`. Check `docs/decisions/_INDEX.md` for the latest number.
2. **Follow the ADR format.** Include these sections:
   - **Title** — The decision in a short phrase
   - **Status** — Proposed, Accepted, Deprecated, or Superseded
   - **Context** — What situation or problem prompted this decision
   - **Decision** — What was decided and why
   - **Consequences** — What follows from this decision, both positive and negative
3. **Add the freshness tag.** Include `<!-- reviewed: YYYY-MM-DD -->` near the top.
4. **Update the index.** Add an entry to `docs/decisions/_INDEX.md`.
5. **Commit.** Commit with a message like `decision: ADR-NNNN short description`.

## Updating Documentation

1. **Edit the content.** Make the necessary changes to the document.
2. **Update the freshness date.** Change the `<!-- reviewed: YYYY-MM-DD -->` tag to today's date.
3. **Check for broken links.** If you renamed a file or changed a heading, search the repo for references that need updating.
4. **Validate.** Run `scripts/validate-docs.sh` (if available) to check for structural issues.
5. **Commit.** Commit with a message describing what was updated and why.

## Running Quality Checks

Run these checks before committing significant changes. Execute them from the repository root.

1. **Documentation validation.**
   ```bash
   ./scripts/validate-docs.sh
   ```
   Checks for missing freshness dates, broken internal links, and structural issues.

2. **Freshness check.**
   ```bash
   ./scripts/check-freshness.sh
   ```
   Reports documents with `<!-- reviewed: -->` dates older than 90 days.

3. **Plan consistency.**
   ```bash
   ./scripts/validate-plans.sh
   ```
   Confirms all active plans are indexed and all completed plans have been moved.

If any check fails, fix the issue before committing. Do not suppress or ignore validation errors.

## Performing a Session Handoff

This is the most important task. Do it at the end of every session without exception.

1. **Open the handoff.** Edit `docs/session/SESSION_HANDOFF.md`.
2. **Update Last Updated.** Set the date and time to now.
3. **Write the Session Summary.** One to three sentences covering what this session accomplished at a high level.
4. **Fill in Work Completed.** List each discrete unit of work finished during this session. Be specific — file names, feature names, bug IDs.
5. **Fill in Work In Progress.** List anything started but not finished. Include enough context that the next agent can pick it up without re-reading everything.
6. **Fill in Blocked Items.** List anything that cannot proceed and why. Include what would unblock it.
7. **Fill in Next Steps.** Prioritized list of what the next session should tackle. Be concrete — "implement the auth middleware in src/auth/" not "continue working on auth."
8. **Record Key Decisions.** Any choices made during this session that affect future work. Link to ADRs if you created them.
9. **Record Open Questions.** Anything you were unsure about that needs human input or further investigation.
10. **Commit the handoff.** Commit with the message `session: update handoff [YYYY-MM-DD]`.

---

## Quick Recipe Index

| Task | Key Files |
|---|---|
| New feature | `docs/plans/active/`, `src/`, `docs/plans/_INDEX.md` |
| Bug fix | `src/`, test files, `docs/session/SESSION_HANDOFF.md` |
| Execution plan | `docs/plans/templates/`, `docs/plans/active/`, `docs/plans/_INDEX.md` |
| Architecture decision | `docs/decisions/`, `docs/decisions/_INDEX.md` |
| Doc update | Target doc, `scripts/validate-docs.sh` |
| Quality checks | `scripts/validate-docs.sh`, `scripts/check-freshness.sh`, `scripts/validate-plans.sh` |
| Session handoff | `docs/session/SESSION_HANDOFF.md` |

---

*This document is part of the Context_Map agent-first repository template.*
