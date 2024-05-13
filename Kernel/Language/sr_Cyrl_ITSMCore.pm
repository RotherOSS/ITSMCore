# --
# OTOBO is a web-based ticketing system for service organisations.
# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# Copyright (C) 2019-2021 Rother OSS GmbH, https://otobo.de/
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

package Kernel::Language::sr_Cyrl_ITSMCore;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # Template: AdminITSMCIPAllocate
    $Self->{Translation}->{'Criticality ↔ Impact ↔ Priority'} = 'Значај ↔ утицај ↔ приоритет';
    $Self->{Translation}->{'Manage the priority result of combinating Criticality ↔ Impact.'} =
        'Управљање резултатом приоритета комбиновањем значај ↔ утицај.';
    $Self->{Translation}->{'Priority allocation'} = 'Расподела приоритета';

    # Template: AdminSLA
    $Self->{Translation}->{'Filter by valid state'} = '';
    $Self->{Translation}->{'Include invalid SLAs'} = '';
    $Self->{Translation}->{'Minimum Time Between Incidents'} = 'Минимално време између инцидената';

    # Template: AdminService
    $Self->{Translation}->{'Include invalid services'} = '';
    $Self->{Translation}->{'Criticality'} = 'Значај';

    # Template: AgentITSMSLAZoom
    $Self->{Translation}->{'SLA Information'} = 'Информације о SLA';
    $Self->{Translation}->{'Last changed'} = 'Задњи пут промењено';
    $Self->{Translation}->{'Last changed by'} = 'Последњи је мењао';
    $Self->{Translation}->{'Associated Services'} = 'Повезани сервиси';

    # Template: AgentITSMServiceZoom
    $Self->{Translation}->{'Service Information'} = 'Сервисна информација';
    $Self->{Translation}->{'Current incident state'} = 'Тренутно стање инцидента';
    $Self->{Translation}->{'Associated SLAs'} = 'Повезани SLA';

    # Perl Module: Kernel/Modules/AdminITSMCIPAllocate.pm
    $Self->{Translation}->{'Impact'} = 'Утицај';

    # Perl Module: Kernel/Modules/AgentITSMSLAPrint.pm
    $Self->{Translation}->{'No SLAID is given!'} = 'Није дат SLAID!';
    $Self->{Translation}->{'SLAID %s not found in database!'} = 'SLAID %s није нађен у бази података!';
    $Self->{Translation}->{'Calendar Default'} = 'Подразумевани календар';

    # Perl Module: Kernel/Modules/AgentITSMSLAZoom.pm
    $Self->{Translation}->{'operational'} = 'оперативни';
    $Self->{Translation}->{'warning'} = 'упозорење';
    $Self->{Translation}->{'incident'} = 'инцидент';

    # Perl Module: Kernel/Modules/AgentITSMServicePrint.pm
    $Self->{Translation}->{'No ServiceID is given!'} = 'Није дат ServiceID!';
    $Self->{Translation}->{'ServiceID %s not found in database!'} = 'ServiceID "%s" није нађен у бази података!';
    $Self->{Translation}->{'Current Incident State'} = 'Тренутно стање инцидента';

    # Perl Module: Kernel/Output/HTML/LinkObject/Service.pm
    $Self->{Translation}->{'Incident State'} = 'Стање инцидента';

    # Database XML Definition: ITSMCore.sopm
    $Self->{Translation}->{'Operational'} = 'Оперативни';
    $Self->{Translation}->{'Incident'} = 'Инцидент';
    $Self->{Translation}->{'End User Service'} = 'Сервис за крајњег корисника';
    $Self->{Translation}->{'Front End'} = 'Приступни крај';
    $Self->{Translation}->{'Back End'} = 'Позадина';
    $Self->{Translation}->{'IT Management'} = 'ИТ управљање';
    $Self->{Translation}->{'Reporting'} = 'Извештавање';
    $Self->{Translation}->{'IT Operational'} = 'IT оперативно';
    $Self->{Translation}->{'Demonstration'} = 'Демонстрација';
    $Self->{Translation}->{'Project'} = 'Пројекат';
    $Self->{Translation}->{'Underpinning Contract'} = 'У основи уговора';
    $Self->{Translation}->{'Other'} = 'Друго';
    $Self->{Translation}->{'Availability'} = 'Доступност';
    $Self->{Translation}->{'Response Time'} = 'Време одговора';
    $Self->{Translation}->{'Recovery Time'} = 'Време опоравка';
    $Self->{Translation}->{'Resolution Rate'} = 'Стопа решавања';
    $Self->{Translation}->{'Transactions'} = 'Трансакције';
    $Self->{Translation}->{'Errors'} = 'Грешке';

    # SysConfig
    $Self->{Translation}->{'A precentage value of the minimal translation progress per language, to be usable for documentations.'} =
        '';
    $Self->{Translation}->{'Access repos via http or https.'} = '';
    $Self->{Translation}->{'Autoloading of Znuny4OTRSRepo extensions.'} = '';
    $Self->{Translation}->{'Backend module registration for the config conflict check module.'} =
        '';
    $Self->{Translation}->{'Backend module registration for the file conflict check module.'} =
        '';
    $Self->{Translation}->{'Backend module registration for the function redefine check module.'} =
        '';
    $Self->{Translation}->{'Backend module registration for the manual set module.'} = '';
    $Self->{Translation}->{'Block hooks to be created for BS ad removal.'} = '';
    $Self->{Translation}->{'Block hooks to be created for package manager output filter.'} =
        '';
    $Self->{Translation}->{'Branch View commit limit'} = 'Ограничење броја комитова у приказу гране';
    $Self->{Translation}->{'CodePolicy'} = '';
    $Self->{Translation}->{'Commit limit per page for Branch view screen'} = 'Ограничење броја комитова по страни у екрану приказа гране';
    $Self->{Translation}->{'Create analysis file'} = '';
    $Self->{Translation}->{'Creates a analysis file from this ticket and sends to Znuny.'} =
        '';
    $Self->{Translation}->{'Creates a analysis file from this ticket.'} = '';
    $Self->{Translation}->{'Define private addon repos.'} = '';
    $Self->{Translation}->{'Defines the filter that processes the HTML templates.'} = '';
    $Self->{Translation}->{'Defines the test module for checking code policy.'} = '';
    $Self->{Translation}->{'Definition of GIT clone/push URL Prefix.'} = 'Дефиниција адресног префикса за GIT клонирање и слање.';
    $Self->{Translation}->{'Definition of a Dynamic Field: Group => Group with access to the Dynamic Fields; AlwaysVisible => Field can be removed (0|1); InformationAreaName => Name of the Widgets; InformationAreaSize => Size and position of the widgets (Large|Small); Name => Name of the Dynamic Field which should be used; Priority => Order of the Dynamic Fields; State => State of the Fields (0 = disabled, 1 = active, 2 = mandatory), FilterRelease => Regex which the repository name has to match to be displayed, FilterPackage => Regex which the package name has to match to be displayed, FilterBranch => Regex which the branch name has to match to be displayed, FilterRelease => Regex which the repelase version string has to match to be displayed.'} =
        'Дефиниција динамичког поља: Group => група за приступ динамичким пољима; AlwaysVisible => поље може бити уклоњено (0|1); InformationAreaName => наслов додатака; InformationAreaSize => величина и позиција додатака (Large|Small); Name => назив динамичког поља; Priority => редослед динамичких поља; State => статус поља (0 = онемогућено, 1 = омогућено, 2 = обавезно); FilterRepository => регуларни израз који назив складишта мора да задовољава да би поље било приказано; FilterPackage => регуларни израз које назив пакета мора да задовољава да би поље било приказано; FilterBranch => регуларни израз који назив гране мора да задовољава да би поље било приказано; FilterRelease => регуларни израз који верзија издања мора да задовољава да би поље било приказано.';
    $Self->{Translation}->{'Definition of a Dynamic Field: Group => Group with access to the Dynamic Fields; AlwaysVisible => Field can be removed (0|1); InformationAreaName => Name of the Widgets; InformationAreaSize => Size and position of the widgets (Large|Small); Name => Name of the Dynamic Field which should be used; Priority => Order of the Dynamic Fields; State => State of the Fields (0 = disabled, 1 = active, 2 = mandatory), FilterRepository => Regex which the repository name has to match to be displayed, FilterPackage => Regex which the package name has to match to be displayed, FilterBranch => Regex which the branch name has to match to be displayed, FilterRelease => Regex which the repelase version string has to match to be displayed.'} =
        'Дефиниција динамичког поља: Group => група за приступ динамичким пољима; AlwaysVisible => поље може бити уклоњено (0|1); InformationAreaName => наслов додатака; InformationAreaSize => величина и позиција додатака (Large|Small); Name => назив динамичког поља; Priority => редослед динамичких поља; State => статус поља (0 = онемогућено, 1 = омогућено, 2 = обавезно); FilterRepository => регуларни израз који назив складишта мора да задовољава да би поље било приказано; FilterPackage => регуларни израз које назив пакета мора да задовољава да би поље било приказано; FilterBranch => регуларни израз који назив гране мора да задовољава да би поље било приказано; FilterRelease => регуларни израз који верзија издања мора да задовољава да би поље било приказано.';
    $Self->{Translation}->{'Definition of external MD5 sums (key => MD5, Value => Vendor, PackageName, Version, Date).'} =
        'Дефиниција екстерних MD5 вредности (кључ => MD5, вредност => Vendor, PackageName, Version, Date).';
    $Self->{Translation}->{'Definition of mappings between public repository requests and internal OPMS repositories.'} =
        'Мапирање складишта у јавним захтевима са интерним OPMS складиштима.';
    $Self->{Translation}->{'Definition of package states.'} = 'Дефиниција стања пакета.';
    $Self->{Translation}->{'Definition of renamed OPMS packages.'} = 'Дефиниција OPMS пакета са промењеним именом.';
    $Self->{Translation}->{'Directory, which is used by Git to cache repositories.'} = '';
    $Self->{Translation}->{'Directory, which is used by Git to store temporary data.'} = '';
    $Self->{Translation}->{'Directory, which is used by Git to store working copies.'} = '';
    $Self->{Translation}->{'Disable online repositories.'} = '';
    $Self->{Translation}->{'Do not log git ssh connection authorization results for these users. Useful for automated stuff.'} =
        'Искључи бележење ауторизација приликом остваривања Git SSH конекција за ове кориснике. Корисно за аутоматизацију.';
    $Self->{Translation}->{'Dynamic Fields Screens'} = '';
    $Self->{Translation}->{'DynamicFieldScreen'} = '';
    $Self->{Translation}->{'Export all available public keys to authorized_keys file.'} = 'Извези све доступне јавне кључеве у датотеку authorized_keys.';
    $Self->{Translation}->{'Export all relevant releases to ftp server.'} = 'Извоз свих релевантних издања на FTP сервер.';
    $Self->{Translation}->{'Frontend module registration for the OPMS object in the agent interface.'} =
        'Модул регистрације за OPMS објекат у интерфејсу оператера.';
    $Self->{Translation}->{'Frontend module registration for the PublicOPMSRepository object in the public interface.'} =
        'Модул регистрације за PublicOPMSRepository објекат у јавном интерфејсу.';
    $Self->{Translation}->{'Frontend module registration for the PublicOPMSRepositoryLookup object in the public interface.'} =
        'Модул регистрације за PublicOPMSRepositoryLookup објекат у јавном интерфејсу.';
    $Self->{Translation}->{'Frontend module registration for the PublicOPMSTestBuild object in the public interface.'} =
        'Модул регистрације за PublicOPMSTestBuild објекат у јавном интерфејсу.';
    $Self->{Translation}->{'Frontend module registration for the PublicPackageVerification object in the public interface.'} =
        'Модул регистрације за PublicPackageVerification објекат у јавном интерфејсу.';
    $Self->{Translation}->{'Frontend module registration for the admin interface.'} = '';
    $Self->{Translation}->{'GIT Author registration.'} = 'Регистрација Git аутора.';
    $Self->{Translation}->{'Generate HTML comment hooks for the specified blocks so that filters can use them.'} =
        '';
    $Self->{Translation}->{'Generate documentations once per night.'} = '';
    $Self->{Translation}->{'Git'} = 'Git';
    $Self->{Translation}->{'Git Management'} = 'Git управљање';
    $Self->{Translation}->{'Git Repository'} = '';
    $Self->{Translation}->{'Group, whose members have delete admin permissions in OPMS.'} = 'Група чији чланови имају дозволу за брисање у OPMS.';
    $Self->{Translation}->{'Group, whose members have repository admin permissions in OPMS.'} =
        'Група чији чланови имају администраторске дозволе у OPMS.';
    $Self->{Translation}->{'Group, whose members will see CI test result information in OPMS screens.'} =
        '';
    $Self->{Translation}->{'Groups an authenticated user (by user login and password) must be member of to build test packages via the public interface.'} =
        'Групе у којима регистровани корисник (по корисничком имену и лозинци) мора бити члан да би имао дозволу за креирање тест издања пакета у јавном интерфејсу.';
    $Self->{Translation}->{'Groups which will be set during git project creation processes while adding OPMS repositories.'} =
        'Групе које ће бити подешене приликом креирања GIT пројекта у случају додавања OPMS складишта.';
    $Self->{Translation}->{'Manage dynamic field in screens.'} = '';
    $Self->{Translation}->{'Manage your public SSH key(s) for Git access here. Make sure to save this preference when you add a new key.'} =
        'Уредите своје јавне SSH кључеве за Git приступ. Обратите пажњу да морате сачувати ово подешавање приликом додавања новог кључа.';
    $Self->{Translation}->{'Module to generate statistics about the added code lines.'} = 'Модул за генерисање статистика о броју додатих линија кода.';
    $Self->{Translation}->{'Module to generate statistics about the growth of code.'} = 'Модул за генерисање статистика о увећању кода.';
    $Self->{Translation}->{'Module to generate statistics about the number of git commits.'} =
        'Модул за генерисање статистика о броју Git комитова.';
    $Self->{Translation}->{'Module to generate statistics about the removed code lines.'} = 'Модул за генерисање статистика о броју уклоњених линија кода.';
    $Self->{Translation}->{'OPMS'} = 'OPMS';
    $Self->{Translation}->{'Only users who have rw permissions in one of these groups may access git.'} =
        'Само корисници који имају rw дозволу у једној од ових група имаће Git приступ.';
    $Self->{Translation}->{'Option to set a package compatibility manually.'} = '';
    $Self->{Translation}->{'Parameters for the pages in the BranchView screen.'} = 'Параметри за странице у екрану приказа гране.';
    $Self->{Translation}->{'Pre-Definition of the \'GITProjectName\' Dynamic Field: Group => Group with access to the Dynamic Fields; AlwaysVisible => Field can be removed (0|1); InformationAreaName => Name of the Widgets; InformationAreaSize => Size and position of the widgets (Large|Small); Name => Name of the Dynamic Field which should be used; Priority => Order of the Dynamic Fields; State => State of the Fields (0 = disabled, 1 = active, 2 = mandatory), FilterRepository => Regex which the repository name has to match to be displayed, FilterPackage => Regex which the package name has to match to be displayed, FilterBranch => Regex which the branch name has to match to be displayed, FilterRelease => Regex which the repelase version string has to match to be displayed.'} =
        'Предефинисање динамичког поља \'GITProjectName\': Group => група за приступ динамичким пољима; AlwaysVisible => поље може бити уклоњено (0|1); InformationAreaName => наслов додатака; InformationAreaSize => величина и позиција додатака (Large|Small); Name => назив динамичког поља; Priority => редослед динамичких поља; State => статус поља (0 = онемогућено, 1 = омогућено, 2 = обавезно); FilterRepository => регуларни израз који назив складишта мора да задовољава да би поље било приказано; FilterPackage => регуларни израз које назив пакета мора да задовољава да би поље било приказано; FilterBranch => регуларни израз који назив гране мора да задовољава да би поље било приказано; FilterRelease => регуларни израз који верзија издања мора да задовољава да би поље било приказано.';
    $Self->{Translation}->{'Pre-Definition of the \'GITRepositoryName\' Dynamic Field: Group => Group with access to the Dynamic Fields; AlwaysVisible => Field can be removed (0|1); InformationAreaName => Name of the Widgets; InformationAreaSize => Size and position of the widgets (Large|Small); Name => Name of the Dynamic Field which should be used; Priority => Order of the Dynamic Fields; State => State of the Fields (0 = disabled, 1 = active, 2 = mandatory), FilterRepository => Regex which the repository name has to match to be displayed, FilterPackage => Regex which the package name has to match to be displayed, FilterBranch => Regex which the branch name has to match to be displayed, FilterRelease => Regex which the repelase version string has to match to be displayed.'} =
        'Предефинисање динамичког поља \'GITRepositoryName\': Group => група за приступ динамичким пољима; AlwaysVisible => поље може бити уклоњено (0|1); InformationAreaName => наслов додатака; InformationAreaSize => величина и позиција додатака (Large|Small); Name => назив динамичког поља; Priority => редослед динамичких поља; State => статус поља (0 = онемогућено, 1 = омогућено, 2 = обавезно); FilterRepository => регуларни израз који назив складишта мора да задовољава да би поље било приказано; FilterPackage => регуларни израз које назив пакета мора да задовољава да би поље било приказано; FilterBranch => регуларни израз који назив гране мора да задовољава да би поље било приказано; FilterRelease => регуларни израз који верзија издања мора да задовољава да би поље било приказано.';
    $Self->{Translation}->{'Pre-Definition of the \'PackageDeprecated\' Dynamic Field: Group => Group with access to the Dynamic Fields; AlwaysVisible => Field can be removed (0|1); InformationAreaName => Name of the Widgets; InformationAreaSize => Size and position of the widgets (Large|Small); Name => Name of the Dynamic Field which should be used; Priority => Order of the Dynamic Fields; State => State of the Fields (0 = disabled, 1 = active, 2 = mandatory), FilterRepository => Regex which the repository name has to match to be displayed, FilterPackage => Regex which the package name has to match to be displayed, FilterBranch => Regex which the branch name has to match to be displayed, FilterRelease => Regex which the repelase version string has to match to be displayed.'} =
        'Предефинисање динамичког поља \'PackageDeprecated\': Group => група за приступ динамичким пољима; AlwaysVisible => поље може бити уклоњено (0|1); InformationAreaName => наслов додатака; InformationAreaSize => величина и позиција додатака (Large|Small); Name => назив динамичког поља; Priority => редослед динамичких поља; State => статус поља (0 = онемогућено, 1 = омогућено, 2 = обавезно); FilterRepository => регуларни израз који назив складишта мора да задовољава да би поље било приказано; FilterPackage => регуларни израз које назив пакета мора да задовољава да би поље било приказано; FilterBranch => регуларни израз који назив гране мора да задовољава да би поље било приказано; FilterRelease => регуларни израз који верзија издања мора да задовољава да би поље било приказано.';
    $Self->{Translation}->{'Recipients that will be informed by email in case of errors.'} =
        '';
    $Self->{Translation}->{'SSH Keys for Git Access'} = 'SSH кључеви за Git приступ';
    $Self->{Translation}->{'Send analysis file'} = '';
    $Self->{Translation}->{'Sets the git clone address to be used in repository listings.'} =
        'Дефинише адресу за Git клонирање која ће бити коришћена у приказу репозиторија.';
    $Self->{Translation}->{'Sets the home directory for git repositories.'} = 'Дефинише директоријум за Git репозиторије.';
    $Self->{Translation}->{'Sets the path for the BugzillaAddComment post receive script location.'} =
        'Дефинише путању до BugzillaAddComment скрипта.';
    $Self->{Translation}->{'Sets the path for the OTRSCodePolicy  script location. It is recommended to have a separate clone of the OTRSCodePolicy module that is updated via cron.'} =
        '';
    $Self->{Translation}->{'Sets the path for the OTRSCodePolicy pre receive script location. It is recommended to have a separate clone of the OTRSCodePolicy module that is updated via cron.'} =
        'Дефинише путању до OTRSCodePolicy скрипта. Препоручено је да постоји посебан клон OTRSCodePolicy модула који се редовно освежава путем cron.';
    $Self->{Translation}->{'Show latest commits in git repositories.'} = '';
    $Self->{Translation}->{'Shows a link in the menu to go create a unit test from the current ticket.'} =
        '';
    $Self->{Translation}->{'Synchronize OPMS tables with a remote database.'} = 'Синхронизација OPMS табела са удаљеном базом.';
    $Self->{Translation}->{'The minimum version of the sphinx library.'} = '';
    $Self->{Translation}->{'The name of the sphinx theme to be used.'} = '';
    $Self->{Translation}->{'The path to the OTRS CSS file (relative below the static path).'} =
        '';
    $Self->{Translation}->{'The path to the OTRS logo (relative below the static path).'} = '';
    $Self->{Translation}->{'The path to the static folder, containing images and css files.'} =
        '';
    $Self->{Translation}->{'The path to the theme folder, containing the sphinx themes.'} = '';
    $Self->{Translation}->{'This configuration defines all possible screens to enable or disable default columns.'} =
        '';
    $Self->{Translation}->{'This configuration defines all possible screens to enable or disable dynamic fields.'} =
        '';
    $Self->{Translation}->{'This configuration defines if only valids or all (invalids) dynamic fields should be shown.'} =
        '';
    $Self->{Translation}->{'This configuration defines if the OTRS package verification should be active or disabled. If disabled all packages are shown as verified. It\'s still recommended to use only verified packages.'} =
        '';
    $Self->{Translation}->{'This configuration defines the URL to the OTRS CloudService Proxy service. The http or https prefix will be added, depending on selection SysConfig \'Znuny4OTRSRepoType\'.'} =
        '';
    $Self->{Translation}->{'This configuration registers a Output post-filter to extend package verification.'} =
        '';
    $Self->{Translation}->{'This configuration registers an OutputFilter module that removes OTRS Business Solution TM advertisements.'} =
        '';
    $Self->{Translation}->{'This configuration registers an output filter to hide online repository selection in package manager.'} =
        '';
    $Self->{Translation}->{'Tidy unprocessed release that not passed test pomules checks for a long time.'} =
        '';
    $Self->{Translation}->{'Users who have rw permissions in one of these groups are permitted to execute force pushes \'git push --force\'.'} =
        'Корисници који имају rw дозволу у једној од ових група имаће могућност извршавања команде \'git push --force\'.';
    $Self->{Translation}->{'Users who have rw permissions in one of these groups are permitted to manage projects. Additionally the members have administration permissions to the git management.'} =
        'Корисници који имају rw дозволу у једној од ових група имаће могућност управљања пројектима. Додатно припадници ће имати администрационе привилегије за Git управљање.';


    push @{ $Self->{JavaScriptStrings} // [] }, (
    );

}

1;
