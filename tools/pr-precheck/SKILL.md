---
name: pr-precheck
description: Grade a PR package (a candidate pull request read against the plan it claims to implement and the issue that plan belongs to) and decide whether it is ready to submit. Use when checking your own branch, draft PR title, and description before opening the pull request, or when grading an eval package bundle.
---

# pr-precheck: rubric-driven PR grading

## The question

Decide whether exactly one candidate PR is ready to submit. Read its title,
description, commits, diff, and test evidence against its accepted plan and
issue. Execute the components below rather than inventing readiness criteria.

## Inputs and modes

- **Live mode:** read the issue URL and thread; `plan.md` including deviations;
  the committed branch diff from `git diff main...HEAD` run at the repository
  root; branch commits from `git log main..HEAD`; `pr_draft.md` containing the
  title and description; and `test_evidence.md`. Read the target repository's
  `.github/PULL_REQUEST_TEMPLATE.md` and `docs/CONTRIBUTING.md`, plus relevant
  policy they name. Use explicitly supplied alternative paths when provided.
  For a house-chain submission, use the assigned house issue, house plan,
  house repro pack, and working branch under the same checks. Do not treat
  uncommitted changes as part of the diff. Report missing or inaccessible
  evidence; never claim to have read it or run commands that were not run.
- **Eval mode:** use only the supplied bundle's issue, thread, repo facts,
  plan context, and candidate PR. The bundle is the whole world: do not fetch
  its live issue, inspect a checkout, consult gold labels, or read other
  packages. Grade every check and apply the full verdict rule.

## The scope seam (live mode only)

Read `scope.md` before any other component or live artifact. Verify the
target repository against its Repo line and apply its house rules. Refuse
out-of-scope work. If the file is missing or its Repo line is a placeholder,
stop without grading and ask for that line to be filled with the section's
Path Review repository. Never guess it. Ignore scope entirely in eval mode.

## The voice seam (live mode only)

Read `voice-guide.md` and check the outgoing PR title and description against
it. Quote broken rules in the readable summary. Voice alone never changes
the verdict unless an explicit rubric check makes the rule relevant. Ignore
the voice guide entirely in eval mode.

## Component reads

Read `rubric.md` for the checks, pass conditions, weights, and verdict rule;
`references/evidence-guide.md` for evidence locations; and `procedure.md`
for the operating steps. Execute the procedure as written. Report a procedure
gap rather than silently inventing a step or check. If the rubric has no
filled checks or the procedure has no written steps, refuse to grade and
identify the empty component. Headings and instruction comments are not
content. Refusals produce a plain explanation, not a fabricated verdict.

## Verdict and output

Use only `accept` (ready to submit) or `reject` (hold), never an intermediate
verdict or score. Show a concise per-check summary and any live voice notes.
For a completed grading run, end with the exact schema below, replacing its
placeholders and adding one checks entry per rubric row. For an unopened
live PR, use the supplied issue URL as the stable item identifier and state
that it is a draft in the summary. Keep the JSON valid and last, with nothing
after its closing fence.

```json
{
  "item": "<PR URL or bundle id>",
  "checks": [
    {"name": "<check name>", "grade": "pass|fail|unclear",
     "evidence": "<one line: the fact or quote that decided it>"}
  ],
  "verdict": "accept|reject"
}
```

## Grading discipline

- Name the deciding fact or quote for every grade; "looks fine" is not evidence.
- Grade behavior and artifacts, not polish, word count, or commit count.
- Apply each pass condition literally. Record tensions without changing rules
  mid-run. Improvements belong in a later revision of the rubric.
- Follow the procedure; expose its gaps rather than improvising around them.
- Follow the rubric's unclear rule; if it is silent, unclear counts as fail.
- Distinguish disclosed limitations from unsupported claims. A bounded partial
  outcome can be ready, but disclosure does not excuse unrelated edits or an
  explicit repository requirement that remains unmet.
