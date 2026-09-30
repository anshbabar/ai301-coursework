# Evidence guide: where proof lives in a reproduction package

In eval mode, use only the supplied bundle. Do not fetch links or
assume facts absent from the bundle.

In live mode, use the issue and repository sources for context and
policy. Grade the candidate evidence contained or quoted in the draft
comments; do not silently supplement incomplete comments with files
elsewhere in the student's working directory.

This guide locates evidence. Apply the pass conditions and verdict
rule from rubric.md.

## Environment

- Where it lives:
  - Eval: the issue context and repo-facts block for the target
    environment; the repro report's environment record and setup
    commands for the environment actually tested.
  - Live: the issue description and relevant repository setup docs,
    compared with the draft report's revision, versions, configuration,
    and installation commands.

- What good looks like:
  The report identifies the tested revision and relevant runtime,
  dependency, OS, and configuration details sufficiently to recreate
  the environment. Compare these with the issue's target conditions;
  any meaningful difference is disclosed and accounted for in the
  conclusion rather than silently treated as equivalent.

## Steps

- Where it lives:
  - Eval: the repro report's setup commands, ordered actions, test
    commands, input examples, fixtures, and resource references.
  - Live: those same elements in the draft report, using repository
    documentation to establish any explicitly referenced setup.

- What good looks like:
  A reader can move from the stated starting environment to the
  relevant trigger using the supplied instructions and available
  inputs, without inventing essential steps. Commands identify the
  necessary working directory or context, and resources are included
  or accessible rather than unexplained files on the author's machine.

## Behavior shown

- Where it lives:
  - Eval: the issue context's trigger and reported symptom, compared
    with the repro report's expected result, observed result, and
    output excerpts, logs, screenshots, or test results.
  - Live: the issue description and relevant clarifications, compared
    with the expected and observed behavior and artifacts in the draft.

- What good looks like:
  The expectation is grounded in the issue or documented behavior,
  and concrete artifacts support the reported observation for the
  relevant scenario. Check what a failing test or error actually
  demonstrates: an installation error or unrelated failure does not
  establish reproduction of the issue.

  For a cannot-reproduce report, look for a relevant, repeatable
  primary attempt, its observed output, and an explicit account of
  any trigger conditions that were not achieved or remain uncertain.
  Such a report can be ready to post without establishing the trigger,
  provided its conclusion stays limited to the attempted conditions.
  Missing details for an exploratory follow-up do not erase the
  documented primary attempt, but cannot support stronger conclusions.
  An unrelated test or a bare "works for me" remains insufficient.

## Honesty

- Where it lives:
  - Eval: statements in the claim and the repro report's conclusion,
    compared with the recorded environment, actions, and artifacts.
  - Live: assertions in the draft comments compared with the evidence
    those comments contain or quote.

- What good looks like:
  Conclusions describe only what the supplied evidence supports,
  distinguish completed actions from proposed ones, and state
  relevant limitations. Cannot-reproduce conclusions remain limited
  to the tested conditions; they do not claim the bug cannot exist.

  In a claim-only draft, a promise to investigate and report findings
  does not require completed reproduction evidence. Any assertion of
  work already completed still needs support.

## Comms

- Where it lives:
  - Eval: the claim comment against the issue context; both comments
    against the conventions and policies supplied in the repo-facts
    block or elsewhere in the bundle.
  - Live: the draft claim against the issue, and both draft comments
    against applicable repository contribution instructions, templates,
    AI-use policies, and the skill's scope.md house rules.
    Also consult voice-guide.md for live wording feedback.

- What good looks like:
  The claim identifies the issue-specific behavior, a relevant next
  investigative step, and an intention to report findings without
  promising a fix or deadline. Comments communicate respectfully and
  understandably; length and headings alone do not establish quality.

  Check each stated applicable repository requirement, including
  whether required AI-assistance disclosure appears in the specified
  comment or location. Do not invent an AI ban or disclosure rule
  where none is stated, or mistake unavailable policy evidence for
  confirmed compliance.

  Apply the classroom house rules in live mode: another student's
  claim does not block this student's work, but the student must
  provide their own report and evidence.

  Voice-guide feedback alone does not change the verdict; a rejection
  must follow an applicable required rubric check.

  For a repository with a mandatory AI-disclosure policy, locate both
  the policy's required details and the package's statement about
  assistance. Silence does not establish either AI use or non-use:
  grade unstated assistance status unclear under the rubric's
  conservative readiness rule. Do not infer AI use from writing style.
  If use is disclosed, compare the disclosure with the exact policy;
  if no use is explicitly stated, do not demand invented tool details.

