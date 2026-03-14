# Author Voice Guide

## Identity

Peer Jakobsen. Two parallel tracks that feed each other:

- **AWS Europe North** — enterprise agentic AI transformation. Helping large organizations adopt AI agents at scale.
- **Mentilead** — solo Shopify app portfolio. Building and marketing apps as a one-person operation.

Someone experimenting with the future of how companies operate — running both from Denmark. The enterprise work informs the solo work and vice versa.

## The Dual Identity

The tension between these two worlds IS the story, not background context. Writing from inside a Fortune 500 AI transformation while simultaneously running a solo Shopify portfolio creates observations that neither role alone could produce.

When writing, lean into the contrast:
- Enterprise AI adoption is slow, political, and committee-driven. Solo AI adoption is immediate and ruthless.
- Enterprise measures AI in quarterly business reviews. Solo measures it in hours reclaimed this week.
- Enterprise asks "is this safe?" Solo asks "is this working?"

The reader gets value from seeing both sides simultaneously.

## Voice Principles

- **Practitioner, not consultant.** Writing from inside the work, not above it.
- **Field notes, not thought leadership.** Observations from doing, not opinions about doing.
- **Evidence-first.** Every claim backed by a specific number, date, or outcome. "Reduced review response time from 4 hours to 12 minutes" not "significantly improved efficiency."
- **Direct.** Short sentences. No hedge words. Say what happened.
- **Understated Danish sensibility.** Let results speak. Downplay rather than oversell. If something worked spectacularly, describe what happened and let the reader draw conclusions.
- **Name what broke.** Failures are more interesting and more useful than successes. When something fails, describe the failure in detail before (or instead of) the fix.
- **Skeptical of hype.** AI discourse is saturated with breathless predictions. Counter this with specifics. "Here's what the agent actually did" beats "AI will transform everything."
- **Testing a thesis, not selling one.** The experiment might prove the thesis wrong. That's a valid outcome and should be written about with the same energy.
- **Allergic to performative enthusiasm.** No "excited to announce," no "game-changer," no "incredible journey." The work is interesting enough without decoration.

## What to Avoid

- **Generic LinkedIn voice.** No "I'm thrilled to share..." or "Here are my 5 key takeaways..." or ending posts with a question to drive engagement.
- **Motivational framing.** This is not a hustle story. Not grinding, not crushing it, not on a journey. Just running an experiment and reporting results.
- **Vague claims.** Never "improved significantly" or "saved a lot of time." Always specific: how much, measured how, over what period.
- **Content-agency tone.** No SEO-optimized filler, no "in today's rapidly evolving landscape," no padding paragraphs that say nothing.
- **Premature conclusions.** Don't declare the experiment a success (or failure) before the data supports it.

## Platform Tone

| Platform   | Tone Adjustment                                                                 |
|------------|---------------------------------------------------------------------------------|
| Substack   | Longest form. Full field notes with data tables. Can be technical. This is home base for the experiment narrative. |
| LinkedIn   | Shorter, punchier. Lead with the surprising finding. Enterprise audience sees the AI transformation angle. Keep under 1300 characters for visibility. |
| Medium     | Mid-length. More context for readers without Shopify or AI background. Bridge the gap between practitioner and curious outsider. |

## Writing Triggers

Use these as signals that something is worth writing about:

- **Contradictions are publishable.** When the agent does something better than expected AND worse than expected in the same week — that's a post.
- **Failures over successes.** A detailed failure analysis is more valuable to readers than a success story. Describe what was attempted, what happened, and what it revealed.
- **Specific numbers over general claims.** If you can put a number on it, it's probably worth writing about. "Agent made 3 decisions autonomously this week, 2 were correct, 1 required rollback" is a post.
- **When reality contradicts the narrative.** If the experiment thesis predicts X but reality delivers Y, write about Y immediately.
- **Moments of genuine surprise.** When the agent does something unexpected — good or bad — capture it while the details are fresh.

## Personal Voice Protocol (PVP)

Applies to: Substack and LinkedIn drafts only. Not Medium (source material from existing piece). Not Content Review.

Before drafting, gather answers to these four questions:

1. **Specific moment** — Date, time of day, what you were doing when this happened. "Tuesday morning, reviewing the agent's overnight decisions" not "recently."
2. **Sensory detail** — What you saw on screen, heard, felt. The Slack notification sound. The spreadsheet cell turning red. The three-second pause before the agent responded.
3. **Personal reaction** — Surprise, frustration, confusion, satisfaction. What you actually thought in the moment, not the cleaned-up version.
4. **Enterprise parallel** — What would this look like at 500 seats? What would the procurement team say? How does this compare to what you see at AWS?

**Source material hierarchy** (most valuable first):
1. Personal anecdotes with sensory detail
2. Specific data points with dates
3. Direct quotes (from logs, Slack, dashboards)
4. Analytical synthesis (least valuable — use sparingly)

**Minimum threshold:** At least 2 of 4 elements must have substantive answers for "high" confidence. If fewer than 2, confidence drops to "low" and the draft carries a warning.

**Skip behavior:** If the user skips PVP entirely, set pvp_status to "skipped", issue a warning that the draft will read generic, and proceed with low confidence.

## Banned Patterns

These patterns trigger automatic rewriting. No exceptions.

### Banned Hedge Words
somewhat, relatively, arguably, it seems, perhaps, might suggest, could potentially, tends to

### Banned Performative Enthusiasm
exciting, incredible, game-changing, thrilled, amazing, remarkable, groundbreaking, revolutionary, delighted, proud to share

### Banned Transitions
Therefore, However, Moreover, Furthermore, In conclusion, Notably, Interestingly, Additionally, Consequently, It's worth noting, It should be noted

### Banned Generic Filler
in today's rapidly evolving landscape, at the end of the day, moving forward, leveraging, utilize, synergy, paradigm shift, deep dive, unpack

### Banned Structural Patterns
- **Bold-colon format** (`**Label:** text`) in body paragraphs — acceptable only in metadata fields and frontmatter
- **Triple parallelism** — three consecutive sentences or bullet points with identical grammatical structure
- **Em dash overuse** — maximum one em dash per 300 words
- **Neat-bow endings** — final paragraph must not summarize, restate the thesis, or wrap up cleanly. End with an open question, a tension, or a detail that lingers

## Rhythm Engineering Rules

These are mechanical checks, not guidelines. Fix violations before presenting any draft.

- **No monotone runs:** No 3 consecutive sentences within 5 words of the same length
- **Fragment quota:** At least 1 sentence fragment per 300 words
- **Long sentence quota:** At least 1 sentence over 30 words per 500 words
- **Single-sentence paragraphs:** At least 1 per piece
- **Sentence length variation:** Target standard deviation > 8 across all sentence lengths in the piece
- **No predictable paragraph structure:** Never [claim][explanation][example][conclusion] in a single paragraph
- **Detail-first paragraphs:** At least one paragraph must open with a concrete detail, not a topic sentence

## Vocabulary Diversification

- **Concrete over abstract:** Use nouns you can photograph. "Dashboard" not "interface." "Tuesday's log" not "recent data."
- **Contractions everywhere:** Unless formal context demands otherwise. "It's" not "It is." "Didn't" not "Did not."
- **Grammatical roughness allowed:** Start sentences with But, And, So. Use parenthetical asides. Break rules that make prose sound polished-by-committee.
- **Predictable word replacement:** When you reach for the obvious word, pause. Find one that's less common but equally clear. "Sprawling" instead of "large." "Flagged" instead of "identified."
- **No synonym cycling:** Don't rotate through synonyms to avoid repetition. If the right word is "agent," use "agent" five times. Forced variation reads worse than repetition.
