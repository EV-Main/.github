## Task Tracking
task management happens through Zenhub

sprints are self-imposed deadlines; while actual hard ones caused by external factors, are expressed via milestones.

![`estimate` section](../../../docs/assets/zenhub_story_points.png) on issues, which they call "Story Points", under our system means apprx number of hours required.
All opened issues should have an estimate attached. Use the **upper** part of the range when not certain.
Very large features can omit it, which would imply that pre-selected sizes are not sufficiently large to cover the expected scope. This is only allowed if the issue has children, and raises questions on why it's not instead a milestone, (through which epics are normally handled).

> epic issue vs milestone: milestones are **aggregates** of issue particles; care about **impact** of the work, and care about their absolute position in time. Issues are fully related, - so a very large piece of work, which is however self-contained and reasons about changing code first and foremost, will be a `t:epic` issue, not a milestone.

all tasks past product backlog (sprint backlog and active), must have a person assigned.
However, no such rule exists for tasks oustide, - new issues can be created and kept without anyone yet assigned to them.
Be mindful of intent, - once you assign someone to an issue, they take its ownership. And only one person can be assigned to any one issue (if part of the implementation needs to be delegated, it should be done through creation of a child issue for that part of the work). <!--Done to drive strict ownership of all features. Absence of distinct leader on any task will lead to delegation of responsibility by all participants-->
> you are expected to be aware of all your github notifications, and keep sorting of your Zenhub tasks up-to-date

## Labels
standardized labels are [defined in and brought by v_flakes](https://github.com/valeratrades/v_flakes/blob/main/github/labels.nix)

v_flakes [skill](https://github.com/valeratrades/v_flakes/blob/main/skill/SKILL.md) has instructions on how to reason about them. Tldr is:
- `i:*` for importance (0-9; higher - grander)
- `h:*` expected number of hours
- `t:` type, - {`t:task`, `t:bug`, `t:enhancement`, `t:question` (think of it as decide+explore), `t:architecture`, `t:epic`, etc}

then you can go deeper, and provide `category`: {`c:docs`, `c:test`, `c:ci`, `c:pef`, etc} and `extensions`: {`ext:good-first-issue`, `ext:wontfix`, `ext:claude`, etc}

`i:*` is required, `h:*` and `t:` are expected

## Time Tracking
[Clockify](https://app.clockify.me/calendar) will be integrated later. Manually using it is not realistic, so blocked by tooling automation. <!--Partial implementation already exists in https://github.com/valeratrades/tedi-->
