test(agent): expand README fixture to meet comprehensive threshold

## Summary
Expand the README fixture in `test_readme_with_all_quality_signals` from 51 to
632 whitespace-separated tokens so it satisfies the scorer's existing
500-word comprehensive threshold. The scorer behaves correctly; the fixture
was too short for the assertions it was intended to exercise.

## Issue
Closes #63

## Changes
- Expand the inline fixture with meaningful README prose while preserving its
  existing quality signals and all assertions.
- Remove only the affected test's strict issue #63 xfail marker, so the fixed
  test runs normally. There was no matching pyproject.toml suppression.

## Testing
- [ ] **CI is green on this PR (all five jobs)** — not yet verified
- [x] Unit tests pass (`make test-unit`)
- [ ] Integration tests pass (`make test-integration`) — no tests ran; expected by the Unit 4 assignment
- [x] Linter passes (`make lint`)
- [x] Type checker passes (`make typecheck`)
- [x] New/updated tests cover the changes
- [x] If this fixes a seeded bug: removed its `@pytest.mark.xfail` marker (and any matching suppression in `pyproject.toml`)

ChatGPT ran the following verification in a Linux x86_64 workspace using
Python 3.12.14 and pytest 9.1.1. These are not additional local macOS runs.
Before: `2f4e82f52efbcfcc57d65b3fa5348672163ca088` (main, isolated worktree).
After: `a8a5856d91f541a552f5095b87c524015f30579a` (this branch).

Reproduction command, run on both code states using the same virtual environment:

```bash
python -m pytest tests/unit/test_readme_scorer.py::TestReadmeScorer::test_readme_with_all_quality_signals --runxfail -vv --tb=short -rP
```

Before output:
```text
E   assert 51 > 100
readme_scored category=minimal score=0.8717142857142858 word_count=51
1 failed in 0.19s
```

After output:
```text
readme_scored category=comprehensive score=1.0 word_count=632
1 passed in 0.18s
```

Additional commands and captured results:
```text
$ python -m pytest tests/unit/test_readme_scorer.py -v
23 passed in 0.18s

$ make test-unit
376 passed, 52 xfailed, 5 warnings in 8.02s
(exit 0)

$ make test-integration
collected 0 items
no tests ran in 0.09s
make: *** [Makefile:43: test-integration] Error 5
(make exit 2; pytest exit 5)

$ make lint
All checks passed!
(exit 0)

$ make typecheck
Success: no issues found in 76 source files
(exit 0)

$ git diff main...HEAD --check
(no output; exit 0)
```

The unit suite reported five warnings. Integration contains no runnable tests;
the assignment explicitly expects this result, so that checkbox remains unticked.

## Screenshots / Demo
N/A. This change corrects a Python test fixture and does not change a user interface.
The before/after test output above demonstrates the correction.

## Notes for Reviewers
ChatGPT assisted with planning, drafting the PR-precheck skill and this
PR description, and running the Linux verification reported above. Claude Code
previously assisted with the plan, plan comment, implementation, and Unit 3
verification. AI assistance is disclosed here as required by the course.

The implementation follows the plan: one test fixture was expanded, its quality
signals and assertions were retained, and only its issue #63 xfail was removed.
No production scorer logic, thresholds, dependency configuration, or unrelated
files changed.

The Unit 3 macOS run hit a mypy/NumPy syntax compatibility error that also
occurred on the baseline. The Linux verification above passed type checking;
this does not claim the earlier macOS environment was repaired. CI remains
unverified. The plan's deviations record both environments and the expected
integration no-tests result.
