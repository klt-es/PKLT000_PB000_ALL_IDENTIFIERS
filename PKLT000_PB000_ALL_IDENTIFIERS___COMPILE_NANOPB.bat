echo off
echo This script will generate source files from .proto file
IF EXIST pb_all_identifiers.pb.c (
	del pb_all_identifiers.pb.c
)
IF EXIST pb_all_identifiers.pb.h (
	del pb_all_identifiers.pb.h
)
IF EXIST NANOPB_GENERATOR_BINARY\protoc.exe (
    echo Compiled generator exist!
    start NANOPB_GENERATOR_BINARY\protoc.exe --nanopb_out=. pb_all_identifiers.proto
	start NANOPB_GENERATOR_BINARY\protoc.exe --python_out=. pb_all_identifiers.proto
    timeout 2
    IF EXIST pb_all_identifiers.pb.c (
        echo NANOPB Generation successfull!
    ) ELSE (
        echo NANOPB Something gone wrong please retry the generation!
    )
    IF EXIST pb_all_identifiers_pb2.py (
        echo PYTHON Generation successfull!
    )
) ELSE (
    echo Script requires the 'NANOPB_GENERATOR_BINARY' folder nNext to the project folder.
    echo You can download compiled generator from: https://jpa.kapsi.fi/nanopb/download/
)

pause