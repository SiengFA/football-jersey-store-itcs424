# 🤖 ITCS424 Jersey Agent — Specification

> An "agentic AI" for shipping the ITCS424 Football Jersey Store assignment
> from zero to submitted, with minimum human input.

---

## 🎯 Mission
Take the student from **"empty machine"** → **"submitted assignment"** with the
fewest manual steps possible.

## 🧠 Architecture

```
                 ┌──────────────────────────────┐
   user ──────►  │  Cowork Agent (Claude)       │
                 │  — reads AGENT.md            │
                 │  — invokes skills            │
                 │  — runs automation/*.sh      │
                 └──────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        ▼                     ▼                     ▼
┌────────────────┐  ┌──────────────────┐  ┌──────────────────┐
│ Code generator │  │ Diagram renderer │  │ Deploy orchestr. │
│ (lib/*.dart)   │  │ (SVG → PNG)      │  │ (git, GitHub)    │
└────────────────┘  └──────────────────┘  └──────────────────┘
```

## 🔄 Phases

| Phase | Skill / Script             | Auto? | Time |
|-------|----------------------------|-------|------|
| 0 — Doctor    | `automation/00_doctor.sh` | ✅ Yes | 10s |
| 1 — Scaffold  | `automation/01_setup.sh`  | ✅ Yes | 1m  |
| 2 — Run       | `automation/02_run.sh`    | ⚙️ Semi (user closes Chrome) | 1m |
| 3 — Test      | `automation/03_test.sh`   | ✅ Yes | 30s |
| 4 — Diagram   | `automation/04_diagram.sh`| ✅ Yes | 5s  |
| 5 — Git init  | `automation/05_git_init.sh`| ✅ Yes | 5s  |
| 6 — Video     | `docs/video_script.md`    | 🧑 Manual | 15m |
| 7 — Push+Add  | `git push` + GitHub UI    | 🧑 Manual | 5m |
| 8 — Email     | `automation/06_email.py`  | ⚙️ Semi (user attaches PNG, hits send) | 2m |

**Total: ~25 minutes** for the whole assignment, of which ~22 are spent recording video.

## 🚀 Usage

### Single-command end-to-end (recommended)
```bash
cd football_jersey_store/automation
./run_all.sh kunach-itcs424     # Mac/Linux
:: or
run_all.bat kunach-itcs424      :: Windows
```

This runs Phase 0, 1, 3, 4, 5 sequentially, then prints the checklist for
manual phases.

### Phase-by-phase (if you want control)
```bash
./00_doctor.sh
./01_setup.sh ~/Documents/FlutterProjects/football_jersey_store
./02_run.sh    # Chrome opens — verify visually, Ctrl+C
./03_test.sh
./04_diagram.sh
./05_git_init.sh kunach-itcs424
# now record video manually
git push -u origin main
python3 06_email.py "https://github.com/.../" "https://youtu.be/..."
```

## 🤝 Human-in-the-loop checkpoints

The agent **stops and waits** at these points (it can't read your camera or your mind):

1. **Phase 2** — verify app actually renders (jerseys + ❤️ work)
2. **Phase 6** — record + upload video (you must speak)
3. **Phase 7** — `git push` (auth handshake) + add `siripenp` collaborator
4. **Phase 8** — attach PNG + hit Send in your mail client

## 🔌 Reusing as a Cowork plugin

The bundled `itcs424-jersey-agent.plugin` (zip) contains the same logic
re-packaged as a Cowork plugin with five skills:

| Skill | Triggers |
|---|---|
| `start` | "build my jersey app", "/jersey-run-all" |
| `scaffold` | "scaffold project", "create flutter app" |
| `diagram` | "render diagram", "class diagram" |
| `video-prep` | "video script", "demo script" |
| `deploy` | "push to github", "git init" |

Drop the `.plugin` file into your Cowork plugin marketplace or share with classmates.

## 🔒 Safety

- Agent never pushes to a remote it didn't create
- Agent never sends email automatically — only opens the mail client with prefilled body
- Agent never modifies files outside the project directory
- All scripts are idempotent — safe to re-run
- Email goes to `siripen.pon@mahidol.ac.th` only, hardcoded

## 📈 Roadmap

What this agent could do *if* given more permissions:
- 📹 Auto-record video via `xdotool`/`AppleScript` driving Chrome
- 🌐 Auto-create GitHub repo via GitHub API (with PAT)
- 👥 Auto-add `siripenp` via GitHub Collaborators API
- 📧 Auto-send email via Gmail API (with OAuth)

For now, those steps stay in human hands — by design.
