# Server Performance Stats Analyzer

## Overview

This project aims to provide a simple yet effective script, `server-stats.sh`, for analyzing basic server performance statistics on Linux systems. The script is designed to be run on any Linux server and provide key performance metrics.

## Features

- **System information:**
    - OS Version
    - Kernel Version
    - Uptime
    - Load Average
    - Logged-in Users
    - Failed Login Attempts

- **Total CPU Usage:** Displays the overall CPU utilization.

- **Total Memory Usage:** Shows the total memory usage, including free vs. used memory and their respective percentages.

- **Total Disk Usage:** Presents the total disk usage, including free vs. used disk space and their corresponding percentages.

- **Top 5 Processes by CPU Usage:** Lists the top 5 processes consuming the most CPU resources.

- **Top 5 Processes by Memory Usage:** Lists the top 5 processes utilizing the most memory resources.

## Requirements

- A Linux-based server environment.
- `bash` shell.
- Standard Linux utilities (`top`, `free`, `df`, etc.).

## Usage

1.  Clone the repository to your local machine or directly to the server:

    ```bash
    git clone https://github.com/your-username/server-performance-stats.git
    ```
2.  Navigate to the project directory:

    ```bash
    cd server-performance-stats
    ```
3.  Make the script executable:

    ```bash
    chmod +x server-stats.sh
    ```
4.  Run the script:

    ```bash
    ./server-stats.sh
    ```


