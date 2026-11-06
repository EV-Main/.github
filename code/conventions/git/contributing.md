## Branches
contribution to our own repos happens through branching, never forking.

you own your feature branches, and take care of prefixing them with your name.
Eg my branches look like `val/shave_the_yak`.
You take care of deleting them after they are merged. There are no deadlines on how quickly that needs to be done, but avoid letting your garbage branches pile up.

most of our repos will have `main` and `dev` branches; but it is not a strict requirement.
Eg we can have repositories with blogs or other documents/assets, that are not compiled directly; or maybe scripts that are not critical to fund's operations. Those do not require effort allocation towards strict deployment controls.

## Review
by default, reviewer will approve the changes, while responsibility of final merging is on you.
You can ask them to merge immediately and/or delete your feature branch after, but responsibily of ensuring both are done remains on you.

> `assign` don't `request`. And except for most critical cases, don't pick more than one.

## PR vs Issue
your pr must always be linked to a specific issue
- Issue reasons about **what** and **why**
- PR only responds to the question of **how** \
  its description contains whatever implementation details you felt were relevant for inclusion.
  Following conversation only focus on problems with the code; with questions on (scope, necessity, importance, etc) of implementation itself, being elevated to the tracking issue.
- Milestone issue is added under, is what you use if it has external physical deadline. \
  > different from self-imposed deadlines, which are controlled and managed through [Sprints on Zenhub](./orchestration.md#task-tracking)
