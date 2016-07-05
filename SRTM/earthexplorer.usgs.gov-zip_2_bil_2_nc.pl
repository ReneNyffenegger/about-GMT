#!/usr/bin/perl
#
#   http://earthexplorer.usgs.gov offers (bulk-) downloads of zip
#   files containing SRTM digital elevation models with a resulution
#   of 1 arc second.
#
#   This script converts these ZIP files into a
#   suitable format for GMT (general mapping tool).
#   
#   The ZIP files must have been previously bulk downloaded or
#   cp'ied into »$zip_dir«.
#
#   These ZIP files contains four files:  a .bil, a .hdr
#   a .blw and a .prj file.
#   Only the .bil file is of interest.
#   This .bil is extracted into »$bil_dir«.
#
#   Finally, xyz2grd (of the GMT tool suite) is used to
#   convert the .bil file into the netCDF .nc file which
#   is placed into »$nc_dir«.

use warnings;
use strict;

use File::Basename;

die usage() if (@ARGV < 3);

my $zip_dir = shift;
my $bil_dir = shift;
my $nc_dir  = shift;

die "$zip_dir is not a directory" unless -d $zip_dir;
die "$bil_dir is not a directory" unless -d $bil_dir;
die  "$nc_dir is not a directory" unless -d $nc_dir;

for my $zip_file_with_path (glob ("$zip_dir/*.zip")) {

  my ($zip_file) = fileparse($zip_file_with_path);

 (my $bil_file = $zip_file) =~ s/_bil\.zip$/.bil/;

  my $bil_file_with_path = "$bil_dir/$bil_file";


  if (-f $bil_file_with_path) {
#    print "$bil_file already exists\n";
  }
  else {
     
     print "$bil_file doesn't exists\n";
     readpipe "unzip $zip_file_with_path $bil_file -d $bil_dir";
  }

}

for my $bil_file (glob ("$bil_dir/*.bil")) {

  my ($file_without_suffix) = fileparse($bil_file, '.bil');

  my $nc_file_with_path = "$nc_dir/$file_without_suffix.nc";

  if (-f $nc_file_with_path) {
    print "$nc_file_with_path already exists\n";
    next;
  }

  if ($file_without_suffix =~ /^(n|s)(\d\d)_(e|w)(\d\d\d)_1arc_v3$/) {

    my $ns = $1;
    my $ns_val = $2;
    my $we = $3;
    my $we_val = $4;

    my ($x_from, $x_to, $y_from, $y_to);
    if ($ns eq 'n') {
      $y_from = int $ns_val;
      $y_to   = $y_from + 1;
    }
    else {die "TODO south files!"};
    if ($we eq 'e') {
      $x_from = int $we_val;
      $x_to   = $x_from + 1;
    }
    else {
      $x_from = - int $we_val;
      $x_to   =   $x_from + 1;
    };

    print readpipe ("xyz2grd $bil_file -G$nc_file_with_path -I1s -di-32768 -R$x_from/$x_to/$y_from/$y_to -ZTLh");

  }
  else {
    die "$file_without_suffix didn't match";
  }
}

sub usage {

  return "

  earthexplorer.usgs.gov-zip_2_bil_2_nc.pl   zip-dir  bil-dir  nc-dir

";

}
