---
layout: page
title: WoW
nav_order: 20
---

Some common ways of working for the CoFinder project. This is meant to be a living document that adapts to the reality. If something that is written here doesn't seem to match with the current reality, please raise that question at a standup and if others agree, make a change in this page.

## Tracking work
- The project uses [GitHub projects](https://github.com/orgs/knowit-solutions-cocreate/projects) as its planning and management tool.  
- Items in the project come in three different levels:
    - **epics**: high-level ambitions that either relate to a specific product function (e.g. "make cofinder-ads-kanalen work in teams") or that describe a general direction of improvement (e.g. "improve the code quality"). These are meant to act as an aid in prioritization work and don't generally need to get closed as tickets. [see currently open epics here](https://github.com/knowit-solutions-cocreate/datadrivet-infra-opendatastack/issues?q=is%3Aissue%20state%3Aopen%20type%3AEpic)
    - **features**: larger chunks of work that result in a concrete improvement, should take max 1 week to complete. If you have an idea for a new feature, add it in [the backlog](https://github.com/orgs/knowit-solutions-cocreate/projects/7/views/11). In planning meetings, we go through features in the backlog and the chosen ones get escalated to "planned" and in daily work the features get then delegated to different members of the team. Exception to this rule are urgent features, which can be put to "planned" in a standup (or in case of urgent, critical bug fixes, immediately added to "planned").
    - **sub-issues**: a helpful tool for you to plan out how you plan to tackle the feature and how far along you are. Feel free to use them or not use them as you wish.

## Code reviews and PRs
- When your code is ready for review, announce the PR on the #cofinder-dev slack channel 
- When you start reviewing a PR, react to the PR announcement on slack with appropriate emoji
    - :eyes: means I've started reviewing this
    - :heavy_check_mark: means I have approved the PR 
- It's a good idea to take a look at others' PRs even if you are not the one reviewing it in order to get a better sense of the system
- Another good idea is to share screen and live-review PRs in teams of 2+ people. This is an excellent opportunity for you who submitted the PR to learn from your colleagues! Programming is a craft and a craft is best learned when discussing choices with other craftspeople.

## Regular meetings

Standups
- The project runs regular standup meetings that go through ongoing work and any demos that might be helpful for the broader team to see
- There is a [standup board](https://github.com/knowit-solutions-cocreate/datadrivet-infra-opendatastack/issues?q=is%3Aissue%20state%3Aopen%20type%3AEpic) that is updated at each standup
- In the standup, you as a developer are expected to clearly communicate your status, ie what you're currently working on and if you're experiencing any issues that you'd like help with. 
- At the end of the standup, there is time to demo completed work

Planning meetings
- The project holds planning meetings at regular intervals where the epics and work in backlog are prioritized according to stakeholder needs, resources etc
