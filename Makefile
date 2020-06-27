default: help

.PHONY: models flowty clean

models: DST_FOLDER:=flowty_sdk_py/models
models: #: Compile protobuf files
	@echo "Create models from protobuf"
	mkdir -p $(DST_FOLDER)
	protoc --proto_path=OpenWorkflow/proto -I/usr/local/include --python_out=$(DST_FOLDER) OpenWorkflow/proto/workflow.proto

clean: DST_FOLDER:=flowty_sdk_py/models
clean:			#: Delete generated files from protoc
	@echo "Cleaning up"
	rm $(DST_FOLDER)/*_pb2.py 

help:			#: Show help topics
	@grep "#:" Makefile* | grep -v "@grep" | sort | sed "s/\([A-Za-z_ -]*\):.*#\(.*\)/$$(tput setaf 3)\1$$(tput sgr0)\2/g"
