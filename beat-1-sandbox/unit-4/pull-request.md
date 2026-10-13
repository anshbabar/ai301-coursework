# Unit 4 — Test and Submit

Path: `beat-1-sandbox/unit-4/pull-request.md`

Record of the pull request you opened against the Path Review repo, and of the evaluation
runs that produced `eval-run.txt`. This file is graded at the path above; a copy kept
anywhere else in the repository is not read.

Complete every labelled field below. Each is graded on its own; content placed under the wrong
label is not graded.

---

## Your pull request

**Pull request**

https://github.com/codepath/pathreview-ai301-fa26-s3/pull/196

**Branch**

`fix/63-readme-scorer-fixture-length`

**Run history**

1. Run 1, full evaluation: **16/20**. Every category had a match.
2. Run 2, partial evaluation: **6/7**, covering pkg-03, pkg-04, pkg-08, pkg-13, pkg-16, pkg-19, and pkg-20.
3. Run 3, final full evaluation: **19/20**, with every category matched. The saved transcript states:

> agreement: 19/20 scored items  (bar: 18/20: PASS)

After Run 1, I clarified that accepted Plan context is evidence of a posted
plan even when summarized thread highlights omit it. I also clarified that
named secondary controls can have concise reported outcomes when the main
regression already has concrete before/after proof. Run 2 checked the four
disagreements and three previously correct rejection cases. I made no further
skill changes between Runs 2 and 3.

The final categories were clear-accept 6/7, not-tested 4/4, silent-drift 4/4,
standards-wall 2/2, and unreviewable 3/3. The only final disagreement was pkg-11.
The partial run did not replace the full transcript. Raw result files are
preserved in eval-details/.

**Package analysis**

I examined **pkg-13**. In Run 1, my rubric returned
`reject` while the gold label was `accept`.
The evaluator's decisive-regression-evidence explanation was:

> Before/after repro shows code 1 -> 0 and the full URL, but the planned control is only asserted ('No-ampersand control unchanged') with no command or output.

The package supplied a concrete Windows before/after reproduction: the URL
was truncated with exit code 1 before, then opened with both query parameters
and exit code 0 after. The evaluator nevertheless required separate command
output for the secondary no-ampersand control.

I clarified that a specific reported outcome for a named secondary control
can suffice when the primary regression is demonstrated concretely.
In the final run, my rubric returned `accept` and the gold label
was `accept`. The final evaluator wrote:

> Repro before {code=1, truncated URL} vs after {code=0, full ?q=hello&t=brave}; control named as unchanged; new test asserts 'hello^&t=x'.

This revision changes the required evidence detail for secondary controls;
it does not remove the requirement to demonstrate the main bug and fix.

**Check rationale**

The following is the exact current check:

```text
| decisive-regression-evidence | Plan test plan and original reproduction compared with candidate test evidence; live: plan.md and reproduction against test_evidence.md. | Concrete commands or steps and observed results exercise the affected behavior and distinguish the reproduced failure from the claimed fixed outcome. Before evidence may be reused from the recorded reproduction. Material planned checks are evidenced or their omission is explicitly justified without overstating coverage. A bare assertion that tests pass is insufficient. | required |
```

I kept concrete, observable proof as a required condition because a new test
file or a bare claim that tests pass does not establish that the reported bug
was fixed. After Run 1, I added the Evidence interpretation rule to distinguish
the primary reproduction from secondary controls. I rejected requiring a
separate raw transcript for every control, while retaining concrete before/after
proof for the main failure.

**Trade-offs**

Allowing concise outcomes for named secondary controls
reduces unnecessary rejection of otherwise well-supported PRs, but may accept
an inaccurate control claim that a raw transcript would expose. It does not
authenticate the reported execution.

I checked pkg-03, pkg-04, and pkg-20 as canaries in Run 2. All three still
correctly rejected, and they also rejected in the final full run.

The results also show evaluator variability: with no skill changes between
Runs 2 and 3, pkg-16 changed from reject to accept. In the full runs, pkg-11
changed from accept to reject. I report the actual final 19/20 result rather
than claiming the rubric is perfectly stable.

---

Related paths: `eval-run.txt` in this directory; your skill's files in
`tools/pr-precheck/`.
