What the order a page loads in does to its user, and how to choose it.

Each linked heading opens its example, bad beside good, in [Figma · Load times](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=13-3).

A page has no one load time. What there is to load fixes the total; the order it is paid in is designed, and the user lives through the order:

```
 part                                                        by         late, the user…
 1 frame      its shape: where everything will be            first paint  thinks nothing happened: reloads, leaves
 2 way out    navigation, search, the object's name          0.5 s        is stuck on a page they opened by mistake
 3 the thing  what they came for, in the form they act on    1–3 s        waits: the only wait that counts
 4 next       what acting on it needs: choices, counts       as they read meets a control that isn't ready
 5 the rest   related, comments, history, third parties      15 s is fine does not notice
```

YouTube is the reference: it feels instant, and smaller parts of its page come 10–15 s in. Seconds moved from 3 to 5 are free; a second moved from 5 to 3 is the whole product.

# Order
## [What They Came For First](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=13-59)
Which part gets the line and the server first.

**wrong**: the page is ready when all of it is, so it is as slow as its slowest part.

**right**: every part is put on one of the five lines above, and loads in that order. A part on line 5 may be slow; nothing above it knows.

**reason**: the wait is until the first useful act. Two pages with the same total differ by that alone.

## [Frame Before Data](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=13-92)
What is on screen before any code of ours runs.

**wrong**: blank, or a splash over everything.

**right**: the document itself draws the frame: navigation, bars, the place and size of what will come.

**reason**: the shape answers "did it open, is it the right page". A part that takes its room on arrival moves the one being read.

## [Nothing Waits for What It Doesn't Show](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=13-140)
What each part's appearance depends on.

**wrong**: one read for the page; a list of issues behind the pull requests' history, the navigation behind a third party's API.

**right**: each part names the data it shows and appears with the last of it; data is read in the order of the parts that need it. A third party is never above line 4.

**reason**: every needless dependency moves a part down to its slowest neighbour's line.

# Feedback
## [The Loader Is Where the Thing Will Be](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=13-175)
What a loader covers.

**wrong**: the page, for the sake of one view in it.

**right**: that view's content. Its own controls, the other views and the navigation work meanwhile; two views loading are two loaders.

**reason**: what has loaded and cannot be reached has not loaded.

## [Measured, Not Animated](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=13-215)
What a loader says.

**wrong**: a spinner; a bar paced by how long it took last time; no number on the first load.

**right**: the share that is loaded of what there is to load (bytes, rows), of what this part shows. Where the far side works in silence, it is made to report: a stream with its total first. No total to be had: name who is being waited for ("Asking GitHub…").

**reason**: the number is there to decide whether to wait. One that is not measured is believed once.

## [Fails Where It Loads](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=13-247)
A part that does not arrive.

**wrong**: an error page in place of everything.

**right**: what failed and why, where the part would have been; the next successful read replaces it.

**reason**: the other parts did arrive.

# Budget
## Remove Before Showing
A wait worth a loader.

**wrong**: the loader first.

**right**: what the wait is spent on is known before it is drawn: read once what is read per row, send compressed, drop what no part shows.

**reason**: a loader makes a wait bearable, which is also what keeps it.

## [One Line, One Queue](https://www.figma.com/design/uVD3gi5T7qkOLlavhTfrzL/UI-conventions?node-id=13-287)
What is requested when.

**wrong**: everything prefetched at once, so the bulk shares the line with what all else waits for.

**right**: the small and critical in parallel at the start; the bulk once the client is here, in the order of its parts.

**reason**: on a fast line it costs nothing; on a slow one parallel bulk delays the first useful act by its own whole length.

# Verify
## Cold Server, Slow Line, Real Data
How a load is judged.

**wrong**: localhost, the second load, five rows.

**right**: an uncached server, 10 Mbps, the largest real dataset; when each of the five parts appeared, as numbers. A test holds the bulk back and requires lines 1–3 without it.

**reason**: every ordering mistake is invisible when everything arrives at once.
