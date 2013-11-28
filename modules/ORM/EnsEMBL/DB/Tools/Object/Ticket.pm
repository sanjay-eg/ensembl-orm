=head1 LICENSE

Copyright [1999-2013] Wellcome Trust Sanger Institute and the EMBL-European Bioinformatics Institute

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut

package ORM::EnsEMBL::DB::Tools::Object::Ticket;

use strict;
use warnings;

use ORM::EnsEMBL::DB::Tools::Object::Job; # for foreign key initialisation

use base qw(ORM::EnsEMBL::DB::Tools::Object);

__PACKAGE__->meta->setup(
  table           => 'ticket',
  auto_initialize => []
);

{
  my $job_relationship = __PACKAGE__->meta->relationship('job');

  $job_relationship->method_name('count', 'job_count');
  $job_relationship->make_methods(
    preserve_existing => 1,
    types             => [ 'count' ]
  );
}

1;
