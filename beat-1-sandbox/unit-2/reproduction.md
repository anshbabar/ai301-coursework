# Unit 2 — Claim and Reproduce

Path: `beat-1-sandbox/unit-2/reproduction.md`

Record of your claim and reproduction on the issue you chose in Unit 1, and of the
evaluation runs that produced `eval-run.txt`. This file is graded at the path above; a copy
kept anywhere else in the repository is not read.

Complete every labelled field below. Each is graded on its own; content placed under the wrong
label is not graded.

---

## Your identity upstream

**GitHub username**

anshbabar

---

## Posted upstream

**Claim comment**

https://github.com/codepath/pathreview-ai301-fa26-s3/issues/63#issuecomment-5902324529

Hi! I’d like to investigate the reported fixture-length mismatch in test_readme_with_all_quality_signals. I’ll run the relevant test and compare the README fixture with the scorer’s length requirement and the test’s assertion. I’ll post a reproduction report with my environment, steps, and observed output, including any differences from the reported behavior.

**Reproduction comment**

https://github.com/codepath/pathreview-ai301-fa26-s3/issues/63#issuecomment-5903862356

Reproduced the fixture/assertion mismatch in test_readme_with_all_quality_signals.

Environment
Repository: anshbabar/pathreview-ai301-fa26-s3
Commit: 2f4e82f52efbcfcc57d65b3fa5348672163ca088
macOS 26.6.2, arm64
Python 3.13.1
pytest 9.1.1
Installed the project and development dependencies in a Python virtual environment using python -m pip install -e ".[dev]".
Steps to reproduce
To prepare a fresh checkout of the tested revision:

git clone https://github.com/anshbabar/pathreview-ai301-fa26-s3.git
cd pathreview-ai301-fa26-s3
git checkout 2f4e82f52efbcfcc57d65b3fa5348672163ca088

python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
python -m pip install -e ".[dev]"
From the repository root, run the affected test:

python -m pytest \
  tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals \
  --runxfail -vv --tb=short
The test has an xfail(strict=True) marker for issue #63. --runxfail exposes the underlying failure without removing that marker or changing the source.

Expected behavior
The fixture for this test should satisfy its assertions, including word_count > 100 and word_count_category == "comprehensive".

Observed behavior
The test fails at the word-count assertion:

tests/unit/test_readme_scorer.py:60: in test_readme_with_all_quality_signals
    assert data["word_count"] > 100
E   assert 51 > 100
The captured scorer log reports word_count=51 and category=minimal. The test summary reports:

1 failed in 1.24s
Findings and scope
In agent/tools/readme_scorer.py, the word count is calculated with len(content.split()). Counts below 100 are classified as "minimal", counts from 100 through 499 as "adequate", and counts of at least 500 as "comprehensive".

The observed count of 51 is therefore inconsistent with this test's expectations. This reproduces the reported fixture/assertion mismatch; it does not demonstrate incorrect word counting by the scorer.

Execution stops at the first failing assertion, so the later "comprehensive" assertion was not reached. Based on the implementation, increasing the fixture only slightly above 100 words would still leave that category expectation unsatisfied.

This investigation covers the single affected test on the environment above. I have not applied a fix or run the full test suite.


## Eval iterations

Answer all four sections. Quote source text directly; paraphrase does not satisfy these
fields.

**Run history**

1. First full run: **18/20** agreement. The disagreements were `pkg-09` and `pkg-20`. The category results were `clear-accept 7/8`, `disclosure 0/1`, `no-evidence 4/4`, `unfollowable-comms 3/3`, and `wrong-target 4/4`. Although the overall agreement reached 18/20, the run did not pass because the disclosure category had no match.
2. After revising the rubric and evidence guide, I ran `--only pkg-09,pkg-20,pkg-07,pkg-17`. This targeted run achieved **4/4** agreement. It checked both original disagreements and two previously correct packages for regressions. As a partial run, it did not establish the full evaluation bar.
3. I ran a confirming full evaluation with the revised files and `--save-run eval-run.txt`. It achieved **20/20** agreement. This is the final run submitted in `eval-run.txt`.

**Package analysis**

For `pkg-09`, my initial rubric returned **reject**, while the gold label was **accept**.

The grader marked “Followable reproduction” as `unclear` because:

> The padded/asymmetric second attempt is described in prose only; no exact command given for it.

It also failed “Evidence targets the issue” because the shown output did not establish that one command reached its argument-size limit before the other.

However, the report explicitly limited its conclusion:

> I could NOT reproduce scenario 2

It also acknowledged that:

> my padding approach may not achieve that

The package supplied a repeatable primary attempt, its output, and an explanation of why the required trigger might not have been achieved. My original checks treated successful trigger creation as necessary even for this honestly limited failed attempt. They also let missing details for the exploratory follow-up invalidate the documented primary attempt.

I revised the checks to distinguish a claimed reproduction from an evidenced, bounded cannot-reproduce report. After revision, `pkg-09` returned **accept**, matching the gold label in the targeted rerun and the confirming full run.

**Check rationale**

The “Followable reproduction” check in my final rubric reads:

| Check | Evidence | Pass condition | Weight |
|---|---|---|---|
| Followable reproduction | The repro report's setup instructions, actions, commands, inputs, and referenced fixtures or resources. | A reader can repeat the primary investigation supporting the stated outcome using the supplied or accessible inputs and instructions. For an honestly limited cannot-reproduce report, require a repeatable documented attempt, not a successful trigger. An incompletely documented exploratory follow-up does not invalidate that primary attempt unless the conclusion depends on the follow-up; do not treat the follow-up as independently verified. Essential private or missing resources still block acceptance. | required |

I revised this check after examining `pkg-09`. The original wording was too strict about reproducing every exploratory action and establishing the trigger. The revised wording requires enough information to repeat the primary investigation while allowing a report to explain that its attempt did not establish the necessary conditions. Missing resources still block acceptance when they are essential to the conclusion.

**Trade-offs**

The revised reproduction checks allow useful but incomplete investigations to be posted. The trade-off is that an accepted report may leave the trigger unresolved or include a follow-up that cannot independently be verified. I limit this by requiring a repeatable primary attempt, concrete observations, and a conclusion that acknowledges those limits.

I reran `pkg-17` to check that this change did not excuse a report claiming reproduction of the wrong behavior. It remained **reject**, matching the gold label.

The disclosure revision makes the checker more conservative: when a repository requires disclosure, unstated AI-assistance status produces `unclear` rather than an assumption of compliance. This could hold a comment written without AI assistance until its author clarifies that status. It is a readiness standard chosen for this rubric, not proof that the author used AI or that the repository requires a declaration of non-use.

In the targeted rerun, `pkg-20` changed to the expected **reject**, while `pkg-07`, which had previously passed with disclosure, remained **accept**. The confirming full run achieved **20/20**, so no final verdict disagreed with a gold label in that run.
`tools/repro-check/`.
