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

package Kernel::System::ITSMCIPAllocate;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::System::DB',
    'Kernel::System::Log',
);

=head1 NAME

Kernel::System::ITSMCIPAllocate - C<criticality>, impact and priority allocation lib

=head1 PUBLIC INTERFACE

=cut

=head2 new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $ITSMCIPAllocateObject = $Kernel::OM->Get('Kernel::System::ITSMCIPAllocate');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {};
    bless( $Self, $Type );

    return $Self;
}

=head2 AllocateList()

return a two dimensional hash reference of allocations

    my $ListRef = $CIPAllocateObject->AllocateList(
        UserID => 1,
    );

C<$ListRef> is something like

    $ListRet = {
        '3 normal' => {
            '1 very low' => 1,
            '3 normal'   => 2,
            '4 high'     => 3,
        },
        '5 very high' => {
            '2 low'    => 3,
            '3 normal' => 4,
            '4 high'   => 5,
        },
    };

meaning that the C<Criticality> '3 normal' and the Impact '1 very low' suggest the PriorityID '1'.

=cut

sub AllocateList {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{UserID} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need UserID!',
        );
        return;
    }

    # ask database
    $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT criticality, impact, priority_id FROM cip_allocate',
    );

    # result list
    my %AllocateData;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $AllocateData{ $Row[1] }{ $Row[0] } = $Row[2];
    }

    return \%AllocateData;
}

=head2 AllocateUpdate()

update the allocation of C<criticality>, impact and priority

    my $True = $CIPAllocateObject->AllocateUpdate(
        AllocateData => $DataRef,  # 2D hash reference
        UserID       => 1,
    );

=cut

sub AllocateUpdate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(AllocateData UserID)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # check if allocate data is a hash reference
    if ( ref $Param{AllocateData} ne 'HASH' ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'AllocateData must be a 2D hash reference!',
        );
        return;
    }

    # check if allocate data is a 2D hash reference
    IMPACT:
    for my $Impact ( sort keys %{ $Param{AllocateData} } ) {

        next IMPACT if ref $Param{AllocateData}->{$Impact} eq 'HASH';

        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'AllocateData must be a 2D hash reference!',
        );
        return;
    }

    # delete old allocations
    $Kernel::OM->Get('Kernel::System::DB')->Do( SQL => 'DELETE FROM cip_allocate' );

    # insert new allocations
    for my $Impact ( sort keys %{ $Param{AllocateData} } ) {

        for my $Criticality ( sort keys %{ $Param{AllocateData}->{$Impact} } ) {

            # extract priority
            my $PriorityID = $Param{AllocateData}->{$Impact}->{$Criticality};

            # insert new allocation
            $Kernel::OM->Get('Kernel::System::DB')->Do(
                SQL => 'INSERT INTO cip_allocate '
                    . '(criticality, impact, priority_id, '
                    . 'create_time, create_by, change_time, change_by) VALUES '
                    . '(?, ?, ?, current_timestamp, ?, current_timestamp, ?)',
                Bind => [
                    \$Criticality,   \$Impact, \$PriorityID,
                    \$Param{UserID}, \$Param{UserID},
                ],
            );
        }
    }

    return 1;
}

=head2 PriorityAllocationGet()

return the priority id of a C<criticality> and an impact

    my $PriorityID = $CIPAllocateObject->PriorityAllocationGet(
        Criticality => '1 very low',
        Impact      => '3 normal',
    );

=cut

sub PriorityAllocationGet {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Criticality Impact)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get priority id from db
    $Kernel::OM->Get('Kernel::System::DB')->Prepare(
        SQL => 'SELECT priority_id FROM cip_allocate '
            . 'WHERE criticality = ? AND impact = ?',
        Bind  => [ \$Param{Criticality}, \$Param{Impact} ],
        Limit => 1,
    );

    # fetch result
    my $PriorityID;
    while ( my @Row = $Kernel::OM->Get('Kernel::System::DB')->FetchrowArray() ) {
        $PriorityID = $Row[0];
    }

    return $PriorityID;
}

1;
