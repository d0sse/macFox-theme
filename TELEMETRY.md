# Firefox Manual Telemetry & Mozilla Communication Disable List

Set each preference manually in **`about:config`**  
or enforce via **Enterprise Policies** → `Preferences`.

---

## 1. Core Telemetry

- `toolkit.telemetry.enabled` → **false**  
- `toolkit.telemetry.unified` → **false**  
- `toolkit.telemetry.bhrPing.enabled` → **false**  
- `toolkit.telemetry.hybridContent.enabled` → **false**  
- `toolkit.telemetry.server` → **<http://127.0.0.1/>**  
- `toolkit.telemetry.archive.enabled` → **false**  
- `toolkit.telemetry.newProfilePing.enabled` → **false**  
- `datareporting.policy.dataSubmissionEnabled` → **false**  
- `datareporting.healthreport.uploadEnabled` → **false**  
- `datareporting.healthreport.logging.consoleEnabled` → **false**

---

## 2. Normandy / Studies

- `app.shield.optoutstudies.enabled` → **false**  
- `app.normandy.enabled` → **false**  
- `app.normandy.api_url` → **<http://127.0.0.1/>**  
- `shield.service.enabled` → **false**  
- `app.normandy.run_interval_seconds` → **0**

---

## 3. Crash Reports

- `breakpad.reportURL` → **(empty string)**  
- `browser.tabs.crashReporting.sendReport` → **false**  
- `browser.crashReports.unsubmittedCheck.enabled` → **false**  
- `browser.crashReports.autoSubmit` → **false**

---

## 4. Ping & Upload Controls

- `toolkit.telemetry.shutdownPingSender.enabled` → **false**  
- `toolkit.telemetry.firstShutdownPing.enabled` → **false**  
- `toolkit.telemetry.pioneer-new-studies.enabled` → **false**

---

## 5. Other Mozilla Communications

- `diagnostics.support.url` → **(empty string)**  
- `app.support.baseURI` → **(empty string)**  
- `app.update.enabled` → **false**  
- `browser.startup.homepage_override.mstone` → **ignore**  
- `browser.aboutHomeSnippets.updateUrl` → **(empty string)**  
- `browser.messaging-system.whatsNewPanel.enabled` → **false**  
- `idle.lastDailyNotification` → **0**

---

## 6. Optional Network Layer Block

Block the following domains at DNS or firewall level:

- `incoming.telemetry.mozilla.org`  
- `normandy.cdn.mozilla.net`  
- `aus5.mozilla.org`  
- `updates.mozilla.org`  
- `snippets.cdn.mozilla.net`

---

## 7. Verification

1. Restart Firefox.  
2. Check `about:policies` → **Active** for “DisableTelemetry” (if using policies).  
3. Monitor network logs — no traffic to Mozilla telemetry or Normandy endpoints should appear.  
4. Verify `telemetry-pings` folder in your profile is empty or inactive.
