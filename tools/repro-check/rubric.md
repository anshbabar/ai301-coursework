# Rubric: is this reproduction package ready to post?

<!--
THIS IS THE PART YOU WRITE. The skill in SKILL.md executes whatever
checks you define here. It ships empty on purpose: the judgment is your
work.

A filled rubric must contain:

1. At least one row in the checks table. Each row needs all four
   columns:
   - Check: a short name (used in the output JSON).
   - Evidence: exactly what to look at, and where in the package. Name
     the part (the claim comment, the repro report's environment
     record, the artifacts read against the issue's description, the
     repo-facts block) or a location from your
     references/evidence-guide.md. "The report" is not a source; "the
     output excerpt read against the error the issue describes" is.
   - Pass condition: a decision rule about the OUTCOME that someone
     else could apply and get your answer. Judge the thing itself (does
     the artifact show the issue's behavior?), never the write-up's
     shape (how many steps it has, how long it is, whether it uses a
     template's headings). Structure-shaped checks are what make
     graders disagree with themselves.
   - Weight: `required` (a fail here holds the package) or `preferred`
     (never changes the verdict).

2. A verdict rule below the table: how the check grades combine into
   accept (ready) or reject (hold), including how `unclear` is
   treated. The verdict space is binary. If you write no rule for
   `unclear`, the skill treats it as fail.

Cover what actually gets bad packages posted. The lecture named the
proof families: the environment is recorded, the steps are complete
and followable, the behavior shown matches the issue (not an adjacent
one), the outcome is stated honestly (an evidenced cannot-reproduce is
a pass, a confident wrong-target is not), and the words respect the
repo's conventions. A rubric that ignores a family will fail eval
packages designed around that family.
-->

## Checks

| Check | Evidence | Pass condition | Weight |
|---|---|---|---|
| Specific claim | The claim comment read against the issue's description. | Identifies the specific behavior being investigated and a relevant next investigative step, and commits to reporting findings. Does not promise a fix or completion date, or claim results unsupported by the package. | required |
| Environment recorded | The repro report's environment record and setup commands. | Identifies the tested code revision and the runtime, dependencies, OS, and configuration relevant to the reported behavior, with enough detail to recreate the tested environment without guessing material setup details. | required |
| Followable reproduction | The repro report's setup instructions, actions, commands, inputs, and referenced fixtures or resources. | A reader can repeat the primary investigation supporting the stated outcome using the supplied or accessible inputs and instructions. For an honestly limited cannot-reproduce report, require a repeatable documented attempt, not a successful trigger. An incompletely documented exploratory follow-up does not invalidate that primary attempt unless the conclusion depends on the follow-up; do not treat the follow-up as independently verified. Essential private or missing resources still block acceptance. | required |
| Expected and observed behavior | The issue's description compared with the repro report's expected result, observed result, and supporting artifacts. | Distinguishes what should happen from what actually happened for the tested scenario. The expectation is grounded in the issue or documented behavior, and the observation is supported by the supplied evidence. | required |
| Evidence targets the issue | The report's concrete artifacts compared with the issue's defining behavior, trigger conditions, and the report's stated conclusion and limitations. | For a claimed reproduction, artifacts demonstrate the issue's actual behavior under relevant conditions, not an unrelated failure. For a cannot-reproduce report, artifacts show a relevant documented attempt and its observed result; unachieved or uncertain trigger conditions are explicitly identified and the conclusion remains limited to that attempt. Do not require successful trigger creation for an honestly bounded failed attempt, and do not accept an unrelated test or unsupported assertion merely because it is labeled cannot-reproduce. | required |
| Honest outcome | The report's conclusion and claims of execution or verification compared with its steps, environment, and artifacts. | States whether the issue was reproduced or could not be reproduced in the tested conditions, consistent with the evidence. Discloses relevant limitations and does not present guesses or unexecuted steps as verified results. An evidenced cannot-reproduce report passes without claiming the issue cannot exist elsewhere. | required |
| Repository conventions | The claim and repro comments compared with the repo-facts block in eval mode, or applicable repository contribution and AI-use policies in live mode; include any explicit statement about AI assistance. | Follows all stated applicable repository rules. When the repository requires AI-use disclosure, verify the package's assistance status: disclosed use must include the details the policy requires, such as tool and extent; an explicit statement of no AI use satisfies this conditional requirement unless contradicted by evidence. If assistance status is unstated, grade unclear rather than assuming no AI was used. If assistance is established but required disclosure is missing or incomplete, grade fail. Do not impose disclosure requirements where no policy states them. | required |
| Clear and respectful communication | The wording of the claim and repro comments. | Communicates the investigation and findings understandably and respectfully, without blame, demands, or unsupported certainty. Judge meaning and usefulness, not length, headings, or use of a particular template. | required |

## Verdict rule

For a full package, return accept only if every required check is pass.
Return reject if any required check is fail or unclear.
Preferred checks, if added, never change the verdict.

For a claim-only draft, apply Specific claim, Repository conventions,
and Clear and respectful communication to the claim. Assess only
requirements applicable to that claim; do not require reproduction
results or a repro comment.

Mark every reproduction-dependent check unclear with evidence
"not yet applicable: claim-only draft" and exclude those checks from
the claim-only verdict.

Missing evidence for an applicable required check is unclear and
blocks acceptance. The claim-only exclusion does not excuse missing
evidence in a full package.

