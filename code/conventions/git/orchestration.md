## Task Tracking
sprints are expressed with Milestones.

> epic issue vs milestone: milestones are **aggregates** of issue particles; care about **impact** of the work, and care about their absolute position in time. Issues are fully related, - so a very large piece of work, which is however self-contained and reasons about changing code first and foremost, will be a `t:epic` issue, not a milestone.

all tasks past product backlog (sprint backlog and active), must have a person assigned.
However, no such rule exists for tasks oustide, - new issues can be created and kept without anyone yet assigned to them.
Be mindful of intent, - once you assign someone to an issue, they take its ownership. And only one person can be assigned to any one issue (if part of the implementation needs to be delegated, it should be done through creation of a child issue for that part of the work). <!--Done to drive strict ownership of all features. Absence of distinct leader on any task will lead to delegation of responsibility by all participants-->

## Labels
standardized labels are [defined in and brought by v_flakes](https://github.com/valeratrades/v_flakes/blob/main/github/labels.nix)

v_flakes [skill](https://github.com/valeratrades/v_flakes/blob/main/skill/SKILL.md) has instructions on how to reason about them. Tldr is:
- `i:*` for importance (0-9; higher - grander)
- `h:*` expected number of hours
- `t:` type, - {`t:task`, `t:bug`, `t:enhancement`, `t:question` (think of it as decide+explore), `t:architecture`, `t:epic`, etc}

then you can go deeper, and provide `category`: {`c:docs`, `c:test`, `c:ci`, `c:pef`, etc} and `extensions`: {`ext:good-first-issue`, `ext:wontfix`, `ext:claude`, etc}

`i:*` is required, `h:*` and `t:` are expected
