# Evidence guide: where evidence lives in a PR package

## Plan fidelity (harness category: silent-drift)

**Eval:** read Plan context for scope, exclusions, proposed changes, and any
deviations. Compare with Candidate PR / Diff and Commits, then Title and
Description. Check both extra hunks and missing promised outcomes.

**Live:** read plan.md, especially Scope, Exclusions, Files, and Deviations;
compare with git diff main...HEAD and git log main..HEAD. Check pr_draft.md's
title and each claim against that committed diff and test_evidence.md.

**Good evidence:** each substantive change maps to the plan or a justified
recorded deviation. Deferred work is explicit with a reason. The description
neither claims unimplemented work nor hides changed behavior. Honest partial
delivery can pass; silent expansion, omission, or contradictory claims cannot.
Used by plan-fidelity and description-fidelity.

## Test evidence (harness category: not-tested)

**Eval:** read the original repro and Test plan in Plan context; compare with
Candidate PR / Test evidence and Description / Testing. Find repository check
requirements in Repo facts. Inspect changed tests in Diff for what is exercised.

**Live:** pair plan.md's reproduction and planned tests with test_evidence.md
and the draft's Testing section. The issue's posted reproduction or assigned
house repro pack supplies before evidence. CONTRIBUTING and the PR template
identify repository checks. Record environment and code state when supplied.

**Good evidence:** commands/steps and observable outputs distinguish the old
failure from the claimed new behavior. The same reproduction or an equivalent
regression reaches the changed implementation. Required check outcomes are
visible; failures, missing runs, and limitations are explained accurately.
"Tests pass" alone proves neither regression coverage nor suite execution.
A disclosed limitation is not automatically a false claim or a missing run;
whether it blocks submission depends on the actual applicable requirement.
Used by decisive-regression-evidence and repository-check-evidence.

## Diff quality (harness category: unreviewable)

**Eval:** inspect Candidate PR / Diff in full and its Commits list; use Plan
context and Issue to decide whether each supporting hunk is necessary.

**Live:** inspect the full git diff main...HEAD, not merely --stat, plus
git log main..HEAD. Compare changed files with plan.md's boundary.

**Good evidence:** the functional or test correction is readily identifiable,
with no debug leftovers, dead/commented-out blocks, unrelated cleanup, or
accidental files. A necessary larger change can pass; a small unrelated hunk
still fails. Disclosing unrelated cleanup does not make it part of the fix.
Used by reviewable-diff.

## Standards and comms (harness category: standards-wall)

**Eval:** read Repo facts for template sections, contribution instructions,
required checks, and AI policy; read Thread highlights for explicit maintainer
requests. Compare with Candidate PR / Title, Description, Diff, and Test
evidence. Do not import live policies or scope rules into the bundle.

**Live:** read the target's .github/PULL_REQUEST_TEMPLATE.md,
docs/CONTRIBUTING.md, linked applicable policies, scope.md, and issue thread.
Check pr_draft.md section by section, including Notes for Reviewers for the
course's AI-use disclosure. Consult voice-guide.md for separate voice notes.

**Good evidence:** each required section has an actual answer or justified
N/A; the issue is linked when required; explicit direction is addressed;
applicable disclosure and other mandatory requirements are satisfied. Cite
the actual rule before failing a policy check. Determine conditional policy
triggers from supplied evidence, not assumptions about every author. Live
Unit 4 specifically requires AI disclosure and an unticked pre-opening CI box;
the assignment also documents integration's expected no-tests outcome. Those
facts do not establish passing CI or real integration tests.
Used by repository-standards; voice notes alone do not decide the verdict.
