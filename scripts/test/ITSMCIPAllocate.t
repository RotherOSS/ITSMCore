# --
# OTOBO is a web-based ticketing system for service organisations.
# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# Copyright (C) 2019-2023 Rother OSS GmbH, https://otobo.de/
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

# core modules

# CPAN modules
use Test2::V0;

# OTOBO modules
use Kernel::System::UnitTest::RegisterDriver;    # Set up $Kernel::OM and $main::Self

our $Self;

my $CIPAllocateObject = $Kernel::OM->Get('Kernel::System::ITSMCIPAllocate');

# get current allocation list (UserID is needed)
my $AllocateData1 = $CIPAllocateObject->AllocateList();

# check the result
$Self->False( $AllocateData1, 'AllocateList()' );

# get current allocation list
my $AllocateData2 = $CIPAllocateObject->AllocateList(
    UserID => 1,
);

# check the result
$Self->True( $AllocateData2, 'AllocateList()' );

# check the allocation hash
my $HashOK = 1;
if ( ref $AllocateData2 ne 'HASH' ) {
    $HashOK = 0;
}

# check the allocation 2d hash
if ($HashOK) {

    IMPACT:
    for my $Impact ( sort keys %{$AllocateData2} ) {

        if ( ref $AllocateData2->{$Impact} ne 'HASH' ) {
            $HashOK = 0;
            last IMPACT;
        }

        CRITICALITY:
        for my $Criticality ( sort keys %{ $AllocateData2->{$Impact} } ) {

            if ( !$Criticality || !$AllocateData2->{$Impact}->{$Criticality} ) {
                $HashOK = 0;
                last IMPACT;
            }
        }
    }
}

# check HashOK
$Self->True( $HashOK, 'AllocateList()' );

# call PriorityAllocationGet() for one Criticality/Impact pair
if ($HashOK) {

    my ($Impact) = sort keys %{$AllocateData2};

    if ( $AllocateData2->{$Impact} ) {
        my ($Criticality) = sort keys %{ $AllocateData2->{$Impact} };

        my $ExpectedPriorityID = $AllocateData2->{$Impact}->{$Criticality};
        my $PriorityID         = $CIPAllocateObject->PriorityAllocationGet(
            Criticality => $Criticality,
            Impact      => $Impact,
        );
        $Self->Is(
            $PriorityID,
            $ExpectedPriorityID,
            'PriorityAllocationGet()',
        );
    }
}

# update the allocation hash (not all needed arguments given)
my $Success1 = $CIPAllocateObject->AllocateUpdate(
    UserID => 1,
);

# check the result
$Self->False( $Success1, 'AllocateUpdate()' );

# update the allocation hash (not all needed arguments given)
my $Success2 = $CIPAllocateObject->AllocateUpdate(
    AllocateData => $AllocateData2,
);

# check the result
$Self->False( $Success2, 'AllocateUpdate()' );

# update the allocation hash (allocation hash)
my $Success3 = $CIPAllocateObject->AllocateUpdate(
    AllocateData => {
        Test  => 'aaa',
        Test2 => 'bbb',
    },
    UserID => 1,
);

# check the result
$Self->False( $Success3, 'AllocateUpdate()' );

# update the allocation hash
my $Success4 = $CIPAllocateObject->AllocateUpdate(
    AllocateData => $AllocateData2,
    UserID       => 1,
);

# check the result
$Self->True( $Success4, 'AllocateUpdate()' );

done_testing;
