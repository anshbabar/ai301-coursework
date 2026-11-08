# Issue scout scan: 2026-11-07

Live mode, scan. Scan date: 2026-11-07 (local). Recency cutoff for ranking filter 3: updatedAt on or after 2026-08-09.
Rubric: `rubric.md` (6 required checks, 1 preferred). Strategy: `search-strategy.md` (2 queries, top 5).

## Funnel

| Stage | Count |
|---|---|
| Query `python` (good first issue, language:python) | 100 |
| Query `typescript` (good first issue + bug, language:typescript) | 100 |
| Combined / unique by URL | 200 / 200 (no overlap) |
| After filter 2 (no assignees) | 165 |
| After filter 3 (updated within 90 days) | 165 |
| After filter 4 (excluded labels) | 164 |
| After filter 6 (first issue per repo) | 83 |
| Graded (top 5) | 5 |

All five top results came from the Python query, with 0 comments each. They were sorted by updatedAt descending among the 0-comment issues. No TypeScript result made the top five, because the search returned many Python issues with 0 comments that had been updated more recently.

## Ranked read-out

### Accepted (fit order)

1. **WingedGuardian/GENesis-AGI#4075**: "deploy_health: preserve unchecked result when commit type lookup fails"
   - Fit: this is the best match for the profile. It's a small Python bug fix with an exact location (`src/genesis/observability/snapshots/deploy_health.py:226-228`), a concrete expected result, and a test-shaped acceptance criterion ("phase-specific controls").
   - Caution on fit: the project's full dev setup is an Incus container on a Linux VM (CONTRIBUTING.md). The fix is a resolver function with controlled Git responses, so it can probably be tested with plain `pytest`, but check this before committing to the issue. The issue was opened less than 2 hours before the scan by the owner, who merges several PRs an hour, so claim it quickly or expect the owner to fix it first.
   - Surfaced by: `python` query. Ranking signals: 0 assignees, 0 comments, updated 2026-11-08T04:23Z, no excluded labels, first result for this repo.
   - Preferred: Newcomer guidance **pass** (has a `good first issue` label and names the file and line).

2. **Huerte/algo-solutions-python#204**: "Be the first to add C++, C, C#, Go, Rust, Kotlin, Swift, PHP, or Ruby"
   - Fit: poor, although the rubric accepts it. The work is to add an algorithm solution in a language **other than** Python or TypeScript, the repo already has `python`, `typescript`, `javascript`, and `java` folders, and the task isn't a bug fix or a test improvement. Fit never changes a verdict, so it stays accepted and ranks second.
   - Surfaced by: `python` query. Ranking signals: 0 assignees, 0 comments, updated 2026-11-08T03:54Z, no excluded labels, first result for this repo.
   - Preferred: Newcomer guidance **pass** (has `good first issue` and names the target path `solutions/<language>/practice1.<ext>`).

### Rejected

3. **Community-Access/quill-github-practice#2**: "Add a line count to the summary". Sunk by **Available to work on**: open PR #7 ("Add a line count") is formally linked. The repo is also a locked practice template ("only Community Access changes it"), which no rubric check covers. Surfaced by: `python` query, 0 comments, updated 2026-11-08T03:48Z.
4. **cognicore-dev/cognicore-env#76**: "🧠 IdeaBot: Weekly Codebase Report". Sunk by **Bounded contribution**: a bot-generated umbrella report with 10+ checklist items (missing tests, files to split, refactors). Surfaced by: `python` query, 0 comments, updated 2026-11-08T03:45Z.
5. **almadhlom/cyber-security-basics#890**: "Threat Monitoring". Sunk by **Maintainer activity**, **Project in use**, and **Bounded contribution**. The last human merge was on 2026-06-25, there are no releases, and the last push was 2026-06-25. The issue body is only "Study cyber hygiene", one of a series of issues opened every day at 04:00. Seven contributor PRs have been open since June with no review. Surfaced by: `python` query, 0 comments, updated 2026-11-08T04:00Z.

## Rubric and strategy friction (candidates for scan-notes.md)

- **Ranking favours brand-new and auto-generated issues.** Sorting by fewest comments and then most recent update puts issues created minutes ago at the top. Three of the five were machine-made: a daily scheduled issue (#890), a weekly bot report (#76), and a template seeded by github-actions (#2). Possible fix: also drop results whose author is a bot or app (the `author` field is available from search) and labels such as `ideabot`.
- **The recency filter uses issue updatedAt, not repo activity.** The issue in a dead repo (#890) passed filter 3 only because a scheduled job had just created it. The rubric caught it, but it took up one of the five grading slots.
- **There's no fit filter in ranking.** #204 (non-Python/TS languages) reached the top 5 and was accepted. A language-agnostic label such as `any-language` could be excluded, or the Python query could add `bug` or `test` labels, as the TypeScript query does with `bug`.
- **Locked or read-only repos.** Nothing in the rubric rejects a repo that says outside contributions aren't accepted (#2). #2 was rejected for another reason. Consider a required check: "repo accepts outside PRs to this issue."
- **The TypeScript query got no grading slots.** Every result in the top five came from the Python query. If TypeScript coverage matters, consider reserving slots for each query.

```json
[
  {
    "item": "https://github.com/WingedGuardian/GENesis-AGI/issues/4075",
    "checks": [
      {"name": "Maintainer activity", "grade": "pass", "evidence": "Owner WingedGuardian committed 5 human-authored commits to main on 2026-11-08 (e.g. 'ci: run the test job on four pytest-xdist workers (#3997)')."},
      {"name": "Project in use", "grade": "pass", "evidence": "Not archived; latest release v3.0b19 on 2026-10-24; last push 2026-11-08; 100 stars."},
      {"name": "Bounded contribution", "grade": "pass", "evidence": "Single acceptance item: 'Preserve the unchecked/timeout/exec-failure classification at both Git phases, with phase-specific controls' at deploy_health.py:226-228."},
      {"name": "Repeated failed attempts", "grade": "pass", "evidence": "Issue opened 2026-11-08 (under 2 years old); no linked or mentioned PRs."},
      {"name": "Available to work on", "grade": "pass", "evidence": "Assignees: none; 0 comments; no linked PRs or cross-referenced PRs; PR search for '4075' returned nothing."},
      {"name": "AI workflow permitted", "grade": "pass", "evidence": "CONTRIBUTING.md and .github/PULL_REQUEST_TEMPLATE.md contain no AI restriction; repo ships AGENTS.md and CLAUDE.md (instructions for AI agents)."},
      {"name": "Newcomer guidance", "grade": "pass", "evidence": "Labelled 'good first issue'; body names src/genesis/observability/snapshots/deploy_health.py:226-228."}
    ],
    "verdict": "accept"
  },
  {
    "item": "https://github.com/Huerte/algo-solutions-python/issues/204",
    "checks": [
      {"name": "Maintainer activity", "grade": "pass", "evidence": "Owner Huerte merged human PRs #194, #195, #196 (from painbaba) on 2026-11-07."},
      {"name": "Project in use", "grade": "pass", "evidence": "Not archived; no releases, but last push 2026-11-07 (within 90 days)."},
      {"name": "Bounded contribution", "grade": "pass", "evidence": "One concrete deliverable: 'Create solutions/<language>/practice1.<ext>' with a header comment, about 30 minutes."},
      {"name": "Repeated failed attempts", "grade": "pass", "evidence": "Issue opened 2026-11-08; no linked or mentioned PRs."},
      {"name": "Available to work on", "grade": "pass", "evidence": "Assignees: none; 0 comments; no open PRs in the repo; PR search for '204' returned nothing."},
      {"name": "AI workflow permitted", "grade": "pass", "evidence": "CONTRIBUTING.md (113 lines) and .github/PULL_REQUEST_TEMPLATE.md inspected; no AI restriction stated."},
      {"name": "Newcomer guidance", "grade": "pass", "evidence": "Labelled 'good first issue'; owner names target path solutions/<language>/practice1.<ext>."}
    ],
    "verdict": "accept"
  },
  {
    "item": "https://github.com/Community-Access/quill-github-practice/issues/2",
    "checks": [
      {"name": "Maintainer activity", "grade": "pass", "evidence": "accesswatch committed to main on 2026-11-08 ('Say what QUILL does with suggestions and pending checks')."},
      {"name": "Project in use", "grade": "pass", "evidence": "Not archived; release v0.1.0 on 2026-11-08; last push 2026-11-08."},
      {"name": "Bounded contribution", "grade": "pass", "evidence": "'Add a line_count(text) function. Empty text should have no lines. Text with no line breaks is one line.'"},
      {"name": "Repeated failed attempts", "grade": "pass", "evidence": "Issue opened 2026-11-08; one PR (#7), still open, none closed-unmerged."},
      {"name": "Available to work on", "grade": "fail", "evidence": "Open implementation PR #7 'Add a line count' is formally linked (closedByPullRequestsReferences); issue is also locked."},
      {"name": "AI workflow permitted", "grade": "pass", "evidence": "CONTRIBUTING.md and .github/pull_request_template.md inspected; no AI restriction stated."},
      {"name": "Newcomer guidance", "grade": "pass", "evidence": "Labelled 'good first issue'."}
    ],
    "verdict": "reject"
  },
  {
    "item": "https://github.com/cognicore-dev/cognicore-env/issues/76",
    "checks": [
      {"name": "Maintainer activity", "grade": "pass", "evidence": "Kaushalt2004 merged PR #205 'release: 0.12.0' on 2026-11-07; Durvesh-dev merged #199 on 2026-11-04."},
      {"name": "Project in use", "grade": "pass", "evidence": "Not archived; release v0.12.0 on 2026-11-07; last push 2026-11-07; 82 stars."},
      {"name": "Bounded contribution", "grade": "fail", "evidence": "Bot-generated 'IdeaBot Weekly Codebase Report' listing 10 modules without tests, 5 large files to split, 5 complex functions to refactor: umbrella work, not one contribution."},
      {"name": "Repeated failed attempts", "grade": "pass", "evidence": "Issue opened 2026-07-10 (under 2 years old); no linked PRs."},
      {"name": "Available to work on", "grade": "pass", "evidence": "Assignees: none; 0 comments; no linked or cross-referenced PRs."},
      {"name": "AI workflow permitted", "grade": "pass", "evidence": "CONTRIBUTING.md (584 lines) and .github/pull_request_template.md inspected; no AI restriction; repo ships AGENTS.md."},
      {"name": "Newcomer guidance", "grade": "pass", "evidence": "Labelled 'good first issue'."}
    ],
    "verdict": "reject"
  },
  {
    "item": "https://github.com/almadhlom/cyber-security-basics/issues/890",
    "checks": [
      {"name": "Maintainer activity", "grade": "fail", "evidence": "Last human merge 2026-06-25 (PR #746); every issue comment since 2026-08-01 is from NONE-association users; 7 contributor PRs open since June-October unreviewed."},
      {"name": "Project in use", "grade": "fail", "evidence": "Not archived, but no releases and last push 2026-06-25 (more than 90 days before 2026-11-07)."},
      {"name": "Bounded contribution", "grade": "fail", "evidence": "Body is only 'Study cyber hygiene. To take this issue, comment: /assign'; one of a daily 04:00 series (#883-#890) with no concrete deliverable."},
      {"name": "Repeated failed attempts", "grade": "pass", "evidence": "Issue opened 2026-11-08; no linked PRs."},
      {"name": "Available to work on", "grade": "pass", "evidence": "Assignees: none; 0 comments; no linked or mentioned PRs."},
      {"name": "AI workflow permitted", "grade": "pass", "evidence": "No CONTRIBUTING, AI policy, or templates; README.md and .github/ inspected; no AI restriction."},
      {"name": "Newcomer guidance", "grade": "pass", "evidence": "Labelled 'good first issue'."}
    ],
    "verdict": "reject"
  }
]
```

---

# Direct grading: 2026-11-07

Live mode, direct. Two hand-fed URLs graded independently against `rubric.md`, then ranked by the fit profile in `scope.md`. Both are public GitHub repos, so both are inside the scope. Under the scope's etiquette rule, post a short claim comment on the issue as soon as you commit to it. Scan date: 2026-11-07. The 90-day window starts 2026-08-09.

## Ranked read-out

### Accepted (fit order)

1. **Snoww3d/jwst-data-analysis#1010**: "[processing] MastDownloadResponse.file_count can drift from len(files)"
   - Fit: strong. It's a small Python bug fix in a Pydantic model (`processing-engine/app/mast/models.py`) with a concrete expected result (`file_count` always equals `len(files)`), and the owner has called it a "Trivial fix" using `@computed_field`. It can be verified with pytest in `processing-engine/tests/` (for example, `tests/mast/test_download_progress_guard.py` already references `file_count`).
   - Cautions:
     - The line numbers in the issue body are out of date: the fields are now at `models.py:200-201`, as the owner's 2026-09-01 triage comment says.
     - `file_count` is also read in `mast_service.py`, `routes.py`, and the .NET `MastModels.cs`, so the JSON output has to keep the field.
     - CI enforces a strict PR template, including an Owner summary, Risk & Rollback, and Tech Debt Impact. `./scripts/validate-pr.sh` checks it locally.
     - Maintainer activity is slowing. The last human commit was 2026-09-21; after that, the owner only merged Dependabot PRs (2026-10-16). One outside PR (#1995, opened 2026-09-07) is still open with no review. Expect a slow review.
   - Source: direct.
   - Preferred: Newcomer guidance **pass**. It has the `good first issue` label, added by the owner on 2026-09-01, and the owner names the file and fields.

2. **WorldconVotingSystems/nomnom#358**: "Packet: Expand All Categories button?"
   - Fit: weaker. It's a small UI feature (Expand All / Collapse All buttons on the Packet downloads page, likely in `src/nomnom/hugopacket/templates/hugopacket/`), not a bug fix. Running it locally needs Docker for PostgreSQL, Redis, and mailcatcher (`docs/docs/dev/bootstrap.md`). There's no test target stated, and the wording is tentative ("could maybe be labeled"), so you'd decide the exact behaviour yourself.
   - Cautions: no maintainer has commented on any issue since 2026-08-09, and aJanuary's PR #410 has been open since 2026-04-27. The maintainer did label the issue `good first issue` and put it in the "LACon Voting Opens" milestone.
   - Source: direct.
   - Preferred: Newcomer guidance **pass**. offbyone added the `good first issue` label on 2026-03-20, but nobody names a file.

### Rejected

None.

## Rubric friction (candidates for scan-notes.md)

- **Maintainer activity passes on any one human event in 90 days.** JWST passes because of a human commit 47 days ago, even though its only outside PR in two months has gone unreviewed. nomnom passes because of a commit, despite no maintainer issue replies in 90 days. Neither check measures how quickly outside contributions get reviewed.
- **Out-of-date line references.** #1010's body points to old line numbers. The rubric doesn't need to change for this; it's a note for the plan stage.

```json
[
  {
    "item": "https://github.com/Snoww3d/jwst-data-analysis/issues/1010",
    "checks": [
      {"name": "Maintainer activity", "grade": "pass", "evidence": "Owner Snoww3d authored and merged human PRs on main through 2026-09-21 (#2046), merged outside PR #1963 from v01dst on 2026-09-04, and posted a triage comment on this issue 2026-09-01."},
      {"name": "Project in use", "grade": "pass", "evidence": "Not archived; no releases, but last push 2026-11-07 and human default-branch commit 2026-09-21 (both within 90 days)."},
      {"name": "Bounded contribution", "grade": "pass", "evidence": "Owner: 'Trivial fix: make file_count a @computed_field (or a validator) so it is always len(files).'"},
      {"name": "Repeated failed attempts", "grade": "pass", "evidence": "Opened 2026-04-05 (under 2 years old); no linked, cross-referenced, or mentioned PRs."},
      {"name": "Available to work on", "grade": "pass", "evidence": "Assignees: none; only comment is the owner's triage (2026-09-01); no linked PRs; PR search for '1010' returned nothing."},
      {"name": "AI workflow permitted", "grade": "pass", "evidence": "CONTRIBUTING.md (148 lines), .github/PULL_REQUEST_TEMPLATE.md inspected: no AI restriction; repo ships AGENTS.md ('Primary guidance for all agents')."},
      {"name": "Newcomer guidance", "grade": "pass", "evidence": "'good first issue' label added by owner 2026-09-01; owner names mast/models.py:200-201 and the fix."}
    ],
    "verdict": "accept"
  },
  {
    "item": "https://github.com/WorldconVotingSystems/nomnom/issues/358",
    "checks": [
      {"name": "Maintainer activity", "grade": "pass", "evidence": "offbyone merged human PR #519 'Convert report views to functional views' on 2026-10-18 (within 90 days)."},
      {"name": "Project in use", "grade": "pass", "evidence": "Not archived; release v2027.0.0 on 2026-10-17; last push 2026-11-05; 17 stars."},
      {"name": "Bounded contribution", "grade": "pass", "evidence": "One concrete UI addition: 'a pair of buttons at the top of the Packet-downloads page' to expand all / collapse all categories; maintainer labelled and milestoned it."},
      {"name": "Repeated failed attempts", "grade": "pass", "evidence": "Opened 2026-03-19 (under 2 years old); no linked, cross-referenced, or mentioned PRs."},
      {"name": "Available to work on", "grade": "pass", "evidence": "Assignees: none; 0 comments; no linked PRs; PR search for '358' returned nothing."},
      {"name": "AI workflow permitted", "grade": "pass", "evidence": "No CONTRIBUTING.md, AI policy, or templates; README.md and docs/docs/dev/index.md 'Contributing' section ('All contributions should be made through pull requests... PRs should pass all CI') inspected: no AI restriction."},
      {"name": "Newcomer guidance", "grade": "pass", "evidence": "'good first issue' label added by maintainer offbyone 2026-03-20."}
    ],
    "verdict": "accept"
  }
]
```

---

# Issue scout re-run (direct): 2026-11-07

Live mode, direct. Run date: 2026-11-07 local (PST); GitHub timestamps below are UTC, so some read 2026-11-08. 90-day cutoff: 2026-08-09. 30-day claim window: 2026-10-08 onward.
Rubric: `rubric.md` as patched with `rubric-scope-patch.md`. The checks are now Maintainer activity, Project in use, **scope-feasible**, Repeated failed attempts, Available to work on, AI workflow permitted (all required), and Newcomer guidance (preferred), plus the difficulty note. The earlier run above used the old "Bounded contribution" check.
Authenticated `gh` user: `anshbabar` (me).

## Ranked read-out

### Accepted (fit order)

1. **Snoww3d/jwst-data-analysis#1010**: "[processing] MastDownloadResponse.file_count can drift from len(files)"
   - Fit: strong. It's a small Python/Pydantic model bug with a concrete expected result (`file_count == len(files)`) and an obvious regression test.
   - **Difficulty: straightforward.** The owner names the file and the fix (`mast/models.py`, "make `file_count` a `@computed_field` (or a validator) so it is always `len(files)`"). One edge to keep in mind: the issue body asks for a plain `@property`, which would drop `file_count` from the serialized JSON. The owner's later triage comment suggests `@computed_field` or a validator, and both keep it, so I treat the triage comment as the latest decision. The line numbers in the issue body (82-84) and in the triage comment (200-201) have both drifted, so find the field by name. Running the documented setup needs Docker, but the model can be tested with plain Python and Pydantic.
   - **Claim status: the only claim on the thread is mine.** `anshbabar` commented on 2026-11-08T05:53:27Z UTC ("Hi! I'd like to work on this issue. I plan to derive file_count from files while keeping it in the serialized JSON response, and add regression tests ... aiming to open a PR within the next day."). That is me, not another contributor, so it doesn't count against availability for me. It does mean the issue is now reserved under my name, and to anyone else's scout it reads as an active claim. I owe the maintainer the PR, or a status update, within the day I promised.
   - Cautions: owner-only project (1 star, no releases). The last human commit was 2026-09-21; since then the owner has only merged Dependabot PRs (2026-10-16). Expect a slow review.
   - Source: direct.
   - Preferred: Newcomer guidance **pass**.

2. **WorldconVotingSystems/nomnom#358**: "Packet: Expand All Categories button?"
   - Fit: weaker. It's a small UI enhancement, not a bug fix, and it has no test target.
   - **Difficulty: moderate.** I have to find the location myself: nobody names a file, and it is probably the Packet template under `src/nomnom/hugopacket/` plus some JS/CSS. It has a small open design edge: the opener's wording is tentative ("could maybe be labeled something like 'Expand All' and 'Collapse All'"), and no maintainer has commented. Running it locally needs Docker (PostgreSQL, Redis, mailcatcher).
   - Cautions: the last maintainer issue comment I found was offbyone on 2026-08-09, and every comment since then is from Dependabot. aJanuary's PR #410 ("Add timeline app", not related to this issue) has been open since 2026-04-27.
   - Source: direct.
   - Preferred: Newcomer guidance **pass** (good first issue label only; no file named).

### Rejected

None.

## Rubric friction (candidates for scan-notes.md)

- **The availability check can't tell my own claim from a stranger's.** Read literally, "no unresolved claim within 30 days" fails #1010 because of my own comment from 2026-11-08. Possible patch: "a claim by the scout's own user is reported as *held by you*, not as unavailable."
- **"Merge of a human PR" vs. a human merging bot PRs.** For JWST, the owner's only activity after 2026-09-21 is merging Dependabot PRs. Those merges don't count by themselves; the check passes on the 2026-09-21 human commits.

```json
[
  {
    "item": "https://github.com/Snoww3d/jwst-data-analysis/issues/1010",
    "checks": [
      {"name": "Maintainer activity", "grade": "pass", "evidence": "Owner Snoww3d authored and merged human PR #2046 on 2026-09-21 (also #2025, #1985 2026-09-18/21), within 90 days of 2026-11-07."},
      {"name": "Project in use", "grade": "pass", "evidence": "isArchived=false; no releases; pushedAt 2026-11-07T12:33:46Z (within 90 days)."},
      {"name": "scope-feasible", "grade": "pass", "evidence": "One identifiable change: 'make file_count a @computed_field (or a validator) so it is always len(files)' (owner triage 2026-09-01)."},
      {"name": "Repeated failed attempts", "grade": "pass", "evidence": "Opened 2026-04-05 (<2 years); timeline has no cross-referenced or connected PRs; PR searches '1010' and 'file_count' return none."},
      {"name": "Available to work on", "grade": "pass", "evidence": "Assignees: none; no PRs; the only claim is anshbabar's own comment 2026-11-08T05:53:27Z, i.e. the scout's user, held by me, not a competing claim."},
      {"name": "AI workflow permitted", "grade": "pass", "evidence": "CONTRIBUTING.md and .github/PULL_REQUEST_TEMPLATE.md inspected: no AI restriction; repo ships AGENTS.md."},
      {"name": "Newcomer guidance", "grade": "pass", "evidence": "'good first issue' label (re-added by owner 2026-09-01); owner names mast/models.py and the fix."}
    ],
    "verdict": "accept"
  },
  {
    "item": "https://github.com/WorldconVotingSystems/nomnom/issues/358",
    "checks": [
      {"name": "Maintainer activity", "grade": "pass", "evidence": "offbyone merged human PR #519 on 2026-10-18 and #518 the same day (within 90 days)."},
      {"name": "Project in use", "grade": "pass", "evidence": "isArchived=false; release v2027.0.0 published 2026-10-17; pushedAt 2026-11-05."},
      {"name": "scope-feasible", "grade": "pass", "evidence": "One identifiable task: 'a pair of buttons at the top of the Packet-downloads page' to expand all / collapse all categories."},
      {"name": "Repeated failed attempts", "grade": "pass", "evidence": "Opened 2026-03-19 (<2 years); timeline has no cross-referenced PRs; PR searches '358' and 'expand' show no related PR."},
      {"name": "Available to work on", "grade": "pass", "evidence": "Assignees: none; 0 comments; no linked or mentioned PRs."},
      {"name": "AI workflow permitted", "grade": "pass", "evidence": "Root and .github/ inspected: no CONTRIBUTING.md, AI policy file, or PR/issue template; README/docs contributing section has no AI restriction."},
      {"name": "Newcomer guidance", "grade": "pass", "evidence": "'good first issue' label added by offbyone 2026-03-20."}
    ],
    "verdict": "accept"
  }
]
```
