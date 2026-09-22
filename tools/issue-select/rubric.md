# Rubric: is this a good first issue?

## Checks

Measure recency against the bundle's capture date in eval mode,
and today's date in live mode. Use the latest explicit maintainer
decision when older comments conflict with newer ones.

| Check | Evidence | Pass condition | Weight |
|---|---|---|---|
| Maintainer activity | Repo facts: last 5 default-branch commits and maintainer first-response sample; issue comments with OWNER, MEMBER, or COLLABORATOR association. In live mode, inspect the corresponding commit history and issue threads. | At least one human maintainer commit, merge of a human PR, or maintainer issue response within 90 days. Automated bot activity alone does not pass. | required |
| Project in use | Repo facts: archived flag, latest release, last push to any branch, and stars. In live mode, inspect the repository banner, Releases, branch activity, and star count. | Repository is not archived, and has either a release within 365 days or a push within 90 days. Stars alone cannot establish current use. | required |
| Bounded contribution | Issue body, labels, and comment thread, especially maintainer statements about the requested work. | Requests one concrete contribution with an identifiable outcome. Reject umbrella/tracking work intended to be split, unresolved design debates, pure usage questions, or changes explicitly requiring core-internals work. A short description or missing reproduction steps alone does not fail. A good-first-issue label cannot override explicit scope problems. | required |
| Repeated failed attempts | Issue opening date and capture date; linked PR states; comments describing previous attempts. | Issue is not both at least 2 years old and associated with at least 2 abandoned, closed-unmerged implementation attempts. Count distinct PRs, not repeated mentions of the same attempt. | required |
| Available to work on | Issue assignees, linked PR states, and claim or release comments in the thread. Inspect PRs mentioned in comments as well as formally linked PRs. | No current assignee, open implementation PR, or unresolved claim within 30 days. Explicit withdrawal or maintainer reopening of availability clears an older claim. Closed-unmerged PRs alone do not reserve the issue. When sidebar and thread conflict, use the latest explicit thread evidence. In live Path Review mode, apply scope.md's classroom exception to claim signals. | required |
| AI workflow permitted | Eval bundle's contribution-policy line. In live mode: CONTRIBUTING.md in root or .github/, linked contributor docs, AI_POLICY.md or AI_USAGE_POLICY.md, and PR/issue templates. | No explicit policy bans the planned AI-assisted contribution. Disclosure, understanding, testing, and human-review conditions pass and must be followed. An inspected policy surface with no AI restriction passes; unavailable evidence is unclear. | required |
| Newcomer guidance | Issue labels, body, and maintainer comments. | Has a good-first-issue label or a maintainer identifies a specific file, function, or test relevant to the contribution. | preferred |

## Verdict rule

Accept if every required check passes.
Reject if any required check fails or is unclear.

Preferred checks only rank accepted issues and never change the verdict.
An unclear preferred check provides no ranking benefit.

For each check, cite the evidence supporting its result.
Distinguish explicit absence (such as no assignees) from missing evidence.

In live mode, follow scope.md's Path Review house rule.
Do not apply that classroom exception to eval snapshots.