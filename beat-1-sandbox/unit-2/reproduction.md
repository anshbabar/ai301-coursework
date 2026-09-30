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

[The agreement score of each run you did, in order. A single run is a complete answer if
only one run occurred. **The last score in your list must match the agreement line in the
`eval-run.txt` you committed** — that file is the record of your final run.]

**Package analysis**

[Pick one scored package (`pkg-01` through `pkg-20` — the four `calib-` packages are never
scored). Name it by id, say what your rubric decided and what the gold label said, and
explain why your rubric read it that way.]

**Check rationale**

[Quote one check from the `rubric.md` you uploaded to `tools/repro-check/`, exactly as it reads now.
Then say why it reads that way — what you revised to get there, or what you rejected in
favour of it.]

**Trade-offs**

[Every check gives something up. Any one of these is a complete answer: a package whose
result it changes, a canary you re-ran with `--only`, a case you accept it will miss, or a
stated reason nothing changed elsewhere. "Nothing changed, and here is how I know" earns
the point in full when the reason follows.]

---

Related paths: `eval-run.txt` in this directory; your skill's files in
`tools/repro-check/`.
