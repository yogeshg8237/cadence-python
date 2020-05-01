git clone https://github.com/temporalio/temporal-proto.git temporal-proto/temporal/proto
cd temporal-proto
find . -name '*.proto'|gxargs -I % gsed -i -E '/.*google.*/! s/import "/import "temporal\/proto\//' %
python -m grpc_tools.protoc -I .  --python_out=.. --grpc_python_out=.. `find . -name '*.proto'`
