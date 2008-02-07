  package Package::Subroutine::Object
# ***********************************
; our $VERSION='0.01'
# *******************

; require Exporter
; our @ISA=qw/Exporter/
; our @EXPORT=()
; our @EXPORT_OK=('applymethodhash')

; sub applymethodhash
    { my ($obj,%ms) = @_
    ; for my $m (keys %ms)
        { $obj->$m($ms{$_})
        }
    ; return $obj
    }
    
; 1

__END__


