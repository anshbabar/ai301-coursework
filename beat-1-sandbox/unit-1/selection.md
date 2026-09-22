# Unit 1 — Issue Selection

Path: `beat-1-sandbox/unit-1/selection.md`

Record of the issue carried into Unit 2, and of the evaluation runs that produced
`eval-run.txt`.

---

## Selected issue

**Issue link**

https://github.com/codepath/pathreview-ai301-fa26-s3/issues/63

**Verdict output**

1. #63 — README scorer test fixture too short (accept)
Tightest scope of the three: one test function in one file, with a copy-paste repro (pytest tests/unit/test_readme_scorer.py -q → assert 51 > 100). I confirmed the xfail(strict=True, reason="issue #63: …") marker is live at tests/unit/test_readme_scorer.py:18–21, and CONTRIBUTING documents exactly what to do with it — so "done" is machine-checkable rather than a judgment call.

```json
{
  "item": "https://github.com/codepath/pathreview-ai301-fa26-s3/issues/63",
  "checks": [
    {
      "name": "Maintainer activity",
      "grade": "pass",
      "evidence": "COLLABORATOR Aburke225 committed to main 2026-09-16, 6 days before today (2026-09-22)"
    },
    {
      "name": "Project in use",
      "grade": "pass",
      "evidence": "archived: false; pushed_at 2026-09-16 is within 90 days (no releases exist)"
    },
    {
      "name": "Bounded contribution",
      "grade": "pass",
      "evidence": "One concrete outcome: 'Extend the fixture (or correct the assertion)' in test_readme_with_all_quality_signals"
    },
    {
      "name": "Repeated failed attempts",
      "grade": "pass",
      "evidence": "Opened 2026-09-10 (12 days old); repo has 0 PRs in any state"
    },
    {
      "name": "Available to work on",
      "grade": "pass",
      "evidence": "assignees: [] explicitly empty; 0 comments; timeline has only 4 label events; no PRs exist in repo"
    },
    {
      "name": "AI workflow permitted",
      "grade": "pass",
      "evidence": "docs/CONTRIBUTING.md, PR template and 4 issue templates inspected: no AI restriction stated"
    },
    {
      "name": "Newcomer guidance",
      "grade": "pass",
      "evidence": "Labeled 'good first issue'; names tests/unit/test_readme_scorer.py and the exact test function"
    }
  ],
  "verdict": "accept"
}
```

---

## Eval iterations

**Run history**

An initial setup attempt stopped because my rubric was empty and produced no agreement score. After completing setup and filling the rubric, I completed one full evaluation. It reported:

> agreement: 18/20 scored items  (bar: 18/20: PASS)

The category results were:

> categories: claimed 4/4  clear-accept 6/8  dead-repo 3/3  policy 1/1  scope 4/4

I kept the rubric unchanged after this run and did not perform partial re-runs. This is the final run saved in my submitted `eval-run.txt`.

**Issue analysis**

For `issue-01`, my rubric returned `reject`, while the gold label was `accept`. The required “Bounded contribution” check failed with this explanation in `results.json`:

> Issue lists five distinct deliverables across five files (new page; updates to manage-pkgs.rst, pip-interoperability.rst, new-features.md; optional troubleshooting.rst entry) — umbrella-style scope intended to be split, not one concrete outcome.

The grader interpreted the documentation updates as separate deliverables and applied my rule against umbrella work. Since every required check must pass, this caused the rejection. “Newcomer guidance” also failed, but it is preferred and did not affect the verdict.

This disagreement shows that the grader interpreted my scope rule too cautiously in this case. Changes across several files can still support one bounded documentation goal; file count alone does not establish that an issue should be split.

**Check rationale**

The “Bounded contribution” check in my uploaded rubric is:

| Check | Evidence | Pass condition | Weight |
|---|---|---|---|
| Bounded contribution | Issue body, labels, and comment thread, especially maintainer statements about the requested work. | Requests one concrete contribution with an identifiable outcome. Reject umbrella/tracking work intended to be split, unresolved design debates, pure usage questions, or changes explicitly requiring core-internals work. A short description or missing reproduction steps alone does not fail. A good-first-issue label cannot override explicit scope problems. | required |

I made this check required because a project can be active and an issue available while the requested work is still too broad for a first contribution. The wording focuses on the actual work rather than the length of the description or the presence of a friendly label.

**Trade-offs**

The phrase “Requests one concrete contribution with an identifiable outcome” favors clearly bounded work but can cause false rejections when related changes are interpreted as separate tasks.

For `issue-01` and `issue-19`, the gold label was `accept`, but my rubric returned `reject`. Both reported:

> failed: Bounded contribution, Newcomer guidance (preferred)

The required scope check caused these rejections; the preferred check did not affect the verdict. I kept the rubric after reaching 18/20 and accepted these two missed opportunities as a limitation of this version.

---

## Selection rationale

**Selection rationale**

1. I chose issue #63 because it has the smallest scope of the three candidates and fits my goal of learning how open-source contributions work. A focused test change leaves time to understand the existing code, verify my fix, and prepare a pull request.

2. Claude correctly identified the bounded task, the specific test involved, and a concrete way to verify the result. Beyond its checks, I considered my learning goal: I want to practice the complete contribution process without taking on too much implementation work at once.

3. I do not expect difficulty claiming the issue, especially in a classroom setting. The live verdict reported no assignee or claim comments at the time of the run, and the Path Review classroom rule allows students to work on the same issue. I will follow the Unit 2 instructions when posting my claim.

---

Related paths: `eval-run.txt` in this directory; your skill's files in
`tools/issue-select/`.
