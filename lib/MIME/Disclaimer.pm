package MIME::Disclaimer;

use 5.014;
use warnings;
use Const::Fast;

use base 'MIME::Signature';

our $VERSION = '0.16';

const my $NEWLINE   => "\n";
const my $DELIMITER => "\n" . '-' x 10 . "\n";

sub new {
  my $class = shift;
  my $self = $class->SUPER::new(@_);

  $self->enriched_delimiter($DELIMITER);
  $self->html_delimiter('<br /><hr /><br />');
  $self->plain_delimiter($DELIMITER);

  return $self;
}

sub _signature {
    my ( $self, $type ) = @_;
    defined( my $signature = $self->$type ) or return;
    my $delimiter_method = $type . '_delimiter';
    my $delimiter = $self->$delimiter_method;

    return join ($NEWLINE, ($delimiter, $sigature, $delimiter));
}

sub add {
  my $self = shift;

  $self->prepend;
  $self->append;
}

1;

__END__

=head1 SYNOPSIS

  my $md = MIME::Disclaimer->new(
    plain => 'Disclaim this',
  );

  $md->parse( \*STDIN );
  $md->add;

  $md->entity->print;

=head1 DESCRIPTION

This module adds disclaimer text to both the beginning and ending of an
email message. It is a subclass of L<MIME::Signature>.

=head1 METHODS

=over 4

=item C<add>

Adds the disclaimer text to both the beginning and end of the message with the
L<MIME::Signature::prepend> and L<MIME::Signature::append>.

=back

=head1 AUTHOR

Chris Scheller <schelcj@pobox.com>

=head1 BUGS

Please report any bugs or feature requests to C<bug-mime-signature at rt.cpan.org>, or through
the web interface at L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=MIME-Signature>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc MIME::Signature

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<https://rt.cpan.org/NoAuth/Bugs.html?Dist=MIME-Signature>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/MIME-Signature>

=item * CPAN Ratings

L<https://cpanratings.perl.org/d/MIME-Signature>

=item * Search CPAN

L<https://metacpan.org/release/MIME-Signature>

=back

=head1 ACKNOWLEDGEMENTS

=head1 LICENSE AND COPYRIGHT

Copyright 2019 Chris SCheller

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
