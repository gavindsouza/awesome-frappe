# Awesome Frappe [![Awesome](https://awesome.re/badge-flat.svg)](https://github.com/sindresorhus/awesome)

> A curated list of awesome things related to the Frappe Framework

<div align="center">
  <img width="400" src="./.github/frappe-framework-logo.svg" alt="Frappe logo">
</div>

Inspired by [awesome-django](https://github.com/wsvincent/awesome-django).

## Contents

- [Apps](#apps)
  - [Business Apps](#business-apps)
  - [Utility Apps](#utility-apps)
  - [Integrations](#integrations)
- [Developer Tooling](#developer-tooling)
- [Deployment Tools](#deployment-tools)
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


#### Utility Apps

- [Chat](https://github.com/frappe/chat) - Modern chat for your Frappe deployments.
- [Wiki](https://github.com/frappe/wiki) - Wiki for serving dynamic data along with a built-in review system.
- [Release](https://github.com/frappe/release) - Manage releases for Frappe and Frappe Applications.
- [Language Translator](https://github.com/mymi14s/language_translator) - Automatic language translator on Frappe Desk and website.
- [Database Console](https://github.com/mymi14s/database_console) - Execute SQL queries directly from Frappe/ERPNext desk just like 'bench mariadb'.
- [S3 Attachments](https://github.com/zerodha/frappe-attachments-s3) - Plug an S3 bucket for storing and fetching files in Frappe.
- [ERPNext Quota](https://github.com/ahmadpak/erpnext_quota) - App to manage ERPNext Site, User, Company and Space limitations.
- [ERPNext OCR](https://github.com/Monogramm/erpnext_ocr) - Optical Character Recognition using Tesseract within Frappe.
- [Temporal](https://github.com/Datahenge/temporal) - An ERPNext App that integrates with Redis to rapidly provide calendar information.
- [Background Tasks Unleashed](https://github.com/Datahenge/btu) - A Frappe Task Scheduling and Automation.
- [Frappe tinyMCE](https://github.com/shridarpatil/frappe_tinymce) - Replace frappe's Quill Text Editor with tinyMCE Text Editor.
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


#### Other Apps

- [Recod ERPNext Design](https://github.com/Monogramm/recod_erpnext_design) - Provides new sample print formats and design for ERPNext.
- [Telegram Bot Manager](https://github.com/leam-tech/frappe_telegram) - Telegram Bot support for Frappe.
- [Expense Entry](https://github.com/the-bantoo/expense_request) - Expense Entry for easy capture of non-item expenses without using the Journal Entry.
- [Robinhood](https://github.com/shridarpatil/robinhood) - System that powers [robinhoodarmy.com](https://checkin.robinhoodarmy.com/)
- [Workspace Permissions](https://github.com/pstuhlmueller/workspaceperms) - Manage the availability of workspaces within Frappe/ ERPNext (sidebar) based on user-roles.


### Developer Tooling

- [Intellisense](https://github.com/frappe/intellisense) - VSCode Extension and Language Server for Frappe Framework.
- [Doppio](https://github.com/NagariaHussain/doppio) - Magically setup single page applications on your Frappe Apps.
- [frappe_test.vim](https://github.com/ankush/frappe_test.vim) - Running Frappe unit tests at speed of thought.
- [Frappeviz](https://github.com/yemikudaisi/frappeviz) - Visualize class diagrams of a Frappe App's doctypes using PlantUML.
- [Frappe GraphQL](https://github.com/leam-tech/frappe_graphql) - GraphQL API Layer for Frappe Framework.
- [renovation_core.dart](https://github.com/leam-tech/renovation_core.dart) - The Frappe Dart/Flutter Front End SDK.
- [DocType Model Generator](https://github.com/assemmarwan/model_generator) - Generate models to different languages based on Doctype.
- [Console](https://github.com/yrestom/Console) - Powerful Console for Frappe Backend


### Deployment Tools

_Resources allowing you to deploy Frappe apps with your favourite toolset_

- [Bench](https://frappe.io/bench) - CLI to Manage Frappe Deployments
- [Frappe Docker](https://github.com/frappe/frappe_docker) - Official docker images for Frappe.
- [Docker Hub](https://hub.docker.com/u/frappe) - Container images for Frappe & ERPNext releases.
- [Helm Chart](https://helm.erpnext.com/) - Kubernetes Helm Chart for ERPNext.


### Other Clients

_Clients built for the Frappe Framework, other than the standard browser view Desk_

- [Mobile](https://github.com/frappe/mobile) - Mobile App for Frappe built on Dart. _[Version 13+]_
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
