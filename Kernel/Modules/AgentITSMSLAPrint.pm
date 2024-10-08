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

package Kernel::Modules::AgentITSMSLAPrint;

use strict;
use warnings;

use Kernel::Language qw(Translatable);

our $ObjectManagerDisabled = 1;

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    # get params
    my $SLAID = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => "SLAID" );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # check needed stuff
    if ( !$SLAID ) {
        return $LayoutObject->ErrorScreen(
            Message => Translatable('No SLAID is given!'),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get sla
    my %SLA = $Kernel::OM->Get('Kernel::System::SLA')->SLAGet(
        SLAID  => $SLAID,
        UserID => $Self->{UserID},
    );
    if ( !$SLA{SLAID} ) {
        return $LayoutObject->ErrorScreen(
            Message => $LayoutObject->{LanguageObject}->Translate( 'SLAID %s not found in database!', $SLAID ),
            Comment => Translatable('Please contact the administrator.'),
        );
    }

    # get config object
    my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

    # get calendar name
    if ( $SLA{Calendar} ) {
        $SLA{CalendarName} = "Calendar $SLA{Calendar} - "
            . $ConfigObject->Get( "TimeZone::Calendar" . $SLA{Calendar} . "Name" );
    }
    else {
        $SLA{CalendarName} = Translatable('Calendar Default');
    }

    # get user object
    my $UserObject = $Kernel::OM->Get('Kernel::System::User');

    # get user data (create by)
    $SLA{CreateByName} = $UserObject->UserName(
        UserID => $SLA{CreateBy},
    );

    # get user data (change by)
    $SLA{ChangeByName} = $UserObject->UserName(
        UserID => $SLA{ChangeBy},
    );

    # get PDF object
    my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

    # generate PDF output
    my %Page;

    # get maximum number of pages
    $Page{MaxPages} = $ConfigObject->Get('PDF::MaxPages');
    if ( !$Page{MaxPages} || $Page{MaxPages} < 1 || $Page{MaxPages} > 1000 ) {
        $Page{MaxPages} = 100;
    }
    $Page{MarginTop}    = 30;
    $Page{MarginRight}  = 40;
    $Page{MarginBottom} = 40;
    $Page{MarginLeft}   = 40;
    $Page{HeaderRight}  = $LayoutObject->{LanguageObject}->Translate('SLA');
    $Page{PageText}     = $LayoutObject->{LanguageObject}->Translate('Page');
    $Page{PageCount}    = 1;

    # create new PDF document
    $PDFObject->DocumentNew(
        Title  => $ConfigObject->Get('Product') . ': ' . $SLA{Name},
        Encode => $LayoutObject->{UserCharset},
    );

    # create first PDF page
    $PDFObject->PageNew(
        %Page,
        FooterRight => $Page{PageText} . ' ' . $Page{PageCount},
    );
    $Page{PageCount}++;

    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -6,
    );

    # output title
    $PDFObject->Text(
        Text     => $SLA{Name},
        FontSize => 13,
    );

    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -6,
    );

    # output "printed by"
    $PDFObject->Text(
        Text => $LayoutObject->{LanguageObject}->Translate('printed by') . ' '
            . $Self->{UserFullname} . ' '
            . $LayoutObject->{Time},
        FontSize => 9,
    );

    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -14,
    );

    # output general infos
    $Self->_PDFOutputGeneralInfos(
        Page => \%Page,
        SLA  => \%SLA,
    );

    # output detailed infos
    $Self->_PDFOutputDetailedInfos(
        Page => \%Page,
        SLA  => \%SLA,
    );

    # get datetime object
    my $DateTimeObject = $Kernel::OM->Create('Kernel::System::DateTime');

    # create file name
    my $Filename        = "sla_$SLA{Name}_" . $DateTimeObject->Format( Format => "%Y-%m-%d_%H:%M" ) . '.pdf';
    my $CleanedFilename = $Kernel::OM->Get('Kernel::System::Main')->FilenameCleanUp(
        Filename => $Filename,
        Type     => 'Attachment',
    );

    # return the PDF document
    return $LayoutObject->Attachment(
        Filename    => $CleanedFilename,
        ContentType => 'application/pdf',
        Content     => $PDFObject->DocumentOutput(),
        Type        => 'inline',
    );
}

sub _PDFOutputGeneralInfos {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Page SLA)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # create left table
    my $TableLeft = [
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('SLA') . ':',
            Value => $Param{SLA}->{Name},
        },
    ];

    # create right table
    my $TableRight = [
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Created') . ':',
            Value => $LayoutObject->Output(
                Template => '[% Data.CreateTime | Localize("TimeLong") %]',
                Data     => \%{ $Param{SLA} },
            ),
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Created by') . ':',
            Value => $Param{SLA}->{ChangeByName},
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Last changed') . ':',
            Value => $LayoutObject->Output(
                Template => '[% Data.ChangeTime | Localize("TimeLong") %]',
                Data     => \%{ $Param{SLA} },
            ),
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Last changed by') . ':',
            Value => $Param{SLA}->{ChangeByName},
        },
    ];

    my $Rows = @{$TableLeft};
    if ( @{$TableRight} > $Rows ) {
        $Rows = @{$TableRight};
    }

    my %TableParam;
    for my $Row ( 1 .. $Rows ) {
        $Row--;
        $TableParam{CellData}[$Row][0]{Content}         = $TableLeft->[$Row]->{Key};
        $TableParam{CellData}[$Row][0]{Font}            = 'ProportionalBold';
        $TableParam{CellData}[$Row][1]{Content}         = $TableLeft->[$Row]->{Value};
        $TableParam{CellData}[$Row][2]{Content}         = ' ';
        $TableParam{CellData}[$Row][2]{BackgroundColor} = '#FFFFFF';
        $TableParam{CellData}[$Row][3]{Content}         = $TableRight->[$Row]->{Key};
        $TableParam{CellData}[$Row][3]{Font}            = 'ProportionalBold';
        $TableParam{CellData}[$Row][4]{Content}         = $TableRight->[$Row]->{Value};
    }
    $TableParam{ColumnData}[0]{Width} = 50;
    $TableParam{ColumnData}[1]{Width} = 200.5;
    $TableParam{ColumnData}[2]{Width} = 4;
    $TableParam{ColumnData}[3]{Width} = 80;
    $TableParam{ColumnData}[4]{Width} = 170.5;
    $TableParam{Type}                 = 'Cut';
    $TableParam{Border}               = 0;
    $TableParam{FontSize}             = 6;
    $TableParam{BackgroundColorEven}  = '#DDDDDD';
    $TableParam{Padding}              = 1;
    $TableParam{PaddingTop}           = 3;
    $TableParam{PaddingBottom}        = 3;

    # get PDF object
    my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

    # output table
    PAGE:
    for ( $Param{Page}->{PageCount} .. $Param{Page}->{MaxPages} ) {

        # output table (or a fragment of it)
        %TableParam = $PDFObject->Table(%TableParam);

        # stop output or output next page
        last PAGE if $TableParam{State};

        $PDFObject->PageNew(
            %{ $Param{Page} },
            FooterRight => $Param{Page}->{PageText} . ' ' . $Param{Page}->{PageCount}
        );
        $Param{Page}->{PageCount}++;
    }
    return 1;
}

sub _PDFOutputDetailedInfos {
    my ( $Self, %Param ) = @_;

    # check needed stuff
    for my $Argument (qw(Page SLA)) {
        if ( !defined $Param{$Argument} ) {
            $Kernel::OM->Get('Kernel::System::Log')->Log(
                Priority => 'error',
                Message  => "Need $Argument!"
            );
            return;
        }
    }

    # get PDF object
    my $PDFObject = $Kernel::OM->Get('Kernel::System::PDF');

    # set new position
    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -15,
    );

    # get layout object
    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');

    # output headline
    $PDFObject->Text(
        Text     => $LayoutObject->{LanguageObject}->Translate('SLA'),
        Height   => 7,
        Type     => 'Cut',
        Font     => 'ProportionalBoldItalic',
        FontSize => 7,
        Color    => '#666666',
    );

    # set new position
    $PDFObject->PositionSet(
        Move => 'relativ',
        Y    => -4,
    );

    # create table
    my $Table = [
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('SLA') . ':',
            Value => $Param{SLA}->{Name},
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Type') . ':',
            Value => $LayoutObject->{LanguageObject}->Translate( $Param{SLA}->{Type} ),
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Calendar') . ':',
            Value => $LayoutObject->{LanguageObject}->Translate( $Param{SLA}->{CalendarName} ),
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('First Response Time') . ':',
            Value =>
                $LayoutObject->{LanguageObject}->Translate( $Param{SLA}->{FirstResponseTime} )
                . ' '
                . $LayoutObject->{LanguageObject}->Translate('minutes'),
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Update Time') . ':',
            Value => $LayoutObject->{LanguageObject}->Translate( $Param{SLA}->{UpdateTime} ) . ' '
                . $LayoutObject->{LanguageObject}->Translate('minutes'),
        },
        {
            Key   => $LayoutObject->{LanguageObject}->Translate('Solution Time') . ':',
            Value => $LayoutObject->{LanguageObject}->Translate( $Param{SLA}->{SolutionTime} )
                . ' '
                . $LayoutObject->{LanguageObject}->Translate('minutes'),
        },
        {
            Key => $LayoutObject->{LanguageObject}->Translate('Minimum Time Between Incidents')
                . ':',
            Value => $LayoutObject->{LanguageObject}->Translate(
                $Param{SLA}->{MinTimeBetweenIncidents},
                )
                . ' '
                . $LayoutObject->{LanguageObject}->Translate('minutes'),
        },
    ];
    my %TableParam;
    my $Rows = @{$Table};
    for my $Row ( 1 .. $Rows ) {
        $Row--;
        $TableParam{CellData}[$Row][0]{Content} = $Table->[$Row]->{Key};
        $TableParam{CellData}[$Row][0]{Font}    = 'ProportionalBold';
        $TableParam{CellData}[$Row][1]{Content} = $Table->[$Row]->{Value};
    }
    $TableParam{ColumnData}[0]{Width} = 120;
    $TableParam{ColumnData}[1]{Width} = 391;
    $TableParam{Type}                 = 'Cut';
    $TableParam{Border}               = 0;
    $TableParam{FontSize}             = 6;
    $TableParam{BackgroundColor}      = '#DDDDDD';
    $TableParam{Padding}              = 1;
    $TableParam{PaddingTop}           = 3;
    $TableParam{PaddingBottom}        = 3;

    # output table
    PAGE:
    for ( $Param{Page}->{PageCount} .. $Param{Page}->{MaxPages} ) {

        # output table (or a fragment of it)
        %TableParam = $PDFObject->Table(%TableParam);

        # stop output or output next page
        last PAGE if $TableParam{State};

        $PDFObject->PageNew(
            %{ $Param{Page} },
            FooterRight => $Param{Page}->{PageText} . ' ' . $Param{Page}->{PageCount}
        );
        $Param{Page}->{PageCount}++;
    }
    return 1;
}

1;
