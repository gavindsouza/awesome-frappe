# Awesome Frappe [![Awesome](https://awesome.re/badge-flat.svg)](https://github.com/sindresorhus/awesome)

> A curated list of awesome things related to the Frappe Framework. Maintained by [Gavin D'souza](https://github.com/gavindsouza).

**🌐 [Browse on awesome-frappe.gavv.in](https://awesome-frappe.gavv.in)** – Searchable, categorized interface with 225+ apps, tools & resources.

<div align="center">
  <img width="200" src="https://raw.githubusercontent.com/frappe/frappe/refs/heads/develop/.github/frappe-framework-logo.svg" alt="Frappe logo" style="padding-right: 20px; padding-left: 20px;">
</div>

Inspired by [awesome-django](https://github.com/wsvincent/awesome-django).

> **Disclaimer:** Projects listed may be third-party community packages. They may not vetted nor endorsed by the contributors. Check each project's compatibility information before using. Use them at your own volition.

Know of a project that should be here? Make a submission using [this form](https://github.com/gavindsouza/awesome-frappe/issues/new?assignees=&labels=new-submission&projects=&template=new_submission.yml&title=Add%20this%20cool%20App+-+)! 😄

## Introduction

Frappe, pronounced fra-pay, is a full stack, batteries-included, web framework written in Python and Javascript with MariaDB (and Postgres too) as the database. It is the framework which powers ERPNext, is pretty generic and can be used to build database driven apps.


<video src="https://user-images.githubusercontent.com/36654812/166205861-0fc9ac53-c14b-4268-bfff-99d8aeb1a4eb.mp4" data-canonical-src="https://user-images.githubusercontent.com/36654812/166205861-0fc9ac53-c14b-4268-bfff-99d8aeb1a4eb.mp4" style="max-height:480px; min-height: 200px; width: -webkit-fill-available;" controls muted>
</video>

## Contents

- [Apps](#apps)
  - [Business Apps](#business-apps)
  - [Utility Apps](#utility-apps)
  - [Plugins](#plugins)
  - [Integrations](#integrations)
  - [Themes](#themes)
  - [Regional Apps](#regional-apps)
  - [Other Apps](#other-apps)
- [Developer Tooling](#developer-tooling)
  - [SDKs & Libraries](#sdks--libraries)
  - [Templates](#templates)
- [Other Tooling](#other-tooling)
- [Deployment Tools](#deployment-tools)
- [Resources](#resources)
- [Hosting](#hosting)


### Apps

_Apps that showcase the power of the Frappe Framework_


#### Business Apps

- [Agriculture](https://github.com/frappe/agriculture) - Agriculture Domain for ERPNext.
- [ALYF Banking](https://github.com/alyf-de/banking) - ALYF Banking is a seamless solution to connect and reconcile your bank accounts with ERPNext. It supports a robust Bank Integration (via EBICS) and a modern Bank Reconciliation tool ⚡
- [Apparelo](https://github.com/aerele/apparelo) - Manufacturing Workflow Management for the garment industry.
- [AuMMS](https://github.com/efeone/aumms) - Aurum Manufacturing Management System for Gold Manufacturing.
- [Cargo Management](https://github.com/AgileShift/cargo_management) - Package Management App for ERPNext.
- [Clefincode Chat](https://github.com/clefincode/clefincode_chat) - ERPNext/Frappe Business Chat: A self-hosted communication solution.
- [CRM](https://github.com/frappe/crm) - Fully featured, open source CRM.
- [Education](https://github.com/frappe/education) - Open source education / school management system.
- [ERPNext](https://erpnext.com) - Open source full-featured business management system.
- [Expenses](https://github.com/kid1194/erpnext_expenses) - An expenses management module for ERPNext.
- [FiMax](https://github.com/YefriTavarez/fimax) - Loan Management and Repayment Scheduling for ERPNext.
- [Frappe Desk](https://frappedesk.com/) -  Well designed, open-source ticketing system.
- [Frappe HR](http://frappehr.com/) - An Open Source HRMS for Frappe Ecosystem.
- [Frappe Insights](https://github.com/frappe/insights) -  Free and Open Source Data Analytics Tool for your Frappe Apps
- [Gameplan](https://github.com/frappe/gameplan/) - Delightful, open-source, work communication tool for remote teams.
- [Healthcare](https://github.com/frappe/healthcare) - An open source management system crafted for the medical industry.
- [Hospitality](https://github.com/frappe/hospitality) - Hospitality app for ERPNext to manage hotels & restaurants.
- [Lending](https://github.com/frappe/lending) - Open Source Lending software.
- [Mail](https://github.com/frappe/mail) - Frappe Mail.
- [Mon School](https://github.com/fossunited/mon_school) - Frappe App for Mon School based on Frappe LMS.
- [Nepal Compliance](https://github.com/yarsa/nepal-compliance) - Open source ERP for Nepal with HR, Payroll & Accounting compliance.
- [Non Profit](https://github.com/frappe/non_profit) - Non Profit module for Frappe/ERPNext.
- [Payments](https://github.com/frappe/payments) - A payments app for frappe.
- [POS Awesome](https://github.com/yrestom/POS-Awesome) - An open-source Point of Sale for ERPNext using Vue.js and Vuetify.
- [POS-Awesome-V15](https://github.com/defendicon/POS-Awesome-V15) - the enhance version with more bugs fixed and multiple currency add thanks to @defendicon
- [POSNext](https://github.com/BrainWise-DEV/POSNext.git) - POSNext is a modern, open-source Point of Sale for ERPNext, offering fast billing, multiple payment methods, smart discounts, offline mode, and a clean touchscreen-friendly UI—built to handle real retail operations with speed and reliability.
- [PropMS](https://github.com/aakvatech/PropMS) - Property Management Solution Powered on ERPNext by Aakvatech.
- [Restaurant](https://github.com/quantumbitcore/erpnext-restaurant) - Restaurant App for ERPNext.
- [School](https://github.com/frappe/school) - The Learning Management System (LMS) that powers [mon.school](https://mon.school) & [frappe.school](https://frappe.school).
- [ServiceMS](https://github.com/aakvatech/servicems) - Service Management System for ERPNext by Aakvatech.
- [Stone Warehouse](https://github.com/finbyz/stonewarehouse) - Manage batch wise balance, especially setup for a ceramic tiles vendor.
- [TailPOS](https://github.com/bailabs/tailpos) - Offline First Open Source POS for ERPNext.
- [URY - Open Source Restaurant Management System](https://github.com/ury-erp/ury) - URY is an open-source ERP designed to simplify and streamline restaurant operations, built over ERPNext.
- [Webshop](https://github.com/frappe/webshop) - eCommerce Platform for ERPNext.

#### Utility Apps

- [Alerts](https://github.com/kid1194/frappe_alerts) - Displays custom alerts to specific recipients after login.
- [Background Tasks Unleashed](https://github.com/Datahenge/btu) - A Frappe Task Scheduling and Automation.
- [Bench Manager](https://github.com/frappe/bench_manager) - Frappe app for managing bench.
- [Block Administrator](https://frappecloud.com/marketplace/apps/block_administrator) - Enhances security by disabling password-based logins for the Administrator user, thereby reducing the vulnerability surface for brute-force attacks.
- [Bulk Webhook](https://github.com/aakvatech/Bulk-Webhook) - Bulk Webhook allows creating webhook that sends multiple records and also reports from ERPNext, and has support for Apache Kafka.
- [Chat](https://github.com/frappe/chat) - Modern chat for your Frappe deployments.
- [Enhanced Kanban View](https://github.com/ibrahim317/enhanced_kanban_view) - Frappe Kanban boards with Link field columns, validation dialogs, and automatic synchronization.
- [ERPNext OCR](https://github.com/Monogramm/erpnext_ocr) - Optical Character Recognition using Tesseract within Frappe.
- [ERPNext POS Hardware Integrations](https://github.com/aisenyi/pasigono) - Weigh scale integration, Stripe Terminal integration, and Raw printing via QZ Tray
- [ERPNext Quota](https://github.com/ahmadpak/erpnext_quota) - App to manage ERPNext Site, User, Company and Space limitations.
- [Event Streaming](https://github.com/frappe/event_streaming) - Event Streaming for frappe.
- [Frappe Assistant Core](https://github.com/buildswithpaul/Frappe_Assistant_Core) - Infrastructure that connects LLMs to ERPNext with Model Context Protocol (MCP).
- [Frappe Dynamic OG](https://github.com/NagariaHussain/frappe_dynamic_og) - Dynamic OG Image Generation in Frappe Sites.
- [Frappe Private Attachments](https://github.com/shridarpatil/frappe_private_attachments) - Make all frappe attachments as private by default.
- [Frappe PWA](https://github.com/Monogramm/frappe_pwa) - PWA setup for Frappe website.
- [Frappe ReST API Wrapper](https://github.com/pifabs/restipie) - Build custom ReST api's on top of Frappe.
- [Frappe System Monitor](https://github.com/mymi14s/frappe_system_monitor) - Web interface for webserver running processes and system utilization (RAM, CPU, Disk)
- [Go1 CMS](https://github.com/TridotsTech/go1cms) - Advanced Content Management System built on Frappe.
- [In-Context Translation](https://github.com/Mazen-Almortada/incontext_translation) - In-context translation for Frappe & ERPNext with automated suggestions.
- [Kai](https://github.com/KorucuTech/kai) - Custom Frappe App to integrate AI Agents as DocTypes using CrewAI & Frappe Framework.
- [Photos](https://github.com/gavindsouza/photos) - AI powered Image classification & labelling similar to Google Photos in Desk.
- [Pibicut](https://github.com/pibico/pibicut) - URL Shortener with QR Code Generator.
- [PibiDAV](https://github.com/pibico/pibiDAV) - Integrate webDAV, calDAV and cardDAV (Future) with a NextCloud Server, used as (DMS), for a copy of Frappe Files uploaded and tagged to NextCloud while uploading files to Frappe.
- [Print Designer](https://github.com/frappe/print_designer) - Frappe app to design print formats using interactive UI.
- [Private Comment](https://github.com/rtCamp/frappe-private-comment.git) - App that allows controlling comment visibility for tagged user and user-groups with three modes: Private, Public & Mentioned
- [ProjectIT](https://github.com/Arus-Info/ProjectIT) - Open Source PWA mobile app to track the Employees out in the field.
- [Raven](https://github.com/The-Commit-Company/Raven) - Simple, open source team messaging platform built for Frappe.
- [Release](https://github.com/frappe/release) - Manage releases for Frappe and Frappe Applications.
- [Sentry](https://github.com/ParsimonyGit/frappe-sentry) - Send error logs to [Sentry](https://sentry.io/) for debugging.
- [Sheets](https://sheets.gavv.in/) - Effortless synchronization between your online SpreadSheet Apps & ERPNext.
- [SmartConnect Mobile Application](https://github.com/Midocean-Technologies/mtpl_api) - Interactive Mobile Application (Pre-release Alpha Version)
- [Temporal](https://github.com/Datahenge/temporal) - An ERPNext App that integrates with Redis to rapidly provide calendar information.
- [ToolBox](https://toolbox.gavv.in/) - Automate your Site Maintenance with ToolBox.
- [Wiki](https://github.com/frappe/wiki) - Wiki for serving dynamic data along with a built-in review system.
- [XcelForm](https://github.com/jezlan/xcelform) - A powerful app for Exporting Doctype data to Excel with custom formats in Frappe/ERPNext.

#### Plugins

- [Active User Lister](https://github.com/kid1194/frappe-active-users) - App that displays a list of current active users.
- [Attachment Control extended](https://github.com/kid1194/frappe-better-attach-control) - Plugin that gives you more control over the attachments at field level.
- [Database Console](https://github.com/mymi14s/database_console) - Execute SQL queries directly from Frappe/ERPNext desk just like 'bench mariadb'.
- [Desk Navbar Extended](https://github.com/gavindsouza/desk-navbar-extended) - Frappe's Navbar, slightly salted.
- [DFP External Storage](https://github.com/developmentforpeople/dfp_external_storage) - S3 compatible external storages per folder management app for Frappe and ERPNext.
- [ERPNext: Fiscal Year](https://github.com/kid1194/ERPNext-Fiscal-Year-Based-Date-Related-Fields) - Desk plugin that makes date related fields respect the start and end dates of default fiscal year.
- [ERPNext: POS Restrictions](https://github.com/kid1194/erpnext_pos_controller) - ERPNext plugin that helps in adding some restrictions over default POS.
- [Export Setting](https://github.com/zaid2229/Export-Settings.git) - This app allows you to predefine the fields you want to export from any given doctype in Frappe.
- [Frappe Msdoc Template](https://github.com/rareMaxim/frappe_msdoc_template) - Generate documents from MS Docs templates (.docx and .xlsx)
- [Frappe tinyMCE](https://github.com/shridarpatil/frappe_tinymce) - Replace frappe's Quill Text Editor with tinyMCE Text Editor.
- [Jodit HTML Editor](https://github.com/ashish-greycube/jodit_html_editor) - Replace Quill Text Editor With [Jodit](https://github.com/xdan/jodit) HTML Editor on WebPage and WebForm for Frappe/ERPNext Version 11 & 12.
- [Language Toggle](https://github.com/zaid2229/language-toggle) - Button on navbar to toggle language in ERPNext.
- [Language Translator](https://github.com/mymi14s/language_translator) - Automatic language translator on Frappe Desk and website.
- [List View extended](https://github.com/kid1194/frappe-better-list-view) - List view plugin with more customization sugar.
- [List View: Unassign From](https://github.com/kid1194/frappe-list-unassign-from) - A Frappe plugin that adds the support of unassign from for multiple selection in Desk's List View.
- [Numeric Control extended](https://github.com/kid1194/frappe-better-numerical-controls) - Allows for more control over numeric fields on Website & Desk.
- [OIDC Extended](https://github.com/MohammedNoureldin/frappe-oidc-extended) - An extension to the ERPNext Social Login authentication method (OIDC) that incorporates new features designed to meet the needs of enterprises.
- [S3 Attachments](https://github.com/zerodha/frappe-attachments-s3) - Plug an S3 bucket for storing and fetching files in Frappe.
- [Select Control extended](https://github.com/kid1194/frappe-better-select-control) - Plugin that adds the support of options group to the select control.
- [Sidebar Collapsed Default](https://github.com/Nasr-Systems/sidebar_collapsed_default) - Collapses Sidebar by default on all desk pages. Helps use screen real-estate better on small screens.
- [Silent Print](https://github.com/roquegv/Silent-Print-ERPNext) - Utility App for printing documents silently, that is, without having to interact with browser's print dialog and send the printing order directly to the printer(s).
- [Strict Session Defaults](https://github.com/kid1194/frappe-strict-session-defaults) - Enforces and manages the session defaults popup.

#### Integrations

- [Banking API Integration](https://github.com/aerele/bank_api_integration) - Bank API Integration for ERPNext.
- [Dash Integration](https://github.com/pipech/frappe-plotly-dash) - Build analytical web apps through the Desk with @plotly's [Dash](https://github.com/plotly/dash).
- [DATEV Integration](https://github.com/alyf-de/erpnext_datev) - Integration between ERPNext and DATEV.
- [Discourse SSO Integration](https://github.com/shridarpatil/frappe_discourse) - Simple frappe app to setup Single sign-on for Discourse.
- [DocuSign Integration](https://frappecloud.com/marketplace/apps/dsc_erpnext) - DocuSign integration for Frappe Apps.
- [Ecommerce Integrations](https://github.com/frappe/ecommerce_integrations) - Ecommerce integrations for ERPNext (Shopify, Unicommerce, Zenoti).
- [ERPNext Shipping](https://github.com/frappe/erpnext-shipping) - Shipping Integration for ERPNext with Packlink, LetMeShip & SendCloud.
- [ERPNextFinTS](https://github.com/jHetzer/erpnextfints) - FinTS Connector for ERPNext.
- [EWB API Integration](https://github.com/aerele/ewb_api_integration) - Implementing E-WayBill API integration for India.
- [FCM Notification for ERPNext](https://github.com/tridz-dev/erpnext_fcm) - Send notifications created in Frappe or ERPNext as push notication via Firebase Cloud Message.
- [Frepple Integration](https://github.com/msf4-0/ERPNext-Frepple-Integration) - Frepple Production Scheduling Tool.
- [HDFC Bank Integration](https://github.com/resilient-tech/bank_integration) - Unofficial API to handle bank transactions using ERPNext.
- [Mandrill Integration](https://github.com/frappe/mandrill_integration) - Mandrill Integration for Frappe.
- [Mautic Integration](https://github.com/dokos-io/mautic) - Mautic Integration for ERPNext.
- [Meta Integration](https://github.com/efeone/frappe_meta_integration) - Meta Cloud API Integration for Frappe.
- [Metabase Integration](https://github.com/pipech/frappe-metabase) - Access your Metabase instance from Desk.
- [Microsoft 365 Groups](https://github.com/Aptitudetech/frappe-m365) - Microsoft 365 Groups Integration for Frappe.
- [MSG91 Integration](https://github.com/dhwani-ris/frappe_msg91_integration) - Integration with the MSG91 SMS gateway for Frappe Framework
- [Nextcloud Integration](https://github.com/frappe/nextcloud-integration) - Nextcloud + Frappe = ❤️
- [Paystack Integration](https://github.com/mymi14s/frappe_paystack) - Paystack Payment Gateway Integration for Frappe.
- [Pibiapp](https://github.com/doloresjuliana/pibiapp) - Connect with Nextcloud to store the attachments on your Nextcloud server, integrate with external data from Excel, CSV, JSON or XML files, and view Redash dashboards in Frappe.
- [PostGrid Integration](https://github.com/Avunu/postgrid_integration) - Direct Mail Documents within Frappe via PostGrid Print & Mail API
- [PrintNode Integration](https://github.com/techmaxsolucoes/printnode-integration) - Smart Printing from Frappe using Print Node API.
- [Razorpay Integration](https://github.com/frappe/razorpay_integration) - Razorpay Integration for Frappe.
- [RClone Integration](https://github.com/Muzzy73/rclone_integration) - Frappe integration with Rclone.
- [Shipstation Integration](https://github.com/ParsimonyGit/shipstation_integration) - Shipstation Integration for ERPNext.
- [Shopify Integration](https://github.com/frappe/ecommerce_integrations) - Shopify Integration for ERPNext.
- [Storage Integration](https://github.com/frappe/storage_integration) - Storage Integration for Frappe.
- [Telegram Integration](https://github.com/yrestom/erpnext_telegram) - Telegram Integration app for more productivity.
- [Twilio Integration](https://github.com/frappe/twilio-integration) - Twilio Integration for Frappe.
- [Unicommerce Integration](https://github.com/frappe/ecommerce_integrations) - Unicommerce Integration for ERPNext.
- [WABA Integration](https://github.com/frappe/waba_integration) - WhatsApp Business Cloud API integration for Frappe.
- [WhatsApp Integration](https://github.com/shridarpatil/frappe_whatsapp) - WhatsApp Cloud Integration for Frappe.
- [WooCommerceConnector](https://github.com/libracore/WooCommerceConnector) - Integration App for ERPNext to connect to WooCommerce.
- [Zenoti Integration](https://github.com/frappe/ecommerce_integrations) - Zenoti Integration for ERPNext.

#### Themes

- [Business Theme](https://github.com/Midocean-Technologies/business_theme_v14.git) - Business Theme for your Frappe v14 Apps.
- [Classic White](https://github.com/hashirluv/whitetheme-v13) - Classic White theme for your Frappe v13 Apps.
- [Desk Theme](https://github.com/dhwani-ris/frappe_desk_theme) - Comprehensive theming solution for Frappe/ ERPNext v16 Apps.
- [Infintrix Theme](https://github.com/Infintrix-Technologies/infintrix_theme) - Modern, Fluent UI–inspired theme for Frappe/ERPNext with customizable fonts, colors, font sizes, dark mode, and a polished reusable design system.
- [Material Blue](https://github.com/hashirluv/bluetheme) - Material Blue Theme for your Frappe v12 Apps.
- [Material Theme](https://github.com/itrostack/material_theme) - Frappe theme inspired by Google material design.
- [Material UI](https://github.com/michaelkaraz/kimstheme) - kims Theme Material UI for ERPNext.
- [Owl](https://github.com/zaqouttahir/owl_theme) - @zaqouttahir's Owl theme for your Frappe v15 Apps.
- [Pink](https://github.com/Muhammad-shaalan/pink-theme) - @Muhammad-shaalan's Pink theme.
- [Portal Theme](https://github.com/Sudhanshu-Badole/Portal-Theme) - Theme your entire Frappe portal — navbar, cards, login page, and more.
- [Red](https://github.com/hashirluv/redtheme_v13b) - @hashirluv's Red theme for your Frappe v13-beta Apps.
- [Tekton Theme](https://github.com/vineyrawat/Tekton-Theme) - Tekton Theme - Custom App for frappe for addon themes.

#### Regional Apps

- [CSF_TZ](https://github.com/aakvatech/CSF_TZ) - Regional App for Tanzania.
- [ERPNext France](https://github.com/scopen-coop/erpnext_france.git) - Regional code for France, built on top of ERPNext.
- [ERPNext Germany](https://github.com/alyf-de/erpnext_germany) - Regional code for Germany, built on top of ERPNext.
- [ERPNext Thailand](https://github.com/ecosoft-frappe/erpnext_thailand) - Thailand Taxation (VAT, WHT), Thai Billing Process, Get Address from Tax ID, Bank of Thailand Exchange Rate and more... for ERPNext.
- [Grynn Swiss QR Bill](https://github.com/Grynn-GmbH/Swiss-QR-Bill-ERPNext) - Swiss QR Bill Generator app for ERPNext.
- [GSTR 2B Reconciler](https://github.com/aerele/reconciler) - Reconciliation tool for GSTR 2B and Purchase Register.
- [India Compliance](https://github.com/resilient-tech/india-compliance) - Simple, yet powerful compliance solutions for Indian businesses.
- [KSA](https://github.com/8848digital/KSA) - Regional Compliance for the Kingdom of Saudi Arabia
- [Pakistan Workspace](https://github.com/ParaLogicTech/erpnext_pk) - Regional App for Pakistan with NIC, NTN, and STRN numbers, and reports for FBR tax compliance.
- [Payware](https://github.com/aakvatech/Payware) - ERPNext Payroll enhancements specific for functionality required in Tanzania.
- [Swiss Accounting Integration](https://github.com/phamos-eu/Swiss-Accounting-Integration) - Extend ERPNext with Swiss QR Integration and Abacus Export.
- [Swiss Factur X E Invoicing](https://github.com/Grynn-GmbH/Swiss-E-invoicing-ERPNext) - For E-Invoice Hybrid PDF based on Factur-X and ZugFerd (EN 16931 Standards).

#### Other Apps

- [Church](https://github.com/meichthys/church) - A church management app based on the Frappe framework.
- [Contract Payment](https://github.com/morghim/contract-payment) - Link between contract with sales invoice and purchase invoice and make dues.
- [Digistore](https://github.com/NagariaHussain/digistore) - Digital Asset Distribution Platform built on Frappe.
- [Digital Signage](https://github.com/one-highflyer/frappe-signage-display-app) - A lightweight digital signage solution made with Frappe. (Desinged for Single Board Computers (SBC) eg: Raspberry Pi.
- [Double Ledger](https://github.com/ahmadpak/doubleledger) - App made on Frappe framework to accommodate parties that act as both customers and suppliers in ERPNext.
- [ERPNext Whitelabel](https://github.com/bhavesh95863/whitelabel) - White label ERPNext for your own brand from a single setting.
- [Expense Entry](https://github.com/the-bantoo/expense_request) - Expense Entry for easy capture of non-item expenses without using the Journal Entry.
- [IT Management](https://github.com/phamos-eu/it_management) - Manage your IT landscape from ERPNext.
- [Mail Reminder](https://github.com/scopen-coop/frappe-mail-reminder.git) - ERPNext automatic mail to Contact for Sales invoices, Purchase Orders , ...
- [PDF on Submit](https://github.com/alyf-de/erpnext_pdf-on-submit) - Automatically generate and attach a PDF when a sales document gets submitted.
- [Persona](https://github.com/iptelephony/persona) - Frappe/ERPNext app to allow Administrator/System Managers to impersonate other users.
- [Recod ERPNext Design](https://github.com/Monogramm/recod_erpnext_design) - Provides new sample print formats and design for ERPNext.
- [Robinhood](https://github.com/shridarpatil/robinhood) - System that powers [robinhoodarmy.com](https://checkin.robinhoodarmy.com/)
- [Special Item Accountancy Code](https://github.com/scopen-coop/special_item_accountancy_code) - ERPNext Special Item accountancy code according customer settings.
- [Stock Reconciliation Per Item Group](https://github.com/scopen-coop/stock_reconcialiation_per_item_group) - ERPNext Stock reconciliation per item group
- [Telegram Bot Manager](https://github.com/leam-tech/frappe_telegram) - Telegram Bot support for Frappe.
- [Vendor Payments](https://github.com/zerodha/vendor-payments) - A frappe app that has workflows and reports to make payments to vendors by a company and track them.
- [Workspace Permissions](https://github.com/pstuhlmueller/workspaceperms) - Manage the availability of workspaces within Frappe/ ERPNext (sidebar) based on user-roles.

### Developer Tooling

- [Barista](https://github.com/ElasticRun/barista) - Automate functional testing of your Frappe Apps.
- [Console](https://github.com/yrestom/Console) - Powerful Console for Frappe Backend.
- [DocType Model Generator](https://github.com/assemmarwan/model_generator) - Generate models to different languages based on Doctype.
- [Doppio](https://github.com/NagariaHussain/doppio) - Magically setup single page applications on your Frappe Apps.
- [Frappe Deployer](https://github.com/Henry-Do-Su/frappe_deployer) - Streamlined and efficient way to set up development and production environments for Frappe.
- [Frappe Diff Custom](https://github.com/scopen-coop/scopen-frappe-diff) - Easy way to compare Custom Fields and Property Setters between the git version of an App.
- [Frappe ER Generator](https://github.com/The-Commit-Company/frappe_er_generator) - Frappe ER Generator is application to generate ERD.
- [Frappe GraphQL](https://github.com/leam-tech/frappe_graphql) - GraphQL API Layer for Frappe Framework.
- [Frappe Schema JSON Diff](https://github.com/Robproject/fsjd) - CI tool for showing any schema changes between commits.
- [Frappe Test Runner](https://marketplace.visualstudio.com/items?itemName=AnkushMenat.frappe-test-runner) - VS Code extension to run Frappe tests with single keybind.
- [Frappe UI](https://github.com/frappe/frappe-ui) - A set of components and utilities for rapid UI development.
- [Frappe-Manager (fm)](https://github.com/rtCamp/Frappe-Manager) - A powerful CLI tool to streamline the development and deployment of Frappe and ERPNext applications using Docker. Features quick environment setup, multi-bench/site management, VSCode integration, and production-ready SSL support—all from the command line.
- [frappe_test.vim](https://github.com/ankush/frappe_test.vim) - Running Frappe unit tests at speed of thought.
- [FrappeAPI](https://github.com/0xsirsaif/frappeapi) - Provides FastAPI-style API development for Frappe, enabling modern path-based routing.
- [Frappeviz](https://github.com/yemikudaisi/frappeviz) - Visualize class diagrams of a Frappe App's doctypes using PlantUML.
- [Fsocket](https://github.com/pifabs/fsocket) - Extend frappe's websocket server using socket.io and redis.
- [Intellisense](https://github.com/frappe/intellisense) - VSCode Extension and Language Server for Frappe Framework.
- [Nano Press](https://github.com/BuildWithHussain/nano_press) - Nano Press automates your Frappe/ERPNext deployment from zero to production.
- [Semgrep Rules](https://github.com/frappe/semgrep-rules) - Semgrep Rules for following the best practices while building your Frappe Apps.
- [TypeScript Type generator](https://github.com/The-Commit-Company/frappe-types) - Typescript type definition generator for Frappe DocTypes.

#### SDKs & Libraries

- [Frappe JS SDK](https://github.com/nikkothari22/frappe-js-sdk) - TypeScript/JavaScript library for Frappe REST API
- [Frappe MCP](https://github.com/frappe/mcp) - Allows Frappe apps to function as MCP servers.
- [Frappe React SDK SDK](https://github.com/nikkothari22/frappe-react-sdk) -  React hooks for Frappe
- [Frappe Straw](https://github.com/ssiyad/frappe-straw) - Developer focused React/TypeScript hooks and utilities for Frappe.
- [Frappe-Request.js](https://github.com/bailabs/frappe-request) - A Frappe-Client made with JavaScript and Needle.
- [FrappeAPI](https://github.com/0xsirsaif/frappeapi) - Provides FastAPI-style API development for Frappe, enabling modern path-based routing and leveraging FastAPI's familiar interface and semantics for a streamlined development experience.
- [FrappeClient.php](https://github.com/hizbul25/frappe-client) - a PHP client for making requests to your Frappe Server.
- [FrappeClient.py](https://github.com/zerodha/py-frappe-client) - @zerodha's Python client for making requests to your Frappe Server.
- [FrappeRestClient.Net](https://github.com/yemikudaisi/FrappeRestClient.Net) - Frappe Framework REST client for .Net
- [Renovation](https://github.com/leam-tech/renovation_core) - Renovation is a Frappe Front End TS/JS SDK.
- [renovation_core.dart](https://github.com/leam-tech/renovation_core.dart) - The Frappe Dart/Flutter Front End SDK.

#### Templates

- [App Template](https://github.com/Monogramm/erpnext_template) - @Monogramm's supercharged GitHub template for building ERPNext/Frappe Apps.
- [Doppio Bot](https://github.com/NagariaHussain/doppio_bot) - AI ChatBot Template, built into Frappe's Desk Interface.
- [Doppio FrappeUI Starter](https://github.com/NagariaHussain/doppio_frappeui_starter) - A Vite + Vue 3 + TailwindCSS + Frappe UI starter template for building frontends for Frappe Apps.

### Other Tooling

- [Smart Weighing Scale & Inventory](https://github.com/msf4-0/SWSI) - A wireless & portable smart weighing scale embedded system that interfaces with Node-Red for IoT connectivity and ERPNext for inventory & stock tracking.
- [Biometric Attendance Sync Tool](https://github.com/frappe/biometric-attendance-sync-tool) - Python Scripts to poll your biometric attendance system (BAS) for logs and sync with your ERPNext instance.
- [Frappe Chrome Dev Utils](https://github.com/ascorbic-acid/frappe_chrome_dev_utils) - A simple Browser Extension that help you work & develop in Frappe/ERPNext Framework.
- [Frappe MCP Server](https://github.com/appliedrelevance/frappe-mcp-server) - A server that implements the Anthropic Model Control Protocol (MCP) to enable controlled access to Frappe sites.

### Deployment Tools

_Resources allowing you to deploy Frappe apps with your favourite toolset_

- [Bench](https://frappe.io/bench) - CLI to Manage Frappe Deployments
- [Benchless](https://github.com/castlecraft/benchless) - CLI tool to manage Frappe deployments without bench.
- [Docker Hub](https://hub.docker.com/u/frappe) - Container images for Frappe & ERPNext releases.
- [ERPNextFailOver](https://github.com/martinhbramwell/ERPNextFailOver) - Tool to automate setting up Database Replication for ERPNext.
- [Frappe Docker](https://github.com/frappe/frappe_docker) - Official docker images for Frappe.
- [Helm Chart](https://helm.erpnext.com/) - Kubernetes Helm Chart for ERPNext.
- [Nethserver](https://github.com/geniusdynamics/ns8-erp-next) - @geniusdynamics's configuration for NS8 with backup/restore, server to server node migration, Ldap & Active directory integration and more. [[read more here](https://community.nethserver.org/t/erpnext-the-most-agile-erp-on-the-planet-in-ns8/24240)]
- [Press](https://github.com/frappe/press) - Full service cloud hosting for the Frappe stack - powers Frappe Cloud

### Other Clients

_Clients built for the Frappe Framework, other than the standard browser view Desk_

- [AdminLTE](https://github.com/mymi14s/frappevue_adminlte) - Vue-based AdminLTE dashboard for Frappe and ERPNext.
- [Mobile](https://github.com/frappe/mobile) - Mobile App for Frappe built on Dart. _[Version 13+]_

### Resources

_Resources that can help you harness the power of the Frappe Framework_

- [docs.frappe.io/framework](https://docs.frappe.io/framework) - Official documentation of the Frappe Framework.
- [frappe.school](https://frappe.school) - Pick from the various courses by the maintainers or from the community.
- [How Does the Frappe Framework Work?](https://gavv.in/blog/how-does-the-frappe-framework-work/) - Deep dive into the internals of the Frappe Framework.

_Community Channels_

- [discuss.frappe.io](https://discuss.erpnext.com) - Forum for Frappe and ERPNext community.
- [Telegram](https://t.me/frappeframework) - Public Telegram group for the Frappe Framework.
- [Stackoverflow](https://stackoverflow.com/questions/tagged/frappe) - Post questions with the `frappe` tag.

_YouTube Channels_

- [@frappetech](https://www.youtube.com/@frappetech) - Frappe Technologies' official Youtube channel.
- [@buildwithhussain](https://www.youtube.com/@buildwithhussain) - Watch Frappe Framework used live to build world-class web apps.


### Hosting

_Providers that are catered to hosting of Frappe and Frappe Apps_

- [Frappe Cloud](https://cloud.frappe.io/dashboard/signup?referrer=a6d8da54) - Managed hosting platform for Frappe Apps.
