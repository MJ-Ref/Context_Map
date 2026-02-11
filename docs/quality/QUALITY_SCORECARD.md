# Quality Scorecard

<!-- reviewed: 2026-02-11 -->

> **Purpose:** Scoring rubric for auditing repository quality.
> Use this scorecard to evaluate the health of any Context_Map project.
> Run audits with `scripts/check-quality.sh` or score manually using the dimensions below.

## Scoring Dimensions

Quality is measured across four dimensions. Each is scored 1-5. An audit evaluates every dimension and produces an overall score.

---

### 1. Documentation (Weight: 30%)

Docs are the system of record. This dimension measures whether they can be trusted.

| Score | Freshness | Completeness | Accuracy |
|-------|-----------|--------------|----------|
| **5** | All docs reviewed within 30 days | Every routing-table target exists and has content | Docs match repo state exactly — no drift |
| **4** | All docs reviewed within 45 days | All required docs exist; minor gaps in optional sections | Trivial inconsistencies only (e.g., a renamed flag) |
| **3** | Some docs reviewed within 30 days; none older than 60 | Core docs exist; some referenced docs are stubs | A few outdated references that could mislead an agent |
| **2** | Most docs older than 60 days | Multiple missing docs in the routing table | Significant drift between docs and implementation |
| **1** | No freshness dates or all older than 90 days | Routing table points to files that do not exist | Docs actively contradict the codebase |

**How to check:**
- Run `scripts/check-doc-freshness.sh` for freshness dates
- Run `scripts/check-structure.sh` for completeness against the expected layout
- Manual review for accuracy (compare docs against actual code behavior)

---

### 2. Structure (Weight: 25%)

The repo layout must match the Context_Map architecture. Progressive disclosure depends on structural integrity.

| Score | Directory Compliance | Routing Integrity |
|-------|---------------------|-------------------|
| **5** | All required directories present; no extraneous top-level dirs | Every link in every routing table resolves to an existing file |
| **4** | All required directories present; one or two extra dirs with clear purpose | All routing links resolve; one or two targets are stubs |
| **3** | Most required directories present; missing one non-critical dir | Most routing links resolve; a few broken links |
| **2** | Missing multiple expected directories | Multiple broken routing-table links |
| **1** | Layout does not resemble Context_Map structure | Routing tables are absent or mostly broken |

**How to check:**
- Run `scripts/check-structure.sh` for directory compliance
- Run `scripts/check-agent-files.sh` for routing-table integrity

---

### 3. Plans (Weight: 20%)

Execution plans must follow their lifecycle. Plans that stall or skip states indicate process breakdown.

| Score | Lifecycle Compliance | Template Adherence |
|-------|---------------------|--------------------|
| **5** | All plans in correct lifecycle state; completed plans archived | Every plan uses the standard template with all required sections |
| **4** | All plans in correct state; one or two lack completion dates | Plans follow the template; minor deviations in optional sections |
| **3** | Most plans in correct state; one or two stale active plans | Most plans follow the template; some missing sections |
| **2** | Multiple plans in wrong lifecycle state | Plans exist but vary widely in structure |
| **1** | No lifecycle management; plans scattered across dirs | No consistent plan format |

**How to check:**
- Review `plans/active/` for stale plans (no updates in 14+ days)
- Review `plans/completed/` for proper archival
- Verify plan files against the template in `plans/_INDEX.md`

---

### 4. Code Quality (Weight: 25%)

Code standards, test coverage, and debt management. For template repos, structural tests and validation scripts take the place of traditional unit tests.

| Score | Standards | Tests | Debt Tracking |
|-------|-----------|-------|---------------|
| **5** | All code follows CODING_STANDARDS.md; no linter warnings | All validation scripts pass; custom tests cover project-specific logic | Tech debt register is current; all items have owners |
| **4** | Code follows standards; minor style inconsistencies | Validation scripts pass; test coverage for most custom logic | Tech debt register exists; most items have owners |
| **3** | Code mostly follows standards; some violations | Most validation scripts pass; limited custom tests | Tech debt register exists but is not current |
| **2** | Frequent standard violations | Validation scripts fail or are missing | Tech debt is acknowledged informally but not tracked |
| **1** | No coding standards enforced | No tests or validation | No debt tracking of any kind |

**How to check:**
- Run any configured linters
- Run `scripts/check-structure.sh` and `scripts/check-doc-freshness.sh`
- Review `docs/quality/TECH_DEBT_REGISTER.md` for currency

---

## Overall Score Formula

```
Overall = (Documentation * 0.30)
        + (Structure     * 0.25)
        + (Plans         * 0.25)
        + (Code Quality  * 0.25)
```

**Score interpretation:**

| Range | Rating | Action |
|-------|--------|--------|
| 4.5 - 5.0 | Excellent | Maintain current practices |
| 3.5 - 4.4 | Good | Address gaps in lowest-scoring dimension |
| 2.5 - 3.4 | Needs Work | Prioritize remediation; create an execution plan |
| 1.0 - 2.4 | Critical | Stop feature work; focus on repo health |

---

## Running an Audit

### Automated checks

```bash
# Run all validation scripts
scripts/check-structure.sh        # Directory and file compliance
scripts/check-doc-freshness.sh    # Documentation freshness dates
scripts/check-agent-files.sh      # Routing table integrity
```

### Manual audit steps

1. **Score each dimension** using the rubrics above
2. **Record the scores** and compute the weighted overall
3. **File issues** for any dimension scoring below 3
4. **Create an execution plan** in `plans/active/` if overall score is below 3.5

### Audit cadence

- **Full audit:** At least once per month
- **Spot checks:** After any major structural change
- **Automated checks:** Run in CI on every pull request

---

## Example Scorecard

```
Dimension      | Score | Notes
---------------|-------|------
Documentation  |  4    | Two docs reviewed 40 days ago
Structure      |  5    | All checks pass
Plans          |  3    | One stale active plan
Code Quality   |  4    | Minor linter warnings
-------------------------------
Overall        |  4.0  | Good — address stale plan
```

---

*This scorecard is a living document. Update the rubrics as the project's quality needs evolve.*
