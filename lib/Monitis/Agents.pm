package Monitis::Agents;

use warnings;
use strict;
require Carp;

use base 'Monitis';

sub get {
    my ($self, @params) = @_;

    my @mandatory = qw//;
    my @optional  = qw/keyRegExp/;

    my $params = $self->prepare_params(\@params, \@mandatory, \@optional);

    return $self->api_get('agents' => $params);
}

sub get_agent_info {
    my ($self, @params) = @_;

    my @mandatory = qw/agentId/;
    my @optional  = qw/loadTests/;

    my $params = $self->prepare_params(\@params, \@mandatory, \@optional);

    return $self->api_get('agentInfo' => $params);
}

sub get_all_agents_snapshot {
    my ($self, @params) = @_;

    my @mandatory = qw//;
    my @optional  = qw/platform timezone tag/;

    my $params = $self->prepare_params(\@params, \@mandatory, \@optional);

    return $self->api_get('allAgentsSnapshot' => $params);
}

sub get_agents_snapshot {
    my ($self, @params) = @_;

    my @mandatory = qw/agentKey/;
    my @optional  = qw/timezone/;

    my $params = $self->prepare_params(\@params, \@mandatory, \@optional);

    return $self->api_get('agentSnapshot' => $params);
}

sub delete {
    my ($self, @params) = @_;

    my @mandatory = qw//;
    my @optional  = qw/agentIds keyRegExp/;

    my $params = $self->prepare_params(\@params, \@mandatory, \@optional);

    return $self->api_post('deleteAgents' => $params);
}

__END__

=head1 NAME

Monitis::Agents - [One line description of module's purpose here]

=head1 SYNOPSIS

    use Monitis::Agents;

=head1 DESCRIPTION

=head1 ATTRIBUTES

L<Monitis::Agents> implements following attributes:

=head1 METHODS

L<Monitis::Agents> implements following methods:

=head2 get

    my $response = $api->agents->get;

Retuirns list of agents.

Optional parameters:

    keyRegExp

Normal response is:

    [   {   "key"       => "LinAgent_11",
            "platform"  => "LINUX",
            "status"    => "running",
            "id"        => 1985,
            "processes" => [
                "init",    # ...
            ],
            "drives" => [
                "\/(\/dev\/sda3|ext3)",

                # ...
            ]
        }
    ]

=head2 get_agent_info

    my $response = $api->agents->get_agent_info;

Retuirns agent info.

Mandatory parameters:

    agentId

Optional parameters:

    loadTests

Response:

    Please, refer to documentation:

    L<http://monitis.com/api/api.html#getAgentInfo>

=head2 get_all_agents_snapshot

    my $response = $api->agents->get_all_agents_snapshot;

Retuirns all agent info.

Optional parameters:

    platform timezone tag

Response:

    Please, refer to documentation:

    L<http://monitis.com/api/api.html#getAllAgentsSnapshot>

=head2 get_agents_snapshot

    my $response =
      $api->agents->get_agents_snapshot(agentKey => 'linux_test_aent');

Retuirns agent info.

Mandatory parameters:

    agentKey

Optional parameters:

    timezone

Response:

    Please, refer to documentation:

    L<http://monitis.com/api/api.html#getAgentSnapshot>

=head2 delete

    my $response = $api->agents->delete(agentIds => '12345;12346');

Delete agents.

Mandatory parameters:

    agentIds or keyRegExp required

Normal response is:

    {"status" => "ok"}

=head1 SEE ALSO

L<Monitis>

Official API page: L<http://monitis.com/api/api.html#addPage>


=head1 AUTHOR

Yaroslav Korshak  C<< <ykorshak@gmail.com> >>
Alexandr Babenko  C<< <foxcool@cpan.org> >>


=head1 LICENCE AND COPYRIGHT

Copyright (C) 2006-2011, Monitis Inc.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.
