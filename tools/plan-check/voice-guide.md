# Voice guide: how I talk upstream

## Who I am in threads

I am a student contributor learning this repository through CodePath.
I am investigating a specific issue and documenting what I observe.
Readers can expect clear steps, evidence, and honesty about what I
have and have not verified.

## Rules I write by

### Rule: Commit to investigation, not a guaranteed fix

I describe the next action I can take and commit to sharing findings.
I do not promise a fix or a completion date before understanding
the problem.

- Wrong: "I'll fix this bug by tomorrow."
- Right: "I'll try to reproduce the reported behavior and share my steps and findings here."

### Rule: Name the specific investigation

I connect my claim to the behavior described in the issue and explain
what I will check next. I avoid generic claims that could be pasted
onto any issue.

- Wrong: "I'd like to work on this. Please assign it to me."
- Right: "I'll check whether the test fixture contains the quality signals its assertion expects, then report what I find."

### Rule: Separate observations from explanations

I state what the output shows before proposing a cause. If I have not
verified an explanation, I label it as a possibility.

- Wrong: "The parser is definitely broken."
- Right: "The output is missing the expected signal. I haven't yet checked whether the cause is the parser or the fixture."

### Rule: Keep conclusions within the tested conditions

I describe the environment and scenario I actually tested. If I
cannot reproduce the issue, I report that result without dismissing
someone else's experience.

- Wrong: "This isn't a bug. It works."
- Right: "I couldn't reproduce the reported failure with the setup and input below. I haven't tested the other configuration mentioned in the issue."

### Rule: Describe the problem without blaming people

I explain the mismatch and its effect using straightforward language.
I avoid judgments about the author's ability or effort.

- Wrong: "Whoever wrote this test clearly didn't check it."
- Right: "The assertion expects a signal that appears to be missing from the fixture."

## Things I never post

- A guaranteed fix or delivery date before I understand the work.
- A claim that I ran a command or verified a result when I did not.
- "Same as above, can confirm" instead of my own steps and evidence.
- A confident explanation that goes beyond what I have checked.
- Blame, sarcasm, or demands for a maintainer's attention.
- AI-assisted comments that omit disclosure required by the repository.
