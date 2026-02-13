# Context_Map

**An agent-first repository template and guide for agent-led development.**

> The repo IS the guide. It demonstrates every pattern it teaches.

## What Is This?

Context_Map is a repository template that structures projects for AI agent productivity. It captures the patterns that make agent-led development work:

- **Progressive disclosure** — agents find the right info in ≤3 hops
- **Docs as system of record** — documentation drives development, not the reverse
- **Execution plans as artifacts** — structured plans with lifecycle states
- **Quality scoring** — automated enforcement of standards
- **Multi-agent support** — one truth, five entry points (Claude Code, Codex, Cursor, Copilot, universal)

## Who Is This For?

- **Teams adopting agent-led development** — use as a template for new projects
- **Developers working with AI agents** — learn the patterns that reduce friction
- **Anyone scaling agent workflows** — proven structure for multi-session, multi-agent work

## Quick Start

### AI Agents

Start with your dedicated entry file — it has your orientation, constraints,
and routing into `docs/`:

| Agent | Entry Point |
|-------|-------------|
| Any / Universal | [`AGENTS.md`](AGENTS.md) |
| Claude Code | [`CLAUDE.md`](CLAUDE.md) |
| OpenAI Codex | [`CODEX.md`](CODEX.md) |
| Cursor | [`.cursorrules`](.cursorrules) → [`.cursor/rules/global.mdc`](.cursor/rules/global.mdc) |
| GitHub Copilot | [`.github/copilot-instructions.md`](.github/copilot-instructions.md) |

### Use as a Template

```bash
gh repo create my-project --template context-map/context-map
cd my-project

# Or scaffold into an existing project with Claude Code:
# /context-map scaffold
```

### Read the Guide

Start with [`guide/README.md`](guide/README.md), or browse individual chapters:

1. [Why Agent Legibility](guide/01-why-agent-legibility.md)
2. [Progressive Disclosure](guide/02-progressive-disclosure.md)
3. [Multi-Agent Setup](guide/03-multi-agent-setup.md)
4. [Execution Plans](guide/04-execution-plans.md)
5. [Quality & Enforcement](guide/05-quality-and-enforcement.md)
6. [Doc Gardening](guide/06-doc-gardening.md)
7. [Session Handoffs](guide/07-session-handoffs.md)
8. [Building Skills](guide/08-building-skills.md)

## Repository Structure

```
Context_Map/
├── AGENTS.md              # Universal agent entry point (routing table)
├── CLAUDE.md              # Claude Code entry point (routing table)
├── CODEX.md               # OpenAI Codex entry point (routing table)
├── ARCHITECTURE.md        # Architecture summary → docs/architecture/
├── docs/                  # THE SYSTEM OF RECORD (operational, mutable)
│   ├── _INDEX.md          # Master navigation with freshness dates
│   ├── architecture/      # System design and ADRs
│   ├── golden-rules/      # Principles and coding standards
│   ├── quality/           # Scorecard and tech debt
│   ├── workflows/         # Development, PR, testing, doc processes
│   ├── agent-guide/       # Onboarding and common tasks
│   └── session/           # Session handoff state
├── plans/                 # Execution plans (temporal, lifecycle)
│   ├── active/            # Currently executing plans
│   └── completed/         # Finished plans (archive)
├── guide/                 # Educational content (read-only, immutable)
├── scripts/               # Validation and enforcement
├── .claude/               # Claude Code config and skills
├── .codex/                # OpenAI Codex config
├── .cursor/               # Cursor rules
└── .github/               # GitHub Copilot instructions
```

## Key Principles

1. **Single source of truth** — all agent entry files route to `docs/`, never duplicate
2. **Progressive disclosure** — entry (~100 lines) → index → detailed doc → code
3. **Three content zones** — `docs/` (operational), `guide/` (educational), `plans/` (temporal)
4. **Enforce what matters** — if a rule is worth stating, it's worth checking automatically
5. **Freshness is measurable** — every doc has a review date, staleness is detected

See `docs/golden-rules/PRINCIPLES.md` for the full set.

## Setup & Development

### Validation

Run these from the repository root before committing changes:

```bash
scripts/check-structure.sh        # All required files and directories exist
scripts/check-doc-freshness.sh    # Every doc has a current review date
scripts/check-agent-files.sh      # Agent entry points route correctly
```

See `docs/workflows/DEVELOPMENT.md` for the full development workflow.

### Claude Code Skills

- `/context-map scaffold` — scaffold the Context_Map structure in a new project
- `/context-map audit` — audit an existing project against the standard
- `/session-handoff` — generate a session handoff document

## Contributing

This is a template repository. To contribute:

1. Fork the repo
2. Create a feature branch
3. Follow the development workflow in `docs/workflows/DEVELOPMENT.md`
4. Submit a PR following `docs/workflows/PR_REVIEW.md`

## License

MIT — see [LICENSE](LICENSE)
