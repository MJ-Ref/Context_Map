# Dependency and Layering Rules

<!-- reviewed: 2026-02-11 -->

This document defines the dependency relationships between areas of the
repository. These rules prevent circular references, information drift, and
tangled ownership. They are enforced by convention and validated by scripts.

---

## Dependency Diagram

```
                  ┌─────────────────┐
                  │  Entry Files    │
                  │  (CLAUDE.md,    │
                  │  CODEX.md, etc) │
                  └────────┬────────┘
                           │ route to (one-way)
                           v
                  ┌─────────────────┐
                  │     docs/       │◄─────── plans/ (reference for standards)
                  │  (operational   │
                  │   truth)        │◄─────── .claude/skills/ (reference for details)
                  └─────────────────┘
                                          ┌─────────────────┐
                                          │     guide/      │
                                          │  (educational,  │
                                          │   isolated)     │
                                          └─────────────────┘

                  ┌─────────────────┐
                  │    scripts/     │──────── validates structure of all zones
                  └─────────────────┘         (read-only, never modifies)
```

---

## Rules

### Rule 1: Entry files depend on `docs/` (one-way routing)

**Constraint**: `CLAUDE.md`, `README.md`, and `.claude/skills/*.md` may
reference files in `docs/`. They must never define policy, rules, or standards
inline.

**Direction**: Entry files --> `docs/`. Never the reverse.

**Rationale**: Entry files are summaries and routers. If they contain policy,
there are now two places where a rule is defined. When one is updated and the
other is not, an agent receives contradictory instructions. One-way routing
eliminates this class of drift.

**What this means in practice**:
- `CLAUDE.md` may say: "Follow coding standards in `docs/golden-rules/CODING_STANDARDS.md`."
- `CLAUDE.md` must not say: "Use snake_case for all variables." (That belongs in the doc it points to.)

---

### Rule 2: `docs/` is self-contained (no circular dependencies)

**Constraint**: Documents within `docs/` may cross-reference each other, but
must not form circular dependency chains. If document A references document B,
document B must not reference document A.

**Direction**: References within `docs/` form a directed acyclic graph (DAG).

**Rationale**: Circular references create ambiguity about which document is
authoritative. When an agent follows a chain of references and arrives back
where it started, it has consumed context tokens without gaining information.
A DAG structure ensures every reference chain terminates.

**What this means in practice**:
- `CODING_STANDARDS.md` may reference `DEPENDENCY_RULES.md` for architecture context.
- `DEPENDENCY_RULES.md` must not then reference `CODING_STANDARDS.md`.
- If two documents need to be aware of each other, extract the shared concern into a third document that both reference.

---

### Rule 3: `guide/` depends on nothing; nothing depends on `guide/`

**Constraint**: Files in `guide/` must not reference files in `docs/`, `plans/`,
or `scripts/` by path. Files outside `guide/` must not reference files in
`guide/` as authoritative sources for project rules.

**Direction**: `guide/` is a fully isolated zone. No inbound or outbound
dependency arrows.

**Rationale**: `guide/` is educational content about the Context_Map
methodology. It is not specific to any project that adopts the template. If
`guide/` depends on `docs/`, then changes to project-specific operational
docs break educational material. If `docs/` depends on `guide/`, then
educational opinions become operational constraints.

**What this means in practice**:
- `guide/PATTERNS.md` may describe the freshness-tag pattern in general terms.
- `guide/PATTERNS.md` must not say: "See `docs/golden-rules/CODING_STANDARDS.md` for the exact format."
- `CLAUDE.md` may mention `guide/` for onboarding context, but must not route operational questions there.

**Exception**: `README.md` may link to `guide/` files for human readers seeking
educational context. This is a navigational convenience, not a dependency.

---

### Rule 4: `plans/` reference `docs/` for standards but are self-contained

**Constraint**: Plan files in `plans/active/` and `plans/completed/` may
reference documents in `docs/` for standards and conventions. However, each
plan must contain enough context to be executed independently.

**Direction**: `plans/` --> `docs/` (for standards only). `docs/` never
references `plans/`.

**Rationale**: Plans are temporal execution artifacts. They are created, worked,
and archived. If `docs/` referenced active plans, then completing a plan would
break links in operational documentation. Plans reference `docs/` only to say
"follow these standards" — never to define the standards themselves.

**What this means in practice**:
- A plan may say: "All code must follow `docs/golden-rules/CODING_STANDARDS.md`."
- A plan must also include its own goal, scope, tasks, and acceptance criteria — it must not require reading three other plans to understand what to do.
- `docs/_INDEX.md` must not contain links to specific plans.

---

### Rule 5: `scripts/` validate structure but never modify content

**Constraint**: Scripts in `scripts/` may read any file in the repository.
They must never write to, modify, or delete any file.

**Direction**: `scripts/` reads from all zones. No zone depends on `scripts/`
for content.

**Rationale**: Enforcement scripts exist to detect violations, not to fix them.
Automated fixes mask structural problems that deserve deliberate attention. If
a freshness tag is stale, the right response is to review the document — not to
silently update the date.

**What this means in practice**:
- `check-doc-freshness.sh` may report: "CODING_STANDARDS.md reviewed tag is 45 days old."
- `check-doc-freshness.sh` must not update the tag automatically.
- Scripts exit with non-zero codes on violations, making them suitable for CI gates.

---

### Rule 6: `.claude/skills/` reference `docs/` for operational details

**Constraint**: Skill files in `.claude/skills/` are task-specific playbooks.
They may reference `docs/` for rules, standards, and procedures. They must not
duplicate content from `docs/`.

**Direction**: `.claude/skills/` --> `docs/`. Never the reverse.

**Rationale**: Skills are agent-facing instructions for specific tasks (e.g.,
"how to add a new ADR"). If a skill duplicates a coding standard inline,
updates to the standard will not propagate to the skill. By referencing
`docs/`, skills always inherit the latest rules.

**What this means in practice**:
- A skill may say: "Create the ADR using the template at `docs/architecture/ADR/000-template.md`."
- A skill must not paste the full template into its own file.

---

## Summary Table

| Source | May Reference | Must Not Reference |
|---|---|---|
| Entry files (`CLAUDE.md`, `README.md`) | `docs/`, `guide/` (nav only) | Nothing inline that belongs in `docs/` |
| `docs/` | Other `docs/` files (DAG only) | `guide/`, `plans/`, `scripts/` |
| `guide/` | Nothing | `docs/`, `plans/`, `scripts/` |
| `plans/` | `docs/` (for standards) | `guide/`, `scripts/`, other plans |
| `scripts/` | All zones (read-only) | N/A (never writes) |
| `.claude/skills/` | `docs/` | `guide/`, `plans/` |

---

## Enforcement

These rules are validated by `scripts/check-structure.sh`. Violations are
reported as warnings or errors depending on severity. The validation runs in
CI and can be used as a pre-commit hook.

When a rule feels constraining, that is usually a signal that content is in
the wrong zone. Move the content to where it belongs rather than relaxing the
rule.
