# Two-Tier Architecture

A Two-Tier Architecture is a system where the application is divided into two separate layers: the Web/Application Tier and the Database Tier. Each tier has its own responsibility and works together to provide the complete application.

## The Web/Application Tier

The Web/Application Tier provides the user interface and handles HTTP requests from users. In this lab, the Nextcloud container acts as the Web/Application Tier and runs the application logic.

## The Database Tier

The Database Tier stores and manages the application's persistent data, such as user accounts, settings, and file metadata. In this lab, the MariaDB container acts as the Database Tier.

## Why Separate Them?

Separating the web/application server and database into two containers makes the system easier to manage, maintain, and troubleshoot. It also improves security and allows each tier to be scaled or updated independently without affecting the other tier.
