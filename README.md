# College Network Auto Login

A lightweight PowerShell script that automatically logs into a college/campus captive portal whenever Windows starts.

## Features

- Automatically logs into the campus network.
- Runs silently through Windows Task Scheduler.
- Waits for the network to become available before attempting login.
- Uses PowerShell with no third-party dependencies.
- Lightweight and easy to customize.

## Requirements

- Windows 10/11
- PowerShell 5.1+
- Task Scheduler
- Access to a captive portal login page

## Configuration

Open `login.ps1` and update the following values:

```powershell
$username = "YOUR_USERNAME"
$password = "YOUR_PASSWORD"
```

If your campus uses a different login URL or form fields, modify them accordingly.

## Setup

1. Save the script.
2. Open **Task Scheduler**.
3. Create a new task.
4. Trigger:
   - **At log on**
5. Program:

```
powershell.exe
```

6. Arguments:

```
-ExecutionPolicy Bypass -WindowStyle Hidden -File "C:\Scripts\login.ps1"
```

The script will automatically log into the network after Windows starts.

## Security

This repository does **not** include credentials.

Store your own username and password locally before running the script.

## Compatibility

This script is designed for campus networks that use the same captive portal endpoint and request format.

If your institution uses a different login URL or different form parameters, update the values in `login.ps1` accordingly.

Users should replace the placeholder username and password with their own credentials before running the script.

## Disclaimer

This project is intended for educational and personal automation purposes only. Use it only on networks where you are authorized to automate the login process.

## License

MIT License

Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
