=head1 LICENSE

Copyright [1999-2015] Wellcome Trust Sanger Institute and the EMBL-European Bioinformatics Institute
Copyright [2016] EMBL-European Bioinformatics Institute

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

package ORM::EnsEMBL::DB::Healthcheck::Object::Session;

use strict;
use warnings;

use parent qw(ORM::EnsEMBL::DB::Healthcheck::Object);

__PACKAGE__->meta->setup(
  table         => 'session',

  columns       => [
    session_id        => {type => 'serial', primary_key => 1, not_null => 1}, 
    db_release        => {type => 'integer'},
    start_time        => {type => 'datetime'},
    end_time          => {type => 'datetime'},
    host              => {type => 'varchar', 'length' => '255'},
    config            => {type => 'text'}
  ],

  relationships => [
    report      => {
      'type'        => 'one to many',
      'class'       => 'ORM::EnsEMBL::DB::Healthcheck::Object::Report',
      'column_map'  => {'session_id' => 'last_session_id'},
    },
  ]
);

1;