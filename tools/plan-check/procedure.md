# Procedure: how this skill grades a plan package

## Read order

1. Determine whether this is live mode or eval mode using SKILL.md.
   In live mode, first read scope.md, verify the issue is in scope,
   and note the house rules. Follow SKILL.md if scope is missing or
   invalid. In eval mode, ignore scope.md and use only the bundle.
2. Read rubric.md and references/evidence-guide.md. Identify every
   check, its evidence sources, its pass condition, and the verdict
   rule. Stop if the rubric has no checks.
3. Read the issue context, thread highlights, and repository facts.
   Record the requested behavior, maintainer constraints, and
   applicable repository conventions.
4. Read the reproduction evidence before the proposed plan. Record
   the inputs, steps, actual behavior, expected behavior, and any
   evidence that supports or rules out a cause. This establishes the
   baseline against which the diagnosis and tests will be judged.
5. Read the entire plan and draft comment. Identify the diagnosis,
   scope, exclusions, files, approach, test expectations, and risks.
   Finish reading the package before grading any check.
6. In live mode, also read voice-guide.md for the comment review.

## Evidence gathering

1. Use references/evidence-guide.md to locate each source. In eval
   mode, quote only the supplied bundle; do not browse or inspect
   external files. In live mode, gather issue-side context from the
   permitted sources. Judge the candidate plan and comment by what
   the drafts contain and quote, not by unmentioned working files.
2. For diagnosis-grounded, pair the plan's claimed cause and fix
   with the reproduction's relevant observations. Record supporting
   evidence and any contradiction or ruled-out explanation.
3. For bounded-scope, record the proposed changes, exclusions,
   deferred behavior, and files. Compare each change with the issue
   and identify whether it supports the stated fix.
4. For actionable-approach, record where implementation starts,
   what behavior changes, and how the approach produces the result.
   Compare these details with the repository facts.
5. For decisive-test, pair the reproduced failure with the planned
   test inputs, steps, implementation exercised, and expected result.
   Identify the observable difference between the buggy and fixed
   behavior and any relevant boundary cases.
6. For honest-unknowns, identify assumptions that could invalidate
   the fix. Record whether they are supported, acknowledged, or
   assigned a verification step before dependent changes.
7. For comment-and-conventions, compare the comment's promises and
   verification plan with the plan itself, maintainer requests in
   the thread, and applicable repository conventions.
8. Keep a short quote or specific source fact for each check.
   If evidence appears absent, recheck the relevant source before
   recording exactly what is missing.

## Check execution

1. Execute every rubric check in table order, using its gathered
   evidence. Do not stop grading after the first failure.
2. Assign pass when the evidence satisfies the stated condition.
   Assign fail when the evidence demonstrates a violation.
   Assign unclear when necessary evidence is genuinely missing or
   too ambiguous to decide. Do not fill gaps with assumptions.
3. Give each grade a concise explanation citing the deciding quote
   or fact. For unclear, name the missing evidence and where it was
   expected.
4. Judge the proposed behavior and supporting evidence, not length,
   headings, polished language, or the number of files. Explicitly
   bounded partial fixes may pass; use the rubric's conditions.
5. Re-read a source when evidence conflicts or a decision remains
   ambiguous. Otherwise use the gathered evidence without repeatedly
   reading the entire package.
6. In live mode, separately note any voice-guide violations and quote
   the relevant rule. Do not change the rubric verdict for voice
   alone unless a rubric check explicitly makes it relevant.

## Verdict assembly

1. Apply the verdict rule in rubric.md exactly. Under the current
   rule, accept only if every required check passes. Any required
   fail or unclear produces reject. Preferred checks do not affect
   the verdict.
2. Explain which required checks caused a rejection, quoting the
   deciding evidence or identifying what is missing. For acceptance,
   briefly explain how the evidence satisfies the required checks.
3. Output every check's name, grade, and evidence, followed by the
   binary verdict, using the exact output contract in SKILL.md.
   Keep its required fenced JSON block valid and last.
