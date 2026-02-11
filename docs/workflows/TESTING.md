# Testing Strategy

<!-- reviewed: 2026-02-11 -->

> **Purpose:** Define the testing philosophy and approach for Context_Map projects.
> In a template repository, the "product" is the structure and documentation itself.
> Tests verify that the system of record is intact, consistent, and trustworthy.

## Testing Philosophy

Context_Map is a template and guide. Its correctness is measured by structural integrity, documentation accuracy, and routing consistency — not by traditional code coverage. Tests exist to enforce the principles in `docs/golden-rules/PRINCIPLES.md` automatically, because manual discipline is insufficient for agent-led development at scale (Principle 6).

There are three layers of testing:

1. **Structural tests** — Does the repo layout match the architecture?
2. **Content tests** — Are docs fresh, complete, and internally consistent?
3. **Project-specific tests** — Custom tests you add when using this template for your own work.

---

## Layer 1: Structural Tests

Structural tests verify that the repo conforms to the Context_Map architecture.

### What they check

- Required directories exist (`docs/`, `guide/`, `plans/`, `scripts/`)
- Required subdirectories exist (`docs/architecture/`, `docs/golden-rules/`, etc.)
- Agent entry files exist (`AGENTS.md`, `CLAUDE.md`, `ARCHITECTURE.md`)
- `guide/` has not been modified from its reference state

```bash
scripts/check-structure.sh    # Run before every commit, in CI, and after scaffolding
```

---

## Layer 2: Content Tests

Content tests verify that documentation is fresh, complete, and internally consistent.

### Freshness checks

Every doc must carry a `<!-- reviewed: YYYY-MM-DD -->` tag. Docs older than 30 days are flagged as stale.

```bash
scripts/check-doc-freshness.sh
```

### Completeness checks

Every file referenced in a routing table (`AGENTS.md`, `CLAUDE.md`, `docs/_INDEX.md`) must exist and contain meaningful content (not just a heading or empty file).

```bash
scripts/check-agent-files.sh
```

### Routing consistency

All agent entry files must route to the same targets for the same tasks. If `AGENTS.md` says "Follow development workflow" points to `docs/workflows/DEVELOPMENT.md`, then `CLAUDE.md` must agree.

This is checked as part of `scripts/check-agent-files.sh`.

---

## Layer 3: Project-Specific Tests

When you use Context_Map as a template for your own project, you will add tests specific to your domain.

### Adding your own tests

1. **Place test scripts** in `scripts/` using the naming convention `check-<what>.sh`, or use your language's test framework.
2. **Register tests** in your CI pipeline and in the pre-commit checklist in `docs/workflows/DEVELOPMENT.md`.
3. **Keep structural and content tests running.** They protect the system of record even as the project grows. Do not disable them because "the project has real tests now."

### Test file organization

```
scripts/
  check-structure.sh          # Layer 1: structural validation
  check-doc-freshness.sh      # Layer 2: freshness validation
  check-agent-files.sh        # Layer 2: routing validation
  check-<your-domain>.sh      # Layer 3: project-specific checks
```

---

## Running All Tests

```bash
scripts/check-structure.sh       # Layer 1
scripts/check-doc-freshness.sh   # Layer 2
scripts/check-agent-files.sh     # Layer 2
# npm test / pytest / etc.       # Layer 3
```

All three layers must pass in CI for a PR to be mergeable.

---

## When to Write New Tests

Write a new test when you add a validation rule, add a structural requirement, find a bug a test could have caught, or when a quality audit scores below 3 in any dimension. The goal is that every principle worth stating is enforced automatically.

---

*Tests in Context_Map protect the system of record. If a rule matters, a test checks it.*
