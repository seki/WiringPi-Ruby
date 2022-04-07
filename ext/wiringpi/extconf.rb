require 'mkmf'

$srcs = ['wiringpi_wrap.c']
$objs = $srcs.map{ |file| file.sub('.c','.o') }

have_library("rt", "shm_open")
have_library("wiringPi", "pinMode")
have_library("wiringPiDev", "lcd128x64clear")
if have_library("wiringPiDev", "softServoWrite")
  $defs << "-DHAVE_softServoWrite"
end
if !have_library("wiringPiDev", "ads1115Setup")
  $defs << "-DTINKER_BOARD"
end

create_makefile('wiringpi/wiringpi')    
