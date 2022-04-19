# Awesome Frappe [![Awesome](https://awesome.re/badge-flat.svg)](https://github.com/sindresorhus/awesome)

> A curated list of awesome things related to the Frappe Framework

<div align="center">
  <img width="400" src="./.github/frappe-framework-logo.svg" alt="Frappe logo">
</div>

Inspired by [awesome-django](https://github.com/wsvincent/awesome-django).

## Contents

- [Awesome Frappe ![Awesome](https://github.com/sindresorhus/awesome)](#awesome-frappe-)
  - [Contents](#contents)
    - [Apps](#apps)
      - [Business Apps](#business-apps)
      - [Utility Apps](#utility-apps)
      - [Integrations](#integrations)
      - [Themes](#themes)
      - [Other Apps](#other-apps)
    - [Developer Tooling](#developer-tooling)
    - [Deployment Tools](#deployment-tools)
    - [Other Clients](#other-clients)
    - [Resources](#resources)
    - [Hosting](#hosting)


### Apps

_Apps that showcase the power of the Frappe Framework_

#### Business Apps

- [ERPNext](https://erpnext.com) - Open source full-featured business management system.
- [Healthcare](https://github.com/frappe/healthcare) - An open source management system crafted for the medical industry.
- [POS Awesome](https://github.com/yrestom/POS-Awesome) - An open-source Point of Sale for ERPNext using Vue.js and Vuetify.
- [TailPOS](https://github.com/bailabs/tailpos) - Offline First Open Source POS for ERPNext.
- [School](https://github.com/frappe/school) - The Learning Management System (LMS) that powers [mon.school](https://mon.school) & [frappe.school](https://frappe.school).
- [Apparelo](https://github.com/aerele/apparelo) - Manufacturing Workflow Management for the garment industry.
- [Cargo Management](https://github.com/AgileShift/cargo_management) - Package Management App for ERPNext.
- [FiMax](https://github.com/YefriTavarez/fimax) - Loan Management and Repayment Scheduling for ERPNext.
- [Restaurant](https://github.com/quantumbitcore/erpnext-restaurant) - Restaurant App for ERPNext.
- [Stone Warehouse](https://github.com/finbyz/stonewarehouse) - Manage batch wise balance, especially setup for a ceramic tiles vendor.


#### Utility Apps

- [Chat](https://github.com/frappe/chat) - Modern chat for your Frappe deployments.
- [Wiki](https://github.com/frappe/wiki) - Wiki for serving dynamic data along with a built-in review system.
- [Pibicut](https://github.com/pibico/pibicut) - URL Shortener with QR Code Generator.
- [Release](https://github.com/frappe/release) - Manage releases for Frappe and Frappe Applications.
- [Language Translator](https://github.com/mymi14s/language_translator) - Automatic language translator on Frappe Desk and website.
- [Database Console](https://github.com/mymi14s/database_console) - Execute SQL queries directly from Frappe/ERPNext desk just like 'bench mariadb'.
- [S3 Attachments](https://github.com/zerodha/frappe-attachments-s3) - Plug an S3 bucket for storing and fetching files in Frappe.
- [ERPNext Quota](https://github.com/ahmadpak/erpnext_quota) - App to manage ERPNext Site, User, Company and Space limitations.
- [ERPNext OCR](https://github.com/Monogramm/erpnext_ocr) - Optical Character Recognition using Tesseract within Frappe.
- [Temporal](https://github.com/Datahenge/temporal) - An ERPNext App that integrates with Redis to rapidly provide calendar information.
- [Background Tasks Unleashed](https://github.com/Datahenge/btu) - A Frappe Task Scheduling and Automation.
- [Frappe tinyMCE](https://github.com/shridarpatil/frappe_tinymce) - Replace frappe's Quill Text Editor with tinyMCE Text Editor.
- [Jodit HTML Editor](https://github.com/ashish-greycube/jodit_html_editor) - Replace Quill Text Editor With [Jodit](https://github.com/xdan/jodit) HTML Editor on WebPage and WebForm for Frappe/ERPNext Version 11 & 12
- [FCM Notification for ERPNext](https://github.com/tridz-dev/erpnext_fcm) - Send notifications created in Frappe or ERPNext as push notication via Firebase Cloud Message.
- [Frappe ReST API Wrapper](https://github.com/pifabs/restipie) - Build custom ReST api's on top of Frappe.


#### Integrations

- [Twilio Integration](https://github.com/frappe/twilio-integration) - Twilio Integration for Frappe.
- [ERPNext Shipping](https://github.com/frappe/erpnext-shipping) - Shipping Integration for ERPNext with Packlink, LetMeShip & SendCloud.
- [Shopify Integration](https://github.com/frappe/ecommerce_integrations) - Shopify Integration for ERPNext
- [Unicommerce Integration](https://github.com/frappe/ecommerce_integrations) - Unicommerce Integration for ERPNext
- [Zenoti Integration](https://github.com/frappe/ecommerce_integrations) - Zenoti Integration for ERPNext
- [Nextcloud Integration](https://github.com/frappe/nextcloud-integration) - Nextcloud + Frappe = ❤️
- [Razorpay Integration](https://github.com/frappe/razorpay_integration) - Razorpay Integration for Frappe.
- [Mandrill Integration](https://github.com/frappe/mandrill_integration) - Mandrill Integration for Frappe.
- [Mautic Integration](https://github.com/dokos-io/mautic) - Mautic Integration for ERPNext.
- [Paystack Integration](https://github.com/mymi14s/frappe_paystack) - Paystack Payment Gateway Integration for Frappe.
- [RClone Integration](https://github.com/Muzzy73/rclone_integration) - Frappe integration with Rclone.
- [WooCommerceConnector](https://github.com/libracore/WooCommerceConnector) - Integration App for ERPNext to connect to WooCommerce.
- [ERPNextFinTS](https://github.com/jHetzer/erpnextfints) - FinTS Connector for ERPNext.
- [EWB API Integration](https://github.com/aerele/ewb_api_integration) - Implementing E-WayBill API integration for India.
- [Discourse SSO Integration](https://github.com/shridarpatil/frappe_discourse) - Simple frappe app to setup Single sign-on for Discourse.
- [Telegram Integration](https://github.com/yrestom/erpnext_telegram) - Telegram Integration app for more productivity.
- [Pibiapp](https://github.com/doloresjuliana/pibiapp) - Connect with Nextcloud to store the attachments on your Nextcloud server, integrate with external data from Excel, CSV, JSON or XML files, and view Redash dashboards in Frappe.
- [Firebase Cloud Message Integration](https://github.com/tridz-dev/erpnext_fcm) - Send push notifications to users using FCM integration.
- [Metabase Integration](https://github.com/pipech/frappe-metabase) - Access your Metabase instance from Desk.
- [Dash Integration](https://github.com/pipech/frappe-plotly-dash) - Build analytical web apps through the Desk with @plotly's [Dash](https://github.com/plotly/dash).


#### Themes

- [Classic White](https://github.com/hashirluv/whitetheme-v13) - Classic White theme for your Frappe v13 Apps.
- [Red](https://github.com/hashirluv/redtheme_v13b) - @hashirluv's Red theme for your Frappe v13 Apps.
- [Material Blue](https://github.com/hashirluv/bluetheme) - Material Blue Theme for your Frappe v12 Apps.
- [DATEV Integration](https://github.com/alyf-de/erpnext_datev) - Integration between ERPNext and DATEV.
- [Banking API Integration](https://github.com/aerele/bank_api_integration) - Bank API Integration for ERPNext.


#### Other Apps

- [Recod ERPNext Design](https://github.com/Monogramm/recod_erpnext_design) - Provides new sample print formats and design for ERPNext.
- [Telegram Bot Manager](https://github.com/leam-tech/frappe_telegram) - Telegram Bot support for Frappe.
- [Expense Entry](https://github.com/the-bantoo/expense_request) - Expense Entry for easy capture of non-item expenses without using the Journal Entry.
- [Robinhood](https://github.com/shridarpatil/robinhood) - System that powers [robinhoodarmy.com](https://checkin.robinhoodarmy.com/)
- [Workspace Permissions](https://github.com/pstuhlmueller/workspaceperms) - Manage the availability of workspaces within Frappe/ ERPNext (sidebar) based on user-roles.
- [Digistore](https://github.com/NagariaHussain/digistore) - Digital Asset Distribution Platform built on Frappe.
- [PDF on Submit](https://github.com/alyf-de/erpnext_pdf-on-submit) - Automatically generate and attach a PDF when a sales document gets submitted.
- [Contract Payment](https://github.com/morghim/contract-payment) - Link between contract with sales invoice and purchase invoice and make dues.
- [Special Item Accountancy Code](https://github.com/scopen-coop/special_item_accountancy_code) - ERPNExt Spécial Item accountancy code according customer settings.
- [Swiss Accounting Integration](https://github.com/phamos-eu/Swiss-Accounting-Integration) - Extend ERPNext with Swiss QR Integration and Abacus Export.
- [ERPNext Whitelabel](https://github.com/bhavesh95863/whitelabel) - White label ERPNext for your own brand from a single setting.
- [IT Management](https://github.com/phamos-eu/it_management) - Manage your IT landscape from ERPNext.
- [ERPNext Germany](https://github.com/alyf-de/erpnext_germany) - Regional code for Germany, built on top of ERPNext.
- [Swiss Factur X E Invoicing](https://github.com/Grynn-GmbH/Swiss-E-invoicing-ERPNext) - For E-Invoice Hybrid PDF based on Factur-X and ZugFerd (EN 16931 Standards).
- [Grynn Swiss QR Bill](https://github.com/Grynn-GmbH/Swiss-QR-Bill-ERPNext) - Swiss QR Bill Generator app for ERPNext.
- [GSTR 2B Reconciler](https://github.com/aerele/reconciler) - Reconciliation tool for GSTR 2B and Purchase Register.


### Developer Tooling

- [Intellisense](https://github.com/frappe/intellisense) - VSCode Extension and Language Server for Frappe Framework.
- [Semgrep Rules](https://github.com/frappe/semgrep-rules) - Semgrep Rules for following the best practices while building your Frappe Apps.
- [frappe_test.vim](https://github.com/ankush/frappe_test.vim) - Running Frappe unit tests at speed of thought.
- [Frappe UI](https://github.com/frappe/frappe-ui) - A set of components and utilities for rapid UI development.
- [Frappe UI Starter](https://github.com/netchampfaris/frappe-ui-starter) - Boilerplate sets up Vue 3, Vue Router, TailwindCSS, and Frappe UI out of the box.
- [Frappeviz](https://github.com/yemikudaisi/frappeviz) - Visualize class diagrams of a Frappe App's doctypes using PlantUML.
- [Frappe GraphQL](https://github.com/leam-tech/frappe_graphql) - GraphQL API Layer for Frappe Framework.
- [Renovation](https://github.com/leam-tech/renovation_core) - Renovation is a Frappe Front End TS/JS SDK.
- [renovation_core.dart](https://github.com/leam-tech/renovation_core.dart) - The Frappe Dart/Flutter Front End SDK.
- [DocType Model Generator](https://github.com/assemmarwan/model_generator) - Generate models to different languages based on Doctype.
- [Doppio](https://github.com/NagariaHussain/doppio) - Magically setup single page applications on your Frappe Apps.
- [Console](https://github.com/yrestom/Console) - Powerful Console for Frappe Backend
- [App Template](https://github.com/Monogramm/erpnext_template) - @Monogramm's supercharged GitHub template for building ERPNext/Frappe Apps.
- [Fsocket](https://github.com/pifabs/fsocket) - Extend frappe's websocket server using socket.io and redis.
- [Barista](https://github.com/ElasticRun/barista) - Automate functional testing of your Frappe Apps.


### Deployment Tools

_Resources allowing you to deploy Frappe apps with your favourite toolset_

- [Bench](https://frappe.io/bench) - CLI to Manage Frappe Deployments
- [Frappe Docker](https://github.com/frappe/frappe_docker) - Official docker images for Frappe.
- [Docker Hub](https://hub.docker.com/u/frappe) - Container images for Frappe & ERPNext releases.
- [Helm Chart](https://helm.erpnext.com/) - Kubernetes Helm Chart for ERPNext.
- [Benchless](https://github.com/castlecraft/benchless) - CLI tool to manage Frappe deployments without bench.


### Other Clients

_Clients built for the Frappe Framework, other than the standard browser view Desk_

- [Mobile](https://github.com/frappe/mobile) - Mobile App for Frappe built on Dart. _[Version 13+]_
- [AdminLTE](https://github.com/mymi14s/frappevue_adminlte) - Vue-based AdminLTE dashboard for Frappe and ERPNext.
- [FrappeClient.py](https://github.com/zerodha/py-frappe-client) - @zerodha's Python client for making requests to your Frappe Server.
- [FrappeRestClient.Net](https://github.com/yemikudaisi/FrappeRestClient.Net) - Frappe Framework REST client for .Net
- [Frappe-Request.js](https://github.com/bailabs/frappe-request) - A Frappe-Client made with JavaScript and Needle.
- [FrappeClient.php](https://github.com/hizbul25/frappe-client) - a PHP client for making requests to your Frappe Server.


### Resources

_Resources that can help you harness the power of the Frappe Framework_

- [frappeframework.com](https://frappeframework.com) - Official documentation of the Frappe Framework.
- [frappe.school](https://frappe.school) - Pick from the various courses by the maintainers or from the community.

_Community Channels_

- [discuss.erpnext.com](https://discuss.erpnext.com) - Forum for Frappe and ERPNext community.
- [Telegram](https://t.me/frappeframework) - Public Telegram group for the Frappe Framework.
- [Stackoverflow](https://stackoverflow.com/questions/tagged/frappe) - Post questions with the `frappe` tag.


### Hosting

_Providers that are catered to hosting of Frappe and Frappe Apps_

- [Frappe Cloud](https://frappecloud.com) - Managed hosting platform for Frappe Apps.
