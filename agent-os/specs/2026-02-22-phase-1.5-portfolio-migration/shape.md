---
phase: "1.5"
title: "Multi-App Portfolio Architecture Migration"
date: 2026-02-22
---

# Shaping Notes — Phase 1.5

## Problem
Phase 1 assumed a single Shopify app per developer. In practice, many developers manage a portfolio of apps (e.g., Mentilead with B2B Onboard, QuickCart B2B, NetTerms Pro) that share brand, partnerships, and strategy but need independent tracking.

## Appetite
Small batch — template additions and CLAUDE.md update only. No skill logic changes. No init workflow changes yet.

## Solution Shape

### Portfolio Layer
Add a portfolio concept above individual apps:
- Portfolio-level MEMORY.md tracks brand identity, cross-sell strategy, shared learnings
- Portfolio-level STATUS.md provides a dashboard across all apps
- Brand positioning captures umbrella positioning and voice
- Portfolio metrics track combined and per-app performance

### Per-App Identity
Each app gets an identity card (`app-identity.md`) with:
- App-specific positioning and differentiators
- Current metrics and targets
- Cross-sell opportunities to other portfolio apps

### Tagging Over Restructuring
Rather than moving experiments and campaigns into per-app directories, we tag them with `app_slug` in frontmatter. This keeps the directory structure flat while allowing filtering by app.

### Table Updates
- Experiment backlog gets an `App` column for at-a-glance filtering
- Weekly review metrics table switches from week-over-week to per-app columns

## Rabbit Holes
- Do NOT change the init skill yet — that's Phase 2
- Do NOT restructure existing directory layout — just add templates
- Do NOT add app-specific positioning or reviews templates yet — those come in Phase 2

## No-Gos
- Breaking single-app user experience
- Requiring multi-app setup for existing users
- Changing skill stubs or reference files
