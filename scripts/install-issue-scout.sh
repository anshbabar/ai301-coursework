#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source_dir="$repo_root/tools/issue-scout"
skills_dir="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
for required_file in SKILL.md scope.md search-strategy.md rubric.md references/evidence-guide.md; do
  if [ ! -f "$source_dir/$required_file" ]; then
    echo "Missing scout file: $required_file" >&2
    exit 1
  fi
done
mkdir -p "$skills_dir"
backup_dir="$(mktemp -d "${skills_dir%/}/../issue-scout-backup.XXXXXX")"
# Backup outside the skills directory so Claude cannot discover duplicate skills.
for old_name in issue-select issue-scout; do
  if [ -e "$skills_dir/$old_name" ]; then
    cp -R "$skills_dir/$old_name" "$backup_dir/$old_name"
  fi
done
# All backups succeeded before either existing installation is moved.
for old_name in issue-select issue-scout; do
  if [ -e "$skills_dir/$old_name" ]; then
    mv "$skills_dir/$old_name" "$backup_dir/original-$old_name"
  fi
done
cp -R "$source_dir" "$skills_dir/issue-scout"
printf 'Installed scout: %s\nBackups: %s\n' "$skills_dir/issue-scout" "$backup_dir"
printf '%s\n' 'Review scope.md before running. If your old local profile/rubric is newer than GitHub, recover those edits from the backups.'
