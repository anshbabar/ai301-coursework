# Procedure: how this tool grades a PR package

## Read order

1. Determine the mode. In live mode read scope first, verify the target, and
   apply the SKILL.md refusal rules. In eval mode read only the supplied
   package and grading components; ignore scope and personal voice.
2. Read rubric.md and references/evidence-guide.md, identifying each check,
   its sources, pass condition, and weight. Refuse an empty rubric or procedure.
3. Read the issue, thread, and repository facts. Record the requested behavior,
   explicit maintainer direction, template asks, checks, and policy conditions.
4. Read the reproduction and accepted plan before the diff. Record the baseline,
   scope, exclusions, promised outcomes, test plan, and explicit deviations.
5. Read all commits and the full diff. Then read the candidate title,
   description, and test evidence. This order prevents confident prose from
   substituting for what the implementation actually does.
6. In live mode read the voice guide. Finish gathering before assigning grades.

## Evidence gathering

1. For plan-fidelity, map each substantive hunk to a plan item or documented
   deviation. Also walk the plan in reverse to find omitted commitments.
   Record where omissions and their reasons are disclosed.
2. For description-fidelity, pair each material claim in the title/description
   with its diff hunk or test result. Record claims of completeness, preserved
   behavior, success, and exclusions that the artifacts contradict.
3. For decisive-regression-evidence, pair the original failing input and the
   plan's expected-after behavior with actual commands, steps, and output.
   Record relevant boundary checks and any justified omissions. Do not infer
   successful execution from a test file's mere presence.
4. For repository-check-evidence, list each applicable repository check next
   to its command, result, and any stated failure or environment limitation.
   Distinguish checks never run from checks run unsuccessfully.
5. For reviewable-diff, inspect the entire diff and commit list for debug code,
   unused or commented-out blocks, unrelated hunks, and formatting churn.
   Pair supporting edits with the behavior they enable; size alone is no veto.
6. For repository-standards, map each actual template requirement, policy,
   explicit maintainer request, and mandatory gate to evidence of compliance.
   Determine whether conditional rules actually apply from supplied facts.
   For live Unit 4 pre-opening review, record the assignment's explicit
   instruction to leave CI unticked and its expected no-tests integration
   result; do not misrepresent either as passing CI or integration coverage.
7. Keep one deciding quote or precise source fact per check. If evidence seems
   absent, recheck its mapped location once and name exactly what is missing.

## Check execution

1. Execute every rubric row in order, even after a rejection is already certain.
2. Assign pass when its stated condition is satisfied, fail for a demonstrated
   violation, and unclear when necessary evidence cannot be verified.
3. Support each grade with its gathered evidence. Do not invent test output,
   infer a policy from another repository, or upgrade an assertion to proof.
4. Evaluate honest limitations under the relevant separate conditions: faithful
   description is different from satisfying an explicit mandatory requirement.
5. Re-read paired sources when they conflict; otherwise reuse gathered facts.
   Report any procedure gap rather than making up a new step or check.
6. In live mode quote any violated voice rule in the summary. Voice alone does
   not override the rubric verdict.

## Verdict assembly

1. Apply rubric.md's verdict rule exactly: all required checks pass means
   accept; any required fail or unclear means reject.
2. For rejection, identify the first failing or unclear required check in table
   order as the primary blocker and quote its deciding fact or missing evidence.
   Also list the other blockers. For acceptance, summarize the evidence that
   establishes readiness without claiming more than it proves.
3. Output all checks in table order using their exact names. End with SKILL.md's
   exact fenced JSON schema, valid and last. Do not append recommendations after
   the JSON or replace the binary verdict with a score.
