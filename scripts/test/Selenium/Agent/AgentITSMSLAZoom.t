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
use utf8;

# core modules

# CPAN modules
use Test2::V0;

# OTOBO modules
use Kernel::System::UnitTest::RegisterDriver;    # Set up $Kernel::OM and $main::Self
use Kernel::System::UnitTest::Selenium;

our $Self;

# get selenium object
my $Selenium = Kernel::System::UnitTest::Selenium->new;

$Selenium->RunTest(
    sub {

        # get helper object
        my $Helper = $Kernel::OM->Get('Kernel::System::UnitTest::Helper');

        # create and log in test user
        my $TestUserLogin = $Helper->TestUserCreate(
            Groups => [ 'admin', 'itsm-service' ],
        ) || die "Did not get test user";

        $Selenium->Login(
            Type     => 'Agent',
            User     => $TestUserLogin,
            Password => $TestUserLogin,
        );

        # create test SLA
        my $SLAName = "SLA" . $Helper->GetRandomID();
        my $SLAID   = $Kernel::OM->Get('Kernel::System::SLA')->SLAAdd(
            Name              => $SLAName,
            ValidID           => 1,
            FirstResponseTime => 120,
            UpdateTime        => 180,
            SolutionTime      => 580,
            Comment           => 'Selenium test SLA',
            TypeID            => 2,
            UserID            => 1,
        );
        $Self->True(
            $SLAID,
            "SLA is created - ID $SLAID",
        );

        # get script alias
        my $ScriptAlias = $Kernel::OM->Get('Kernel::Config')->Get('ScriptAlias');

        # navigate to AgentITSMSLAZoom screen with no SLAID, expecting error message screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMSLAZoom;SLAID=");
        $Self->True(
            index( $Selenium->get_page_source(), 'No SLAID is given!' ) > -1,
            "Error message without SLA ID - found",
        );

        # navigate to AgentITSMSLAZoom screen with wrong SLAID, expecting error message screen
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMSLAZoom;SLAID=asd");
        $Self->True(
            index( $Selenium->get_page_source(), 'SLAID asd not found in database!' ) > -1,
            "Error message with wrong SLA ID - found",
        );

        # navigate to AgentITSMSLAZoom screen with correct SLAID
        $Selenium->VerifiedGet("${ScriptAlias}index.pl?Action=AgentITSMSLAZoom;SLAID=$SLAID");

        # check for AgentITSMSLAZoom fields
        my @ElementList = ( 'ContentColumn', 'SidebarColumn' );
        for my $ElementCheck (@ElementList) {
            my $Element = $Selenium->find_element( ".$ElementCheck", 'css' );
            $Element->is_enabled();
            $Element->is_displayed();
        }
        $Self->True(
            index( $Selenium->get_page_source(), "SLA: $SLAName" ) > -1,
            "SLA: $SLAName - found",
        );

        # check for respond times
        my @RespondTime = ( 120, 180, 580 );
        for my $Time (@RespondTime) {
            $Self->True(
                index( $Selenium->get_page_source(), $Time . " minutes" ) > -1,
                "Respond $Time minutes - found",
            );
        }

        # delete test SLA
        my $Success = $Kernel::OM->Get('Kernel::System::DB')->Do(
            SQL => "DELETE FROM sla WHERE id = $SLAID",
        );
        $Self->True(
            $Success,
            "SLA is deleted - ID $SLAID",
        );

        # make sure cache is correct
        $Kernel::OM->Get('Kernel::System::Cache')->CleanUp(
            Type => 'SLA'
        );
    }
);

done_testing;
