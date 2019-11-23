#!/bin/bash

source run_test.sh

# Inject environment variables into tests
inject_variables testfiles/xgboost-mnist-trainingjob.yaml
inject_variables testfiles/spot-xgboost-mnist-trainingjob.yaml
inject_variables testfiles/kmeans_west2_tf_neo.yaml
inject_variables testfiles/xgboost-mnist-custom-endpoint.yaml
inject_variables testfiles/efs-xgboost-mnist-trainingjob.yaml
inject_variables testfiles/fsx-xgboost-mnist-trainingjob.yaml
inject_variables testfiles/xgboost-mnist-hpo.yaml
inject_variables testfiles/spot-xgboost-mnist-hpo.yaml
inject_variables testfiles/xgboost-mnist-hpo-custom-endpoint.yaml
inject_variables testfiles/xgboost-mnist-batchtransform.yaml

# Add all your new sample files below
# Run test
# Format: `run_test testfiles/<Your test file name>`
run_test testfiles/xgboost-mnist-trainingjob.yaml
run_test testfiles/spot-xgboost-mnist-trainingjob.yaml
run_test testfiles/kmeans_west2_tf_neo.yaml
run_test testfiles/xgboost-mnist-custom-endpoint.yaml
run_test testfiles/efs-xgboost-mnist-trainingjob.yaml
run_test testfiles/fsx-xgboost-mnist-trainingjob.yaml
run_test testfiles/xgboost-mnist-hpo.yaml
run_test testfiles/spot-xgboost-mnist-hpo.yaml
run_test testfiles/xgboost-mnist-hpo-custom-endpoint.yaml
run_test testfiles/xgboost-mnist-batchtransform.yaml

# Verify test
# Format: `verify_test <type of job> <Job's metadata name> <timeout to complete the test>`` 
verify_test trainingjob xgboost-mnist 10m
verify_test trainingjob spot-xgboost-mnist 10m
verify_test trainingjob kmeans-mnist 10m
verify_test trainingjob xgboost-mnist-custom-endpoint 10m
verify_test trainingjob efs-xgboost-mnist 10m
verify_test trainingjob fsx-xgboost-mnist 10m
verify_test HyperparameterTuningJob xgboost-mnist-hpo 15m
verify_test HyperparameterTuningJob spot-xgboost-mnist-hpo 15m
verify_test HyperparameterTuningJob xgboost-mnist-hpo-custom-endpoint 15m
verify_test BatchTransformJob xgboost-mnist 10m