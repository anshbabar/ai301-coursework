# Rubric: is this plan ready to post and build from?

## Checks

| Check | Evidence | Pass condition | Weight |
|---|---|---|---|
| diagnosis-grounded | The plan's stated cause and proposed fix, compared with the repro evidence's steps, actual output, and expected behavior. | The diagnosis follows from the reproduced behavior without contradicting it, and the proposed fix addresses the supported cause. A symptom workaround is insufficient when the evidence identifies an underlying cause it leaves unresolved. | required |
| bounded-scope | The plan's included changes, exclusions, deferred work, and named files, compared with the issue's requested behavior. | The changes form one coherent fix with clear boundaries. Supporting edits are justified by that fix, and unrelated cleanup or redesign is excluded. A smaller fix is acceptable when deferred behavior is explicit and the plan does not claim to solve it. | required |
| actionable-approach | The plan's files or code locations and implementation approach, compared with the repo-facts block. | A stranger could identify where to begin and what behavior to change without inventing a major design decision. The approach fits the supplied repository facts and explains how the proposed changes produce the intended result. | required |
| decisive-test | The plan's test steps and expected results, compared with the repro evidence's inputs, commands, and observed failure. | The test exercises the affected implementation using the reproduced case or an equivalent regression check, and states an observable result that distinguishes the bug from the fix. Relevant boundary cases are covered when the evidence indicates they matter. "Run tests" or "check that it works" alone is insufficient. | required |
| honest-unknowns | The plan's assumptions, risks, and unknowns, compared with the repro evidence and repo facts. | Material uncertainty is acknowledged rather than presented as established fact. Any unresolved assumption that could invalidate the fix has a concrete verification step before dependent changes. No speculative risk list is required when the supplied evidence reveals no material uncertainty. | required |
| comment-and-conventions | The draft plan comment, compared with the plan's commitments, thread highlights, and repo-facts conventions. | The comment accurately describes the proposed work and how it will be verified, respects applicable maintainer requests and repository conventions, and makes no unsupported promises. Explicitly deferred work is not presented as completed or included. | required |

## Verdict rule

Grade each check as pass, fail, or unclear, citing the relevant
submission evidence.

Return accept (ready) only when every required check passes.
Return reject (hold) if any required check fails or is unclear.
Unclear means the supplied evidence is insufficient to decide;
do not invent missing facts.

Preferred checks, if added later, never change the verdict.
