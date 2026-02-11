# Coding Standards

<!-- reviewed: 2026-02-11 -->

These standards govern how code and documentation are written in this project.
They are designed to be **agent-friendly**: predictable, machine-readable, and
unambiguous. Adopt and adapt these to your own project — they are a starting
point, not a mandate.

---

## Naming Conventions

### Files and directories

- Use `UPPER_SNAKE_CASE` for documentation files: `CODING_STANDARDS.md`, `OVERVIEW.md`.
- Use `lower-kebab-case` for script files: `check-structure.sh`, `check-doc-freshness.sh`.
- Use `lower_snake_case` for source code files (adapt to your language's convention).
- Directory names are always `lower-kebab-case` or `lower_snake_case` — never mixed.

### Variables and functions

- Follow the dominant convention of your language (e.g., `camelCase` in JavaScript, `snake_case` in Python).
- Boolean variables start with `is_`, `has_`, `should_`, or `can_`.
- Constants use `UPPER_SNAKE_CASE`.

### Branches and tags

- Branch names: `type/short-description` (e.g., `feat/add-validation`, `fix/stale-tag-check`).
- Tag names: `vMAJOR.MINOR.PATCH` following semantic versioning.

---

## File Organization

### Source files

- One primary export or concept per file. If a file has grown to serve two
  purposes, split it.
- Group imports/requires at the top of the file, separated from implementation
  by a blank line.
- Order sections consistently: imports, constants, types/interfaces, main logic,
  helpers, exports.

### Documentation files

- Every `.md` file in `docs/` begins with a level-1 heading (`# Title`).
- The freshness tag (`<!-- reviewed: YYYY-MM-DD -->`) appears within the first
  five lines.
- Use `---` horizontal rules to separate major sections.
- Prefer flat structure over deep nesting. Two heading levels (`##`, `###`) are
  usually sufficient. Four levels deep is a signal to split the document.

### Directory layout

- Keep directories shallow. If a directory has more than 10 files, consider
  introducing subdirectories.
- Every directory containing documentation should have a clear owner — one
  person or team responsible for its accuracy.

---

## Documentation Requirements

### Freshness tags

Every Markdown file in `docs/` must include a machine-readable review tag:

```html
<!-- reviewed: YYYY-MM-DD -->
```

This tag asserts: "A human or agent reviewed this document for accuracy on this
date." It is not updated automatically — it is updated deliberately after
review.

**Staleness threshold**: Documents not reviewed within 30 days are flagged by
validation scripts. This threshold is configurable in the validation script.

### Section structure

Documents should follow a predictable structure so that agents can extract
information reliably:

1. **Title** — Level-1 heading stating what the document covers.
2. **Freshness tag** — Within the first five lines.
3. **Introductory paragraph** — One to three sentences explaining purpose.
4. **Body sections** — Level-2 headings for each major topic.
5. **Cross-references** — Links to related documents, grouped at the end or
   inline where contextually useful.

### Inline metadata

When a document defines rules or constraints, state them as clear imperatives:

- Good: "Branch names must follow the pattern `type/short-description`."
- Bad: "We usually try to name branches with a type prefix."

Agents interpret ambiguity as optionality. Be precise.

---

## Commit Message Format

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): short description

Optional longer body explaining the "why" behind the change.
The body wraps at 72 characters per line.

Refs: #issue-number
```

### Types

| Type | When to use |
|---|---|
| `feat` | A new feature or capability |
| `fix` | A bug fix |
| `docs` | Documentation-only changes |
| `refactor` | Code restructuring with no behavior change |
| `test` | Adding or updating tests |
| `chore` | Build, CI, tooling, or maintenance tasks |
| `style` | Formatting, whitespace (no logic change) |

### Rules

- Subject line: 50 characters or fewer, imperative mood ("add", not "added").
- No period at the end of the subject line.
- Blank line between subject and body.
- Body: explain *why*, not *what* (the diff shows the what).
- Reference related issues with `Refs: #NNN` or `Closes: #NNN`.

---

## Pull Request Conventions

### Title

- Follows the same format as commit subject lines: `type(scope): description`.
- Under 70 characters.

### Description

- **Summary**: One to three bullet points describing what changed and why.
- **Test plan**: How to verify the change works (manual steps or automated tests).
- **Related issues**: Links to issues, ADRs, or plans.

### Review

- PRs should be reviewable in under 30 minutes. If a PR is too large, split it.
- Every PR must pass validation scripts (`scripts/check-structure.sh`) before merge.
- At least one approval required before merging (adapt to your team size).

---

## Agent-Specific Standards

These conventions exist specifically to make the repository easy for AI agents
to navigate and work with.

### Machine-readable metadata

- Use HTML comments for metadata tags: `<!-- reviewed: YYYY-MM-DD -->`,
  `<!-- status: active -->`, `<!-- owner: team-name -->`.
- Agents parse these with simple regex. Keep the format consistent and
  avoid variations (e.g., always `reviewed:`, never `last-reviewed:` or
  `review-date:`).

### Predictable structure

- Documents of the same type follow the same template. All ADRs use
  `docs/architecture/ADR/000-template.md`. All plans use the plan template.
- Predictability lets agents skip discovery and go straight to extraction.

### Explicit cross-references

- When referencing another document, use the full relative path:
  `docs/golden-rules/CODING_STANDARDS.md`, not "the coding standards doc."
- Agents resolve paths literally. Natural language references require
  interpretation that wastes context and risks error.

### Self-contained sections

- Each section of a document should be understandable without reading the
  entire document. Agents often extract individual sections rather than
  reading top to bottom.
- Avoid forward references like "as described below." Either repeat the
  essential detail or use an explicit link to the section heading.

### Minimal ambiguity

- Use "must", "must not", "should", "should not" per
  [RFC 2119](https://www.rfc-editor.org/rfc/rfc2119) when defining rules.
- Avoid hedging language: "might want to consider" is not an instruction.
- If a rule has exceptions, list them explicitly.
