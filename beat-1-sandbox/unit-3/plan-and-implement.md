# Unit 3 — Plan and Build

Path: `beat-1-sandbox/unit-3/plan-and-implement.md`

Record of your plan, the branch you built it on, and the evaluation runs that produced
`eval-run.txt`. This file is graded at the path above; a copy kept anywhere else in the
repository is not read.

Complete every labelled field below. Each is graded on its own; content placed under the wrong
label is not graded.

---

## Posted upstream

**GitHub username**

anshbabar

**Plan comment**

https://github.com/codepath/pathreview-ai301-fa26-s3/issues/63#issuecomment-6028789621

Exact text of the posted comment (checked against the public GitHub API; it matches the
posted body exactly and has not been edited since it was posted at 2026-10-07T01:17:50Z):

```markdown
## Plan

Following up on my reproduction above (`assert 51 > 100`, scorer log `word_count=51`, `category=minimal`, at `2f4e82f`).

**Diagnosis:** The scorer is behaving correctly. It counts words with `len(content.split())` and only labels a README `"comprehensive"` at 500 words or more. The fixture in `test_readme_with_all_quality_signals` is only 51 words, so it can't meet the test's own `"comprehensive"` expectation. Getting just past 100 words would still fail that assertion.

**Proposed change** (only in `tests/unit/test_readme_scorer.py`, only in this test):
- Expand the inline README fixture to roughly 600–700 words of realistic README content instead of repeated filler.
- Keep every existing quality signal in the fixture (Installation, Usage, Tech Stack, badges, Live Demo / "Try it").
- Leave all existing assertions unchanged.
- Remove only this test's `xfail(strict=True)` marker for #63, per `docs/CONTRIBUTING.md`.

**Out of scope:** `agent/tools/readme_scorer.py` and its thresholds, and all other tests.

**Planned checks** (not run yet):
1. `python -m pytest tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals --runxfail -vv --tb=short -rP`: expect 1 passed, with the log showing `category=comprehensive` and `word_count` > 500
2. After removing the marker, `python -m pytest tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals -vv --tb=short`: expect a plain pass, with no XFAIL or XPASS
3. `python -m pytest tests/unit/test_readme_scorer.py -v`: expect 23 passed and no xfailed tests. This is based on the `22 passed, 1 xfailed` baseline reported earlier in this thread. My own reproduction ran only the single test.
```

---

## Your branch

**Branch**

fix/63-readme-scorer-fixture-length

- Fork branch: https://github.com/anshbabar/pathreview-ai301-fa26-s3/tree/fix/63-readme-scorer-fixture-length
- Commit: `88432f4` (`88432f49175e1707a7ef772729afdf2f7b086775`), "test(agent): expand README
  quality-signals fixture", which is the head of the branch on the fork

**Evidence**

All commands were run from the root of my Path Review clone with the project virtual
environment active (macOS, Python 3.13.1, pytest 9.1.1). Using Claude Code, I ran the
after-change test runs, `make test-unit`, `make check`, and the baseline typecheck below, and
saved each transcript with `tee`.

**Before** (reproduction step re-run before the change, on base commit `2f4e82f`, with the
issue #63 xfail marker still in place; saved as `issue63-before.txt`):

```bash
python -m pytest tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals --runxfail -vv --tb=short
```

```text
============================= test session starts ==============================
platform darwin -- Python 3.13.1, pytest-9.1.1, pluggy-1.6.0 -- /Users/anshbabar/pathreview-ai301-fa26-s3/.venv/bin/python
cachedir: .pytest_cache
hypothesis profile 'default'
benchmark: 5.3.0 (defaults: timer=time.perf_counter disable_gc=False min_rounds=5 min_time=0.000005 max_time=1.0 calibration_precision=10 warmup=False warmup_iterations=100000)
rootdir: /Users/anshbabar/pathreview-ai301-fa26-s3
configfile: pyproject.toml
plugins: platformdirs-4.12.2, hypothesis-6.168.3, cov-7.1.0, asyncio-1.4.0, benchmark-5.3.0, pytest_httpserver-1.1.5, anyio-4.15.1
asyncio: mode=Mode.STRICT, debug=False, asyncio_default_fixture_loop_scope=None, asyncio_default_test_loop_scope=function
collecting ... collected 1 item

tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals FAILED [100%]

=================================== FAILURES ===================================
____________ TestReadmeScorer.test_readme_with_all_quality_signals _____________
tests/unit/test_readme_scorer.py:60: in test_readme_with_all_quality_signals
    assert data["word_count"] > 100
E   assert 51 > 100
----------------------------- Captured stdout call -----------------------------
2026-10-06 18:19:31 [info     ] readme_scored                  category=minimal score=0.8717142857142858 word_count=51
=========================== short test summary info ============================
FAILED tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals - assert 51 > 100
============================== 1 failed in 0.31s ===============================
```

**After** (the same reproduction step re-run against the built change, with `-rP` added so
the scorer log is shown for a passing test; saved as `issue63-after-runxfail.txt`). This
saved output was captured after the xfail marker had been removed, so `--runxfail` had no
effect on this run. An earlier run of this check, made with the marker still present, also
passed (`word_count=632`, `category=comprehensive`), but its output was not saved
separately.

```bash
python -m pytest tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals --runxfail -vv --tb=short -rP
```

```text
============================= test session starts ==============================
platform darwin -- Python 3.13.1, pytest-9.1.1, pluggy-1.6.0 -- /Users/anshbabar/pathreview-ai301-fa26-s3/.venv/bin/python
cachedir: .pytest_cache
hypothesis profile 'default'
benchmark: 5.3.0 (defaults: timer=time.perf_counter disable_gc=False min_rounds=5 min_time=0.000005 max_time=1.0 calibration_precision=10 warmup=False warmup_iterations=100000)
rootdir: /Users/anshbabar/pathreview-ai301-fa26-s3
configfile: pyproject.toml
plugins: platformdirs-4.12.2, hypothesis-6.168.3, cov-7.1.0, asyncio-1.4.0, benchmark-5.3.0, pytest_httpserver-1.1.5, anyio-4.15.1
asyncio: mode=Mode.STRICT, debug=False, asyncio_default_fixture_loop_scope=None, asyncio_default_test_loop_scope=function
collecting ... collected 1 item

tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals PASSED [100%]

==================================== PASSES ====================================
____________ TestReadmeScorer.test_readme_with_all_quality_signals _____________
----------------------------- Captured stdout call -----------------------------
2026-10-06 18:25:41 [info     ] readme_scored                  category=comprehensive score=1.0 word_count=632
============================== 1 passed in 0.20s ===============================
```

**Supporting checks after the change** (excerpts from the saved transcripts, labelled):

Excerpt from `issue63-after-normal.txt`, the affected test run normally after marker removal:

```bash
python -m pytest tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals -vv --tb=short
```

```text
collecting ... collected 1 item
tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals PASSED [100%]
============================== 1 passed in 0.15s ===============================
```

Excerpt from `issue63-after-file.txt`, the whole test file:

```bash
python -m pytest tests/unit/test_readme_scorer.py -v
```

```text
collecting ... collected 23 items
tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals PASSED [  4%]
...
============================== 23 passed in 0.22s ==============================
```

Excerpt from `issue63-make-test-unit.txt`, the repository's unit suite (`make test-unit`, which
runs the first line shown):

```bash
make test-unit
```

```text
.venv/bin/pytest tests/unit -v -m unit
...
tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals PASSED [ 60%]
...
================= 376 passed, 52 xfailed, 1 warning in 19.98s ==================
```

Full output from `issue63-make-check.txt` (`make check` runs ruff, black, then mypy). Ruff and
Black passed, but `make check` exited with status 2 at the mypy step. mypy stopped at a
syntax error in the installed NumPy type stubs, which use the `type` statement (Python
3.12+), while the repository configures mypy with `python_version = "3.11"`. mypy stopped
before checking the project's code, so `make check` did not pass.

```bash
make check
```

```text
.venv/bin/ruff check .
All checks passed!
.venv/bin/black .
All done! ✨ 🍰 ✨
110 files left unchanged.
.venv/bin/mypy api/ core/ ingestion/ rag/ agent/ safety/
.venv/lib/python3.13/site-packages/numpy/__init__.pyi:737: error: Type statement is only supported in Python 3.12 and greater  [syntax]
Found 1 error in 1 file (errors prevented further checking)
make: *** [typecheck] Error 2
```

Full contents of `issue63-baseline-typecheck.txt`: to see whether my change caused that
failure, using Claude Code, I ran the same `typecheck` target in a clean, detached worktree at base commit
`2f4e82f52efbcfcc57d65b3fa5348672163ca088`, using the same virtual environment and installed
dependencies. It produced the same error and exit status, so the failure predates my change
(which only touches `tests/`, outside mypy's targets).

```bash
make typecheck VENV_BIN=/Users/anshbabar/pathreview-ai301-fa26-s3/.venv/bin
```

```text
# Baseline typecheck for issue #63
# Baseline commit (merge-base HEAD origin/main): 2f4e82f52efbcfcc57d65b3fa5348672163ca088
# Worktree: /private/tmp/claude-501/-Users-anshbabar-pathreview-ai301-fa26-s3/b6310d5a-5bda-4f2d-b885-8a59517db77a/scratchpad/issue63-baseline (detached, clean)
# Command (run from worktree root): make typecheck VENV_BIN=/Users/anshbabar/pathreview-ai301-fa26-s3/.venv/bin
# Tool versions: mypy 2.3.1 (compiled: yes); numpy 2.5.3
# ---- output ----
/Users/anshbabar/pathreview-ai301-fa26-s3/.venv/bin/mypy api/ core/ ingestion/ rag/ agent/ safety/
/Users/anshbabar/pathreview-ai301-fa26-s3/.venv/lib/python3.13/site-packages/numpy/__init__.pyi:737: error: Type statement is only supported in Python 3.12 and greater  [syntax]
Found 1 error in 1 file (errors prevented further checking)
make: *** [typecheck] Error 2
# exit status: 2
```

Not verified: full type checking and CI. No PR has been opened yet, so CI has not run on this
change. In Unit 4 I will inspect the PR's `typecheck` job and investigate any failure before
merge.

## Eval iterations

Answer all four sections. Quote source text directly; paraphrase does not satisfy these
fields.

**Run history**

1. Run 1 (full 20-package run, saved with `--save-run` as `eval-run.txt`): 19/20 agreement.

```text
categories: clear-accept 7/7  scope-creep 4/4  thread-convention 1/2  unbuildable 3/3  wrong-cause 4/4
agreement: 19/20 scored items  (bar: 18/20: PASS)
```

That was my only evaluation-harness run. Every category had at least one match, so the
category floor held, and the run passed the 18/20 bar. There were no `--only` or `--limit`
partial retries and no later full runs. The live `plan-check` grading of my own issue #63
plan, which I ran using Claude Code, was not an evaluation-harness run and is not counted
here. The run's header
fingerprints (`rubric.md`, `evidence-guide.md`, `procedure.md`, `SKILL.md`) match the files
uploaded to `tools/plan-check/`.

**Package analysis**

Package: `pkg-20` (`ghostty-org/ghostty#11261`, category `thread-convention`). My rubric
returned **accept**; the gold label is **reject**. It is the one disagreement in the run:

```text
item    category           gold    verdict  agree  note
pkg-20  thread-convention  reject  accept   NO     graded accept
```

The package's repo-facts block states the disclosure policy:

> contribution policy (CONTRIBUTING.md + AI_POLICY.md): strict AI rules. All AI usage in any form must be disclosed, stating the tool used and the extent of the assistance; the human in the loop must fully understand the work; AI-assisted issues and comments must be reviewed and edited by a human before submission

The candidate plan comment contains no AI-use disclosure. My skill passed all six checks.
Its exact `comment-and-conventions` evidence from `results-run-1.json` was:

> Comment mirrors the plan (counter, conditional recompute, both tests, corpus run, open placement question) and follows the maintainer's direction; no evidence in the bundle of AI use by the candidate, so no disclosure violation is demonstrable.

**What the evaluator reasoned (observed):** it found no evidence in the bundle that the
candidate used AI, so it concluded that no disclosure violation could be shown, and it graded
the check `pass`.

**Why the gold label rejects it:** `gold-labels.json` gives the instructor's note for this
item:

> excellent bounded plan that follows the thread's direction, but the comment contains no AI-use disclosure and ghostty's stated policy requires disclosing all AI usage; every package here is treated as AI-assisted work

**Where the evaluator went wrong:** the evaluator failed to apply the benchmark's premise that
every package is AI-assisted work. Under that premise, ghostty's policy applies to this
comment, the required disclosure is missing, and the comment conflicts with a repository
policy. That conflict should have failed `comment-and-conventions` and the package. Instead
the evaluator treated AI use as unknown and, because of that, treated the policy as not shown
to apply.

**A possible explanation (not a proven cause):** my rubric and evidence guide may have
contributed. The evidence guide says "Require AI disclosure when the supplied applicable
policy requires it." The evaluator may have read that as conditional on proof of AI use. I
also found no statement of the AI-assisted premise in the pkg-20 bundle or in my skill's
`rubric.md`, `references/evidence-guide.md`, `procedure.md`, or `SKILL.md`, so the evaluator
may have had nothing telling it to assume AI assistance. I have not tested this explanation:
I did not re-run pkg-20 with a revised rubric, so I cannot say the wording caused the miss
rather than, for example, run-to-run variation in how the model read the policy.

**Check rationale**

From the `rubric.md` uploaded to `tools/plan-check/`, exactly as it reads now:

| Check | Evidence | Pass condition | Weight |
|---|---|---|---|
| comment-and-conventions | The draft plan comment, compared with the plan's commitments, thread highlights, and repo-facts conventions. | The comment accurately describes the proposed work and how it will be verified, respects applicable maintainer requests and repository conventions, and makes no unsupported promises. Explicitly deferred work is not presented as completed or included. | required |

This check compares the plan comment with three things: the plan itself, the issue thread,
and the repository's rules. The other five checks look at whether the plan is technically
sound. This check catches problems they would miss: a comment that promises more than the
plan supports, presents deferred work as included, ignores a maintainer's stated direction,
or conflicts with a repository policy. It was part of my initial rubric, written before the
run, not a revision made after a failed run.

I chose to judge substantive compliance rather than formatting. The check asks whether the
comment "respects applicable maintainer requests and repository conventions", not whether
it uses a particular template or headings. My evidence guide makes that explicit: "Apply
policies to the actions they govern: selective PR review is not automatically a ban on
contributions, and a bug-report template is not automatically required for a plan comment."
I did this so that a good plan comment is not rejected for skipping a template that governs
a different action, while a comment that breaks a rule that does apply to it still fails. In
pkg-20 the check did not achieve the second half of that goal for AI disclosure (see Package
analysis and Trade-offs).

**Trade-offs**

**The general risk.** In general, a plan checker should not assume AI use that the evidence
does not show. If it did, it could hold back a comment a person genuinely wrote without AI,
only because it lacks a disclosure line that would not apply to it. Avoiding that assumption
has a cost too: when AI use is not stated, a package can pass with no evidence that it
complies with an AI policy at all.

**This specific package.** pkg-20 is not that general case. The instructor's note establishes
AI assistance explicitly ("every package here is treated as AI-assisted work"), and the
policy requires disclosure of "All AI usage in any form". So in pkg-20 there was nothing
uncertain to avoid assuming: the disclosure was required and missing, and the gold `reject`
is correct. My skill's `accept` is a miss, not a defensible reading of an ambiguous case.

**What a stricter check would trade.** A check that requires explicit disclosure whenever
the context establishes AI assistance, or a stated benchmark premise that every package is
AI-assisted, would likely catch pkg-20. The cost is that it moves the general risk the other
way, making it easier to hold back human-written comments wherever the premise does not
hold. I have not tested either alternative.

I kept the rubric unchanged after the first full run, because that run met the target:
19/20 agreement, above the 18/20 bar, with every category including `thread-convention` at
1/2 or better. I did not write or test an alternative rubric, and I did not re-run pkg-20
or any canary with `--only`. This missed case is a known, accepted limitation of the current
rubric.

---

Related paths: `plan.md` and `eval-run.txt` in this directory; your skill's files in
`tools/plan-check/`.
