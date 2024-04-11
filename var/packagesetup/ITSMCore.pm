# --
# OTOBO is a web-based ticketing system for service organisations.
# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# Copyright (C) 2019-2024 Rother OSS GmbH, https://otobo.de/
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

package var::packagesetup::ITSMCore;

use strict;
use warnings;

use Kernel::Output::Template::Provider;
use Kernel::System::VariableCheck qw(:all);

our @ObjectDependencies = (
    'Kernel::Config',
    'Kernel::System::SysConfig',
    'Kernel::System::DB',
    'Kernel::System::DynamicField',
    'Kernel::System::GeneralCatalog',
    'Kernel::System::Group',
    'Kernel::System::ITSMCIPAllocate',
    'Kernel::System::Log',
    'Kernel::System::Priority',
    'Kernel::System::Valid',
);

=head1 NAME

var::packagesetup::ITSMCore - code to execute during package installation

=head1 PUBLIC INTERFACE

=cut

=head2 new()

create an object

    use Kernel::System::ObjectManager;
    local $Kernel::OM = Kernel::System::ObjectManager->new();
    my $CodeObject = $Kernel::OM->Get('var::packagesetup::ITSMCore');

=cut

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = bless {}, $Type;

    # Force a reload of ZZZAuto.pm and ZZZAAuto.pm to get the fresh configuration values.
    for my $Module ( sort keys %INC ) {
        if ( $Module =~ m/ZZZAA?uto\.pm$/ ) {
            delete $INC{$Module};
        }
    }

    # Create common objects with fresh default config.
    $Kernel::OM->ObjectsDiscard();

    return $Self;
}

=head2 CodeInstall()

run the code install part

    my $Result = $CodeObject->CodeInstall();

=cut

sub CodeInstall {
    my ( $Self, %Param ) = @_;

    # create dynamic fields for ITSMCore
    $Self->_CreateITSMDynamicFields();

    # set default CIP matrix
    $Self->_CIPDefaultMatrixSet();

    # add the group itsm-service
    $Self->_GroupAdd(
        Name        => 'itsm-service',
        Description => 'Group for ITSM Service mask access in the agent interface.',
    );

    # fill up empty type_id rows in service table
    $Self->_FillupEmptyServiceTypeID();

    # fill up empty criticality rows in service table
    $Self->_FillupEmptyServiceCriticality();

    # fill up empty type_id rows in sla table
    $Self->_FillupEmptySLATypeID();

    # set preferences for some GeneralCatalog entries
    # this is only necessary in CodeInstall
    # (For Upgrades this is done already in the GeneralCatalog package)
    $Self->_SetPreferences();

    return 1;
}

=head2 CodeReinstall()

run the code reinstall part

    my $Result = $CodeObject->CodeReinstall();

=cut

sub CodeReinstall {
    my ( $Self, %Param ) = @_;

    # set default CIP matrix
    $Self->_CIPDefaultMatrixSet();

    # add the group itsm-service
    $Self->_GroupAdd(
        Name        => 'itsm-service',
        Description => 'Group for ITSM Service mask access in the agent interface.',
    );

    # fill up empty type_id rows in service table
    $Self->_FillupEmptyServiceTypeID();

    # fill up empty criticality rows in service table
    $Self->_FillupEmptyServiceCriticality();

    # fill up empty type_id rows in sla table
    $Self->_FillupEmptySLATypeID();

    return 1;
}

=head2 CodeUpgrade()

run the code upgrade part

    my $Result = $CodeObject->CodeUpgrade();

=cut

sub CodeUpgrade {
    my ( $Self, %Param ) = @_;

    # set default CIP matrix
    $Self->_CIPDefaultMatrixSet();

    # fill up empty type_id rows in service table
    $Self->_FillupEmptyServiceTypeID();

    # fill up empty criticality rows in service table
    $Self->_FillupEmptyServiceCriticality();

    # fill up empty type_id rows in sla table
    $Self->_FillupEmptySLATypeID();

    # make dynamic fields internal
    $Self->_MakeDynamicFieldsInternal();

    return 1;
}

=head2 CodeUninstall()

run the code uninstall part

    my $Result = $CodeObject->CodeUninstall();

=cut

sub CodeUninstall {
    my ( $Self, %Param ) = @_;

    # deactivate the group itsm-service
    $Self->_GroupDeactivate(
        Name => 'itsm-service',
    );

    return 1;
}

=head2 _GetITSMDynamicFieldsDefinition()

returns the definition for ITSMCore related dynamic fields

    my $Result = $CodeObject->_GetITSMDynamicFieldsDefinition();

=cut

sub _GetITSMDynamicFieldsDefinition {
    my ( $Self, %Param ) = @_;

    # define all dynamic fields for ITSMCore
    my @DynamicFields = (
        {
            OldName    => 'TicketFreeText13',
            Name       => 'ITSMCriticality',
            Label      => 'Criticality',
            FieldType  => 'Dropdown',
            ObjectType => 'Ticket',
            Config     => {
                DefaultValue       => '',
                Link               => '',
                TranslatableValues => 1,
                PossibleNone       => 1,
                PossibleValues     => {
                    '1 very low'  => '1 very low',
                    '2 low'       => '2 low',
                    '3 normal'    => '3 normal',
                    '4 high'      => '4 high',
                    '5 very high' => '5 very high',
                },
            },
        },
        {
            OldName    => 'TicketFreeText14',
            Name       => 'ITSMImpact',
            Label      => 'Impact',
            FieldType  => 'Dropdown',
            ObjectType => 'Ticket',
            Config     => {
                DefaultValue       => '3 normal',
                Link               => '',
                TranslatableValues => 1,
                PossibleNone       => 1,
                PossibleValues     => {
                    '1 very low'  => '1 very low',
                    '2 low'       => '2 low',
                    '3 normal'    => '3 normal',
                    '4 high'      => '4 high',
                    '5 very high' => '5 very high',
                },
            },
        },
    );

    return @DynamicFields;
}

=head2 _CreateITSMDynamicFields()

creates all dynamic fields that are necessary for ITSMCore

    my $Result = $CodeObject->_CreateITSMDynamicFields();

=cut

sub _CreateITSMDynamicFields {
    my ( $Self, %Param ) = @_;

    my $ValidID = $Kernel::OM->Get('Kernel::System::Valid')->ValidLookup(
        Valid => 'valid',
    );

    # get all current dynamic fields
    my $DynamicFieldList = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid => 0,
    );

    # get the list of order numbers (is already sorted).
    my @DynamicfieldOrderList;
    for my $Dynamicfield ( @{$DynamicFieldList} ) {
        push @DynamicfieldOrderList, $Dynamicfield->{FieldOrder};
    }

    # get the last element from the order list and add 1
    my $NextOrderNumber = 1;
    if (@DynamicfieldOrderList) {
        $NextOrderNumber = $DynamicfieldOrderList[-1] + 1;
    }

    # get the definition for all dynamic fields for ITSM
    my @DynamicFields = $Self->_GetITSMDynamicFieldsDefinition();

    # create a dynamic fields lookup table
    my %DynamicFieldLookup;
    DYNAMICFIELD:
    for my $DynamicField ( @{$DynamicFieldList} ) {
        next DYNAMICFIELD if ref $DynamicField ne 'HASH';
        $DynamicFieldLookup{ $DynamicField->{Name} } = $DynamicField;
    }

    # create or update dynamic fields
    DYNAMICFIELD:
    for my $DynamicField (@DynamicFields) {

        my $CreateDynamicField;

        # check if the dynamic field already exists
        if ( ref $DynamicFieldLookup{ $DynamicField->{Name} } ne 'HASH' ) {
            $CreateDynamicField = 1;
        }

        # if the field exists check if the type match with the needed type
        elsif (
            $DynamicFieldLookup{ $DynamicField->{Name} }->{FieldType}
            ne $DynamicField->{FieldType}
            )
        {

            # rename the field and create a new one
            my $Success = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldUpdate(
                %{ $DynamicFieldLookup{ $DynamicField->{Name} } },
                Name   => $DynamicFieldLookup{ $DynamicField->{Name} }->{Name} . 'Old',
                UserID => 1,
            );

            $CreateDynamicField = 1;
        }

        # otherwise if the field exists and the type match, update it to the ITSM definition
        else {
            my $Success = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldUpdate(
                %{$DynamicField},
                ID         => $DynamicFieldLookup{ $DynamicField->{Name} }->{ID},
                FieldOrder => $DynamicFieldLookup{ $DynamicField->{Name} }->{FieldOrder},
                ValidID    => $ValidID,
                Reorder    => 0,
                UserID     => 1,
            );
        }

        # check if new field has to be created
        if ($CreateDynamicField) {

            # create a new field
            my $FieldID = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldAdd(
                InternalField => 1,
                Name          => $DynamicField->{Name},
                Label         => $DynamicField->{Label},
                FieldOrder    => $NextOrderNumber,
                FieldType     => $DynamicField->{FieldType},
                ObjectType    => $DynamicField->{ObjectType},
                Config        => $DynamicField->{Config},
                ValidID       => $ValidID,
                UserID        => 1,
            );
            next DYNAMICFIELD if !$FieldID;

            # increase the order number
            $NextOrderNumber++;
        }
    }

    # make dynamic fields internal
    $Self->_MakeDynamicFieldsInternal();

    return 1;
}

=head2 _SetPreferences()

    my $Result = $CodeObject->_SetPreferences()

=cut

sub _SetPreferences {
    my $Self = shift;

    my %Map = (
        Operational => 'operational',
        Warning     => 'warning',
        Incident    => 'incident',
    );

    NAME:
    for my $Name ( sort keys %Map ) {

        my $Item = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemGet(
            Name  => $Name,
            Class => 'ITSM::Core::IncidentState',
        );

        next NAME if !$Item;

        $Kernel::OM->Get('Kernel::System::GeneralCatalog')->GeneralCatalogPreferencesSet(
            ItemID => $Item->{ItemID},
            Key    => 'Functionality',
            Value  => [$Map{$Name}],
        );
    }
    return 1;
}

=head2 _CIPDefaultMatrixSet()

set the default C<CIP> matrix

    my $Result = $CodeObject->_CIPDefaultMatrixSet();

=cut

sub _CIPDefaultMatrixSet {
    my ( $Self, %Param ) = @_;

    # get current allocation list
    my $List = $Kernel::OM->Get('Kernel::System::ITSMCIPAllocate')->AllocateList(
        UserID => 1,
    );

    return if !$List;
    return if ref $List ne 'HASH';

    # set no matrix if already defined
    return if %{$List};

    # define the allocations
    my %Allocation;
    $Allocation{'1 very low'}->{'1 very low'}   = '1 very low';
    $Allocation{'1 very low'}->{'2 low'}        = '1 very low';
    $Allocation{'1 very low'}->{'3 normal'}     = '2 low';
    $Allocation{'1 very low'}->{'4 high'}       = '2 low';
    $Allocation{'1 very low'}->{'5 very high'}  = '3 normal';
    $Allocation{'2 low'}->{'1 very low'}        = '1 very low';
    $Allocation{'2 low'}->{'2 low'}             = '2 low';
    $Allocation{'2 low'}->{'3 normal'}          = '2 low';
    $Allocation{'2 low'}->{'4 high'}            = '3 normal';
    $Allocation{'2 low'}->{'5 very high'}       = '4 high';
    $Allocation{'3 normal'}->{'1 very low'}     = '2 low';
    $Allocation{'3 normal'}->{'2 low'}          = '2 low';
    $Allocation{'3 normal'}->{'3 normal'}       = '3 normal';
    $Allocation{'3 normal'}->{'4 high'}         = '4 high';
    $Allocation{'3 normal'}->{'5 very high'}    = '4 high';
    $Allocation{'4 high'}->{'1 very low'}       = '2 low';
    $Allocation{'4 high'}->{'2 low'}            = '3 normal';
    $Allocation{'4 high'}->{'3 normal'}         = '4 high';
    $Allocation{'4 high'}->{'4 high'}           = '4 high';
    $Allocation{'4 high'}->{'5 very high'}      = '5 very high';
    $Allocation{'5 very high'}->{'1 very low'}  = '3 normal';
    $Allocation{'5 very high'}->{'2 low'}       = '4 high';
    $Allocation{'5 very high'}->{'3 normal'}    = '4 high';
    $Allocation{'5 very high'}->{'4 high'}      = '5 very high';
    $Allocation{'5 very high'}->{'5 very high'} = '5 very high';

    # get the dynamic fields for ITSMCriticality and ITSMImpact
    my $DynamicFieldConfigArrayRef = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => ['Ticket'],
        FieldFilter => {
            ITSMCriticality => 1,
            ITSMImpact      => 1,
        },
    );

    # get the dynamic field value for ITSMCriticality and ITSMImpact
    my %PossibleValues;
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicFieldConfigArrayRef} ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # get PossibleValues
        $PossibleValues{ $DynamicFieldConfig->{Name} } = $DynamicFieldConfig->{Config}->{PossibleValues} || {};
    }

    # get the criticality list
    my %CriticalityList = %{ $PossibleValues{ITSMCriticality} };

    # get the impact list
    my %ImpactList = %{ $PossibleValues{ITSMImpact} };

    # get priority list
    my %PriorityList = $Kernel::OM->Get('Kernel::System::Priority')->PriorityList(
        UserID => 1,
    );
    my %PriorityListReverse = reverse %PriorityList;

    # create the allocation matrix
    my %AllocationMatrix;
    IMPACT:
    for my $Impact ( sort keys %Allocation ) {

        next IMPACT if !$ImpactList{$Impact};

        CRITICALITY:
        for my $Criticality ( sort keys %{ $Allocation{$Impact} } ) {

            next CRITICALITY if !$CriticalityList{$Criticality};

            # extract priority
            my $Priority = $Allocation{$Impact}->{$Criticality};

            next CRITICALITY if !$PriorityListReverse{$Priority};

            # extract priority id
            my $PriorityID = $PriorityListReverse{$Priority};

            $AllocationMatrix{$Impact}->{$Criticality} = $PriorityID;
        }
    }

    # save the matrix
    $Kernel::OM->Get('Kernel::System::ITSMCIPAllocate')->AllocateUpdate(
        AllocateData => \%AllocationMatrix,
        UserID       => 1,
    );

    return 1;
}

=head2 _GroupAdd()

add a group

    my $Result = $CodeObject->_GroupAdd(
        Name        => 'the-group-name',
        Description => 'The group description.',
    );

=cut

sub _GroupAdd {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Name Description)) {
        if ( !$Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!",
            );
            return;
        }
    }

    # get valid list
    my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList(
        UserID => 1,
    );
    my %ValidListReverse = reverse %ValidList;

    # get list of all groups
    my %GroupList = $Kernel::OM->Get('Kernel::System::Group')->GroupList();

    # reverse the group list for easier lookup
    my %GroupListReverse = reverse %GroupList;

    # check if group already exists
    my $GroupID = $GroupListReverse{ $Param{Name} };

    # reactivate the group
    if ($GroupID) {

        # get current group data
        my %GroupData = $Kernel::OM->Get('Kernel::System::Group')->GroupGet(
            ID     => $GroupID,
            UserID => 1,
        );

        # reactivate group
        $Kernel::OM->Get('Kernel::System::Group')->GroupUpdate(
            %GroupData,
            ValidID => $ValidListReverse{valid},
            UserID  => 1,
        );

        return 1;
    }

    # add the group
    else {
        return if !$Kernel::OM->Get('Kernel::System::Group')->GroupAdd(
            Name    => $Param{Name},
            Comment => $Param{Description},
            ValidID => $ValidListReverse{valid},
            UserID  => 1,
        );
    }

    # lookup the new group id
    my $NewGroupID = $Kernel::OM->Get('Kernel::System::Group')->GroupLookup(
        Group  => $Param{Name},
        UserID => 1,
    );

    # add user root to the group
    $Kernel::OM->Get('Kernel::System::Group')->GroupMemberAdd(
        GID        => $NewGroupID,
        UID        => 1,
        Permission => {
            ro        => 1,
            move_into => 1,
            create    => 1,
            owner     => 1,
            priority  => 1,
            rw        => 1,
        },
        UserID => 1,
    );

    return 1;
}

=head2 _GroupDeactivate()

deactivate a group

    my $Result = $CodeObject->_GroupDeactivate(
        Name => 'the-group-name',
    );

=cut

sub _GroupDeactivate {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    if ( !$Param{Name} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => 'Need Name!',
        );
        return;
    }

    # lookup group id
    my $GroupID = $Kernel::OM->Get('Kernel::System::Group')->GroupLookup(
        Group => $Param{Name},
    );

    return if !$GroupID;

    # get valid list
    my %ValidList = $Kernel::OM->Get('Kernel::System::Valid')->ValidList(
        UserID => 1,
    );
    my %ValidListReverse = reverse %ValidList;

    # get current group data
    my %GroupData = $Kernel::OM->Get('Kernel::System::Group')->GroupGet(
        ID     => $GroupID,
        UserID => 1,
    );

    # deactivate group
    $Kernel::OM->Get('Kernel::System::Group')->GroupUpdate(
        %GroupData,
        ValidID => $ValidListReverse{invalid},
        UserID  => 1,
    );

    return 1;
}

=head2 _FillupEmptyServiceTypeID()

fill up empty entries in the type_id column of the service table

    my $Result = $CodeObject->_FillupEmptyServiceTypeID();

=cut

sub _FillupEmptyServiceTypeID {
    my ( $Self, %Param ) = @_;

    # get service type list
    my $ServiceTypeList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::Service::Type',
    );

    # error handling
    if ( !$ServiceTypeList || ref $ServiceTypeList ne 'HASH' || !%{$ServiceTypeList} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't find any item in general catalog class ITSM::Service::Type!",
        );
        return;
    }

    # sort ids
    my @ServiceTypeKeyList = sort keys %{$ServiceTypeList};

    # update type_id
    return $Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => "UPDATE service
            SET type_id = ?
            WHERE type_id = 0
            OR type_id IS NULL",
        Bind => [ \$ServiceTypeKeyList[0] ],
    );
}

=head2 _FillupEmptyServiceCriticality()

fill up empty entries in the C<criticality> column of the service table

    my $Result = $CodeObject->_FillupEmptyServiceCriticality();

=cut

sub _FillupEmptyServiceCriticality {
    my ( $Self, %Param ) = @_;

    # get the dynamic fields for ITSMCriticality
    my $DynamicFieldConfigArrayRef = $Kernel::OM->Get('Kernel::System::DynamicField')->DynamicFieldListGet(
        Valid       => 1,
        ObjectType  => ['Ticket'],
        FieldFilter => {
            ITSMCriticality => 1,
        },
    );

    # get the dynamic field value for ITSMCriticality and ITSMImpact
    my %PossibleValues;
    DYNAMICFIELD:
    for my $DynamicFieldConfig ( @{$DynamicFieldConfigArrayRef} ) {
        next DYNAMICFIELD if !IsHashRefWithData($DynamicFieldConfig);

        # get PossibleValues
        $PossibleValues{ $DynamicFieldConfig->{Name} } = $DynamicFieldConfig->{Config}->{PossibleValues} || {};
    }

    # get the criticality list
    my @CriticalityKeyList = sort keys %{ $PossibleValues{ITSMCriticality} };

    # error handling
    if ( !@CriticalityKeyList ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  =>
                "Can't find any possible values for ITSMCriticality in dynamic field configuration!",
        );
        return;
    }

    # update criticality with the first criticality entry
    return $Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => "UPDATE service
            SET criticality = ?
            WHERE criticality = ''
            OR criticality IS NULL",
        Bind => [ \$CriticalityKeyList[0] ],
    );
}

=head2 _FillupEmptySLATypeID()

fill up empty entries in the type_id column of the sla table

    my $Result = $CodeObject->_FillupEmptySLATypeID();

=cut

sub _FillupEmptySLATypeID {
    my ( $Self, %Param ) = @_;

    # get sla type list
    my $SLATypeList = $Kernel::OM->Get('Kernel::System::GeneralCatalog')->ItemList(
        Class => 'ITSM::SLA::Type',
    );

    # error handling
    if ( !$SLATypeList || ref $SLATypeList ne 'HASH' || !%{$SLATypeList} ) {
        $Kernel::OM->Get('Kernel::System::Log')->Log(
            Priority => 'error',
            Message  => "Can't find any item in general catalog class ITSM::SLA::Type!",
        );
        return;
    }

    # sort ids
    my @SLATypeKeyList = sort keys %{$SLATypeList};

    # update type_id
    return $Kernel::OM->Get('Kernel::System::DB')->Do(
        SQL => "UPDATE sla
            SET type_id = ?
            WHERE type_id = 0
            OR type_id IS NULL",
        Bind => [ \$SLATypeKeyList[0] ],
    );
}

=head2 _MakeDynamicFieldsInternal()

Converts the dynamic fields to internal fields, which means that they can not be deleted in the admin interface.

    my $Result = $CodeObject->_MakeDynamicFieldsInternal();

=cut

sub _MakeDynamicFieldsInternal {
    my ( $Self, %Param ) = @_;

    # get the definition for all dynamic fields for ITSM
    my @DynamicFields = $Self->_GetITSMDynamicFieldsDefinition();

    for my $DynamicField (@DynamicFields) {

        # set as internal field
        $Kernel::OM->Get('Kernel::System::DB')->Do(
            SQL => 'UPDATE dynamic_field
                SET internal_field = 1
                WHERE name = ?',
            Bind => [
                \$DynamicField->{Name},
            ],
        );
    }
    return 1;
}

1;
