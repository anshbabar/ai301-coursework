# Rubric: is this pull request ready to submit?

## Checks

| Check | Evidence | Pass condition | Weight |
|---|---|---|---|
| plan-fidelity | Plan-context scope, exclusions, and deviations compared with every diff hunk; live: plan.md against git diff main...HEAD. | Every substantive change belongs to the accepted plan or an explicit, justified deviation. Every planned deliverable is implemented or explicitly deferred with a reason. Supporting edits stay tied to the issue; neither extra behavior nor omitted work is concealed. | required |
| description-fidelity | Candidate title and description compared with the actual diff, plan/deviations, and test outcomes. | Claims accurately describe what changed and what was verified. Partial outcomes and known failures are disclosed without claiming broader success. A documented narrower result may pass; contradicted claims or silent omissions do not. | required |
| decisive-regression-evidence | Plan test plan and original reproduction compared with candidate test evidence; live: plan.md and reproduction against test_evidence.md. | Concrete commands or steps and observed results exercise the affected behavior and distinguish the reproduced failure from the claimed fixed outcome. Before evidence may be reused from the recorded reproduction. Material planned checks are evidenced or their omission is explicitly justified without overstating coverage. A bare assertion that tests pass is insufficient. | required |
| repository-check-evidence | Repo-facts required checks and plan verification compared with candidate test output; live: CONTRIBUTING and PR template against test_evidence.md. | Applicable repository checks have recorded commands and outcomes. Any failed or unavailable check is explicitly identified with a concrete reason and bounded consequence; the PR never calls an unrun or failed check passing. An honestly explained limitation can satisfy this evidence check, while an unmet explicit mandatory gate is assessed separately under repository-standards. Do not invent suite requirements absent from the supplied repository facts. | required |
| reviewable-diff | Complete unified diff and commit list, read against the issue and plan boundary. | A reviewer can isolate one coherent change. The diff contains no unrelated cleanup, accidental files, debug leftovers, dead or commented-out code, or unjustified formatting churn. Necessary supporting changes are explained. Explaining unrelated work does not make it relevant. | required |
| repository-standards | Repo-facts PR template, contribution policy, and explicit maintainer direction compared with the candidate description and artifacts; live: actual template, CONTRIBUTING, scope rules, and issue thread. | All applicable stated requirements are met: required template sections contain substantive answers or justified N/A, required issue linkage is present, relevant maintainer direction is respected, and required AI-use disclosure is explicit. Enforce stated mandatory gates and stated exceptions; do not assume an unstated policy or require a disclosure format the repo does not name. When a policy is conditional on AI use, use supplied evidence of that condition rather than assuming it. Live course submissions always require disclosure because the assignment explicitly requires it. | required |

## Verdict rule

Grade every row as pass, fail, or unclear, with a deciding fact or quote.
Accept only if every required check passes. Reject if any required check
fails or is unclear. Unclear means necessary evidence is absent, inaccessible,
or too ambiguous to verify, and has the same verdict effect as fail.
Preferred checks, if added, never change the verdict.

Judge each condition independently: an honest limitation may pass fidelity
while failing a mandatory standard. Do not reject merely because a bounded,
disclosed partial fix is smaller than the original ambition. Do not excuse
unrelated edits, contradictory claims, or unmet explicit gates because the
description admits them.

## Evidence interpretation

- In eval mode, an explicit Plan context statement that the plan is accepted
  or excerpted from a posted plan is evidence of that status. Thread highlights
  are summarized issue context, not a complete audit of all submission events.
  Do not fail description-fidelity solely because the accepted plan is absent
  from those highlights. Still fail substantive contradictions between the
  description, diff, plan, and observed results.

- Require concrete steps and observable before/after results for the primary
  reproduced bug. Once that proof is present, a specific report that an
  identified secondary control was run and remained unchanged is sufficient
  for that control; a separate raw transcript for every control is not required.
  This does not excuse a vague primary claim such as "works now", missing
  primary regression proof, an unnamed control, or contradictory evidence.
