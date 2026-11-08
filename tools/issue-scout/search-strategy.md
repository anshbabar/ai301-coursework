# Search strategy: where your scout looks, and why

## Queries

Profile: "I prefer small Python bug fixes and test improvements with a concrete expected result and a focused way to verify the change."
```bash
gh search issues --label "good first issue" --language python --state open --limit 100 --sort updated --order desc --json title,repository,labels,assignees,commentsCount,updatedAt,url
```

Profile: "Small TypeScript bug fixes are also a good fit when they can be tested locally."
```bash
gh search issues --label "good first issue" --label bug --language typescript --state open --limit 100 --sort updated --order desc --json title,repository,labels,assignees,commentsCount,updatedAt,url
```

The Python query is intentionally broad: requiring a bug label as well can miss test improvements. The TypeScript query requires both labels to keep this secondary search focused on bugs. Neither query establishes that a task is small, available, or possible to test locally; those facts need issue and repository evidence during grading.

## Ranking filters

Apply these rules in order using only the returned search fields:

1. Combine both result sets and deduplicate by issue URL. Retain which query or queries found each issue.
2. Drop results with one or more assignees.
3. Drop results whose updatedAt is more than 90 days before the scan's recorded date.
4. Drop results with a label exactly equal to `question`, `discussion`, `epic`, `tracking`, or `wontfix` (case-insensitive).
5. Sort by commentsCount ascending, then updatedAt descending, then URL ascending for a deterministic tie-break.
6. Walk that order and retain only the first issue per repository, so the five graded results sample different projects.

Do not infer availability from low comment counts. Check claim comments, linked PRs, maintainer activity, contribution policy, scope, and setup requirements during grading. Project-area preferences inform the final fit ranking after evidence is gathered; do not invent those facts from search metadata.

If fewer than five results remain, report the shortfall and grade only those present. Do not silently relax the rules or substitute issues.

## How many to grade

Grade the top **5** ranked results per scan.
