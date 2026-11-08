# Contribution: Keep MAST download file counts consistent

Path: `beat-2-contribution/contribution-story.md`

This file is Assignment 5, and it is graded at the path above; a copy kept anywhere else in
the repository is not read. **Keep every section header below under its exact name** — the
format criteria grade exactly that. Your course repo link is the whole submission: no tool
files and no evidence uploads are part of Assignment 5.

**Contribution Number:** 1
**Student:** Ansh Babar
**GitHub Username:** anshbabar
**Issue:** https://github.com/Snoww3d/jwst-data-analysis/issues/1010
**Pull Request:** https://github.com/Snoww3d/jwst-data-analysis/pull/2178

One repository, built across units 5 to 8, telling the whole story of your real
contribution. Fill it as you work, not at the end — the sections below ask for evidence that
is far easier to write down as it happens than to reconstruct in the last weekend.

Contribution Number stays `[1]` unless you make more than one contribution this term; it
just numbers them.

---

## Toolkit

Every story section below, from Why I Chose This Issue through Pull
Request, ends with a Toolkit block: which tool did that phase's work
and how you used it, what it produced, what difficulties or
shortcomings it presented, and what you changed or would change
because of them. Together the blocks are the thread the rubric's
Toolkit points read, and they are the raw material for your unit-9
portfolio, so keep them current as you work rather than
reconstructing them later.

A Toolkit block looks like this (copy it into each story section and
fill it there):

```text
**Toolkit**

- Tool: [which tool did this phase's work, and how you used it]
- What it produced: [described in a sentence or a short excerpt]
- Difficulties: [what fought you or fell short, or "none met"]
- What changed: [the patch, revision, or workaround, what you would
  update, or "nothing"]
```

This section also keeps one short dated entry per week of tool work,
starting below: what you built or changed that week, what broke, and
what you changed because of it. The blocks tell the story where it
happened; these entries are the toolkit's own timeline.

All four entries are graded. Keep every heading below, and fill each
one in the week it belongs to.

**Unit 5: Built and tested issue-scout for real repositories (2026-11-07)**

With ChatGPT's help, I upgraded issue-select to issue-scout, drafted a Python/TypeScript fit profile, wrote two search queries with metadata-based ranking rules, and removed the sandbox-only claim exception from the new rubric. My Claude scan retrieved 200 unique issues and graded five, accepting two, but only one fit my goals; ranking by fewest comments favored new or automated issues, and recent issue updates did not prove that a repository was active. I then graded two candidates from the course Issue Selection site: both were accepted, with JWST #1010 a stronger fit because it is a focused Python data-model bug, while NomNom #358 is a UI feature with more setup. The direct grading also showed that a recent human commit can satisfy my activity check even when outside PRs wait for review, so I would add a preferred responsiveness check and revise the search ranking; those follow-up changes have not yet been implemented.

**Unit 6: Installed the voice guard and wrote the repo memory file for jwst-data-analysis (2026-11-07)**

I installed the voice guard in `~/.claude/voice-guard/`. My voice guide now has one canonical copy there, and repro-check, plan-check, and pr-precheck link to it. `check_voice.py` runs as a PreToolUse hook on Bash in `~/.claude/settings.json`. The wiring test worked: Claude Code's `gh issue comment --help` was stopped with "no body the guard can read" (guard log, 2026-11-07 22:06), which is the expected pass. What fell short was my order of steps, not the guard. I posted my claim on #1010 at 21:53 and only ran `check_voice.py --draft claim-draft.md` afterwards. It STOPPED on my rule "Name my first step and a check-in I can keep", because the claim promised a PR "within the next day" and named no first step. The posted claim is unchanged; from now on I run the guard before posting, and my repro draft passed it before going anywhere (22:19). I also wrote the repo memory file, `CLAUDE.local.md`, in my jwst clone. It imports `AGENTS.md`, records the conventions, the subsystem map, the build/test commands, and the AI policy (none stated), and it stays local through `.git/info/exclude`.

**Unit 7: Installed the ship-gate, filled a Docker-aware manifest, and got a PASS on my #1010 branch (2026-11-07)**

The install was already complete, and a fresh `claude -p` hook test was stopped by both the voice guard and the ship-gate. My manifest has four rows from CONTRIBUTING.md and `ci.yml`: an image rebuild first, because the processing container has no source mount, then pytest with the CI coverage floor, `ruff check`, and `ruff format --check`, all run in the container. The first manual gate run (22:45) passed all four checks, but my pr-precheck **rejected** the package on two checks, and both were right. The body said `Fixes #1010` where CONTRIBUTING.md and the template ask for `Closes #N`, and my `validate-pr.sh` run wasn't recorded in `test_evidence.md`. I fixed the package instead of the rubric, so I made no rubric changes, and the gate passed at 22:47. A further description-fidelity nit (I'd written "191 files formatted" for the baseline, which was 190) got fixed too, and the final run on the final body passed at 22:50. That final PASS is what I shipped: I opened PR #2178 from commit `c40bb3f` on 2026-11-08 07:01 UTC. The gate's PASS covers my local manifest (pytest, ruff check, ruff format) and pr-precheck, not the repo's CI. On the PR, only the PR Standards workflow has run, and it passed; CI, Security, Danger Zone, and Claude Code Review are awaiting maintainer approval to run, since this is my first contribution. The gate also stopped one of my own story-editing shell commands, because its text named the PR-create command. That was annoying but fair, and I moved those edits into a script file.

**Unit 8: Installed the PR monitor, wrote an evidence-based playbook, and kept its wait note local (2026-11-07)**

With Claude Code, I installed the PR monitor in `~/.claude/pr-monitor/` (no earlier playbook existed to preserve) and ran `monitor.py --state` on `fix/mast-download-file-count`, which found PR #2178 in Snoww3d/jwst-data-analysis: 0 reviews, 0 comments, "1 passing" check, MERGEABLE but BLOCKED. My playbook's 5-day first-review nudge threshold is labeled provisional because the evidence is thin: CONTRIBUTING.md states no wait, and only one of the repo's 1,208 merged PRs came from an outside contributor (#1963: maintainer comment in 27 minutes, merged in about 18 hours), not the five examples I looked for, while the unmerged outside PR #1995 has had no maintainer reply in 61 days. The full run (23:11 PST) drafted "No nudge yet. Write a wait note instead.", which matches both the empty thread and my rules, so I'm following it by doing nothing on GitHub and keeping the note local. Its limitation is that it reads only the PR's check rollup: it reported "1 passing" without seeing that CI, Security, Danger Zone, and Claude Code Review are `action_required` (waiting for maintainer approval, not failed), which I confirmed separately with `gh api .../actions/runs`.

---

## Why I Chose This Issue

My first live scan used two profile-based queries (Python good-first-issues, and TypeScript good-first-issues labelled `bug`), 200 results in all. Its top five were mostly brand-new or machine-made issues, and only one of them was a strong fit. I then graded two Issue Selection site picks directly with the patched rubric, where "scope-feasible" replaced "Bounded contribution" and every accepted issue gets a difficulty note. Both passed all six required checks. Snoww3d/jwst-data-analysis#1010 was rated **straightforward**: the owner's triage comment names `mast/models.py` and the fix ("make `file_count` a `@computed_field` (or a validator) so it is always `len(files)`"). WorldconVotingSystems/nomnom#358 was rated **moderate**: it's a UI feature with no file named and tentative button wording. I chose #1010 because it fits my profile best. It's a small Python/Pydantic bug with a concrete expected result (`file_count == len(files)`) and an obvious regression test. I want to learn how a typed API model change travels through a multi-service project, since the .NET backend reads `file_count` from this JSON.

Claim comment: https://github.com/Snoww3d/jwst-data-analysis/issues/1010#issuecomment-6717940186 (posted 2026-11-08 05:53 UTC).

My honest read of the scout: the patched rubric held up for these two picks, but two problems showed up. Read literally, "Available to work on" fails #1010 because of my own claim, so the rubric needs a rule for claims made by the scout's own user. And "Maintainer activity" passes JWST on human commits from 2026-09-21, even though the owner has only merged Dependabot PRs since then, so it doesn't measure how fast outside PRs get reviewed. One thing the difficulty note didn't capture: the issue body says `@property`, which would drop `file_count` from the JSON, while the owner's later triage comment says `@computed_field` or a validator.

**Toolkit**

- Tool: issue-scout, run first as a live scan with my two-query search strategy and then in direct mode on two site picks, graded with my Unit 6 patched rubric (scope-feasible check plus difficulty note).
- What it produced: an accept on #1010 with all six required checks passing, Newcomer guidance passing, and the difficulty note "straightforward". An accept on nomnom#358, rated "moderate". Read-outs are in `tools/issue-scout/scan-output.md`.
- Difficulties: the availability check can't tell my own claim from a stranger's. Maintainer activity counts any one human commit in 90 days, even when outside PRs sit unreviewed. The issue body's line numbers had drifted, so the scout's location pointer needed checking by hand.
- What changed: I logged both rubric gaps, with proposed patches, in `tools/issue-scout/scan-notes.md`. Neither patch is applied yet, and the Unit 1 eval harness hasn't been re-run against the patched rubric.

---

## Understanding the Issue

**Problem Description**

The processing engine's `MastDownloadResponse` model (the response for `POST /mast/download`) stores the number of downloaded files twice: once as the `files` list and once as a separate `file_count` integer. Nothing ties the two together, so the model will hold, and serialize, a count that disagrees with the list it describes. Today's only caller happens to compute the count correctly, so the bug is that the model *allows* the mismatch, not that users are seeing one right now.

**Expected Behavior**

Per the issue and the owner's 2026-09-01 triage: `file_count` always equals `len(files)`, including in the serialized JSON. The key has to stay in the JSON, because the .NET backend reads it by name (`MastModels.cs`, `[JsonPropertyName("file_count")]`).

**Current Behavior**

On `main` at `08629875`, from my reproduction: `files=[2 items], file_count=99` builds without error, and `model_dump_json()`, `jsonable_encoder`, and an HTTP body declared with `response_model=MastDownloadResponse` all emit `"file_count":99`. When `file_count` is left out, it serializes as `0` next to two files.

**Affected Components**

- `processing-engine/app/mast/models.py:197-204`: the model, where `files: list[str] = []` and `file_count: int = 0` are independent fields.
- `processing-engine/app/mast/routes.py:535-543`: the only place that constructs the model (`POST /mast/download`). It passes `file_count=len(result.get("files", []))`.
- Consumers of the JSON: the .NET `MastDownloadResponse` reads `file_count`. A grep found no `file_count` reference in the frontend. `mast_service.py` returns plain dicts with a `"file_count"` key; those aren't this model.
- Tests: `tests/test_mast_models_validation.py` (no download-model tests yet) and the `TestClient(main_mast.app)` route-test pattern in `tests/test_resume_race_condition.py`.

**Toolkit**

- Tool: Claude Code reading the repo (grep for every `MastDownloadResponse(` construction and every `file_count` reference across Python, .NET, and frontend), plus `gh issue view 1010 --comments` for the thread.
- What it produced: a map of one model, one construction site, one external consumer (.NET), and a set of look-alike `"file_count"` dict keys in `mast_service.py` that are *not* the model.
- Difficulties: the issue body's line numbers (82-84) had drifted. The body suggests `@property`, which would drop the key from the JSON, while the owner's triage says `@computed_field` or a validator. The `"file_count"` dict keys in the service made a grep look like there were many construction sites when there is only one.
- What changed: I went by the owner's triage over the issue body. I checked each grep hit by hand and wrote the service-dict keys into the plan's out-of-scope list so they don't get "fixed" by accident.

---

## Reproduction Process

**Environment Setup**

- Project: jwst-data-analysis at commit `08629875175f57b174a97c6d42ff89967ef0c68e` (`main`, the same as `upstream/main` on 2026-11-07), cloned from my fork.
- Host: macOS 26.6.2 (arm64), Docker 29.6.2, Docker Compose v5.3.1.
- Processing-engine container (`jwst-processing`), built by the documented setup: Debian 12 (bookworm), aarch64, Python 3.12.16, pydantic 2.13.5, pydantic-core 2.46.5, fastapi 0.141.1.
- Setup, following CONTRIBUTING.md and AGENTS.md: `cd docker && cp .env.example .env && docker compose up -d`, with `.env` left unchanged. The command exited 0, and `curl -s http://localhost:8000/health` returned `{"status":"healthy","service":"jwst-processing-engine"}`. I checked that `app/mast/models.py` inside the container has the same SHA-256 as the file at that commit.
- Challenge: the Docker daemon wasn't running at first (`Cannot connect to the Docker daemon at unix:///Users/anshbabar/.docker/run/docker.sock. Is the docker daemon running?`). I started Docker Desktop, and the daemon came up in about 10 seconds. The processing engine depends on `backend` in compose, so I ran the full documented stack rather than invent a partial setup.

**Steps to Reproduce**

1. Start the stack as described above, and confirm `jwst-processing` is healthy.
2. Save the repro script from my repro draft as `repro_1010.py` outside the repo. It builds `MastDownloadResponse` three ways and prints `file_count`, `len(files)`, and the serialized JSON. Run it inside the container: `docker exec -i -w /app jwst-processing python - < repro_1010.py`.
3. Case 1: `files=["a_cal.fits", "b_cal.fits"], file_count=99`. Model serialization (`model_dump_json()` and FastAPI's `jsonable_encoder`).
4. Case 2: the same two files with `file_count` omitted.
5. Case 3: a synthetic FastAPI endpoint with `response_model=MastDownloadResponse` (the same declaration as `POST /download` at `app/mast/routes.py:496`), called through `TestClient`.
6. Observed result: construction never raises. Case 1 gives `file_count = 99` with `len(files) = 2`, and `"file_count":99` appears in both serialized outputs. Case 2 gives `file_count = 0` with `len(files) = 2`. Case 3 returns HTTP 200 with a body where `file_count = 99` and `len(files) = 2`. Expected, per the issue and the owner's triage: `file_count == len(files) == 2` in every case.

**Reproduction Evidence**

- **Commit showing reproduction:** none. I didn't commit anything to my fork. The repro is an out-of-tree script run against the unmodified upstream commit https://github.com/Snoww3d/jwst-data-analysis/commit/08629875175f57b174a97c6d42ff89967ef0c68e. The full script (`repro_1010.py`), run with `docker exec -i -w /app jwst-processing python - < repro_1010.py`:

  ```python
  import json, platform, sys
  import fastapi, pydantic
  from fastapi.encoders import jsonable_encoder
  from fastapi.testclient import TestClient
  from app.mast.models import MastDownloadResponse

  print(f"python {platform.python_version()} on {platform.system()} {platform.machine()}")
  print(f"pydantic {pydantic.VERSION}, fastapi {fastapi.__version__}")

  common = dict(status="completed", obs_id="jw02733-o001_t001_nircam_clear-f090w",
                timestamp="2026-11-07T00:00:00Z")

  print("\n--- Case 1: two files, file_count=99 ---")
  r1 = MastDownloadResponse(files=["a_cal.fits", "b_cal.fits"], file_count=99, **common)
  print("file_count      =", r1.file_count)
  print("len(files)      =", len(r1.files))
  print("model_dump_json =", r1.model_dump_json())
  print("jsonable_encoder=", json.dumps(jsonable_encoder(r1)))

  print("\n--- Case 2: two files, file_count omitted ---")
  r2 = MastDownloadResponse(files=["a_cal.fits", "b_cal.fits"], **common)
  print("file_count      =", r2.file_count)
  print("len(files)      =", len(r2.files))
  print("model_dump_json =", r2.model_dump_json())

  print("\n--- Case 3: HTTP response body via response_model=MastDownloadResponse ---")
  app = fastapi.FastAPI()

  @app.get("/mismatch", response_model=MastDownloadResponse)
  def mismatch() -> MastDownloadResponse:
      return MastDownloadResponse(files=["a_cal.fits", "b_cal.fits"], file_count=99, **common)

  resp = TestClient(app).get("/mismatch")
  body = resp.json()
  print("status          =", resp.status_code)
  print("body            =", resp.text)
  print("body file_count =", body["file_count"], "| len(body files) =", len(body["files"]))
  ```

- **Screenshots/logs:** key lines of the exit-0 run (the header printed `python 3.12.16 on Linux aarch64` and `pydantic 2.13.5, fastapi 0.141.1`):

  ```text
  --- Case 1: two files, file_count=99 ---
  file_count      = 99
  len(files)      = 2
  model_dump_json = {"status":"completed","obs_id":"jw02733-o001_t001_nircam_clear-f090w","files":["a_cal.fits","b_cal.fits"],"file_count":99,"download_dir":null,"error":null,"timestamp":"2026-11-07T00:00:00Z"}
  --- Case 2: two files, file_count omitted ---
  file_count      = 0
  len(files)      = 2
  --- Case 3: HTTP response body via response_model=MastDownloadResponse ---
  status          = 200
  body file_count = 99 | len(body files) = 2
  ```

- **My findings:** reproduced at the model level. The model accepts and keeps a `file_count` that disagrees with `files`. Model serialization keeps the wrong value, and nothing between the model and an HTTP response body corrects it (shown with the synthetic endpoint). When `file_count` is omitted, it defaults to `0` instead of the real count. Limits: I did **not** call the real `POST /download` route. That route passes `file_count=len(result.get("files", []))` (`app/mast/routes.py:535-543`), so it shouldn't produce a mismatch today; the bug is that the model allows one. I didn't test the .NET backend, which reads `file_count` from this JSON, or the frontend. I tested only on arm64 macOS with the default `.env`.

**Toolkit**

- Tool: repro-check (live mode, with my voice guide) and the voice guard's manual mode (`check_voice.py --draft`). I graded my claim on its own first, then my claim and repro draft together as a full package.
- What it produced: the claim-only grade was reject (Specific claim failed). The full-package grade passed all five reproduction checks (Environment recorded, Followable reproduction, Expected and observed behavior, Evidence targets the issue, Honest outcome), plus Repository conventions and Clear and respectful communication. It still **rejected** the package on Specific claim, because the already-posted claim promises a PR "within the next day" and names no investigative step. The voice guard passed `repro-draft.md`.
- Difficulties: the claim's problem can't be fixed by revising the repro report. The claim is already posted, so the package stays rejected until a follow-up comment resets expectations. I also had to keep three levels of evidence apart: model serialization (shown), the synthetic HTTP endpoint (shown), and the real `/download` route (not tested).
- What changed: I ran the inline script from my repro draft exactly as written, to confirm it reproduces the same output. I added a "Limits of what I tested" section to the draft. I'm keeping a proposed claim revision separate from the posted original. Nothing has been posted.

---

## Solution Approach

**Analysis**

The root cause is in the model, not in any caller. `file_count` is a stored `int` with default `0` (`models.py:200-201`), so it holds whatever the constructor passes, or `0`, and every serializer emits that stored value. That one fact explains all three reproduced outputs (99 when supplied, 0 when omitted, 99 in the HTTP body). The real route is correct today only because it computes `len(files)` itself. Any new caller, or any change to `files` after construction, would drift.

**Proposed Solution**

Replace the stored field with a pydantic `@computed_field` property that returns `len(self.files)`. That's one of the two options the owner's triage names. I picked it over a validator because a validator only syncs at construction, and over a plain `@property` because that would drop `file_count` from the JSON the .NET backend reads. Then drop the now-redundant `file_count=len(...)` argument at the route. Before writing any code, I checked the side effects with a throwaway copy of the class in the container: a supplied `file_count` is silently ignored, the key moves to the end of the JSON, OpenAPI marks it `readOnly`, assigning to it raises `AttributeError`, and mypy needs `# type: ignore[prop-decorator]`.

Deliberately **not** changing: the .NET `MastDownloadResponse` and `MastController`'s own response (a separate model, to raise rather than fix), `mast_service.py`'s `"file_count"` dict keys, `extra="forbid"` (stricter than the issue asks, so I'll put it to the maintainer as a question), docs (none mention the model), and committing the repo-style plan file (AGENTS.md's plan workflow is the maintainer's own, so I'll ask first).

**Implementation Plan**

1. Write regression tests first: model tests in `tests/test_mast_models_validation.py` (supplied mismatched count, omitted count, empty, changes after construction, JSON dump, round trip, read-only) and a route test in a new `tests/mast/test_download_route_file_count.py` with the MAST service mocked. Rebuild the image and show the model tests failing on unchanged code.
2. Modify `processing-engine/app/mast/models.py`: add `computed_field` to the existing pydantic import, delete `file_count: int = 0`, and add the computed property.
3. Modify `processing-engine/app/mast/routes.py:535-543`: delete the `file_count=len(...)` argument.
4. Rebuild, then run the manifest checks (full pytest with the CI coverage floor, `ruff check`, `ruff format --check`), plus a local mypy on the two files.
5. Re-run `repro_1010.py` against the rebuilt image, and save the before/after output.

Plan package: `plan.md` and `plan-comment.md` at my clone root (kept out of git through `.git/info/exclude`). The comment is a draft and was not posted.

Deviations (recorded in `plan.md` during the build on 2026-11-07, then re-graded by plan-check: accept again, 6/6):

- The mypy baseline in my earlier plan was wrong. `routes.py` already has 12 mypy errors on `main`. The check became "`models.py` stays clean, and `routes.py` has the same 12 errors before and after", which held.
- My first after-fix manifest run failed `ruff check` (I001) on my new route test file. I fixed it and re-ran all four rows.
- `repro_1010.py` wasn't on disk, so I recreated it byte-for-byte from my repro draft.
- The red runs were done by rebuilding the image from the working tree each time and checking the container file hashes.

**Toolkit**

- Tool: plan-check (my Unit 6 rubric and procedure, live mode), run in a fresh `claude -p` process from the clone so the grade wasn't anchored on the session that wrote the plan. Also the voice guard's manual mode (`check_voice.py --draft plan-comment.md`).
- What it produced: **accept** on the first run, with all six required checks passing (diagnosis-grounded, bounded-scope, actionable-approach, decisive-test, honest-unknowns, comment-and-conventions). The voice guard passed the comment ("Your rules hold").
- Difficulties: (1) My procedure has a gap. SKILL.md says the repro evidence is my *posted* repro comment, but mine was never posted, so the grader had to use the evidence quoted in `plan.md`. (2) One of plan-check's side notes was wrong: it said `models.py` doesn't import `Field`, but line 5 does, and `Field(` is used 32 times. (3) It flagged again that my posted claim's "within the next day" breaks my own voice rule.
- What changed: I reworded plan step 2 to "add `computed_field` to the existing import", so the code block can't be misread, and kept the plan otherwise as accepted. I noted the procedure gap (how to grade a repro that exists only as quoted in the drafts) to patch in `procedure.md`. The posted claim still needs a short status update if the PR isn't open by 2026-11-09 UTC.

---

## Testing Strategy

The fix is proved by four things I can observe, each run against a rebuilt image. The `jwst-processing` container has no source bind mount, so a stale image would test old code. Before every run I rebuilt with `cd docker && docker compose up -d --build --wait processing-engine` and checked that the container's file SHA-256s matched my working tree. The key results are below; the full outputs are kept locally in `test_evidence.md` (not part of this submission).

1. **Regression tests fail on the original code, then pass with the fix (red → green).** 7 model tests and 1 route test.
   - Against the unmodified `models.py`/`routes.py`: **6 failed, 2 passed**. The failures are the bug: `assert 99 == 2` (supplied count), `assert 0 == 2` (omitted count), `assert 0 == 3` (after `files.append`), `99 == 2` in `model_dump_json()` and in the round trip, and `DID NOT RAISE AttributeError`. The two passes were predicted: empty `files` is 0 either way, and the real route already counted the files.
   - With the fix: **8 passed**.
2. **The route test can catch a broken route edit.** I removed only the route's `file_count=len(...)` and kept the stored field (a local mutant, not committed). The route test failed with `assert 0 == 2`. It's a guard for the route edit, not a reproduction of the bug, and I say so in the PR.
3. **The original reproduction, before and after.** The same `repro_1010.py` and the same command.
   - Before: `file_count = 99`, then `0`, then `99` in the HTTP body, each next to `len(files) = 2`.
   - After: `file_count = 2` in all three cases. `"file_count":2` appears in every JSON output; it now comes last.
4. **The repo's own checks (my ship manifest, from CI and AGENTS.md), baseline vs changed code:**

| Check | Baseline: unmodified `main` code (22:33 PST) | Changed code, final run (22:40 PST) |
|---|---|---|
| Rebuild image | exit 0, healthy | exit 0, healthy |
| `pytest -q --cov-fail-under=60` | 2289 passed, 2 deselected, coverage 80.26% | 2297 passed, 2 deselected, coverage 80.35% |
| `ruff check .` | All checks passed! | All checks passed! (the first after-fix run failed: I001 in my new test, fixed) |
| `ruff format --check .` | 190 files already formatted | 191 files already formatted |
| mypy (local, not CI) | `models.py` clean; `routes.py` 12 errors | `models.py` clean; `routes.py` the same 12 errors |

Not tested: the .NET backend and its tests, the frontend, the `mast-proxy` image, and a real `POST /mast/download` against MAST (the route test mocks the service and storage). Only arm64 macOS with the default `.env`.

**Toolkit**

- Tool: Claude Code ran each run inside Docker. My `ship-manifest.md` rows were run by a small script that loads them with `check_gate.py`'s own parser, in a clean `/bin/sh` at the clone root, so the baseline used exactly the commands the gate would. For the before/after repro and mypy, I temporarily stashed only the two source files.
- What it produced: `test_evidence.md` with dated baseline, red, mutant, green, repro before/after, manifest after-fix, and mypy sections. It's assembled from the saved output files, not retyped.
- Difficulties: (1) The no-bind-mount container meant every run needed a rebuild and a hash check, or a "pass" could have been against stale code. (2) Ruff caught a real lint error in my own new test file on the first after-fix run. (3) The mypy baseline claim in my plan turned out to be wrong for `routes.py`. (4) The repro script had never been saved to disk.
- What changed: I put the rebuild in as the manifest's first row so the gate can't test stale code. I fixed the I001 and re-ran all four rows instead of only the failed one. I changed the mypy check to compare before and after, and recorded that in `plan.md`. I recreated the repro script from the draft and confirmed its "before" output matches the draft's.

---

## Implementation Notes

**2026-11-07, 22:30-22:35 PST: gate set up and baseline**

The Unit 7 install was already in place: all six ship-gate files match the starter, both PreToolUse hooks are in `settings.json`, and pr-precheck's scope is the live one. I filled `ship-manifest.md` with four rows: an image rebuild (CONTRIBUTING.md "Test with Docker"), then the CI test, lint, and format commands run in the container. The rebuild row is there because `docker inspect` showed only `data/` is mounted. All four passed on unmodified `main` code: 2289 passed, ruff clean. A fresh `claude -p` asked to run the PR-create help command was stopped by both hooks. `ship-gate: STOP. no PR text to check…` came back in the tool result, and the voice guard logged its stop at 22:34. Claude Code only showed one hook's message, so I piped the same payload into `check_voice.py`, which printed `voice-guard: STOP. no body the guard can read…` (exit 2).

**2026-11-07, 22:35-22:38 PST: tests first, then the fix**

I wrote the 7 model tests and the route test before touching the model. Rebuilt with the original source, the tests gave 6 failed / 2 passed, exactly as the plan predicted. Then I removed only the route argument and rebuilt: the route test failed `0 == 2`, so it really guards that edit. Then the fix: I added `computed_field` to the existing pydantic import, replaced the stored field with the property and its `# type: ignore[prop-decorator]`, and kept the route deletion. The diff is 9 lines in `models.py` and 1 in `routes.py`.

**2026-11-07, 22:38-22:42 PST: checks, a wrong turn, commit**

The first after-fix manifest run failed `ruff check` (I001: two blank lines needed after the imports in my new test). I fixed that and re-ran everything from the rebuild: 2297 passed (the 8 new tests), coverage 80.35%, ruff clean. Re-running mypy showed my plan's "mypy Success" baseline was only true for `models.py`; `routes.py` has 12 errors already on `main`. I recorded that as a deviation and compared before and after instead (identical). I committed only the 4 files as `c40bb3f` "fix: derive MastDownloadResponse.file_count from files", and checked that each committed blob's hash equals the file the final green run tested. The repo-style plan doc in `docs/plans/features/` stays untracked until I ask the maintainer.

**2026-11-07, 22:43 PST onward: PR draft and gate**

I wrote `pr_draft.md` on the repo's full PR template (Owner summary, `Fixes #1010`, every required section, plus Notes for Reviewers with the AI disclosure). `./scripts/validate-pr.sh` with the intended title, `pr_draft.md`, and my branch passed, and the voice guard passed the draft. Manual ship-gate: run 1 (22:45) BLOCKED on my own pr-precheck (`Fixes` vs the repo's `Closes #N`, and an unrecorded `validate-pr.sh` run). I fixed both in the package, not the rubric; run 2 (22:47) passed, and after a wording fix (190 vs 191 formatted files) run 3 (22:50) passed on the final body. Nothing had been pushed, posted, or opened at that point.

**2026-11-07, 23:01 PST (2026-11-08 07:01 UTC): pushed and opened the PR**

I pushed `fix/mast-download-file-count` (head `c40bb3f`) to my fork and opened PR #2178 against `main` with the gated `pr_draft.md` body. The PR Standards workflow ("Validate PR Standards") passed at 07:01:38 UTC. CI, Security, Danger Zone, and Claude Code Review finished as `action_required`: GitHub is holding them for a maintainer to approve a first-time contributor's fork PR. They have not run, so they have neither passed nor failed.

**2026-11-07, 23:10-23:12 PST: PR monitor and playbook (Unit 8)**

Installed the PR monitor, ran `--state` (it found #2178 upstream, 0 reviews or comments), collected the waiting-time evidence (only one merged outside-contributor PR exists, #1963), filled the four playbook sections with provisional thresholds, and ran the full monitor. Its draft was a local wait note (no nudge before about 2026-11-13 07:01 UTC). Nothing was posted, rebased, or changed on the branch.

**Toolkit**

- Tool: Claude Code for the edits, the Docker rebuilds and runs, and the commit. The ship-gate install, its hook test, and my manifest. plan-check, re-run after I recorded the deviations.
- What it produced: commit `c40bb3f` (4 files, +91/−4), red/green evidence, and a second plan-check **accept** (6/6) that graded the deviations section.
- Difficulties: Claude Code shows only one hook's STOP message when two hooks block the same command, so the voice guard's stop had to be confirmed from its log and a direct run. The second plan-check said it couldn't find my voice guide, even though `voice-guide.md` in the skill folder is a symlink to it. That note was wrong, and I had already run the voice guard on the comment. The ship-gate hook also stopped one of my own shell commands, a script that only edits this story. The script's text mentioned the PR-create command and had quotes the gate couldn't parse, so it treated it as a PR it couldn't read.
- What changed: I verify a hook stop from its log, not just from what the tool result shows. I commit by explicit path only, after checking that committed hashes equal the tested ones. Story edits now go in a script file written outside the shell, not a heredoc that names the PR command.

---

## Pull Request

**PR Link:** https://github.com/Snoww3d/jwst-data-analysis/pull/2178 (opened 2026-11-08 07:01 UTC, head commit `c40bb3f`)

**PR Description:** posted as the PR body (drafted locally as `pr_draft.md`), on the repo's full PR template. Title: `fix: derive MastDownloadResponse.file_count from files`.

- An Owner summary in plain language.
- `Closes #1010`.
- **Summary:** the stored `file_count` could disagree with `files` (99 or 0 next to two files); it's now a `@computed_field`, always `len(files)`, and kept in the JSON for the .NET backend.
- **Changes Made:** model, route, and the two test files.
- **Test Plan** with the actual numbers:
  - red 6 failed / 2 passed, green 8 passed;
  - the route-test mutant fails `0 == 2`;
  - the repro goes from 99/0/99 to 2/2/2;
  - the suite goes from 2289 to 2297 passed, coverage 80.26% to 80.35%;
  - ruff is clean;
  - `validate-pr.sh` passes;
  - mypy has no new errors.
- What's not tested: .NET, the frontend, `mast-proxy`, and real MAST.
- Docs: no updates needed. No new tech debt.
- **Risk & Rollback:** key order, `readOnly` in OpenAPI, and a supplied count is ignored; revert the one commit.
- **Notes for Reviewers:** one question (`extra="forbid"`?), the out-of-scope items, and an AI-assistance note.

Before opening: commit `c40bb3f` is ready, and `./scripts/validate-pr.sh` passed. The final manual ship-gate (2026-11-07 22:50) passed: all 4 manifest checks green and all 6 pr-precheck checks passing. I then pushed `fix/mast-download-file-count` and opened PR #2178 with that body.

Checks on the PR (head `c40bb3f`): the PR Standards workflow (Validate PR Standards) passed. The CI, Security, Danger Zone, and Claude Code Review workflows have not run; GitHub shows them as awaiting maintainer approval, which first-time contributors need. So the passing results so far are my local tests (2297 passed, coverage 80.35%, ruff clean) and PR Standards, not the full CI. No maintainer has approved the workflows or the PR.

**Maintainer Feedback:**

- 2026-11-08 07:11 UTC (2026-11-07 23:11 PST): none yet. Checked with `gh` and the PR monitor: 0 reviews, 0 PR comments, 0 inline review comments, no review decision, and no new comment on #1010 since my claim. No feedback to address.

**Status:** Awaiting review. Open and mergeable, merge state BLOCKED on a required review; four workflows (CI, Security, Danger Zone, Claude Code Review) are awaiting maintainer approval to run.

**Toolkit**

- Tool: the ship-gate run by hand (`check_gate.py --branch --title ... --body-file pr_draft.md`), which runs my manifest and then my pr-precheck. Also the repo's own `./scripts/validate-pr.sh` and the voice guard's manual mode.
- What it produced:
  - Run 1 (22:45): BLOCK. Manifest 4/4 ok; pr-precheck **reject** on repository-standards (`Fixes` vs CONTRIBUTING's `Closes #N`) and repository-check-evidence (`validate-pr.sh` run not recorded).
  - Run 2 (22:47): PASS, with a nit that "191 files formatted" was 190 at baseline.
  - Run 3 (22:50), on the final body: PASS, 6/6.
- Difficulties: the course step said to write `Fixes #1010`, and GitHub and the repo's validator both accept it, but the repo's written convention is `Closes`. My rubric caught the difference, and the scope's rule is "the repo's stated asks always win". I had also run `validate-pr.sh` without saving its output, so the evidence didn't show it.
- What changed: I changed the body to `Closes #1010`, added the `validate-pr.sh` output to `test_evidence.md` and the Test Plan, and fixed the 190/191 wording. I made no rubric changes: both rejections were real problems in my package, not checks asking for something the repo doesn't ask for.

---

## Learnings and Reflections

**Technical Skills Gained**

- Pydantic v2 field choices: a plain `@property` drops a key from the JSON, a validator only syncs at construction, and `@computed_field` keeps `file_count` serialized while always deriving it from `files`. The side effects were checked before the change: a supplied value is ignored, the key moves to the end of the JSON, OpenAPI marks it `readOnly`, assignment raises `AttributeError`, and mypy needs `# type: ignore[prop-decorator]`.
- Testing against a Docker image with no source bind mount: rebuild before every run and compare file SHA-256s, or a "pass" can be against stale code.
- Proving tests catch the bug: red (6 failed / 2 passed) on the original code, green (8 passed) with the fix, and a route-only mutant that fails `0 == 2`.
- Reading GitHub's PR state: a fork PR's workflows can finish as `action_required`, which means waiting for maintainer approval, not a failed test; `BLOCKED` means a required review is missing, not a verdict on the code.

**Challenges Overcome**

- Stale-image risk: solved by making the image rebuild the first row of my ship manifest and checking hashes before each run.
- Wrong baselines and lint: my plan's mypy baseline was false for `routes.py` (12 errors already on `main`), so I compared before and after instead; ruff's I001 on my new test failed the first after-fix run, so I fixed it and re-ran every manifest row.
- PR conventions: pr-precheck rejected `Fixes #1010` (CONTRIBUTING.md asks for `Closes #N`) and an unrecorded `validate-pr.sh` run. Both were fixed in the package before opening.
- Thin waiting-time evidence: only one merged outside-contributor PR exists in the repo, so the playbook's thresholds are written as provisional and say why.

**What I'd Do Differently Next Time**

- Run the voice guard before posting, not after: my #1010 claim promised a PR "within the next day" with no first step, and the guard caught it only after it was posted.
- Save evidence when it is produced: the repro script had to be recreated from the draft, and the `validate-pr.sh` output wasn't saved the first time.
- Check how fast outside PRs actually get reviewed during issue selection. The scout's activity check passed this repo on human commits, but #1995 has waited 61 days with no maintainer reply, and that is now the main risk to my PR.

---

## Resources Used

- Owner's triage comment on #1010, which named the fix (`@computed_field` or a validator) and the current line numbers: https://github.com/Snoww3d/jwst-data-analysis/issues/1010#issuecomment-5501555925
- The repo's CONTRIBUTING.md (Docker setup, `Closes #N`, required PR sections, `./scripts/validate-pr.sh`): https://github.com/Snoww3d/jwst-data-analysis/blob/main/CONTRIBUTING.md
- The repo's CI workflow, for the exact pytest coverage floor and ruff commands in my manifest: https://github.com/Snoww3d/jwst-data-analysis/blob/main/.github/workflows/ci.yml
- PR #1963, the only merged outside-contributor PR, used as the waiting-time evidence for my playbook: https://github.com/Snoww3d/jwst-data-analysis/pull/1963
- Course starters used as installed: the Unit 8 PR monitor's `INSTALL.md` (https://github.com/codepath/ai301-unit8-starter) and my Unit 6–7 voice guard and ship-gate.
- Claude Code, which read the repo, ran the Docker builds, tests, and checks, and helped draft the plan, PR body, and playbook. I reviewed its diffs and output, and the PR discloses that help.
