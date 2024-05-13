.. image:: ../images/otobo-logo.png
   :align: center
|

.. toctree::
    :maxdepth: 2
    :caption: Contents

Sacrifice to Sphinx
===================

Description
===========
The OTOBO::ITSM Core package.

System requirements
===================

Framework
---------
OTOBO 11.0.x

Packages
--------
GeneralCatalog 11.0.0

Third-party software
--------------------
\-

Usage
=====

Setup
-----

Configuration Reference
-----------------------

Core
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

ProductName
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Defines the name of the application, shown in the web interface, tabs and title bar of the web browser.

Core::GeneralCatalog
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

GeneralCatalogPreferences###IncidentStates
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Parameters for the incident states in the preference view.

Core::ITSMCore
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

ITSM::Core::IncidentLinkTypeDirection
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Set the type and direction of links to be used to calculate the incident state. The key is the name of the link type (as defined in LinkObject::Type), and the value is the direction of the IncidentLinkType that should be followed to calculate the incident state. For example if the IncidentLinkType is set to 'DependsOn', and the Direction is 'Source', only 'Depends on' links will be followed (and not the opposite link 'Required for') to calculate the incident state. You can add more link types ad directions as you like, e.g. 'Includes' with the direction 'Target'. All link types defined in the sysconfig options LinkObject::Type are possible and the direction can be 'Source', 'Target', or 'Both'. IMPORTANT: AFTER YOU MAKE CHANGES TO THIS SYSCONFIG OPTION YOU NEED TO RUN THE CONSOLE COMMAND bin/otobo.Console.pl Admin::ITSM::IncidentState::Recalculate SO THAT ALL INCIDENT STATES WILL BE RECALCULATED BASED ON THE NEW SETTINGS!

Core::LinkObject
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

LinkObject::ViewMode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Determines the way the linked objects are displayed in each zoom mask.

LinkObject::PossibleLink###3281
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'Service' object can be linked with 'FAQ' objects using the 'ParentChild' link type.

LinkObject::PossibleLink###3282
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'Service' object can be linked with 'FAQ' objects using the 'RelevantTo' link type.

LinkObject::PossibleLink###3400
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMWorkOrder' object can be linked with 'Service' objects using the 'Normal' link type.

LinkObject::PossibleLink###3401
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMWorkOrder' object can be linked with 'Service' objects using the 'DependsOn' link type.

LinkObject::PossibleLink###3410
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMWorkOrder' object can be linked with 'ITSMConfigItem' objects using the 'Normal' link type.

LinkObject::PossibleLink###3411
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMWorkOrder' object can be linked with 'ITSMConfigItem' objects using the 'DependsOn' link type.

LinkObject::PossibleLink###3412
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMWorkOrder' object can be linked with 'Ticket' objects using the 'Normal' link type.

LinkObject::PossibleLink###3420
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMChange' object can be linked with 'Ticket' objects using the 'Normal' link type.

LinkObject::Type###AlternativeTo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines the link type 'AlternativeTo'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.

LinkObject::Type###ConnectedTo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines the link type 'ConnectedTo'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.

LinkObject::Type###DependsOn
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines the link type 'DependsOn'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.

LinkObject::Type###Includes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines the link type 'Includes'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.

LinkObject::Type###RelevantTo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines the link type 'RelevantTo'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.

LinkObject::PossibleLink###3200
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMConfigItem' object can be linked with other 'ITSMConfigItem' objects using the 'AlternativeTo' link type.

LinkObject::PossibleLink###3201
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMConfigItem' object can be linked with other 'ITSMConfigItem' objects using the 'ConnectedTo' link type.

LinkObject::PossibleLink###3202
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMConfigItem' object can be linked with other 'ITSMConfigItem' objects using the 'DependsOn' link type.

LinkObject::PossibleLink###3203
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMConfigItem' object can be linked with other 'ITSMConfigItem' objects using the 'Includes' link type.

LinkObject::PossibleLink###3204
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMConfigItem' object can be linked with other 'ITSMConfigItem' objects using the 'RelevantTo' link type.

LinkObject::PossibleLink###3220
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMConfigItem' object can be linked with 'Ticket' objects using the 'AlternativeTo' link type.

LinkObject::PossibleLink###3221
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMConfigItem' object can be linked with 'Ticket' objects using the 'DependsOn' link type.

LinkObject::PossibleLink###3222
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMConfigItem' object can be linked with 'Ticket' objects using the 'RelevantTo' link type.

LinkObject::PossibleLink###3240
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMConfigItem' object can be linked with 'Service' objects using the 'AlternativeTo' link type.

LinkObject::PossibleLink###3241
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMConfigItem' object can be linked with 'Service' objects using the 'DependsOn' link type.

LinkObject::PossibleLink###3242
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMConfigItem' object can be linked with 'Service' objects using the 'RelevantTo' link type.

LinkObject::PossibleLink###3260
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMConfigItem' object can be linked with 'FAQ' objects using the 'Normal' link type.

LinkObject::PossibleLink###3261
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMConfigItem' object can be linked with 'FAQ' objects using the 'ParentChild' link type.

LinkObject::PossibleLink###3262
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'ITSMConfigItem' object can be linked with 'FAQ' objects using the 'RelevantTo' link type.

LinkObject::PossibleLink###3280
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
This setting defines that a 'Service' object can be linked with 'FAQ' objects using the 'Normal' link type.

Core::Package
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Package::RepositoryList
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Defines the list of online repositories. Another installation can be used as repository, for example: Key="http://example.com/otobo/public.pl?Action=PublicRepository;File=" and Content="Some Name".

Package::RepositoryList
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Defines the list of online repositories. Another installation can be used as repository, for example: Key="http://example.com/otobo/public.pl?Action=PublicRepository;File=" and Content="Some Name".

Core::Ticket
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Ticket::Service
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Allows defining services and SLAs for tickets (e. g. email, desktop, network, ...), and escalation attributes for SLAs (if ticket service/SLA feature is enabled).

Frontend::Admin::ModuleRegistration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Frontend::Module###AdminITSMCIPAllocate
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Frontend module registration for the AdminITSMCIPAllocate configuration in the admin area.

Frontend::Admin::ModuleRegistration::AdminOverview
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Frontend::NavigationModule###AdminITSMCIPAllocate
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Admin area navigation for the agent interface.

Frontend::Admin::ModuleRegistration::Loader
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Loader::Module::AdminITSMCIPAllocate###003-ITSMCore
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Loader module registration for the agent interface.

Frontend::Admin::ModuleRegistration::MainMenu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Frontend::Navigation###AdminITSMCIPAllocate###003-ITSMCore
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Main menu item registration.

Frontend::Agent
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

ITSM::Frontend::TextArea
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Width of ITSM textareas.

Frontend::Agent::ITSMSLA::MenuModule
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

ITSMSLA::Frontend::MenuModule###000-Back
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Module to show the Back menu item in SLA menu.

ITSMSLA::Frontend::MenuModule###100-Print
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Module to show the Print menu item in SLA menu.

Frontend::Agent::ITSMService::MenuModule
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

ITSMService::Frontend::MenuModule###000-Back
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Module to show the Back menu item in service menu.

ITSMService::Frontend::MenuModule###100-Print
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Module to show the Print menu item in service menu.

ITSMService::Frontend::MenuModule###200-Link
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Module to show the Link menu item in service menu.

Frontend::Agent::LinkObject
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

LinkObject::ComplexTable::SettingsVisibility###Service
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.

LinkObject::ComplexTable###Service
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Define which columns are shown in the linked Services widget (LinkObject::ViewMode = "complex"). Note: Only Service attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.

Frontend::Agent::ModuleRegistration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Frontend::Module###AgentITSMService
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Frontend module registration for the AgentITSMService object in the agent interface.

Frontend::Module###AgentITSMSLA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Frontend module registration for the AgentITSMSLA object in the agent interface.

Frontend::Module###AgentITSMServiceZoom
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Frontend module registration for the AgentITSMServiceZoom object in the agent interface.

Frontend::Module###AgentITSMServicePrint
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Frontend module registration for the AgentITSMServicePrint object in the agent interface.

Frontend::Module###AgentITSMSLAZoom
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Frontend module registration for the AgentITSMSLAZoom object in the agent interface.

Frontend::Module###AgentITSMSLAPrint
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Frontend module registration for the AgentITSMSLAPrint object in the agent interface.

Frontend::Agent::ModuleRegistration::Loader
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Loader::Module::AgentITSMService###003-ITSMService
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Loader module registration for the agent interface.

Loader::Module::AgentITSMSLA###003-ITSMService
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Loader module registration for the agent interface.

Loader::Module::AgentITSMServiceZoom###003-ITSMService
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Loader module registration for the agent interface.

Loader::Module::AgentITSMSLAZoom###003-ITSMService
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Loader module registration for the agent interface.

Frontend::Agent::ModuleRegistration::MainMenu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Frontend::Navigation###AgentITSMService###003-ITSMService
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Main menu item registration.

Frontend::Navigation###AgentITSMSLA###003-ITSMService
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Main menu item registration.

Frontend::Base::Loader
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Loader::Agent::CommonCSS###100-ITSM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
List of CSS files to always be loaded for the agent interface.

Loader::Agent::CommonJS###100-ITSM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
List of JS files to always be loaded for the agent interface.

About
=======

Contact
-------
| Rother OSS GmbH
| Email: hello@otobo.de
| Web: https://otobo.de

Version
-------
Author: |doc-vendor| / Version: |doc-version| / Date of release: |doc-datestamp|
