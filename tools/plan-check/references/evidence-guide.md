# Evidence guide: where evidence lives in a plan package

In eval mode, use only the supplied package. The relevant sections
are Issue, Thread highlights, Repo facts, Repro evidence, Candidate
plan, and Candidate plan comment. Never fetch outside information.

In live mode, read the issue and its comments, the student's posted
reproduction, applicable repository contribution docs, and the
draft plan.md and comment.md. For a house issue, use the house repro
pack as quoted in the drafts. Do not fill gaps in the candidate's
drafts with unrelated files from the working directory.

Locate evidence by its meaning; do not require particular headings
or a particular writing style.

## Diagnosis and grounding

Where it lives:
- Eval: Candidate plan's cause or diagnosis, compared with Repro
  evidence's inputs, steps, actual output, and expected behavior.
  Read Issue for the behavior the diagnosis must explain.
- Live: plan.md's diagnosis and quoted evidence, compared with the
  student's posted repro comment or quoted house repro pack.

What good looks like:
The proposed cause explains the observed failure and is not
contradicted by the reproduction. The fix targets that cause.
Distinguish a reasonable evidence-supported explanation from an
unsupported assertion; do not demand proof from unavailable code.

## Scope

Where it lives:
- Eval: Candidate plan's change, in-scope and out-of-scope statements,
  deferred work, and named files, compared with Issue and any
  constraints in Thread highlights.
- Live: plan.md's scope and files, compared with the issue's requested
  behavior and relevant maintainer comments.

What good looks like:
The edits support one coherent fix and make its boundaries clear.
Necessary supporting edits are allowed. A partial fix can pass when
the deferred behavior is explicit and the comment accurately states
what the change will cover.

## Executability

Where it lives:
- Eval: Candidate plan's named files, functions or areas, proposed
  behavior changes, and implementation approach; compare with Repo
  facts and relevant constraints in Thread highlights.
- Live: plan.md's files and approach, checked against applicable
  repository documentation and maintainer instructions.

What good looks like:
A stranger can identify where to begin, what to change, and how that
change should address the failure without inventing the core design.
The plan need not contain finished code or a line-by-line patch.

## Test plan

Where it lives:
- Eval: Candidate plan's test instructions and expected outcomes,
  read alongside Repro evidence's steps, inputs, and observed result.
- Live: plan.md's test plan and quoted baseline, compared with the
  posted reproduction or quoted house repro pack.

What good looks like:
The test exercises the affected implementation and names an
observable result that separates the bug from the fix. Referencing
supplied repro steps is sufficient when the inputs and steps are
unambiguous and the expected change is stated. Manual checks can
qualify for observable UI behavior; automation is not mandatory
unless an applicable repository rule requires it.

## Honesty

Where it lives:
- Eval: Candidate plan's assumptions, risks, unknowns, and any
  deviation notes, compared with Repro evidence and Repo facts.
  Also inspect Candidate plan comment for overstated claims.
- Live: plan.md's diagnosis, risks, unknowns, and Deviations section,
  along with the draft comment and the reproduction it relies on.

What good looks like:
Claims stay within the evidence. Material unresolved assumptions
are acknowledged and have concrete verification steps before
dependent changes. Do not demand invented risks or a separate risks
heading when no material uncertainty is apparent.
After a build, deviations explain what changed and why; if nothing
changed, the final plan says so. A pre-build plan does not need to
invent a completed-build deviation report.

## Comms

Where it lives:
- Eval: Candidate plan comment, compared with Candidate plan,
  Thread highlights, and Repo facts, especially contribution policy,
  applicable templates, and AI-use disclosure requirements.
- Live: comment.md, compared with plan.md, the issue thread,
  applicable CONTRIBUTING or template instructions, and scope.md's
  house rules. Review voice-guide.md separately as SKILL.md directs.

What good looks like:
The comment describes the actual proposed scope and verification,
engages relevant maintainer requests, and follows applicable
contribution rules. It does not promise more than the plan supports.
Apply policies to the actions they govern: selective PR review is
not automatically a ban on contributions, and a bug-report template
is not automatically required for a plan comment. Require AI
disclosure when the supplied applicable policy requires it.
