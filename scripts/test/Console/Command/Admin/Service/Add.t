# --
# OTOBO is a web-based ticketing system for service organisations.
# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# Copyright (C) 2019-2023 Rother OSS GmbH, https://otobo.de/
# --
# $origin: otobo - e45f8b48199a0254676f6bd9758a5c00f670d31e - scripts/test/Console/Command/Admin/Service/Add.t
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

use strict;
use warnings;
use utf8;

# core modules

# CPAN modules
use Test2::V0;

# OTOBO modules
use Kernel::System::UnitTest::RegisterDriver;    # Set up $Kernel::OM and $main::Self

our $Self;

my $CommandObject = $Kernel::OM->Get('Kernel::System::Console::Command::Admin::Service::Add');

# get helper object
$Kernel::OM->ObjectParamAdd(
    'Kernel::System::UnitTest::Helper' => {
        RestoreDatabase => 1,
    },
);
my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

my $ParentServiceName = "ParentService" . $Helper->GetRandomID();
my $ChildServiceName  = "ChildService" . $Helper->GetRandomID();

# try to execute command without any options
my $ExitCode = $CommandObject->Execute();
$Self->Is(
    $ExitCode,
    1,
    "No options",
);

# provide minimum options
# ---
# ITSMCore
# ---
#$ExitCode = $CommandObject->Execute( '--name', $ParentServiceName );
$ExitCode = $CommandObject->Execute( '--name', $ParentServiceName, '--criticality', '3 normal', '--type', 'Demonstration' );

# ---
$Self->Is(
    $ExitCode,
    0,
    "Minimum options ( the service is added - $ParentServiceName )",
);

# same again (should fail because already exists)
# ---
# ITSMCore
# ---
#$ExitCode = $CommandObject->Execute( '--name', $ParentServiceName );
$ExitCode = $CommandObject->Execute( '--name', $ParentServiceName, '--criticality', '3 normal', '--type', 'Demonstration' );

# ---
$Self->Is(
    $ExitCode,
    1,
    "Minimum options ( service $ParentServiceName already exists )",
);

# invalid parent
# ---
# ITSMCore
# ---
#$ExitCode = $CommandObject->Execute( '--name', $ChildServiceName, '--parent-name', $ChildServiceName );
$ExitCode = $CommandObject->Execute( '--name', $ChildServiceName, '--parent-name', $ChildServiceName, '--criticality', '3 normal', '--type', 'Demonstration' );

# ---
$Self->Is(
    $ExitCode,
    1,
    "Parent service $ChildServiceName does not exist",
);

# valid parent
# ---
# ITSMCore
# ---
#$ExitCode = $CommandObject->Execute( '--name', $ChildServiceName, '--parent-name', $ParentServiceName );
$ExitCode = $CommandObject->Execute( '--name', $ChildServiceName, '--parent-name', $ParentServiceName, '--criticality', '3 normal', '--type', 'Demonstration' );

# ---
$Self->Is(
    $ExitCode,
    0,
    "Existing parent ( service is added - $ChildServiceName )",
);

# Same again (should fail because already exists).
# ---
# ITSMCore
# ---
#$ExitCode = $CommandObject->Execute( '--name', $ChildServiceName, '--parent-name', $ParentServiceName );
$ExitCode = $CommandObject->Execute( '--name', $ChildServiceName, '--parent-name', $ParentServiceName, '--criticality', '3 normal', '--type', 'Demonstration' );

# ---
$Self->Is(
    $ExitCode,
    1,
    "Existing parent ( service ${ParentServiceName}::$ChildServiceName already exists )",
);

# Parent and child service same name.
# ---
# ITSMCore
# ---
#$ExitCode = $CommandObject->Execute( '--name', $ParentServiceName, '--parent-name', $ParentServiceName );
$ExitCode
    = $CommandObject->Execute( '--name', $ParentServiceName, '--parent-name', $ParentServiceName, '--criticality', '3 normal', '--type', 'Demonstration' );

# ---
my $ServiceName = $ParentServiceName . '::' . $ParentServiceName;
$Self->Is(
    $ExitCode,
    0,
    "Parent and child service same name - $ServiceName - is created",
);

# Parent (two levels) and child same name.
# ---
# ITSMCore
# ---
#$ExitCode    = $CommandObject->Execute( '--name', $ParentServiceName, '--parent-name', $ServiceName );
$ExitCode = $CommandObject->Execute( '--name', $ParentServiceName, '--parent-name', $ServiceName, '--criticality', '3 normal', '--type', 'Demonstration' );

# ---
$ServiceName = $ServiceName . '::' . $ParentServiceName;
$Self->Is(
    $ExitCode,
    0,
    "Parent (two levels) and child service same name - $ServiceName - is created",
);

done_testing;
