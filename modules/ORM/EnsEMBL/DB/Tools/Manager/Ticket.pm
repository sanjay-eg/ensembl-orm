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

package ORM::EnsEMBL::DB::Tools::Manager::Ticket;

use strict;

use base qw(ORM::EnsEMBL::Rose::Manager);

sub object_class { 'ORM::EnsEMBL::DB::Tools::Object::Ticket' };

sub is_ticket_name_unique {
  ## @return 1 is name is unique, 0 otherwise
  my ($self, $name) = @_;
  return $self->get_objects_count('select' => ['ticket_name'], 'query' => [ 'ticket_name' => $name ]) ? 0 : 1;
}

1;