The single source of truth for shared standards and organization of **EV Investment fund**.

## Org

umbrella org of EV Investment Fund. Owns:
- https://github.com/EV-Service-Arb
- https://github.com/EV-Quant
- https://github.com/EV-Invest

### Collaboration

All collaboration is organized github-first.

Progress state on any kind of project should have a stable source of truth.
Even if it's something disconnected from code; like a marketing campaign, or search for best appartments to invest in; it must be tracked on github.

Because we force code as source of truth, we are able to attach collaboration primitives for free with [Zenhub](https://app.zenhub.com/workspaces/packaging-6a0db85e94cac6001cc5e9ab/board).
Source of truth of task mgmt.

Current company operations bottleneck is defined in https://github.com/EV-invest/.github/milestone/1
> CEO is in charge of keeping it up-to-date. If you see that it isn't, - report and get him to update <!--TODO: gotta figure out some compensation structure for noticing these things-->

### Communication

- Unstructured communication happens on Discord. \
  This includes `#daily-updates` channel, and topic-sorted considerations outside of it. Dev alerts also have their section, - everything that developers need to be aware of, should be routed there.

  It is generally encouraged to sit in voice-channels there while working, as this speeds up communication. \
  However, when discussing a solution to a specific problem, prefer using channels that allow for persistence. [Google Meets with Fathom summaries](https://help.fathom.video/en/articles/449472), YT streams, discussions in VCs with SST attached, etc. It is desirable to have persisted reasoning to point to, if this problem is encountered again later (especially by someone who wasn't a part of orig discussion).

  > It is on you to set up notifications for server sections relavant to your work, and stay up-to-date on contained discussions.

- Discussions around a specific impelementation {point / judgement call} are opened through GitHub Discussions. \
  eg <https://github.com/EV-invest/scam_pump_liqs/discussions/12>
  Difference from Issues: answers are not expected. You are adding to the knowledgebase/context of the project, but there is no expected change/decision riding on it (if there is, - open an Issue with "question" label).

- GitHub Issues are the driver for any concerns with change/decision attached. \
  An issue/idea doesn't exist until it is logged on github.
  Then all further discussion happens under it, and related concerns link to it.

> when referencing internal projects in speech, some names can be abbreviated; - an up-to-date glossary can be found here: [./docs/GLOSSARY.md]

### [Code](/code)

Standards for working with code are in ./code

> remember that nobody gets to {critique or request changing} any part of conventions/styles you're using, outside of what is covered here.

## Glossary

It is easier to move fast if we all have shared understanding of the scope of our work; and a number of key resource references, that we can assume everyone is familiar with.

- [Schwarzman biography](/resources/What_It_Takes_-_Stephen_A_Schwarzman.pdf), - this is how the largest Asset Manager in existence got started, we must be intimately familiar with factors that made it possible.

- Yale's exact desired portfolio manager can be inferred from reading [Yale's David Swensen investing](/resources/Pioneering_Portfolio_Management_-_David_F_Swensen.pdf), - this is a partial blueprint to how we can make investment into ourselves desirable for these large players

- TODO: adapt [How to Succeed at MrBeast Productions](https://drive.google.com/file/d/1YaG9xpu-WQKBPUi8yQ4HaDYQLUSa7Y3J/view) to our scope

## KPIs

Everything we do must impact either:

- return on our capital
- safety thereof
- amount of capital under our management

That's it. If you cannot articulate how a task will impact one of these, it is not to be done.

## Principles

- Build in the open. \
  Work happens faster the more knowledgeable each contributor is.
  Hence by default all {code, work, data, meetings} are open, up to the level where it would start impacting the bottom line.

- Long-term focus & liquidity of pursued opportunities. \
  All decisions should be evaluated within context of 10y+ horizon.
  We will not pursue small opportunities or bloat the tech stack with disjoint tooling, languages, standards.

- Simple is better. \
  The simplest solution should always be preferred.
  Reducing {scope, code size, deps}, removing {unused data, meetings not leading to a decision, tools, unpopular product offers}, - all are as or oftentimes more valuable than adding something.
  Simple at scale is complex enough.
  Have no patience for redundancy, - if any action you are prescribed to do is redundant, fight to deprecate it.
  > **NB:** don't drop it before the source-of-truth rulesets are updated

- Remove friction at all costs. \
  Never add **anything** that could increase friction for clients.
  We will never force {instructions, acceptance of terms of service / cookies, forced animations, click-through scaffoldings, "are you sure" popups, etc} upon users.
  Every single {click / second} saved, neccessary for a client to {give / keep giving} us money, is an enormous win.

## Dev

See [ARCHITECTURE.md](/docs/ARCHITECTURE.md) for this repo's organization, before making changes.
