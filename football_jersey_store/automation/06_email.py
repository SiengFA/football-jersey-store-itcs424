#!/usr/bin/env python3
"""
Phase 6: Open default mail client with prefilled email to Dr. Siripen.
Usage:  python3 06_email.py <github_url> <youtube_url>
"""
import sys, urllib.parse, webbrowser, subprocess, platform

if len(sys.argv) < 3:
    print("Usage: python3 06_email.py <github_url> <youtube_url>")
    sys.exit(1)

github_url, youtube_url = sys.argv[1], sys.argv[2]

to = "siripen.pon@mahidol.ac.th"
subject = "ITCS424 Assignment - 6488188 Kunach"
body = f"""Dear Dr. Siripen,

I have completed all deliverables for the Football Jersey Store mobile
application assignment. Please find the details below:

GitHub Repository:
{github_url}
(Username "siripenp" has been added as a collaborator.)

Demo Video (YouTube Unlisted):
{youtube_url}

Class Diagram:
Attached as model_diagram.png. Also embedded in the README of the repo.

I am ready for the oral exam next Thursday or Friday — please confirm the
time that works best for you.

Thank you very much for your support and the extension.

Best regards,
Kunach Samutvanit
Student ID: 6488188
ICT, Mahidol University
"""

mailto = f"mailto:{to}?subject={urllib.parse.quote(subject)}&body={urllib.parse.quote(body)}"
print("📧 Opening mail client...")
print(f"To:      {to}")
print(f"Subject: {subject}")
print()
print("⚠️  Remember to attach docs/model_diagram.png manually before sending.")

system = platform.system()
if system == "Darwin":
    subprocess.run(["open", mailto])
elif system == "Windows":
    subprocess.run(["cmd", "/c", "start", "", mailto], shell=True)
else:
    webbrowser.open(mailto)
