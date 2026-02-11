# Architecture

> **Detailed architecture documentation lives in `docs/architecture/`.**

## Quick Summary

Context_Map follows a **progressive disclosure** architecture:

```
Agent Entry Files (AGENTS.md, CLAUDE.md, .cursorrules, copilot-instructions.md)
    ↓ route to
docs/_INDEX.md (master navigation)
    ↓ route to
Individual docs (operational truth)
    ↓ reference
Code and configuration
```

## Key Architectural Principles

1. **The repo IS the guide** — it demonstrates every pattern it teaches
2. **Five entry points, one truth** — all agent files route to `docs/`, never duplicate
3. **docs/ vs guide/** — operational (mutable) vs educational (immutable)
4. **Plans are temporal** — separate from evergreen documentation
5. **Progressive disclosure** — ~100-line entry → index → detailed docs → code

## Learn More

- Full architecture overview: `docs/architecture/OVERVIEW.md`
- Dependency rules: `docs/architecture/DEPENDENCY_RULES.md`
- Architecture decisions: `docs/architecture/ADR/`
- Design principles: `docs/golden-rules/PRINCIPLES.md`
