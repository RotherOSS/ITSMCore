# --
# OTOBO is a web-based ticketing system for service organisations.
# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# Copyright (C) 2019-2024 Rother OSS GmbH, https://otobo.io/
# --
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
# --

package Kernel::Language::de_ITSMCore;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMCIPAllocate
    $Self->{Translation}->{'Criticality ↔ Impact ↔ Priority'} = 'Kritikalität ↔ Auswirkung ↔ Priorität';
    $Self->{Translation}->{'Manage the priority result of combinating Criticality ↔ Impact.'} =
        'Verwalten Sie das Prioritätsergebnis der Kombination von Kritikalität ↔ Auswirkungen.';
    $Self->{Translation}->{'Priority allocation'} = 'Prioritäts-Zuordnung';

    # Template: AdminSLA
    $Self->{Translation}->{'Minimum Time Between Incidents'} = 'Minimale Zeit zwischen den Vorfällen';

    # Template: AdminService
    $Self->{Translation}->{'Criticality'} = 'Kritikalität';

    # Template: AgentITSMSLAZoom
    $Self->{Translation}->{'SLA Information'} = 'SLA-Informationen';
    $Self->{Translation}->{'Last changed'} = 'Zuletzt geändert';
    $Self->{Translation}->{'Last changed by'} = 'Zuletzt geändert von';
    $Self->{Translation}->{'Associated Services'} = 'Zugehörige Services';

    # Template: AgentITSMServiceZoom
    $Self->{Translation}->{'Service Information'} = 'Service-Informationen';
    $Self->{Translation}->{'Current incident state'} = 'Aktueller Vorfallstatus';
    $Self->{Translation}->{'Associated SLAs'} = 'Zugehörige SLAs';

    # Perl Module: Kernel/Modules/AdminITSMCIPAllocate.pm
    $Self->{Translation}->{'Impact'} = 'Auswirkung';

    # Perl Module: Kernel/Modules/AgentITSMSLAPrint.pm
    $Self->{Translation}->{'No SLAID is given!'} = 'Keine SLAID vorhanden!';
    $Self->{Translation}->{'SLAID %s not found in database!'} = 'SLAID "%s" in der Datenbank nicht gefunden!';
    $Self->{Translation}->{'Calendar Default'} = 'Kalender Standard';

    # Perl Module: Kernel/Modules/AgentITSMSLAZoom.pm
    $Self->{Translation}->{'operational'} = 'Operativ';
    $Self->{Translation}->{'warning'} = 'Warnung';
    $Self->{Translation}->{'incident'} = 'Vorfall';

    # Perl Module: Kernel/Modules/AgentITSMServicePrint.pm
    $Self->{Translation}->{'No ServiceID is given!'} = 'Keine ServiceID vorhanden!';
    $Self->{Translation}->{'ServiceID %s not found in database!'} = 'ServiceID "%s" in der Datenbank nicht gefunden!';
    $Self->{Translation}->{'Current Incident State'} = 'Aktueller Vorfallstatus';

    # Perl Module: Kernel/Output/HTML/LinkObject/Service.pm
    $Self->{Translation}->{'Incident State'} = 'Vorfallstatus';

    # Database XML / SOPM Definition: ITSMCore.sopm
    $Self->{Translation}->{'Operational'} = 'Operativ';
    $Self->{Translation}->{'Incident'} = 'Vorfall';
    $Self->{Translation}->{'End User Service'} = 'Anwender-Service';
    $Self->{Translation}->{'Front End'} = 'Frontend';
    $Self->{Translation}->{'Back End'} = 'Backend';
    $Self->{Translation}->{'IT Management'} = 'IT-Management';
    $Self->{Translation}->{'Reporting'} = 'Berichte';
    $Self->{Translation}->{'IT Operational'} = 'IT Betrieb';
    $Self->{Translation}->{'Demonstration'} = 'Demonstration';
    $Self->{Translation}->{'Project'} = 'Projekt';
    $Self->{Translation}->{'Underpinning Contract'} = 'Zugrundeliegender Vertrag';
    $Self->{Translation}->{'Other'} = 'Sonstiges';
    $Self->{Translation}->{'Availability'} = 'Verfügbarkeit';
    $Self->{Translation}->{'Response Time'} = 'Reaktionszeit';
    $Self->{Translation}->{'Recovery Time'} = 'Wiederherstellungszeit';
    $Self->{Translation}->{'Resolution Rate'} = 'Lösungszeit';
    $Self->{Translation}->{'Transactions'} = 'Transaktionen';
    $Self->{Translation}->{'Errors'} = 'Fehler';

    # SysConfig
    $Self->{Translation}->{'Alternative to'} = 'Alternativ zu';
    $Self->{Translation}->{'Both'} = 'Beide';
    $Self->{Translation}->{'Connected to'} = 'Verbunden mit';
    $Self->{Translation}->{'Define Actions where a settings button is available in the linked objects widget (LinkObject::ViewMode = "complex"). Please note that these Actions must have registered the following JS and CSS files: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js and Core.Agent.LinkObject.js.'} =
        'Definieren Sie Actions, in denen im Verknüpfte-Objekte-Widget ein Einstellungen-Knopf verfügbar sein soll (LinkObject::ViewMode = "complex"). Bitte beachten Sie, dass für diese Actions die folgenden JS- und CSS-Dateien registriert sein müssen: Core.AllocationList.css, Core.UI.AllocationList.js, Core.UI.Table.Sort.js, Core.Agent.TableFilters.js und Core.Agent.LinkObject.js.';
    $Self->{Translation}->{'Define which columns are shown in the linked Services widget (LinkObject::ViewMode = "complex"). Note: Only Service attributes are allowed for DefaultColumns. Possible settings: 0 = Disabled, 1 = Available, 2 = Enabled by default.'} =
        'Definiert welche Spalten im Widget "Verknüpfte Services" angezeigt werden (LinkObject::ViewMode = "complex"). Hinweis: Es sind nur Service-Eigenschaften als Default-Spalten erlaubt. Mögliche Werte: 0 = Deaktiviert, 1 = Verfügbar, 2 = Standardmäßig aktiviert.';
    $Self->{Translation}->{'Defines the default frontend (HTML) theme to be used by the agents and customers. If you like, you can add your own theme. Please refer the administrator manual located at https://doc.otobo.org/.'} =
        '';
    $Self->{Translation}->{'Defines the default frontend language. All the possible values are determined by the available language files on the system. These values are listed as the keys in the setting \'DefaultUsedLanguages\'.'} =
        '';
    $Self->{Translation}->{'Defines the list of online repositories. Another installation can be used as repository, for example: Key="http://example.com/otobo/public.pl?Action=PublicRepository;File=" and Content="Some Name".'} =
        '';
    $Self->{Translation}->{'Defines the parameters for the dashboard backend. "Cmd" is used to specify command with parameters. "Group" is used to restrict access to the plugin (e. g. Group: admin;group1;group2;). "Default" indicates if the plugin is enabled by default or if the user needs to enable it manually. "CacheTTL" indicates the cache expiration period in minutes for the plugin. "Mandatory" determines if the plugin is always shown and can not be removed by agents. Only works if DashboardBackend::AllowCmdOutput is enabled in Config.pm.'} =
        '';
    $Self->{Translation}->{'Depends on'} = 'Hängt ab von';
    $Self->{Translation}->{'Frontend module registration for the AdminITSMCIPAllocate configuration in the admin area.'} =
        'Frontend-Modulregistrierung der AdminITSMCIPAllocate Konfiguration im Admin-Bereich.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLA object in the agent interface.'} =
        'Frontend-Modulregistrierung des AgentITSMSLA-Objekts im Agent-Interface.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAPrint object in the agent interface.'} =
        'Frontend-Modulregistrierung des AgentITSMSLAPrint-Objekts im Agent-Interface.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMSLAZoom object in the agent interface.'} =
        'Frontend-Modulregistrierung des AgentITSMSLAZoom-Objekts im Agent-Interface.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMService object in the agent interface.'} =
        'Frontend-Modulregistrierung des AgentITSMService-Objekts im Agent-Interface.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServicePrint object in the agent interface.'} =
        'Frontend-Modulregistrierung des AgentITSMServicePrint-Objekts im Agent-Interface.';
    $Self->{Translation}->{'Frontend module registration for the AgentITSMServiceZoom object in the agent interface.'} =
        'Frontend-Modulregistrierung des AgentITSMServiceZoom-Objekts im Agent-Interface.';
    $Self->{Translation}->{'ITSM SLA Overview.'} = 'ITSM SLA-Übersicht.';
    $Self->{Translation}->{'ITSM Service Overview.'} = 'ITSM-Services-Übersicht.';
    $Self->{Translation}->{'If "LDAP" was selected for Customer::AuthModule and you wish to use TLS security to communicate with the LDAP server, the "verify" parameter can be specified here. See Net::LDAP::start_tls for more information about the parameter.'} =
        '';
    $Self->{Translation}->{'Ignores not ticket related attributes.'} = '';
    $Self->{Translation}->{'Incident State Type'} = 'Vorfallstatus-Typ';
    $Self->{Translation}->{'Includes'} = 'Beinhaltet';
    $Self->{Translation}->{'Manage priority matrix.'} = 'Prioritäts-Matrix verwalten.';
    $Self->{Translation}->{'Manage the criticality - impact - priority matrix.'} = 'Kritikalität-Auswirkung-Prioritäts-Matrix verwalten.';
    $Self->{Translation}->{'Module to show the Back menu item in SLA menu.'} = 'Modul, das den Menüeintrag „Zurück“ im SLA-Menü anzeigt.';
    $Self->{Translation}->{'Module to show the Back menu item in service menu.'} = 'Modul, das den "Zurück"-Menüeintrag im Service-Menü anzeigt.';
    $Self->{Translation}->{'Module to show the Link menu item in service menu.'} = 'Modul, dass den "Verküpfen"-Menüeintrag im Service-Menü anzeigt.';
    $Self->{Translation}->{'Module to show the Print menu item in SLA menu.'} = 'Modul, dass den "Ausdrucken"-Menüeintrag im SLA-Menü anzeigt.';
    $Self->{Translation}->{'Module to show the Print menu item in service menu.'} = 'Modul, dass den "Ausdrucken"-Menüeintrag im Service-Menü anzeigt.';
    $Self->{Translation}->{'Parameters for the incident states in the preference view.'} = 'Parameter für den Vorfallsstatus in der Ansicht für die Einstellungen.';
    $Self->{Translation}->{'Part of'} = 'Teil von';
    $Self->{Translation}->{'Relevant to'} = 'Relevant für';
    $Self->{Translation}->{'Required for'} = 'Benötigt für';
    $Self->{Translation}->{'SLA Overview'} = 'SLA-Übersicht';
    $Self->{Translation}->{'SLA Print.'} = 'SLA-Audruck.';
    $Self->{Translation}->{'SLA Zoom.'} = 'SLA-Detailansicht.';
    $Self->{Translation}->{'Service Overview'} = 'Service-Übersicht';
    $Self->{Translation}->{'Service Print.'} = 'Service Ausdrucken.';
    $Self->{Translation}->{'Service Zoom.'} = 'Service-Detailansicht.';
    $Self->{Translation}->{'Service-Area'} = 'Service-Bereich';
    $Self->{Translation}->{'Set the type and direction of links to be used to calculate the incident state. The key is the name of the link type (as defined in LinkObject::Type), and the value is the direction of the IncidentLinkType that should be followed to calculate the incident state. For example if the IncidentLinkType is set to \'DependsOn\', and the Direction is \'Source\', only \'Depends on\' links will be followed (and not the opposite link \'Required for\') to calculate the incident state. You can add more link types ad directions as you like, e.g. \'Includes\' with the direction \'Target\'. All link types defined in the sysconfig options LinkObject::Type are possible and the direction can be \'Source\', \'Target\', or \'Both\'. IMPORTANT: AFTER YOU MAKE CHANGES TO THIS SYSCONFIG OPTION YOU NEED TO RUN THE CONSOLE COMMAND bin/otobo.Console.pl Admin::ITSM::IncidentState::Recalculate SO THAT ALL INCIDENT STATES WILL BE RECALCULATED BASED ON THE NEW SETTINGS!'} =
        'Setzen des Typs und der Richtung der verwendeten Links, um den Vorfallstatus zu berechnen. Der Schlüssel ist der Name des Link-Typs (wie in LinkObject::Type definiert), und der Wert ist die Richtung des IncidentLinkType, die befolgt werden soll, um den Incident-Status zu berechnen. Zum Beispiel, wenn der IncidentLinkType auf \'DependsOn\' und als Richtung \'Quelle\' gesetzt ist, wird nur \'Depends\' Links gefolgt (und nicht dem Gegenteil \'Benötigt für\') um den IncidentState zu berechnen. Sie können soviele Link-Typen und Richtungen hinzufügen wie Sie möchten, z.B.: \'Enthält\' mit der Richtung \'Target\'. Alle in der Sysconfig unter Linkobject::Type definierten Verknüpfungsarten sind möglich sind und die Richtung kann \'Quelle\', \'Ziel\' oder \'Beide\' sein. WICHTIG: Nachdem Sie Änderungen an dieser Sysconfig-Einstellung gemacht haben, führen Sie das Skript bin/otobo.ITSMConfigItemIncidentStateRecalculate.pl SO aus, damit alle Vorfallstatus anhand der neuen Einstellungen berechnet werden!';
    $Self->{Translation}->{'Source'} = 'Quelle';
    $Self->{Translation}->{'This setting defines that a \'ITSMChange\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} =
        'Definiert, dass ein \'ITSMChange\'-Objekt mit dem Linktyp \'Normal\' mit \'Ticket\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'Normal\' mit \'FAQ\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'ParentChild\' mit \'FAQ\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'RelevantTo\' mit \'FAQ\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'AlternativeTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'AlternativeTo\' mit \'Service\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'DependsOn\' mit \'Service\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Service\' objects using the \'RelevantTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'RelevantTo\' mit \'Service\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'AlternativeTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'AlternativeTo\' mit \'Ticket\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'DependsOn\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'DependsOn\' mit \'Ticket\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with \'Ticket\' objects using the \'RelevantTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'RelevantTo\' mit \'Ticket\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'AlternativeTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'AlternativeTo\' mit anderen \'ITSMConfigItem\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'ConnectedTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'ConnectedTo\' mit anderen \'ITSMConfigItem\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'DependsOn\' mit anderen \'ITSMConfigItem\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'Includes\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'Includes\' mit anderen \'ITSMConfigItem\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMConfigItem\' object can be linked with other \'ITSMConfigItem\' objects using the \'RelevantTo\' link type.'} =
        'Definiert, dass ein \'ITSMConfigItem\'-Objekt mit dem Linktyp \'RelevantTo\' mit anderen \'ITSMConfigItem\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'DependsOn\' link type.'} =
        'Definiert, dass ein \'ITSMWorkOrder\'-Objekt mit dem Linktyp \'DependsOn\' mit \'ITSMConfigItem\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'ITSMConfigItem\' objects using the \'Normal\' link type.'} =
        'Definiert, dass ein \'ITSMWorkOrder\'-Objekt mit dem Linktyp \'Normal\' mit \'ITSMConfigItem\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'DependsOn\' link type.'} =
        'Definiert, dass ein \'ITSMWorkOrder\'-Objekt mit dem Linktyp \'DependsOn\' mit \'Service\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Service\' objects using the \'Normal\' link type.'} =
        'Definiert, dass ein \'ITSMWorkOrder\'-Objekt mit dem Linktyp \'Normal\' mit \'Service\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'ITSMWorkOrder\' object can be linked with \'Ticket\' objects using the \'Normal\' link type.'} =
        'Definiert, dass ein \'ITSMWorkOrder\'-Objekt mit dem Linktyp \'Normal\' mit \'Ticket\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'Normal\' link type.'} =
        'Definiert, dass ein \'Service\'-Objekt mit dem Linktyp \'Normal\' mit \'FAQ\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'ParentChild\' link type.'} =
        'Definiert, dass ein \'Service\'-Objekt mit dem Linktyp \'ParentChild\' mit \'FAQ\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines that a \'Service\' object can be linked with \'FAQ\' objects using the \'RelevantTo\' link type.'} =
        'Definiert, dass ein \'Service\'-Objekt mit dem Linktyp \'RelevantTo\' mit \'FAQ\'-Objekten verlinkt werden kann.';
    $Self->{Translation}->{'This setting defines the link type \'AlternativeTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Definiert den Linktyp \'AlternativeTo\'. Wird als SourceName und TargetName der gleiche Inhalt angegeben, entsteht ein ungerichteter Linktyp. Wird als SourceName und TargetName verschiedener Inhalt angegeben, entsteht ein gerichteter Linktyp.';
    $Self->{Translation}->{'This setting defines the link type \'ConnectedTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Definiert den Linktyp \'ConnectedTo\'. Wird als SourceName und TargetName der gleiche Inhalt angegeben, entsteht ein ungerichteter Linktyp. Wird als SourceName und TargetName verschiedener Inhalt angegeben, entsteht ein gerichteter Linktyp.';
    $Self->{Translation}->{'This setting defines the link type \'DependsOn\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Definiert den Linktyp \'DependsOn\'. Wird als SourceName und TargetName der gleiche Inhalt angegeben, entsteht ein ungerichteter Linktyp. Wird als SourceName und TargetName verschiedener Inhalt angegeben, entsteht ein gerichteter Linktyp.';
    $Self->{Translation}->{'This setting defines the link type \'Includes\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Definiert den Linktyp \'Includes\'. Wird als SourceName und TargetName der gleiche Inhalt angegeben, entsteht ein ungerichteter Linktyp. Wird als SourceName und TargetName verschiedener Inhalt angegeben, entsteht ein gerichteter Linktyp.';
    $Self->{Translation}->{'This setting defines the link type \'RelevantTo\'. If the source name and the target name contain the same value, the resulting link is a non-directional one. If the values are different, the resulting link is a directional link.'} =
        'Definiert den Linktyp \'RelevantTo\'. Wird als SourceName und TargetName der gleiche Inhalt angegeben, entsteht ein ungerichteter Linktyp. Wird als SourceName und TargetName verschiedener Inhalt angegeben, entsteht ein gerichteter Linktyp.';
    $Self->{Translation}->{'Width of ITSM textareas.'} = 'Anzahl der Zeichen pro Zeile in ITSM-Textfeldern.';


    push @{ $Self->{JavaScriptStrings} // [] }, (
    );

}

1;
