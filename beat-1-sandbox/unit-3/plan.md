# Plan: Issue #63 — README scorer test fixture is too short for its own word-count assertion

Issue: https://github.com/codepath/pathreview-ai301-fa26-s3/issues/63
Base commit: `2f4e82f52efbcfcc57d65b3fa5348672163ca088`

## Diagnosis

`TestReadmeScorer.test_readme_with_all_quality_signals` in
`tests/unit/test_readme_scorer.py` scores an inline README fixture and asserts
both `data["word_count"] > 100` (line 60) and
`data["word_count_category"] == "comprehensive"` (line 61).

In `agent/tools/readme_scorer.py`, `_score_readme` computes
`word_count = len(content.split())` (line 65) and categorizes it as:

- `< 100` → `"minimal"`
- `100`–`499` → `"adequate"`
- `>= 500` → `"comprehensive"`

The fixture (lines 23–53) contains 51 whitespace-separated tokens, so the
scorer correctly reports `word_count=51`, `category=minimal`. The defect is in
the test fixture, not the scorer: the fixture is far too short for the
`"comprehensive"` category the test expects. Making it just over 100 words
would satisfy line 60 but still fail line 61, so the fixture must reach at
least 500 words.

The test currently carries a strict xfail marker (lines 17–20):

```python
@pytest.mark.xfail(
    strict=True,
    reason="issue #63: README scorer fixture is too short for its own word-count assertion",
)
```

Per `docs/CONTRIBUTING.md` ("Working on a seeded bug: remove its xfail
marker"), fixing the bug means removing this marker; otherwise the passing test
reports `XPASS(strict)` and fails CI. There is no matching suppression for #63
in `pyproject.toml`.

## Reproduction evidence

From my Unit 2 reproduction comment
(https://github.com/codepath/pathreview-ai301-fa26-s3/issues/63#issuecomment-5903862356),
at commit `2f4e82f52efbcfcc57d65b3fa5348672163ca088` on macOS 26.6.2 arm64,
Python 3.13.1, pytest 9.1.1:

```bash
python -m pytest \
  tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals \
  --runxfail -vv --tb=short
```

```text
tests/unit/test_readme_scorer.py:60: in test_readme_with_all_quality_signals
    assert data["word_count"] > 100
E   assert 51 > 100
```

> The captured scorer log reports `word_count=51` and `category=minimal`.

```text
1 failed in 1.24s
```

The test stopped at the first failing assertion, so the `"comprehensive"`
assertion on line 61 was not reached. My reproduction ran only this single
test. I did not run the whole file.

Results reported by others on the thread, not run by me:

- Alonso-Lopez-1
  ([comment](https://github.com/codepath/pathreview-ai301-fa26-s3/issues/63#issuecomment-5822626305))
  and batoula1
  ([comment](https://github.com/codepath/pathreview-ai301-fa26-s3/issues/63#issuecomment-5988839576))
  each reported `22 passed, 1 xfailed` for `tests/unit/test_readme_scorer.py`
  at the same commit, with the marker in place.
- Alonso-Lopez-1, batoula1, and drmitte7 each reported the same
  `assert 51 > 100` failure for this test at the same commit.

## Scope

In scope, all in `tests/unit/test_readme_scorer.py`, in
`test_readme_with_all_quality_signals` only:

1. Expand the inline `readme` fixture so it is comfortably over 500 words
   (target roughly 600–700 by `str.split()`) using meaningful README prose,
   not repeated filler.
2. Preserve every quality signal the fixture already exercises: the title,
   description, `## Installation`, `## Usage`, `## Features`, `## Tech Stack`,
   two badge images, and the `## Live Demo` section with its "Try it" link.
3. Keep all existing assertions (lines 57–67) unchanged.
4. Remove only this test's `@pytest.mark.xfail(strict=True, reason="issue #63: ...")`
   marker.

## Exclusions

- No changes to `agent/tools/readme_scorer.py` or its thresholds. The scorer
  behaves correctly for the current input.
- No changes to any other test in the file or elsewhere, including the
  synthetic `"word" * N` category tests.
- No change to the `word_count > 100` assertion, even though tightening it to
  `>= 500` is a reasonable alternative. The `"comprehensive"` assertion already
  requires at least 500 words, so the existing assertions can stay untouched.
- No refactor of the fixture into a module-level constant or `tests/fixtures/`
  file, and no lint or format changes outside the edited lines.

## Files

| File | Change |
| --- | --- |
| `tests/unit/test_readme_scorer.py` | Expand the fixture in `test_readme_with_all_quality_signals`; remove its issue #63 xfail marker |
| `agent/tools/readme_scorer.py` | Read only (reference for thresholds); no change |

## Implementation approach

1. On my fork, create branch `fix/63-readme-scorer-fixture-length` from
   up-to-date `main`, following the course's `fix/<issue-number>-<slug>`
   convention.
2. Rewrite the fixture body as a realistic README for a small web project. Keep
   the existing section headings and signal-bearing lines, and add substantive
   prose: a fuller description, a Features list with explanations,
   step-by-step Installation (prerequisites, virtualenv, install command), a
   Usage section with a short code example, Configuration, Tech Stack
   rationale, Testing, Contributing, and License sections.
3. Keep the string's existing indentation style. Indentation does not affect
   `str.split()` counting or the case-insensitive regex signal checks.
4. Do the fixture edit with the marker still in place, then run check 1 below,
   using `-rP` to show the scorer log and its exact `word_count`. Adjust the
   length if the count is not comfortably above 500.
5. Remove the four-line `@pytest.mark.xfail(...)` decorator from this test only.
6. Run checks 2 and 3, then the repo's pre-PR checks from `docs/CONTRIBUTING.md`
   (`make check && make test-unit`).
7. Commit with a Conventional Commit message, for example
   `test(agent): expand README fixture so quality-signals test is comprehensive`,
   with `Fixes #63` in the footer.

## Planned test commands and expected results

This section is the original pre-build plan: the commands and expected
results as planned before implementation. For the completed results, see
[Deviations](#deviations).
Commands run from the repository root with the project virtualenv active.

1. **Affected test with xfail disabled** (after the fixture edit, before removing
   the marker):

   ```bash
   python -m pytest \
     tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals \
     --runxfail -vv --tb=short -rP
   ```

   Expected: `1 passed`. The captured `readme_scored` log shows
   `category=comprehensive` and `word_count` comfortably above 500.

2. **Affected test run normally** (after removing the marker):

   ```bash
   python -m pytest \
     tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals \
     -vv --tb=short
   ```

   Expected: `PASSED`, `1 passed`, with no `XFAIL` or `XPASS` in the output.
   This confirms a genuine pass rather than one masked by the marker.

3. **Regression check on the whole file**:

   ```bash
   python -m pytest tests/unit/test_readme_scorer.py -v
   ```

   Expected: `23 passed`, with no xfailed or xpassed tests. This expectation
   came from the `22 passed, 1 xfailed` baseline that Alonso-Lopez-1 and
   batoula1 reported on the thread, plus the #63 test now passing. At planning
   time I had not run the whole file myself; the observed result is recorded
   under Deviations.

## Risks and unknowns

- **Shared issue.** Other students have commented on #63, and one has posted a
  plan. The course permits independent work on the same issue. A classmate's
  plan does not block mine, each student builds on a `fix/` branch on their
  own fork, and credit comes from each student's own plan and PR. This plan
  is my own work, based on my own reproduction, so no coordination or hold-off
  is needed.
- **Word-count fragility.** Markdown tokens (`#`, `##`, `-`, code-fence lines)
  each count as words under `str.split()`. Targeting about 600+ words keeps
  later edits from silently dropping the fixture below 500.
- **Signal preservation.** New prose could change which regex matches, but
  every signal assertion only needs `True`. Keeping the existing
  signal-bearing lines guarantees each one still matches. `overall_score`
  should reach 1.0 when all six booleans are true and the word-count bonus is
  capped, well above the `> 0.7` assertion.
- **Environment differences.** The reproduction used Python 3.13.1 on macOS.
  CI may use a different Python version. The test is pure string processing, so
  I don't expect a difference, but CI must be green on all five jobs.
- **Fixture realism.** "Meaningful content" is a judgment call. Reviewers may
  prefer a shorter or differently structured README, as long as it stays
  over 500 words.

## AI assistance

ChatGPT assisted with planning the approach. Claude Code assisted with
drafting this plan and the plan comment, and with implementing the change and
running the verification commands.

## Deviations

- **Scope followed as planned.** I expanded the one README fixture in
  `test_readme_with_all_quality_signals` to 632 words (by `str.split()`). I
  preserved its quality signals and all assertions, and removed only its
  issue #63 xfail marker.
- **Targeted test.** It passed both with and without `--runxfail`. The whole
  file passed all 23 tests, matching the expected `23 passed`.
- **Evidence timing.** The saved `--runxfail` transcript was captured after the
  marker was removed. The earlier check 1 run, with the marker still present,
  also passed (`word_count=632`, `category=comprehensive`), but its output was
  not saved separately.
- **Unit suite.** `make test-unit` passed: `376 passed, 52 xfailed`.
- **`make check`.** Ruff and Black passed, but `make check` exited 2 at mypy.
  The installed NumPy stubs use `type` statement syntax, which requires
  Python 3.12, and that is incompatible with the configured `python_version =
  "3.11"` target. mypy stopped at that error before checking the project.
- **Baseline comparison.** The same error and exit status (2) were reproduced
  on clean baseline commit `2f4e82f52efbcfcc57d65b3fa5348672163ca088` using the
  same virtual environment, so the failure is not caused by this change.
- **Not changed or verified.** I made no dependency or configuration changes.
  Full type checking and CI remain unverified.
- **Remaining typecheck verification.** In Unit 4, after opening the PR, I will
  inspect the PR's `typecheck` CI job. If it fails, I will investigate the
  failure and resolve it or explain it before merge. CI has not been run on
  this change yet.
- **Whitespace.** `git diff --check` passed.
