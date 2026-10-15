# Task 1 — Basic Network Scanning with Nmap

## Objective
Use Nmap to identify ports and services listening on a machine you own or are authorized to test.

## Scope
The included commands target **127.0.0.1 (localhost)** only. Do not scan public IP addresses, campus/company networks, or other devices without explicit permission.

## Install Nmap
- **Windows:** Install Nmap from the official site: https://nmap.org/download.html
- **Ubuntu/Debian:** `sudo apt update && sudo apt install nmap`
- **macOS with Homebrew:** `brew install nmap`

Official reference: https://nmap.org/book/man.html

## Run on Linux/macOS
From this folder:
```bash
chmod +x scan_localhost.sh
./scan_localhost.sh
```

## Run on Windows PowerShell
Open PowerShell in this folder and run:
```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\run_scan_windows.ps1
```
If Nmap is installed but not on PATH, edit the script's `$nmap` path to your installation path.

## Output
The scripts save output to `nmap_scan_results.txt`. Inspect it and use the real results in your findings. A port may be open, closed, or filtered; a scan may also show no open ports. **No open ports is a valid finding**, not a failed task.

## How to interpret common ports
Only describe services that actually appear in your output.
- **22/tcp SSH:** remote administration; restrict access and use keys/MFA where supported.
- **80/tcp HTTP:** unencrypted web service; redirect to HTTPS when appropriate.
- **443/tcp HTTPS:** TLS-protected web service; keep TLS configuration and server software updated.
- **3306/tcp MySQL:** database service; usually should not be exposed broadly.
- **3389/tcp RDP:** Windows remote desktop; restrict to trusted networks/VPN and enforce MFA.

Port numbers alone do not prove a vulnerability. Confirm the service, exposure, business need, and configuration.

## Evidence to capture
1. Terminal showing `nmap --version`.
2. Terminal showing the scan command and completed output.
3. The saved `nmap_scan_results.txt` file opened in an editor.
Avoid showing unrelated personal files or private network information in the recording.

## Demo outline (about 1–2 minutes)
1. State that the target is localhost (`127.0.0.1`) and you have permission.
2. Show Nmap version.
3. Run the scan and open the output file.
4. Explain one or two results actually shown. If no ports are open, explain that the scan did not detect open TCP ports among the scanned ports.
5. Mention that port status is not a full security audit and that any exposed service should be reviewed.

## Limitations
This is a basic TCP port scan of the 1,000 most common ports. It is not a complete vulnerability assessment. Results depend on the local firewall, privileges, software running, and network configuration.
