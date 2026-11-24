What good UI is, across every product in the org: operator tools and customer-facing pages alike. How our own stack is used is [org_specific.md](./org_specific.md).

Each linked heading opens its example, bad beside good, in [Figma · UI conventions](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions).

Every rule below follows from one question: **what is the user deciding here, and what would help them decide?** A screen that cannot answer it has no reason to exist; an element that does not help the answer is cost.

# Decision
## [Connected Decisions in One View](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-112)
Choices that affect each other: filters and their results, a setting and what it changes, an object and the action on it.

**wrong**: a page per filter, a modal whose scrim hides what it is about, a second map drawn inside a panel.

**right**: a sheet or panel over the context it changes, the results updating behind it.

**reason**: the user decides by comparing. Whatever leaves the screen has to be held in memory, and is held wrong.

## [Show Before You Ask](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-149)
What the user gets before the product asks for anything: an account, a payment, data.

**wrong**: the scan runs, then the results are blurred behind "Create an account to see your report".

**right**: the score and the top issues are shown; "Save the full report" comes after them.

**reason**: the user cannot judge whether an ask is worth it before seeing what it buys, and what is already computed costs nothing to show.

## Robust Beats More
Which features exist.

A feature earns its place only once using it is obvious and it is thought through to the end: every state, every edge, the step after it. One utility done completely beats five half-done.

**reason**: every half-feature is something the user has to learn not to trust.

# Information
## [One Thing Read First](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-184)
Hierarchy inside a screen, a card, a row.

**wrong**: labels as loud as values ("Sales" in 20 px over "591" in 14 px); every field in the same label: value form.

**right**: you can say which element is read first. Name, then one key number, the rest muted; values louder than their labels.

**reason**: when everything asks for attention nothing gets it, including what matters.

## [Preview the Cost](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-221)
Options, actions and lists: what choosing them gives or takes.

**wrong**: "Search", "Run scan", "Reserve", a filter chip without a count.

**right**: "Show 41 homes", "Scan 'plombier lyon' · 49 pts · 12 tokens", "Reserve €445 total", "3+ · 459"; a list says how long it is.

**reason**: the user decides before clicking. A choice whose outcome is only learned after it is a gamble, and a gamble gets avoided or undone.

## [Specific Beats Vague](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=4-29)
Times, dates and labels.

**wrong**: "fast", "Mar 28 – Apr 2", "Book a viewing".

**right**: "2 min away · arrives 12:53", "Fri, Mar 28 – Wed, Apr 2 · 5 nights", "Book Sat 11:30".

**reason**: a specific value is one the user can plan and compare with; a vague one sends them to find it out or count it themselves.

## [Speak the User's Units](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-304)
What the system needs against what the user knows.

**wrong**: asking for a max price from someone who knows their deposit and monthly budget; a transfer screen showing the amount but not the balance after it.

**right**: deposit + monthly → max price, computed; "New balance €1 204" under the amount.

**reason**: every translation the user does in their head is a place to get it wrong and a reason to stop.

## [Distribution Behind a Range](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-345)
A slider or range over data.

**wrong**: a bare price slider; a bare radius slider.

**right**: the histogram of what the range filters, drawn behind it, and where the user's own limit cuts it.

**reason**: the user picks a range for what it lets through. Without the distribution they pick blind and iterate.

## [Answer the Next Question in Place](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-370)
The doubt that follows a choice: what if I change my mind, what does it taste like, who am I paying.

**wrong**: the answer on another page, or nowhere.

**right**: "Free cancellation before Mar 26" under the Reserve button; a flavour's description on hover of its swatch; the recipient's photo beside the amount.

**reason**: hesitation is where people leave. An answer at the moment of doubt costs one line; the doubt costs the action.

## [One Direction Means Better](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-400)
Charts and indicators.

**wrong**: average rank plotted as is, so the line rises while the place gets worse; a green that reads as "good" on a neutral metric.

**right**: axes inverted where lower is better (rank 1 on top); semantic colour only where there is a judgment.

**reason**: the reader reads shape before labels. A shape that lies is read wrong every time, whatever the legend says.

## [Show Only What Is Readable](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-433)
Data the product does not have, or has only partly.

**wrong**: a key number the user cannot get yet ("views 7d" before ownership) filled with a placeholder; a stale value shown as current.

**right**: the key number is one we have; what needs something first is a dashed slot naming what it waits for; data age is stated where it matters.

**reason**: one invented number makes every other number suspect.

# Controls
## [Expose the Options](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-492)
A choice among a few known values.

**wrong**: 17 filters hidden in 2 dropdowns; a flavour dropdown; a free-text field for a job title.

**right**: quick filters as chips with counts, "More filters" and sort beside them; options as swatches, segments or cards; the common values to tap, "Other" to type.

**reason**: a dropdown makes the user click, scroll and read to learn what exists. A visible option costs a glance; selection cannot be mistyped.

## [Input Fits the Data](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=4-125)
How a value is entered.

**wrong**: a slider alone for a value that has to be exact (leverage 23x); a bare field for a value inside a range the user cannot see; a stepper for a target the user already knows.

**right**: the control follows the value: a bounded range gets a slider with its common values marked, an exact value a field. A precise value inside a range gets both, editing one value (leverage: field with −/+ over a 1x–100x slider). Segments when the target is one of a few ("2+").

**reason**: a slider shows where a value sits in its range but cannot hit an exact one; a field hits it but hides the range. The data decides which the user needs, often both.

## [Prefill From What Is Known](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-576)
Fields the system already has an answer for.

**wrong**: five empty fields for what the user did last time; a pre-selected option the system guessed and presents as a recommendation; stars pre-selected on a review.

**right**: recent recipients above the search; the open object as the context of an action; "at least" as the default semantics where it is the reading most users mean, "exact" an explicit opt-in.

**reason**: a known answer left blank is homework. An invented one is a fallback dressed as advice, and steers the user where the data does not.

## [Disabled, Not Hidden](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-604)
A control that cannot act right now.

**wrong**: the control disappears, so the user does not learn it exists or why it is gone.

**right**: it stays in place, dimmed, with its reason ("needs a trade", "15 GBPs hold it").

**reason**: a vanished control reads as a missing feature, and its layout shifts. A reason tells the user what to fix.

## [The Action Names Its Target](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=4-52)
Buttons, agent suggestions, menu items.

**wrong**: "Submit", "Draft reply" beside a place with 4 suspended reviews and 2 unanswered.

**right**: "Appeal 4 suspended", "Draft 2 replies".

**reason**: the label is the last check before acting. One that names what happens and to what makes the check possible.

## [Empty Is a State](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-650)
A list, a board or a result with nothing in it.

**wrong**: "You have no projects." and nothing else.

**right**: why it is empty, and the one action that fills it; where nothing needs the user, what changed and what is running.

**reason**: an empty screen is a dead end unless it points somewhere.

# Visual
## [One Shape Language](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-689)
Radii, sizes and the drawing of components.

**wrong**: two search bars drawn differently; four radii on one screen; a back button and a skip button with different shapes for the same role.

**right**: one radius per role; one component per role, identical wherever it appears; details off photos, so a card holds arbitrary content.

**reason**: inconsistency reads as carelessness before any single element is judged, and it makes the user re-learn what is already known.

## [Few Type Steps](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-715)
Font sizes and weights.

**wrong**: six sizes and four weights on one card.

**right**: about four sizes and two weights; tabular or mono figures for numbers that change and get compared.

**reason**: each step is a level of hierarchy. More steps than levels is noise; figures that jitter cannot be compared at a glance.

## [Spacing From a Scale](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-756)
Gaps, padding, grouping.

**wrong**: 11 px here, 25 px there; equal gaps between unrelated groups.

**right**: every value from one scale; related elements closer than unrelated ones.

**reason**: spacing is how grouping is read. Random gaps make random groups.

## [Colour Is Meaning](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-786)
Where colour is spent.

**wrong**: the brand red on every button; a gradient of two hues; a delete button in the brand colour; red for a notification count and for an error.

**right**: mostly neutrals, one accent for what to act on; red only for loss and destruction, kept even when off-brand; states as tints of the base (hover lighter, press darker, disabled desaturated).

**reason**: a colour that appears everywhere means nothing, and colour is the fastest channel the eye has.

## [Effects Earn Their Place](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-804)
Shadows, gradients, glows, blur, motion.

**wrong**: a harsh grey shadow; gradients and glow for decoration; scroll-jacking; animation that only shows off.

**right**: flat by default; a shadow soft and tinted by what is behind it when depth means something (overlay over page); motion that shows where a thing came from or went, and feedback on every press; "Load more" over infinite scroll.

**reason**: an effect that communicates nothing is noise. One that does is the cheapest explanation there is.

## Dark Is Its Own Palette
A dark theme.

**wrong**: the light palette inverted.

**right**: borders and surfaces spaced further apart than in light; light greys for body text, pure white saved for the few loudest elements; brand colours desaturated.

**reason**: the eye separates dark values worse than light ones; inverted contrast is either mud or glare.

## [Size by Job](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=4-79)
How much room an element takes.

**wrong**: a listing photo squeezed to a thumbnail where the user picks a place by its photos; an operator table padded like a landing page.

**right**: what the user judges by gets the room (the photo, with "1 / 24"); a list to scan is dense, with sort, search and filter in reach.

**reason**: content too small to judge has to be opened to be judged; padding in a list to scan is scrolling.

## [Real Content](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-836)
The data a design is drawn and checked with.

**wrong**: five short names; numbers that differ between two screens about the same object.

**right**: the longest name, 92 rows, the empty case; the same object reads the same everywhere it appears.

**reason**: perfect data hides every truncation, overflow and contradiction until a user finds it.

# Flow
## [Every Tap Is a Cost](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=6-34)
Taps, fields and screens between the user and the outcome.

**wrong**: a timeline to read and "Start in 2 taps" where one button does it; a confirm step for what is undoable; a banner "Discover 100+ recipes" that has to be opened to see one.

**right**: the same outcome in the fewest steps: one tap, the content itself where the banner was, undo instead of confirm.

**reason**: every step is time and a place to lose the thread. Between two paths to the same outcome, the shorter one is better without exception.

## [Stay on the Page](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=7-41)
Anything the user opens from where they are: a payment, a date picker, settings, an item from a list.

**wrong**: it takes them away: "Continue to payment" leaves for the provider's page and "Return to merchant"; settings is its own route.

**right**: it floats over the page they are on, and closing it puts them back exactly there.

**reason**: leaving costs a load each way and drops what the user was holding: their place, their context, what they half typed.

## [One Attention Order](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-915)
Everything that tells a user what needs them: badges, a "next" button, notifications, counts on a menu.

**wrong**: each surface sorts its own list.

**right**: one list, ordered by what is at stake; every surface is a filter of it.

**reason**: two orders disagree, and the user stops trusting both.

## [Work Is a Loop](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-941)
Repeated work through a queue.

**wrong**: finish an item, go back to the list, find the next, open it, find the tab its issue lives on.

**right**: "Next" opens the next item where its issue lives; finishing one says what comes after.

**reason**: the walk back is most of the cost, and it is where the user drifts.

## Meet the User Where They Are
The same screen for a newcomer and an expert.

**wrong**: one screen for everyone.

**right**: a new user sees one first step and a little to explore; a returning one, today's plan; a power user, their numbers.

**reason**: what helps a first decision is noise to the hundredth.

# Loading
What comes when, where a wait is shown and what it says: [load_time_consequences.md](./load_time_consequences.md).

# Other
## [Fewest Words](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=1-1002)
Copy.

**wrong**: "Your Total Rewards Earned" under a heading "Rewards"; a label that names a different action from the one the button does; a placeholder "Search".

**right**: no word the heading already says; the label is the action; a placeholder names what is searchable ("places, reviews or leads").

**reason**: every word is read, and a repeated one is read for nothing.
